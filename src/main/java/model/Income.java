package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class Income {
    private int id;
    private int userId;
    private Integer categoryId;
    private BigDecimal amount;
    private String description;
    private String source;
    private Date incomeDate;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    // Tambahan untuk join dengan category
    private String categoryName;
    private String categoryIcon;
    private String categoryColor;

    // Default constructor
    public Income() {
    }

    // Constructor dengan parameter dasar
    public Income(int userId, BigDecimal amount, Date incomeDate) {
        this.userId = userId;
        this.amount = amount;
        this.incomeDate = incomeDate;
    }

    // Constructor dengan parameter lengkap
    public Income(int userId, Integer categoryId, BigDecimal amount, 
                  String description, String source, Date incomeDate) {
        this.userId = userId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.source = source;
        this.incomeDate = incomeDate;
    }

    // Constructor lengkap dengan id dan timestamp
    public Income(int id, int userId, Integer categoryId, BigDecimal amount,
                  String description, String source, Date incomeDate,
                  Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.userId = userId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.source = source;
        this.incomeDate = incomeDate;
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

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Date getIncomeDate() {
        return incomeDate;
    }

    public void setIncomeDate(Date incomeDate) {
        this.incomeDate = incomeDate;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryIcon() {
        return categoryIcon;
    }

    public void setCategoryIcon(String categoryIcon) {
        this.categoryIcon = categoryIcon;
    }

    public String getCategoryColor() {
        return categoryColor;
    }

    public void setCategoryColor(String categoryColor) {
        this.categoryColor = categoryColor;
    }

    @Override
    public String toString() {
        return "Income{" +
                "id=" + id +
                ", userId=" + userId +
                ", categoryId=" + categoryId +
                ", amount=" + amount +
                ", description='" + description + '\'' +
                ", source='" + source + '\'' +
                ", incomeDate=" + incomeDate +
                '}';
    }
}
