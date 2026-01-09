package dao;

import model.Budget;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BudgetDAO {

    public List<Budget> getAllBudgets(int userId) {
        List<Budget> budgets = new ArrayList<>();
        String sql = "SELECT b.*, c.name as category_name, " +
                "(SELECT COALESCE(SUM(amount), 0) FROM transactions t " +
                " WHERE t.user_id = b.user_id AND t.category_id = b.category_id " +
                " AND t.type = 'expense' AND t.transaction_date BETWEEN b.start_date AND b.end_date) as spent_amount " +
                "FROM budgets b " +
                "JOIN categories c ON b.category_id = c.id " +
                "WHERE b.user_id = ? ORDER BY b.end_date DESC";

        try (Connection conn = KoneksiDB.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Budget b = new Budget();
                    b.setId(rs.getInt("id"));
                    b.setUserId(rs.getInt("user_id"));
                    b.setCategoryId(rs.getInt("category_id"));
                    b.setCategoryName(rs.getString("category_name"));
                    b.setAmount(rs.getDouble("amount"));
                    b.setSpentAmount(rs.getDouble("spent_amount")); // Derived from subquery
                    b.setStartDate(rs.getDate("start_date"));
                    b.setEndDate(rs.getDate("end_date"));
                    b.setCreatedAt(rs.getTimestamp("created_at"));
                    budgets.add(b);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return budgets;
    }

    public boolean addBudget(Budget b) {
        String sql = "INSERT INTO budgets (user_id, category_id, amount, start_date, end_date) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = KoneksiDB.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, b.getUserId());
            stmt.setInt(2, b.getCategoryId());
            stmt.setDouble(3, b.getAmount());
            stmt.setDate(4, b.getStartDate());
            stmt.setDate(5, b.getEndDate());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteBudget(int id, int userId) {
        String sql = "DELETE FROM budgets WHERE id = ? AND user_id = ?";
        try (Connection conn = KoneksiDB.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.setInt(2, userId);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
