package controller;

import dao.BudgetDAO;
import dao.CategoryDAO;
import model.Budget;
import model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

/**
 * Servlet untuk mengelola Budget/Anggaran
 */
public class BudgetServlet extends HttpServlet {
    private BudgetDAO budgetDAO;
    private CategoryDAO categoryDAO;
    
    @Override
    public void init() throws ServletException {
        budgetDAO = new BudgetDAO();
        categoryDAO = new CategoryDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            System.out.println("BudgetServlet: No session or userId, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Integer userId = (Integer) session.getAttribute("userId");
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        System.out.println("BudgetServlet doGet - action: " + action + ", userId: " + userId);
        
        try {
            switch (action) {
                case "new":
                    System.out.println("BudgetServlet: Calling showNewForm");
                    showNewForm(request, response, userId);
                    break;
                case "edit":
                    showEditForm(request, response, userId);
                    break;
                case "delete":
                    deleteBudget(request, response, userId);
                    break;
                case "update-spent":
                    updateSpentAmounts(request, response, userId);
                    break;
                case "list":
                default:
                    listBudgets(request, response, userId);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Terjadi kesalahan: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/budgets");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Integer userId = (Integer) session.getAttribute("userId");
        
        String action = request.getParameter("action");
        
        if ("insert".equals(action)) {
            insertBudget(request, response, userId);
        } else if ("update".equals(action)) {
            updateBudget(request, response, userId);
        }
    }
    
    /**
     * Menampilkan daftar budget
     */
    private void listBudgets(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            String filter = request.getParameter("filter");
            // Ensure spent amounts are up to date before fetching
            budgetDAO.updateAllSpentAmounts(userId);

            List<Budget> budgets;
            if ("active".equals(filter)) {
                budgets = budgetDAO.getActiveBudgets(userId);
            } else if ("alert".equals(filter)) {
                budgets = budgetDAO.getBudgetsNearLimit(userId);
            } else {
                budgets = budgetDAO.getAllByUserId(userId);
            }
            
            request.setAttribute("budgets", budgets);
            request.setAttribute("filter", filter);
            request.getRequestDispatcher("/budgets.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Terjadi kesalahan saat memuat data budget: " + e.getMessage());
            request.setAttribute("budgets", new java.util.ArrayList<Budget>());
            request.getRequestDispatcher("/budgets.jsp").forward(request, response);
        }
    }
    
    /**
     * Menampilkan form tambah budget
     */
    private void showNewForm(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            System.out.println("BudgetServlet showNewForm: userId=" + userId);
            List<Category> categories = categoryDAO.findByType(userId, "expense");
            System.out.println("BudgetServlet showNewForm: Found " + (categories != null ? categories.size() : 0) + " expense categories");
            
            request.setAttribute("categories", categories);
            
            if (categories == null || categories.isEmpty()) {
                request.setAttribute("infoMessage", "Anda belum memiliki kategori expense. Silakan buat kategori expense terlebih dahulu di menu Kategori.");
            }
            
            System.out.println("BudgetServlet showNewForm: Forwarding to /budget-form.jsp");
            request.getRequestDispatcher("/budget-form.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("BudgetServlet showNewForm ERROR: " + e.getMessage());
            request.getSession().setAttribute("errorMessage", "Gagal memuat form budget: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/budgets");
        }
    }
    
    /**
     * Menampilkan form edit budget
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            int budgetId = Integer.parseInt(request.getParameter("id"));
            Budget budget = budgetDAO.getById(budgetId);
            if (budget == null || !budget.getUserId().equals(userId)) {
                request.getSession().setAttribute("errorMessage", "Budget tidak ditemukan atau tidak milik Anda.");
                response.sendRedirect(request.getContextPath() + "/budgets");
                return;
            }
        
            List<Category> categories = categoryDAO.findByType(userId, "expense");
            request.setAttribute("budget", budget);
            request.setAttribute("categories", categories);
            
            if (categories == null || categories.isEmpty()) {
                request.setAttribute("infoMessage", "Anda belum memiliki kategori expense. Silakan buat kategori expense terlebih dahulu di menu Kategori.");
            }
            
            request.getRequestDispatcher("/budget-form.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            request.getSession().setAttribute("errorMessage", "ID budget tidak valid.");
            response.sendRedirect(request.getContextPath() + "/budgets");
        } catch (Exception ex) {
            ex.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Gagal memuat form edit: " + ex.getMessage());
            response.sendRedirect(request.getContextPath() + "/budgets");
        }
    }
    
    /**
     * Menambah budget baru
     */
    private void insertBudget(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            Budget budget = new Budget();
            budget.setUserId(userId);
            budget.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            budget.setAmount(new BigDecimal(request.getParameter("amount")));
            budget.setPeriod(request.getParameter("period"));
            budget.setStartDate(LocalDate.parse(request.getParameter("startDate")));
            budget.setEndDate(LocalDate.parse(request.getParameter("endDate")));
            budget.setAlertThreshold(Integer.parseInt(request.getParameter("alertThreshold")));
            budget.setIsActive(Boolean.parseBoolean(request.getParameter("isActive")));
            
            // Validate dates
            if (budget.getEndDate().isBefore(budget.getStartDate())) {
                request.setAttribute("errorMessage", "Tanggal selesai harus lebih besar dari tanggal mulai!");
                showNewForm(request, response, userId);
                return;
            }
            
            // Check for overlapping budgets
            if (budget.getIsActive() && budgetDAO.hasOverlappingBudget(userId, budget.getCategoryId(), 
                    budget.getStartDate(), budget.getEndDate(), null)) {
                request.setAttribute("errorMessage", "Sudah ada budget aktif untuk kategori ini pada periode yang sama!");
                showNewForm(request, response, userId);
                return;
            }
            
            if (budgetDAO.insert(budget)) {
                // Update spent amount untuk budget yang baru dibuat
                budgetDAO.updateSpentAmount(budget.getId());
                
                request.getSession().setAttribute("successMessage", "Budget berhasil ditambahkan!");
                response.sendRedirect(request.getContextPath() + "/budgets");
            } else {
                request.setAttribute("errorMessage", "Gagal menambahkan budget. Silakan coba lagi.");
                showNewForm(request, response, userId);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Format angka tidak valid. Pastikan semua input numerik sudah benar.");
            showNewForm(request, response, userId);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            showNewForm(request, response, userId);
        }
    }
    
    /**
     * Mengupdate budget
     */
    private void updateBudget(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            Budget budget = new Budget();
            budget.setId(Integer.parseInt(request.getParameter("id")));
            budget.setUserId(userId);
            budget.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            budget.setAmount(new BigDecimal(request.getParameter("amount")));
            budget.setPeriod(request.getParameter("period"));
            budget.setStartDate(LocalDate.parse(request.getParameter("startDate")));
            budget.setEndDate(LocalDate.parse(request.getParameter("endDate")));
            budget.setAlertThreshold(Integer.parseInt(request.getParameter("alertThreshold")));
            budget.setIsActive(Boolean.parseBoolean(request.getParameter("isActive")));
            
            // Validate dates
            if (budget.getEndDate().isBefore(budget.getStartDate())) {
                request.setAttribute("errorMessage", "Tanggal selesai harus lebih besar dari tanggal mulai!");
                showEditForm(request, response, userId);
                return;
            }
            
            // Check for overlapping budgets
            if (budget.getIsActive() && budgetDAO.hasOverlappingBudget(userId, budget.getCategoryId(), 
                    budget.getStartDate(), budget.getEndDate(), budget.getId())) {
                request.setAttribute("errorMessage", "Sudah ada budget aktif untuk kategori ini pada periode yang sama!");
                showEditForm(request, response, userId);
                return;
            }
            
            if (budgetDAO.update(budget)) {
                // Update spent amount setelah update
                budgetDAO.updateSpentAmount(budget.getId());
                
                request.getSession().setAttribute("successMessage", "Budget berhasil diupdate!");
                response.sendRedirect(request.getContextPath() + "/budgets");
            } else {
                request.setAttribute("errorMessage", "Gagal mengupdate budget. Silakan coba lagi.");
                showEditForm(request, response, userId);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Format angka tidak valid. Pastikan semua input numerik sudah benar.");
            showEditForm(request, response, userId);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            showEditForm(request, response, userId);
        }
    }
    
    /**
     * Menghapus budget
     */
    private void deleteBudget(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            int budgetId = Integer.parseInt(request.getParameter("id"));
            Budget existingBudget = budgetDAO.getById(budgetId);
            
            if (existingBudget == null || !existingBudget.getUserId().equals(userId)) {
                request.getSession().setAttribute("errorMessage", "Budget tidak ditemukan atau tidak milik Anda.");
            } else if (budgetDAO.delete(budgetId, userId)) {
                request.getSession().setAttribute("successMessage", "Budget berhasil dihapus!");
            } else {
                request.getSession().setAttribute("errorMessage", "Gagal menghapus budget. Silakan coba lagi.");
            }
        } catch (NumberFormatException ex) {
            request.getSession().setAttribute("errorMessage", "ID budget tidak valid.");
        } catch (Exception ex) {
            ex.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Terjadi kesalahan: " + ex.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/budgets");
    }
    
    /**
     * Update spent amounts untuk semua budget user
     */
    private void updateSpentAmounts(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        try {
            if (budgetDAO.updateAllSpentAmounts(userId)) {
                request.getSession().setAttribute("successMessage", "Data budget berhasil diperbarui!");
            } else {
                request.getSession().setAttribute("errorMessage", "Gagal memperbarui data budget. Silakan coba lagi.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Terjadi kesalahan saat memperbarui data: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/budgets");
    }
}
