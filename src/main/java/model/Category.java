package model;

import java.sql.Timestamp;

public class Category {
    private int id;
    private int userId;
    private String name;
    private String type; // 'income' or 'expense'
    private Timestamp createdAt;

    public Category() {
    }

    public Category(int id, int userId, String name, String type, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.type = type;
        this.createdAt = createdAt;
    }

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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
