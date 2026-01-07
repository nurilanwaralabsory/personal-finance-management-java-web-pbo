package dao;

import model.Budget;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO class untuk operasi CRUD Budget
 */
public class BudgetDAO {
    
    /**
     * Mendapatkan semua budget berdasarkan user ID
     */
    public List<Budget> getAllByUserId(int userId) {
        List<Budget> budgets = new ArrayList<>();
        String sql = "SELECT b.*, c.name as category_name, c.type as category_type " +
                    "FROM budgets b " +
                    "LEFT JOIN categories c ON b.category_id = c.id " +
                    "WHERE b.user_id = ? " +
                    "ORDER BY b.start_date DESC, b.created_at DESC";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                budgets.add(mapResultSetToBudget(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return budgets;
    }
    
    /**
     * Mendapatkan budget aktif berdasarkan user ID
     */
    public List<Budget> getActiveBudgets(int userId) {
        List<Budget> budgets = new ArrayList<>();
        String sql = "SELECT b.*, c.name as category_name, c.type as category_type " +
                    "FROM budgets b " +
                    "LEFT JOIN categories c ON b.category_id = c.id " +
                    "WHERE b.user_id = ? AND b.is_active = TRUE " +
                    "AND b.end_date >= CURRENT_DATE " +
                    "ORDER BY b.start_date DESC";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                budgets.add(mapResultSetToBudget(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return budgets;
    }
    
    /**
     * Mendapatkan budget berdasarkan ID
     */
    public Budget getById(int id) {
        String sql = "SELECT b.*, c.name as category_name, c.type as category_type " +
                    "FROM budgets b " +
                    "LEFT JOIN categories c ON b.category_id = c.id " +
                    "WHERE b.id = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToBudget(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * Menambahkan budget baru
     */
    public boolean insert(Budget budget) {
        String sql = "INSERT INTO budgets (user_id, category_id, amount, period, start_date, end_date, alert_threshold, is_active) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, budget.getUserId());
            stmt.setInt(2, budget.getCategoryId());
            stmt.setBigDecimal(3, budget.getAmount());
            stmt.setString(4, budget.getPeriod());
            stmt.setDate(5, Date.valueOf(budget.getStartDate()));
            stmt.setDate(6, Date.valueOf(budget.getEndDate()));
            stmt.setInt(7, budget.getAlertThreshold());
            stmt.setBoolean(8, budget.getIsActive());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    budget.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Mengupdate budget
     */
    public boolean update(Budget budget) {
        String sql = "UPDATE budgets SET category_id = ?, amount = ?, period = ?, " +
                    "start_date = ?, end_date = ?, alert_threshold = ?, is_active = ? " +
                    "WHERE id = ? AND user_id = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, budget.getCategoryId());
            stmt.setBigDecimal(2, budget.getAmount());
            stmt.setString(3, budget.getPeriod());
            stmt.setDate(4, Date.valueOf(budget.getStartDate()));
            stmt.setDate(5, Date.valueOf(budget.getEndDate()));
            stmt.setInt(6, budget.getAlertThreshold());
            stmt.setBoolean(7, budget.getIsActive());
            stmt.setInt(8, budget.getId());
            stmt.setInt(9, budget.getUserId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Menghapus budget
     */
    public boolean delete(int id, int userId) {
        String sql = "DELETE FROM budgets WHERE id = ? AND user_id = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            stmt.setInt(2, userId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Update spent amount berdasarkan expense yang ada
     */
    public boolean updateSpentAmount(int budgetId) {
        String sql = "UPDATE budgets b SET spent = ( " +
                "    SELECT COALESCE(SUM(e.amount), 0) " +
                "    FROM expenses e " +
                "    WHERE e.category_id = b.category_id " +
                "    AND e.user_id = b.user_id " +
                "    AND e.expense_date BETWEEN b.start_date AND b.end_date " +
                ") WHERE b.id = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, budgetId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Update semua spent amount untuk user tertentu
     */
    public boolean updateAllSpentAmounts(int userId) {
        String sql = "UPDATE budgets b SET spent = ( " +
                "    SELECT COALESCE(SUM(e.amount), 0) " +
                "    FROM expenses e " +
                "    WHERE e.category_id = b.category_id " +
                "    AND e.user_id = b.user_id " +
                "    AND e.expense_date BETWEEN b.start_date AND b.end_date " +
                ") WHERE b.user_id = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            return stmt.executeUpdate() >= 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Mendapatkan budget yang melebihi threshold
     */
    public List<Budget> getBudgetsNearLimit(int userId) {
        List<Budget> budgets = new ArrayList<>();
        String sql = "SELECT b.*, c.name as category_name, c.type as category_type, " +
                    "(b.spent / NULLIF(b.amount, 0) * 100) as usage_percentage " +
                    "FROM budgets b " +
                    "LEFT JOIN categories c ON b.category_id = c.id " +
                    "WHERE b.user_id = ? AND b.is_active = TRUE " +
                    "AND b.end_date >= CURRENT_DATE " +
                    "AND (b.spent / NULLIF(b.amount, 0) * 100) >= b.alert_threshold " +
                    "ORDER BY usage_percentage DESC";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                budgets.add(mapResultSetToBudget(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return budgets;
    }
    
    /**
     * Check if there's an overlapping budget for the same category and period
     */
    public boolean hasOverlappingBudget(int userId, int categoryId, java.time.LocalDate startDate, java.time.LocalDate endDate, Integer excludeId) {
        String sql = "SELECT COUNT(*) FROM budgets " +
                    "WHERE user_id = ? AND category_id = ? " +
                    "AND is_active = TRUE " +
                    "AND (" +
                    "  (start_date <= ? AND end_date >= ?) OR " +
                    "  (start_date <= ? AND end_date >= ?) OR " +
                    "  (start_date >= ? AND end_date <= ?)" +
                    ")";
        
        if (excludeId != null) {
            sql += " AND id != ?";
        }
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            stmt.setInt(2, categoryId);
            stmt.setDate(3, Date.valueOf(startDate));
            stmt.setDate(4, Date.valueOf(startDate));
            stmt.setDate(5, Date.valueOf(endDate));
            stmt.setDate(6, Date.valueOf(endDate));
            stmt.setDate(7, Date.valueOf(startDate));
            stmt.setDate(8, Date.valueOf(endDate));
            
            if (excludeId != null) {
                stmt.setInt(9, excludeId);
            }
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Mapping ResultSet ke Budget object
     */
    private Budget mapResultSetToBudget(ResultSet rs) throws SQLException {
        Budget budget = new Budget();
        budget.setId(rs.getInt("id"));
        budget.setUserId(rs.getInt("user_id"));
        budget.setCategoryId(rs.getInt("category_id"));
        budget.setAmount(rs.getBigDecimal("amount"));
        budget.setPeriod(rs.getString("period"));
        budget.setStartDate(rs.getDate("start_date").toLocalDate());
        budget.setEndDate(rs.getDate("end_date").toLocalDate());
        budget.setSpent(rs.getBigDecimal("spent"));
        budget.setAlertThreshold(rs.getInt("alert_threshold"));
        budget.setIsActive(rs.getBoolean("is_active"));
        budget.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        budget.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        
        // Data dari join
        budget.setCategoryName(rs.getString("category_name"));
        budget.setCategoryType(rs.getString("category_type"));
        
        return budget;
    }
}
