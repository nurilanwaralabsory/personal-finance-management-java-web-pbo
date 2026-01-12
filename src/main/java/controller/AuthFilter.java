package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;


public class AuthFilter implements Filter {
    
    private static final Set<String> PUBLIC_PATHS = new HashSet<>(Arrays.asList(
        "/login",
        "/register",
        "/logout",
        "/",
        "/index.jsp"
    ));
    
    private static final Set<String> PUBLIC_EXTENSIONS = new HashSet<>(Arrays.asList(
        ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".ico", ".svg",
        ".woff", ".woff2", ".ttf", ".eot", ".mp3", ".mp4", ".webp", ".json"
    ));
    
    private static final Set<String> PUBLIC_PATH_PREFIXES = new HashSet<>(Arrays.asList(
        "/templates/",
        "/assets/"
    ));

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        addSecurityHeaders(httpResponse);

        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        if (isPublicResource(path)) {
            chain.doFilter(request, response);
            return;
        }
        
        if (isDirectJspAccess(path)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = isUserLoggedIn(session);

        if (isLoggedIn) {
            addNoCacheHeaders(httpResponse);
            
            session.setAttribute("lastActivity", System.currentTimeMillis());
            
            chain.doFilter(request, response);
        } else {
            String requestedUrl = httpRequest.getRequestURI();
            String queryString = httpRequest.getQueryString();
            if (queryString != null) {
                requestedUrl += "?" + queryString;
            }
            
            HttpSession newSession = httpRequest.getSession(true);
            newSession.setAttribute("redirectUrl", requestedUrl);
            
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }
    
    private boolean isPublicResource(String path) {
        if (PUBLIC_PATHS.contains(path)) {
            return true;
        }
        
        for (String prefix : PUBLIC_PATH_PREFIXES) {
            if (path.startsWith(prefix)) {
                return true;
            }
        }
        
        for (String extension : PUBLIC_EXTENSIONS) {
            if (path.endsWith(extension)) {
                return true;
            }
        }
        
        return false;
    }
   
    private boolean isDirectJspAccess(String path) {
        if (path.endsWith(".jsp")) {
            if (path.equals("/login.jsp") || 
                path.equals("/register.jsp") || 
                path.equals("/index.jsp")) {
                return false;
            }
            return true;
        }
        return false;
    }
    
    
    private boolean isUserLoggedIn(HttpSession session) {
        if (session == null) {
            return false;
        }
        
        Object user = session.getAttribute("user");
        if (user == null) {
            return false;
        }
        
        Long lastActivity = (Long) session.getAttribute("lastActivity");
        if (lastActivity != null) {
            long currentTime = System.currentTimeMillis();
            long inactiveTime = currentTime - lastActivity;
            if (inactiveTime > 30 * 60 * 1000) {
                session.invalidate();
                return false;
            }
        }
        
        return true;
    }
    
    
    private void addSecurityHeaders(HttpServletResponse response) {
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        
        response.setHeader("X-XSS-Protection", "1; mode=block");
        
        response.setHeader("X-Content-Type-Options", "nosniff");
        
        response.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");
    }
    
    
    private void addNoCacheHeaders(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

    @Override
    public void destroy() {
    }
}
