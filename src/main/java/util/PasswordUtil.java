package util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordUtil {
    
    private static final int SALT_LENGTH = 16;
    private static final String HASH_ALGORITHM = "SHA-256";
    private static final String SEPARATOR = ":";
    
    private static String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        random.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }
    
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
    
    private static String hashWithSalt(String password, String salt) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
        digest.update(salt.getBytes(StandardCharsets.UTF_8));
        byte[] hashedBytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hashedBytes);
    }
    
    public static boolean verifyPassword(String plainPassword, String storedPassword) {
        if (plainPassword == null || plainPassword.isEmpty()) {
            return false;
        }
        
        if (storedPassword == null || storedPassword.isEmpty()) {
            return false;
        }
        
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
            return plainPassword.equals(storedPassword);
        }
    }
    
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
    
    public static boolean isHashed(String password) {
        if (password == null || password.isEmpty()) {
            return false;
        }
        
        if (password.contains(SEPARATOR)) {
            String[] parts = password.split(SEPARATOR);
            return parts.length == 2 && parts[0].length() >= 20 && parts[1].length() >= 40;
        }
        
        return false;
    }
}
