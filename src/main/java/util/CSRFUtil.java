package util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.security.SecureRandom;
import java.util.Base64;

public class CSRFUtil {
    
    private static final String CSRF_TOKEN_SESSION_KEY = "csrfToken";
    private static final String CSRF_TOKEN_PARAM_NAME = "_csrf";
    private static final int TOKEN_LENGTH = 32;
    
    private static String generateToken() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[TOKEN_LENGTH];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
    
    public static String getToken(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        String token = (String) session.getAttribute(CSRF_TOKEN_SESSION_KEY);
        
        if (token == null || token.isEmpty()) {
            token = generateToken();
            session.setAttribute(CSRF_TOKEN_SESSION_KEY, token);
        }
        
        return token;
    }
    
    public static boolean validateToken(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        if (session == null) {
            return false;
        }
        
        String sessionToken = (String) session.getAttribute(CSRF_TOKEN_SESSION_KEY);
        String requestToken = request.getParameter(CSRF_TOKEN_PARAM_NAME);
        
        if (sessionToken == null || requestToken == null) {
            return false;
        }
        
        return constantTimeEquals(sessionToken, requestToken);
    }
    
    public static String regenerateToken(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        String newToken = generateToken();
        session.setAttribute(CSRF_TOKEN_SESSION_KEY, newToken);
        return newToken;
    }
    
    public static String getParameterName() {
        return CSRF_TOKEN_PARAM_NAME;
    }
    
    private static boolean constantTimeEquals(String a, String b) {
        if (a == null || b == null) {
            return false;
        }
        
        if (a.length() != b.length()) {
            return false;
        }
        
        int result = 0;
        for (int i = 0; i < a.length(); i++) {
            result |= a.charAt(i) ^ b.charAt(i);
        }
        return result == 0;
    }
    
    public static String getHiddenInput(HttpServletRequest request) {
        String token = getToken(request);
        return "<input type=\"hidden\" name=\"" + CSRF_TOKEN_PARAM_NAME + "\" value=\"" + token + "\" />";
    }
}
