package util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * Utility class untuk hashing dan verifikasi password
 * Menggunakan SHA-256 dengan salt untuk keamanan
 */
public class PasswordUtil {
    
    private static final int SALT_LENGTH = 16;
    private static final String HASH_ALGORITHM = "SHA-256";
    private static final String SEPARATOR = ":";
    
    /**
     * Generate random salt untuk password hashing
     * @return salt dalam format Base64 string
     */
    private static String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        random.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }
    
    /**
     * Hash password dengan salt
     * @param password plain text password
     * @return hashed password dalam format "salt:hash"
     */
    public static String hashPassword(String password) {
        if (password == null || password.isEmpty()) {
            throw new IllegalArgumentException("Password tidak boleh kosong");
        }
        
        try {
            String salt = generateSalt();
            String hashedPassword = hashWithSalt(password, salt);
            return salt + SEPARATOR + hashedPassword;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error saat hashing password: " + e.getMessage(), e);
        }
    }
    
    /**
     * Hash password dengan salt yang sudah ada
     * @param password plain text password
     * @param salt salt untuk hashing
     * @return hashed password
     */
    private static String hashWithSalt(String password, String salt) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
        digest.update(salt.getBytes(StandardCharsets.UTF_8));
        byte[] hashedBytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hashedBytes);
    }
    
    /**
     * Verifikasi password dengan hash yang tersimpan
     * @param plainPassword password yang diinput user
     * @param storedPassword password yang tersimpan di database (format: "salt:hash")
     * @return true jika password cocok
     */
    public static boolean verifyPassword(String plainPassword, String storedPassword) {
        if (plainPassword == null || plainPassword.isEmpty()) {
            return false;
        }
        
        if (storedPassword == null || storedPassword.isEmpty()) {
            return false;
        }
        
        // Cek apakah stored password menggunakan format baru (salt:hash)
        if (storedPassword.contains(SEPARATOR)) {
            try {
                String[] parts = storedPassword.split(SEPARATOR);
                if (parts.length != 2) {
                    return false;
                }
                
                String salt = parts[0];
                String storedHash = parts[1];
                String computedHash = hashWithSalt(plainPassword, salt);
                
                return constantTimeEquals(storedHash, computedHash);
            } catch (NoSuchAlgorithmException e) {
                System.err.println("Error saat verifikasi password: " + e.getMessage());
                return false;
            }
        } else {
            // Backward compatibility: password lama tanpa hash (plain text)
            // Ini akan dihapus setelah semua password di-migrate
            return plainPassword.equals(storedPassword);
        }
    }
    
    /**
     * Constant-time comparison untuk mencegah timing attacks
     * @param a string pertama
     * @param b string kedua
     * @return true jika kedua string sama
     */
    private static boolean constantTimeEquals(String a, String b) {
        if (a == null || b == null) {
            return false;
        }
        
        byte[] aBytes = a.getBytes(StandardCharsets.UTF_8);
        byte[] bBytes = b.getBytes(StandardCharsets.UTF_8);
        
        if (aBytes.length != bBytes.length) {
            return false;
        }
        
        int result = 0;
        for (int i = 0; i < aBytes.length; i++) {
            result |= aBytes[i] ^ bBytes[i];
        }
        return result == 0;
    }
    
    /**
     * Cek apakah password sudah di-hash (menggunakan format baru)
     * @param password password yang akan dicek
     * @return true jika sudah menggunakan format hash baru
     */
    public static boolean isHashed(String password) {
        if (password == null || password.isEmpty()) {
            return false;
        }
        
        // Format hash baru: salt:hash
        // Salt adalah Base64 (panjang 24 chars untuk 16 bytes)
        // Hash adalah Base64 dari SHA-256 (panjang 44 chars untuk 32 bytes)
        if (password.contains(SEPARATOR)) {
            String[] parts = password.split(SEPARATOR);
            return parts.length == 2 && parts[0].length() >= 20 && parts[1].length() >= 40;
        }
        
        return false;
    }
}
