package dao;

import model.Transaction;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    public List<Transaction> getAllTransactions(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT t.*, c.name as category_name FROM transactions t " +
                "LEFT JOIN categories c ON t.category_id = c.id " +
                "WHERE t.user_id = ? ORDER BY t.transaction_date DESC, t.created_at DESC";

        try (Connection conn = KoneksiDB.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Transaction t = new Transaction();
                    t.setId(rs.getInt("id"));
                    t.setUserId(rs.getInt("user_id"));
                    t.setCategoryId(rs.getInt("category_id"));
                    t.setCategoryName(rs.getString("category_name"));
                    t.setAmount(rs.getDouble("amount"));
                    t.setDescription(rs.getString("description"));
                    t.setType(rs.getString("type"));
                    t.setTransactionDate(rs.getDate("transaction_date"));
                    t.setCreatedAt(rs.getTimestamp("created_at"));
                    transactions.add(t);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

    public boolean addTransaction(Transaction t) {
        String sql = "INSERT INTO transactions (user_id, category_id, amount, description, type, transaction_date) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = KoneksiDB.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, t.getUserId());
            if (t.getCategoryId() > 0) {
                stmt.setInt(2, t.getCategoryId());
            } else {
                stmt.setNull(2, java.sql.Types.INTEGER);
            }
            stmt.setDouble(3, t.getAmount());
            stmt.setString(4, t.getDescription());
            stmt.setString(5, t.getType());
            stmt.setDate(6, t.getTransactionDate());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteTransaction(int id, int userId) {
        String sql = "DELETE FROM transactions WHERE id = ? AND user_id = ?";
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
