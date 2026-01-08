package com.mycompany.personal.finance.management.dao;

import com.mycompany.personal.finance.management.model.Income;
import com.mycompany.personal.finance.management.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IncomeDAO {

    public List<Income> getAllIncome() {
        List<Income> incomes = new ArrayList<>();
        String sql = "SELECT p.*, k.nama as category_name FROM pemasukan p LEFT JOIN kategori k ON p.kategori_id = k.id ORDER BY p.tanggal DESC";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                incomes.add(new Income(
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
        return incomes;
    }

    public void addIncome(Income income) {
        String sql = "INSERT INTO pemasukan (jumlah, tanggal, deskripsi, kategori_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setBigDecimal(1, income.getJumlah());
            pstmt.setDate(2, income.getTanggal());
            pstmt.setString(3, income.getDeskripsi());
            if (income.getKategoriId() > 0) {
                pstmt.setInt(4, income.getKategoriId());
            } else {
                pstmt.setNull(4, java.sql.Types.INTEGER);
            }
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteIncome(int id) {
        String sql = "DELETE FROM pemasukan WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
