package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KoneksiDB {
    
    private static final String URL = "jdbc:postgresql://localhost:5432/db_personal_finance_management";
    private static final String USER = "postgres";
    private static final String PASS = "abzhorgggaming";
    
    static {
        try {
            // Load PostgreSQL JDBC Driver
            Class.forName("org.postgresql.Driver");
            System.out.println("PostgreSQL JDBC Driver berhasil dimuat!");
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC Driver tidak ditemukan!");
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASS);
            if (conn != null) {
                System.out.println("Koneksi database berhasil!");
            }
        } catch (SQLException e) {
            System.err.println("Koneksi gagal: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Gagal menutup koneksi: " + e.getMessage());
            }
        }
    }
    
    public static void main(String[] args) {
        Connection conn = KoneksiDB.getConnection();
        if (conn != null) {
            System.out.println("Test koneksi berhasil!");
            closeConnection(conn);
        } else {
            System.out.println("Test koneksi GAGAL!");
        }
    }
}
