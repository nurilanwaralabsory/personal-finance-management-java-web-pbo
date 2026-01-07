package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class Expense {
    private int id;
    private int userId;
    private Integer categoryId;
    private BigDecimal amount;
    private String description;
    private String recipient;
    private Date expenseDate;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    // Tambahan untuk join dengan category
    private String categoryName;
    private String categoryIcon;
    private String categoryColor;

    // Default constructor
    public Expense() {
    }

    // Constructor dengan parameter dasar
    public Expense(int userId, BigDecimal amount, Date expenseDate) {
        this.userId = userId;
        this.amount = amount;
        this.expenseDate = expenseDate;
    }

    // Constructor dengan parameter lengkap
    public Expense(int userId, Integer categoryId, BigDecimal amount, 
                   String description, String recipient, Date expenseDate) {
        this.userId = userId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.recipient = recipient;
        this.expenseDate = expenseDate;
    }

    // Constructor lengkap dengan id dan timestamp
    public Expense(int id, int userId, Integer categoryId, BigDecimal amount,
                   String description, String recipient, Date expenseDate,
                   Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.userId = userId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.recipient = recipient;
        this.expenseDate = expenseDate;
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

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public Date getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(Date expenseDate) {
        this.expenseDate = expenseDate;
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
        return "Expense{" +
                "id=" + id +
                ", userId=" + userId +
                ", categoryId=" + categoryId +
                ", amount=" + amount +
                ", description='" + description + '\'' +
                ", recipient='" + recipient + '\'' +
                ", expenseDate=" + expenseDate +
                '}';
    }
}
