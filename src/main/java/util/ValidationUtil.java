package util;

import java.util.regex.Pattern;

/**
 * Utility class untuk validasi input
 */
public class ValidationUtil {
    
    // Email regex pattern (RFC 5322)
    private static final Pattern EMAIL_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$"
    );
    
    // Username pattern: alphanumeric, underscore, min 3, max 30 chars
    private static final Pattern USERNAME_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9_]{3,30}$"
    );
    
    // Password pattern: minimal 6 karakter, setidaknya 1 huruf dan 1 angka
    private static final Pattern PASSWORD_PATTERN = Pattern.compile(
        "^(?=.*[A-Za-z])(?=.*\\d).{6,}$"
    );
    
    /**
     * Validasi format email
     * @param email email yang akan divalidasi
     * @return true jika format email valid
     */
    public static boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return EMAIL_PATTERN.matcher(email.trim()).matches();
    }
    
    /**
     * Validasi format username
     * @param username username yang akan divalidasi
     * @return true jika format username valid
     */
    public static boolean isValidUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            return false;
        }
        return USERNAME_PATTERN.matcher(username.trim()).matches();
    }
    
    /**
     * Validasi kekuatan password
     * @param password password yang akan divalidasi
     * @return true jika password cukup kuat
     */
    public static boolean isValidPassword(String password) {
        if (password == null || password.isEmpty()) {
            return false;
        }
        // Minimal 6 karakter
        return password.length() >= 6;
    }
    
    /**
     * Validasi password dengan aturan yang lebih ketat
     * (minimal mengandung huruf dan angka)
     * @param password password yang akan divalidasi
     * @return true jika password cukup kuat
     */
    public static boolean isStrongPassword(String password) {
        if (password == null || password.isEmpty()) {
            return false;
        }
        return PASSWORD_PATTERN.matcher(password).matches();
    }
    
    /**
     * Sanitize input string untuk mencegah XSS
     * @param input string yang akan di-sanitize
     * @return sanitized string
     */
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
    
    /**
     * Cek apakah string kosong atau null
     * @param str string yang akan dicek
     * @return true jika null atau kosong
     */
    public static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
    
    /**
     * Cek apakah string tidak kosong
     * @param str string yang akan dicek
     * @return true jika tidak null dan tidak kosong
     */
    public static boolean isNotEmpty(String str) {
        return str != null && !str.trim().isEmpty();
    }
    
    /**
     * Trim string dengan null check
     * @param str string yang akan di-trim
     * @return trimmed string atau null
     */
    public static String trim(String str) {
        return str != null ? str.trim() : null;
    }
    
    /**
     * Get pesan error untuk validasi email
     * @param email email yang divalidasi
     * @return pesan error atau null jika valid
     */
    public static String getEmailValidationError(String email) {
        if (isEmpty(email)) {
            return "Email tidak boleh kosong!";
        }
        if (!isValidEmail(email)) {
            return "Format email tidak valid!";
        }
        return null;
    }
    
    /**
     * Get pesan error untuk validasi username
     * @param username username yang divalidasi
     * @return pesan error atau null jika valid
     */
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
    
    /**
     * Get pesan error untuk validasi password
     * @param password password yang divalidasi
     * @return pesan error atau null jika valid
     */
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
