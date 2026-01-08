package com.mycompany.personal.finance.management.dao;

import com.mycompany.personal.finance.management.util.DBConnection;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DashboardDAO {

    public BigDecimal getTotalIncome() {
        BigDecimal total = BigDecimal.ZERO;
        String sql = "SELECT SUM(jumlah) as total FROM pemasukan";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                BigDecimal result = rs.getBigDecimal("total");
                if (result != null)
                    total = result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public BigDecimal getTotalExpense() {
        BigDecimal total = BigDecimal.ZERO;
        String sql = "SELECT SUM(jumlah) as total FROM pengeluaran";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                BigDecimal result = rs.getBigDecimal("total");
                if (result != null)
                    total = result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public List<Map<String, Object>> getRecentTransactions() {
        List<Map<String, Object>> transactions = new ArrayList<>();
        // Union query to get recent income and expense combined
        String sql = "SELECT 'PEMASUKAN' as type, jumlah, tanggal, deskripsi, k.nama as kategori " +
                "FROM pemasukan p JOIN kategori k ON p.kategori_id = k.id " +
                "UNION ALL " +
                "SELECT 'PENGELUARAN' as type, jumlah, tanggal, deskripsi, k.nama as kategori " +
                "FROM pengeluaran p JOIN kategori k ON p.kategori_id = k.id " +
                "ORDER BY tanggal DESC LIMIT 5";

        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("type", rs.getString("type"));
                row.put("jumlah", rs.getBigDecimal("jumlah"));
                row.put("tanggal", rs.getDate("tanggal"));
                row.put("deskripsi", rs.getString("deskripsi"));
                row.put("kategori", rs.getString("kategori"));
                transactions.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
