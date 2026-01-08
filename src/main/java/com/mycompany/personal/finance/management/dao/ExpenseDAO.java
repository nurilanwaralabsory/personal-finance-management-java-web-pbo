package com.mycompany.personal.finance.management.dao;

import com.mycompany.personal.finance.management.model.Expense;
import com.mycompany.personal.finance.management.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {

    public List<Expense> getAllExpenses() {
        List<Expense> expenses = new ArrayList<>();
        String sql = "SELECT p.*, k.nama as category_name FROM pengeluaran p LEFT JOIN kategori k ON p.kategori_id = k.id ORDER BY p.tanggal DESC";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                expenses.add(new Expense(
                        rs.getInt("id"),
                        rs.getBigDecimal("jumlah"),
                        rs.getDate("tanggal"),
                        rs.getString("deskripsi"),
                        rs.getInt("kategori_id"),
                        rs.getString("category_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expenses;
    }

    public void addExpense(Expense expense) {
        String sql = "INSERT INTO pengeluaran (jumlah, tanggal, deskripsi, kategori_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setBigDecimal(1, expense.getJumlah());
            pstmt.setDate(2, expense.getTanggal());
            pstmt.setString(3, expense.getDeskripsi());
            if (expense.getKategoriId() > 0) {
                pstmt.setInt(4, expense.getKategoriId());
            } else {
                pstmt.setNull(4, java.sql.Types.INTEGER);
            }
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteExpense(int id) {
        String sql = "DELETE FROM pengeluaran WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
