package com.mycompany.personal.finance.management.dao;

import com.mycompany.personal.finance.management.model.Budget;
import com.mycompany.personal.finance.management.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BudgetDAO {

    public List<Budget> getAllBudgets() {
        List<Budget> budgets = new ArrayList<>();
        String sql = "SELECT a.*, k.nama as category_name FROM anggaran a LEFT JOIN kategori k ON a.kategori_id = k.id ORDER BY a.bulan DESC";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                budgets.add(new Budget(
                        rs.getInt("id"),
                        rs.getBigDecimal("jumlah"),
                        rs.getInt("kategori_id"),
                        rs.getString("category_name"),
                        rs.getDate("bulan")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return budgets;
    }

    public void addBudget(Budget budget) {
        String sql = "INSERT INTO anggaran (jumlah, kategori_id, bulan) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setBigDecimal(1, budget.getJumlah());
            pstmt.setInt(2, budget.getKategoriId());
            pstmt.setDate(3, budget.getBulan());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBudget(int id) {
        String sql = "DELETE FROM anggaran WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
