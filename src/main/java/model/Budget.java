package model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Model class untuk Budget/Anggaran
 */
public class Budget {
    private Integer id;
    private Integer userId;
    private Integer categoryId;
    private BigDecimal amount;
    private String period; // MONTHLY, WEEKLY, YEARLY
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal spent;
    private Integer alertThreshold;
    private Boolean isActive;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    // Data tambahan dari join dengan tabel lain
    private String categoryName;
    private String categoryType;
    
    public Budget() {
        this.spent = BigDecimal.ZERO;
        this.alertThreshold = 80;
        this.isActive = true;
    }
    
    public Budget(Integer userId, Integer categoryId, BigDecimal amount, String period, 
                  LocalDate startDate, LocalDate endDate) {
        this();
        this.userId = userId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.period = period;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
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

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public BigDecimal getSpent() {
        return spent;
    }

    public void setSpent(BigDecimal spent) {
        this.spent = spent;
    }

    public Integer getAlertThreshold() {
        return alertThreshold;
    }

    public void setAlertThreshold(Integer alertThreshold) {
        this.alertThreshold = alertThreshold;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(String categoryType) {
        this.categoryType = categoryType;
    }
    
    // Helper methods
    public BigDecimal getRemaining() {
        return amount.subtract(spent);
    }
    
    public double getUsagePercentage() {
        if (amount.compareTo(BigDecimal.ZERO) == 0) {
            return 0.0;
        }
        return spent.divide(amount, 4, RoundingMode.HALF_UP)
                   .multiply(BigDecimal.valueOf(100))
                   .doubleValue();
    }
    
    public boolean isOverBudget() {
        return spent.compareTo(amount) > 0;
    }
    
    public boolean isNearLimit() {
        double percentage = getUsagePercentage();
        return percentage >= alertThreshold && percentage < 100;
    }
    
    public String getStatusClass() {
        if (isOverBudget()) {
            return "danger";
        } else if (isNearLimit()) {
            return "warning";
        }
        return "success";
    }

    @Override
    public String toString() {
        return "Budget{" +
                "id=" + id +
                ", userId=" + userId +
                ", categoryId=" + categoryId +
                ", amount=" + amount +
                ", period='" + period + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", spent=" + spent +
                ", alertThreshold=" + alertThreshold +
                ", isActive=" + isActive +
                '}';
    }
}
