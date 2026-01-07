package dao;

import model.Category;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    // Menambahkan kategori baru
    public boolean insert(Category category) {
        String sql = "INSERT INTO categories (user_id, name, type, description, icon, color) VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Insert kategori gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, category.getUserId());
            stmt.setString(2, category.getName());
            stmt.setString(3, category.getType());
            stmt.setString(4, category.getDescription());
            stmt.setString(5, category.getIcon() != null ? category.getIcon() : "ri-folder-line");
            stmt.setString(6, category.getColor() != null ? category.getColor() : "#7367f0");
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat insert kategori: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Update kategori
    public boolean update(Category category) {
        String sql = "UPDATE categories SET name = ?, description = ?, icon = ?, color = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Update kategori gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            stmt.setString(3, category.getIcon());
            stmt.setString(4, category.getColor());
            stmt.setInt(5, category.getId());
            stmt.setInt(6, category.getUserId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat update kategori: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Hapus kategori
    public boolean delete(int id, int userId) {
        String sql = "DELETE FROM categories WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Delete kategori gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat delete kategori: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Ambil kategori berdasarkan ID
    public Category findById(int id, int userId) {
        String sql = "SELECT * FROM categories WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find kategori gagal: Koneksi database null");
                return null;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToCategory(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find kategori: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return null;
    }

    // Ambil semua kategori berdasarkan user
    public List<Category> findAllByUserId(int userId) {
        String sql = "SELECT * FROM categories WHERE user_id = ? ORDER BY type, name";
        List<Category> categories = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find all kategori gagal: Koneksi database null");
                return categories;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find all kategori: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return categories;
    }

    // Ambil kategori berdasarkan tipe (income/expense)
    public List<Category> findByType(int userId, String type) {
        String sql = "SELECT * FROM categories WHERE user_id = ? AND type = ? ORDER BY name";
        List<Category> categories = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find kategori by type gagal: Koneksi database null");
                return categories;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, type);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find kategori by type: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return categories;
    }

    // Cek apakah nama kategori sudah ada untuk user dan tipe tertentu
    public boolean isNameExists(int userId, String name, String type) {
        String sql = "SELECT COUNT(*) FROM categories WHERE user_id = ? AND name = ? AND type = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Cek nama kategori gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, name);
            stmt.setString(3, type);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
        } catch (SQLException e) {
            System.err.println("Error cek nama kategori: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return false;
    }

    // Cek apakah nama kategori sudah ada (kecuali untuk ID tertentu - untuk update)
    public boolean isNameExistsExcludeId(int userId, String name, String type, int excludeId) {
        String sql = "SELECT COUNT(*) FROM categories WHERE user_id = ? AND name = ? AND type = ? AND id != ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Cek nama kategori gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, name);
            stmt.setString(3, type);
            stmt.setInt(4, excludeId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
        } catch (SQLException e) {
            System.err.println("Error cek nama kategori: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return false;
    }

    // Helper method untuk mapping ResultSet ke Category
    private Category mapResultSetToCategory(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setUserId(rs.getInt("user_id"));
        category.setName(rs.getString("name"));
        category.setType(rs.getString("type"));
        category.setDescription(rs.getString("description"));
        category.setIcon(rs.getString("icon"));
        category.setColor(rs.getString("color"));
        category.setCreatedAt(rs.getTimestamp("created_at"));
        category.setUpdatedAt(rs.getTimestamp("updated_at"));
        return category;
    }

    // Helper method untuk menutup resources
    private void closeResources(Connection conn, PreparedStatement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.err.println("Error closing ResultSet: " + e.getMessage());
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                System.err.println("Error closing Statement: " + e.getMessage());
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing Connection: " + e.getMessage());
            }
        }
    }
}
