package dao;

import model.Expense;
import util.KoneksiDB;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {

    // Menambahkan pengeluaran baru
    public boolean insert(Expense expense) {
        String sql = "INSERT INTO expenses (user_id, category_id, amount, description, recipient, expense_date) VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Insert pengeluaran gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, expense.getUserId());
            if (expense.getCategoryId() != null) {
                stmt.setInt(2, expense.getCategoryId());
            } else {
                stmt.setNull(2, Types.INTEGER);
            }
            stmt.setBigDecimal(3, expense.getAmount());
            stmt.setString(4, expense.getDescription());
            stmt.setString(5, expense.getRecipient());
            stmt.setDate(6, expense.getExpenseDate());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat insert pengeluaran: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Update pengeluaran
    public boolean update(Expense expense) {
        String sql = "UPDATE expenses SET category_id = ?, amount = ?, description = ?, recipient = ?, expense_date = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Update pengeluaran gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            if (expense.getCategoryId() != null) {
                stmt.setInt(1, expense.getCategoryId());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            stmt.setBigDecimal(2, expense.getAmount());
            stmt.setString(3, expense.getDescription());
            stmt.setString(4, expense.getRecipient());
            stmt.setDate(5, expense.getExpenseDate());
            stmt.setInt(6, expense.getId());
            stmt.setInt(7, expense.getUserId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat update pengeluaran: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Hapus pengeluaran
    public boolean delete(int id, int userId) {
        String sql = "DELETE FROM expenses WHERE id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Delete pengeluaran gagal: Koneksi database null");
                return false;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat delete pengeluaran: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    // Ambil pengeluaran berdasarkan ID
    public Expense findById(int id, int userId) {
        String sql = "SELECT e.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM expenses e LEFT JOIN categories c ON e.category_id = c.id " +
                     "WHERE e.id = ? AND e.user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find pengeluaran gagal: Koneksi database null");
                return null;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToExpense(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find pengeluaran: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return null;
    }

    // Ambil semua pengeluaran berdasarkan user
    public List<Expense> findAllByUserId(int userId) {
        String sql = "SELECT e.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM expenses e LEFT JOIN categories c ON e.category_id = c.id " +
                     "WHERE e.user_id = ? ORDER BY e.expense_date DESC, e.created_at DESC";
        List<Expense> expenses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find all pengeluaran gagal: Koneksi database null");
                return expenses;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                expenses.add(mapResultSetToExpense(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find all pengeluaran: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return expenses;
    }

    // Ambil pengeluaran berdasarkan rentang tanggal
    public List<Expense> findByDateRange(int userId, Date startDate, Date endDate) {
        String sql = "SELECT e.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM expenses e LEFT JOIN categories c ON e.category_id = c.id " +
                     "WHERE e.user_id = ? AND e.expense_date BETWEEN ? AND ? " +
                     "ORDER BY e.expense_date DESC, e.created_at DESC";
        List<Expense> expenses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find pengeluaran by date range gagal: Koneksi database null");
                return expenses;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setDate(2, startDate);
            stmt.setDate(3, endDate);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                expenses.add(mapResultSetToExpense(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find pengeluaran by date range: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return expenses;
    }

    // Ambil pengeluaran berdasarkan kategori
    public List<Expense> findByCategoryId(int userId, int categoryId) {
        String sql = "SELECT e.*, c.name as category_name, c.icon as category_icon, c.color as category_color " +
                     "FROM expenses e LEFT JOIN categories c ON e.category_id = c.id " +
                     "WHERE e.user_id = ? AND e.category_id = ? " +
                     "ORDER BY e.expense_date DESC, e.created_at DESC";
        List<Expense> expenses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Find pengeluaran by category gagal: Koneksi database null");
                return expenses;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, categoryId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                expenses.add(mapResultSetToExpense(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat find pengeluaran by category: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return expenses;
    }

    // Hitung total pengeluaran user
    public BigDecimal getTotalByUserId(int userId) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM expenses WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Get total pengeluaran gagal: Koneksi database null");
                return BigDecimal.ZERO;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getBigDecimal("total");
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat get total pengeluaran: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return BigDecimal.ZERO;
    }

    // Hitung total pengeluaran berdasarkan rentang tanggal
    public BigDecimal getTotalByDateRange(int userId, Date startDate, Date endDate) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM expenses WHERE user_id = ? AND expense_date BETWEEN ? AND ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Get total pengeluaran by date range gagal: Koneksi database null");
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
            System.err.println("Error saat get total pengeluaran by date range: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return BigDecimal.ZERO;
    }

    // Hitung total pengeluaran bulan ini
    public BigDecimal getTotalThisMonth(int userId) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM expenses " +
                     "WHERE user_id = ? AND EXTRACT(MONTH FROM expense_date) = EXTRACT(MONTH FROM CURRENT_DATE) " +
                     "AND EXTRACT(YEAR FROM expense_date) = EXTRACT(YEAR FROM CURRENT_DATE)";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                System.err.println("Get total pengeluaran this month gagal: Koneksi database null");
                return BigDecimal.ZERO;
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getBigDecimal("total");
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat get total pengeluaran this month: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return BigDecimal.ZERO;
    }

    // Helper method untuk mapping ResultSet ke Expense
    private Expense mapResultSetToExpense(ResultSet rs) throws SQLException {
        Expense expense = new Expense();
        expense.setId(rs.getInt("id"));
        expense.setUserId(rs.getInt("user_id"));
        
        int categoryId = rs.getInt("category_id");
        if (!rs.wasNull()) {
            expense.setCategoryId(categoryId);
        }
        
        expense.setAmount(rs.getBigDecimal("amount"));
        expense.setDescription(rs.getString("description"));
        expense.setRecipient(rs.getString("recipient"));
        expense.setExpenseDate(rs.getDate("expense_date"));
        expense.setCreatedAt(rs.getTimestamp("created_at"));
        expense.setUpdatedAt(rs.getTimestamp("updated_at"));
        
        // Mapping dari join dengan categories
        try {
            expense.setCategoryName(rs.getString("category_name"));
            expense.setCategoryIcon(rs.getString("category_icon"));
            expense.setCategoryColor(rs.getString("category_color"));
        } catch (SQLException e) {
            // Kolom tidak ada (query tanpa join)
        }
        
        return expense;
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
