package com.mycompany.personal.finance.management.dao;

import com.mycompany.personal.finance.management.model.Category;
import com.mycompany.personal.finance.management.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM kategori";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("nama"),
                        rs.getString("tipe")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public void addCategory(Category category) {
        String sql = "INSERT INTO kategori (nama, tipe) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, category.getNama());
            pstmt.setString(2, category.getTipe());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCategory(int id) {
        String sql = "DELETE FROM kategori WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Category> getCategoriesByType(String type) {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM kategori WHERE tipe = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, type);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    categories.add(new Category(
                            rs.getInt("id"),
                            rs.getString("nama"),
                            rs.getString("tipe")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
