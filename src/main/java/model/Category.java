package model;

import java.sql.Timestamp;

public class Category {
    private int id;
    private int userId;
    private String name;
    private String type; // "income" atau "expense"
    private String description;
    private String icon;
    private String color;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Default constructor
    public Category() {
    }

    // Constructor dengan parameter dasar
    public Category(int userId, String name, String type) {
        this.userId = userId;
        this.name = name;
        this.type = type;
    }

    // Constructor dengan parameter lengkap
    public Category(int userId, String name, String type, String description, String icon, String color) {
        this.userId = userId;
        this.name = name;
        this.type = type;
        this.description = description;
        this.icon = icon;
        this.color = color;
    }

    // Constructor lengkap dengan id dan timestamp
    public Category(int id, int userId, String name, String type, String description, 
                   String icon, String color, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.type = type;
        this.description = description;
        this.icon = icon;
        this.color = color;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getter dan Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    // Helper method untuk cek tipe kategori
    public boolean isIncomeCategory() {
        return "income".equalsIgnoreCase(this.type);
    }

    public boolean isExpenseCategory() {
        return "expense".equalsIgnoreCase(this.type);
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", description='" + description + '\'' +
                ", icon='" + icon + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}
