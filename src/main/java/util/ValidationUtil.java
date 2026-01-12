package util;

import java.util.regex.Pattern;

public class ValidationUtil {
    
    private static final Pattern EMAIL_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$"
    );
    
    private static final Pattern USERNAME_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9_]{3,30}$"
    );
    
    private static final Pattern PASSWORD_PATTERN = Pattern.compile(
        "^(?=.*[A-Za-z])(?=.*\\d).{6,}$"
    );
    
    public static boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return EMAIL_PATTERN.matcher(email.trim()).matches();
    }
    
    public static boolean isValidUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            return false;
        }
        return USERNAME_PATTERN.matcher(username.trim()).matches();
    }
    
    public static boolean isValidPassword(String password) {
        if (password == null || password.isEmpty()) {
            return false;
        }
        // Minimal 6 karakter
        return password.length() >= 6;
    }
    
    public static boolean isStrongPassword(String password) {
        if (password == null || password.isEmpty()) {
            return false;
        }
        return PASSWORD_PATTERN.matcher(password).matches();
    }
    
    public static String sanitizeInput(String input) {
        if (input == null) {
            return null;
        }
        
        return input
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#x27;")
            .replace("/", "&#x2F;");
    }
    
    public static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
    
    public static boolean isNotEmpty(String str) {
        return str != null && !str.trim().isEmpty();
    }
    
    public static String trim(String str) {
        return str != null ? str.trim() : null;
    }
    
    public static String getEmailValidationError(String email) {
        if (isEmpty(email)) {
            return "Email tidak boleh kosong!";
        }
        if (!isValidEmail(email)) {
            return "Format email tidak valid!";
        }
        return null;
    }
    
    public static String getUsernameValidationError(String username) {
        if (isEmpty(username)) {
            return "Username tidak boleh kosong!";
        }
        if (username.trim().length() < 3) {
            return "Username minimal 3 karakter!";
        }
        if (username.trim().length() > 30) {
            return "Username maksimal 30 karakter!";
        }
        if (!isValidUsername(username)) {
            return "Username hanya boleh berisi huruf, angka, dan underscore!";
        }
        return null;
    }
    
    public static String getPasswordValidationError(String password) {
        if (isEmpty(password)) {
            return "Password tidak boleh kosong!";
        }
        if (password.length() < 6) {
            return "Password minimal 6 karakter!";
        }
        return null;
    }
}
