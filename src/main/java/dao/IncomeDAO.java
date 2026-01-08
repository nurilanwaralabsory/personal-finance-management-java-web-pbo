package dao;

import model.Income;
import util.KoneksiDB;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IncomeDAO {

    // Menambahkan pemasukan baru
    public boolean insert(Income income) {
        String sql = "INSERT INTO incomes (user_id, category_id, amount, description, source, income_date) VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Insert pemasukan gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, income.getUserId());
            if (income.getCategoryId() != null) {
                stmt.setInt(2, income.getCategoryId());
            } else {
                stmt.setNull(2, Types.INTEGER);
            }
            stmt.setBigDecimal(3, income.getAmount());
            stmt.setString(4, income.getDescription());
            stmt.setString(5, income.getSource());
            stmt.setDate(6, income.getIncomeDate());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat insert pemasukan: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Update pemasukan
    public boolean update(Income income) {
        String sql = "UPDATE incomes SET category_id = ?, amount = ?, description = ?, source = ?, income_date = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Update pemasukan gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            if (income.getCategoryId() != null) {
                stmt.setInt(1, income.getCategoryId());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            stmt.setBigDecimal(2, income.getAmount());
            stmt.setString(3, income.getDescription());
            stmt.setString(4, income.getSource());
            stmt.setDate(5, income.getIncomeDate());
            stmt.setInt(6, income.getId());
            stmt.setInt(7, income.getUserId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat update pemasukan: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Hapus pemasukan
    public boolean delete(int id, int userId) {
        String sql = "DELETE FROM incomes WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Delete pemasukan gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat delete pemasukan: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Ambil pemasukan berdasarkan ID
    public Income findById(int id, int userId) {
        String sql = "SELECT i.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM incomes i LEFT JOIN categories c ON i.category_id = c.id " +
                     "WHERE i.id = ? AND i.user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find pemasukan gagal: Koneksi database null");
                return null;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToIncome(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find pemasukan: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return null;
    }

    // Ambil semua pemasukan berdasarkan user
    public List<Income> findAllByUserId(int userId) {
        String sql = "SELECT i.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM incomes i LEFT JOIN categories c ON i.category_id = c.id " +
                     "WHERE i.user_id = ? ORDER BY i.income_date DESC, i.created_at DESC";
        List<Income> incomes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find all pemasukan gagal: Koneksi database null");
                return incomes;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                incomes.add(mapResultSetToIncome(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find all pemasukan: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return incomes;
    }

    // Ambil pemasukan berdasarkan rentang tanggal
    public List<Income> findByDateRange(int userId, Date startDate, Date endDate) {
        String sql = "SELECT i.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM incomes i LEFT JOIN categories c ON i.category_id = c.id " +
                     "WHERE i.user_id = ? AND i.income_date BETWEEN ? AND ? " +
                     "ORDER BY i.income_date DESC, i.created_at DESC";
        List<Income> incomes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find pemasukan by date range gagal: Koneksi database null");
                return incomes;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setDate(2, startDate);
            stmt.setDate(3, endDate);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                incomes.add(mapResultSetToIncome(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find pemasukan by date range: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return incomes;
    }

    // Ambil pemasukan berdasarkan kategori
    public List<Income> findByCategoryId(int userId, int categoryId) {
        String sql = "SELECT i.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM incomes i LEFT JOIN categories c ON i.category_id = c.id " +
                     "WHERE i.user_id = ? AND i.category_id = ? " +
                     "ORDER BY i.income_date DESC, i.created_at DESC";
        List<Income> incomes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find pemasukan by category gagal: Koneksi database null");
                return incomes;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, categoryId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                incomes.add(mapResultSetToIncome(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find pemasukan by category: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return incomes;
    }

    // Hitung total pemasukan user
    public BigDecimal getTotalByUserId(int userId) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM incomes WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Get total pemasukan gagal: Koneksi database null");
                return BigDecimal.ZERO;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getBigDecimal("total");
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat get total pemasukan: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return BigDecimal.ZERO;
    }

    // Hitung total pemasukan berdasarkan rentang tanggal
    public BigDecimal getTotalByDateRange(int userId, Date startDate, Date endDate) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM incomes WHERE user_id = ? AND income_date BETWEEN ? AND ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Get total pemasukan by date range gagal: Koneksi database null");
                return BigDecimal.ZERO;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setDate(2, startDate);
            stmt.setDate(3, endDate);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getBigDecimal("total");
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat get total pemasukan by date range: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return BigDecimal.ZERO;
    }

    // Hitung total pemasukan bulan ini
    public BigDecimal getTotalThisMonth(int userId) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM incomes " +
                     "WHERE user_id = ? AND EXTRACT(MONTH FROM income_date) = EXTRACT(MONTH FROM CURRENT_DATE) " +
                     "AND EXTRACT(YEAR FROM income_date) = EXTRACT(YEAR FROM CURRENT_DATE)";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Get total pemasukan this month gagal: Koneksi database null");
                return BigDecimal.ZERO;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getBigDecimal("total");
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat get total pemasukan this month: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return BigDecimal.ZERO;
    }

    // Helper method untuk mapping ResultSet ke Income
    private Income mapResultSetToIncome(ResultSet rs) throws SQLException {
        Income income = new Income();
        income.setId(rs.getInt("id"));
        income.setUserId(rs.getInt("user_id"));
        
        int categoryId = rs.getInt("category_id");
        if (!rs.wasNull()) {
            income.setCategoryId(categoryId);
        }
        
        income.setAmount(rs.getBigDecimal("amount"));
        income.setDescription(rs.getString("description"));
        income.setSource(rs.getString("source"));
        income.setIncomeDate(rs.getDate("income_date"));
        income.setCreatedAt(rs.getTimestamp("created_at"));
        income.setUpdatedAt(rs.getTimestamp("updated_at"));
        
        // Mapping dari join dengan categories
        try {
            income.setCategoryName(rs.getString("category_name"));
            income.setCategoryIcon(rs.getString("category_icon"));
            income.setCategoryColor(rs.getString("category_color"));
        } catch (SQLException e) {
            // Kolom tidak ada (query tanpa join)
        }
        
        return income;
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
