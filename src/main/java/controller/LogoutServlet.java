package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        performLogout(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        performLogout(request, response);
    }
    
    private void performLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        // Invalidate session
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Hapus semua atribut session
            java.util.Enumeration<String> attributeNames = session.getAttributeNames();
            while (attributeNames.hasMoreElements()) {
                session.removeAttribute(attributeNames.nextElement());
            }
            
            // Invalidate session
            session.invalidate();
        }
        
        // Hapus cookie JSESSIONID jika ada
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setPath(request.getContextPath());
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }
        
        // Set header untuk mencegah caching
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        // Redirect ke halaman login dengan pesan
        response.sendRedirect(request.getContextPath() + "/login?logout=true");
    }
}
