package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Authentication Filter untuk melindungi halaman-halaman yang membutuhkan login
 * Filter ini juga menambahkan security headers untuk perlindungan tambahan
 */
public class AuthFilter implements Filter {
    
    // Path yang tidak memerlukan autentikasi
    private static final Set<String> PUBLIC_PATHS = new HashSet<>(Arrays.asList(
        "/login",
        "/register",
        "/logout",
        "/",
        "/index.jsp"
    ));
    
    // Ekstensi file publik (static resources)
    private static final Set<String> PUBLIC_EXTENSIONS = new HashSet<>(Arrays.asList(
        ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".ico", ".svg",
        ".woff", ".woff2", ".ttf", ".eot", ".mp3", ".mp4", ".webp", ".json"
    ));
    
    // Path prefix yang diizinkan tanpa autentikasi
    private static final Set<String> PUBLIC_PATH_PREFIXES = new HashSet<>(Arrays.asList(
        "/templates/",
        "/assets/"
    ));

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Tambahkan security headers
        addSecurityHeaders(httpResponse);

        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        // Cek apakah request adalah untuk resource publik
        if (isPublicResource(path)) {
            chain.doFilter(request, response);
            return;
        }
        
        // Cek apakah akses langsung ke JSP (kecuali yang diizinkan)
        if (isDirectJspAccess(path)) {
            // Redirect ke halaman login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        // Cek session
        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = isUserLoggedIn(session);

        if (isLoggedIn) {
            // User sudah login
            // Tambahkan header untuk mencegah caching halaman sensitif
            addNoCacheHeaders(httpResponse);
            
            // Update last activity time
            session.setAttribute("lastActivity", System.currentTimeMillis());
            
            // Lanjutkan request
            chain.doFilter(request, response);
        } else {
            // User belum login
            // Simpan URL yang diminta untuk redirect setelah login
            String requestedUrl = httpRequest.getRequestURI();
            String queryString = httpRequest.getQueryString();
            if (queryString != null) {
                requestedUrl += "?" + queryString;
            }
            
            HttpSession newSession = httpRequest.getSession(true);
            newSession.setAttribute("redirectUrl", requestedUrl);
            
            // Redirect ke halaman login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }
    
    /**
     * Cek apakah path adalah resource publik
     */
    private boolean isPublicResource(String path) {
        // Cek path eksak
        if (PUBLIC_PATHS.contains(path)) {
            return true;
        }
        
        // Cek path prefix
        for (String prefix : PUBLIC_PATH_PREFIXES) {
            if (path.startsWith(prefix)) {
                return true;
            }
        }
        
        // Cek ekstensi file
        for (String extension : PUBLIC_EXTENSIONS) {
            if (path.endsWith(extension)) {
                return true;
            }
        }
        
        return false;
    }
    
    /**
     * Cek apakah akses langsung ke file JSP
     */
    private boolean isDirectJspAccess(String path) {
        // Cek apakah path berakhir dengan .jsp dan bukan halaman publik
        if (path.endsWith(".jsp")) {
            // Izinkan beberapa JSP publik
            if (path.equals("/login.jsp") || 
                path.equals("/register.jsp") || 
                path.equals("/index.jsp")) {
                return false;
            }
            return true;
        }
        return false;
    }
    
    /**
     * Cek apakah user sudah login
     */
    private boolean isUserLoggedIn(HttpSession session) {
        if (session == null) {
            return false;
        }
        
        Object user = session.getAttribute("user");
        if (user == null) {
            return false;
        }
        
        // Cek session timeout manual (tambahan dari session-config)
        Long lastActivity = (Long) session.getAttribute("lastActivity");
        if (lastActivity != null) {
            long currentTime = System.currentTimeMillis();
            long inactiveTime = currentTime - lastActivity;
            // Jika tidak aktif lebih dari 30 menit, anggap session expired
            if (inactiveTime > 30 * 60 * 1000) {
                session.invalidate();
                return false;
            }
        }
        
        return true;
    }
    
    /**
     * Tambahkan security headers ke response
     */
    private void addSecurityHeaders(HttpServletResponse response) {
        // Mencegah clickjacking
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        
        // Mencegah XSS
        response.setHeader("X-XSS-Protection", "1; mode=block");
        
        // Mencegah MIME sniffing
        response.setHeader("X-Content-Type-Options", "nosniff");
        
        // Referrer policy
        response.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");
    }
    
    /**
     * Tambahkan no-cache headers untuk halaman sensitif
     */
    private void addNoCacheHeaders(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
