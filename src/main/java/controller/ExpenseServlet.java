package controller;

import dao.CategoryDAO;
import dao.ExpenseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Expense;
import model.User;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class ExpenseServlet extends HttpServlet {
    
    private ExpenseDAO expenseDAO;
    private CategoryDAO categoryDAO;
    
    @Override
    public void init() throws ServletException {
        expenseDAO = new ExpenseDAO();
        categoryDAO = new CategoryDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Cek session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "list":
                listExpenses(request, response, user);
                break;
            case "add":
                showAddForm(request, response, user);
                break;
            case "edit":
                showEditForm(request, response, user);
                break;
            case "delete":
                deleteExpense(request, response, user);
                break;
            default:
                listExpenses(request, response, user);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // Cek session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "add";
        }
        
        switch (action) {
            case "add":
                addExpense(request, response, user);
                break;
            case "update":
                updateExpense(request, response, user);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/expenses");
                break;
        }
    }
    
    // Tampilkan daftar pengeluaran
    private void listExpenses(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        List<Expense> expenses = expenseDAO.findAllByUserId(user.getId());
        BigDecimal totalExpense = expenseDAO.getTotalByUserId(user.getId());
        BigDecimal totalThisMonth = expenseDAO.getTotalThisMonth(user.getId());
        
        request.setAttribute("expenses", expenses);
        request.setAttribute("totalExpense", totalExpense);
        request.setAttribute("totalThisMonth", totalThisMonth);
        request.getRequestDispatcher("/expenses.jsp").forward(request, response);
    }
    
    // Tampilkan form tambah pengeluaran
    private void showAddForm(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        List<Category> categories = categoryDAO.findByType(user.getId(), "expense");
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/expense-form.jsp").forward(request, response);
    }
    
    // Tampilkan form edit pengeluaran
    private void showEditForm(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/expenses");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Expense expense = expenseDAO.findById(id, user.getId());
            
            if (expense == null) {
                request.getSession().setAttribute("error", "Pengeluaran tidak ditemukan!");
                response.sendRedirect(request.getContextPath() + "/expenses");
                return;
            }
            
            List<Category> categories = categoryDAO.findByType(user.getId(), "expense");
            
            request.setAttribute("expense", expense);
            request.setAttribute("categories", categories);
            request.setAttribute("editMode", true);
            request.getRequestDispatcher("/expense-form.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/expenses");
        }
    }
    
    // Tambah pengeluaran baru
    private void addExpense(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String categoryIdParam = request.getParameter("categoryId");
        String amountParam = request.getParameter("amount");
        String description = request.getParameter("description");
        String recipient = request.getParameter("recipient");
        String expenseDateParam = request.getParameter("expenseDate");
        
        // Validasi input
        if (amountParam == null || amountParam.trim().isEmpty()) {
            request.setAttribute("error", "Jumlah pengeluaran tidak boleh kosong!");
            showAddForm(request, response, user);
            return;
        }
        
        if (expenseDateParam == null || expenseDateParam.trim().isEmpty()) {
            request.setAttribute("error", "Tanggal pengeluaran tidak boleh kosong!");
            showAddForm(request, response, user);
            return;
        }
        
        try {
            BigDecimal amount = new BigDecimal(amountParam.replace(",", "").replace(".", "").trim());
            
            if (amount.compareTo(BigDecimal.ZERO) <= 0) {
                request.setAttribute("error", "Jumlah pengeluaran harus lebih dari 0!");
                showAddForm(request, response, user);
                return;
            }
            
            Date expenseDate = Date.valueOf(expenseDateParam);
            
            Integer categoryId = null;
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdParam);
            }
            
            // Buat pengeluaran baru
            Expense expense = new Expense();
            expense.setUserId(user.getId());
            expense.setCategoryId(categoryId);
            expense.setAmount(amount);
            expense.setDescription(description);
            expense.setRecipient(recipient);
            expense.setExpenseDate(expenseDate);
            
            if (expenseDAO.insert(expense)) {
                request.getSession().setAttribute("success", "Pengeluaran berhasil ditambahkan!");
                response.sendRedirect(request.getContextPath() + "/expenses");
            } else {
                request.setAttribute("error", "Gagal menambahkan pengeluaran!");
                showAddForm(request, response, user);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Format jumlah tidak valid!");
            showAddForm(request, response, user);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Format tanggal tidak valid!");
            showAddForm(request, response, user);
        }
    }
    
    // Update pengeluaran
    private void updateExpense(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String categoryIdParam = request.getParameter("categoryId");
        String amountParam = request.getParameter("amount");
        String description = request.getParameter("description");
        String recipient = request.getParameter("recipient");
        String expenseDateParam = request.getParameter("expenseDate");
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/expenses");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Expense existingExpense = expenseDAO.findById(id, user.getId());
            
            if (existingExpense == null) {
                request.getSession().setAttribute("error", "Pengeluaran tidak ditemukan!");
                response.sendRedirect(request.getContextPath() + "/expenses");
                return;
            }
            
            // Validasi input
            if (amountParam == null || amountParam.trim().isEmpty()) {
                request.setAttribute("error", "Jumlah pengeluaran tidak boleh kosong!");
                request.setAttribute("expense", existingExpense);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "expense"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/expense-form.jsp").forward(request, response);
                return;
            }
            
            if (expenseDateParam == null || expenseDateParam.trim().isEmpty()) {
                request.setAttribute("error", "Tanggal pengeluaran tidak boleh kosong!");
                request.setAttribute("expense", existingExpense);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "expense"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/expense-form.jsp").forward(request, response);
                return;
            }
            
            BigDecimal amount = new BigDecimal(amountParam.replace(",", "").replace(".", "").trim());
            
            if (amount.compareTo(BigDecimal.ZERO) <= 0) {
                request.setAttribute("error", "Jumlah pengeluaran harus lebih dari 0!");
                request.setAttribute("expense", existingExpense);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "expense"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/expense-form.jsp").forward(request, response);
                return;
            }
            
            Date expenseDate = Date.valueOf(expenseDateParam);
            
            Integer categoryId = null;
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdParam);
            }
            
            // Update pengeluaran
            existingExpense.setCategoryId(categoryId);
            existingExpense.setAmount(amount);
            existingExpense.setDescription(description);
            existingExpense.setRecipient(recipient);
            existingExpense.setExpenseDate(expenseDate);
            
            if (expenseDAO.update(existingExpense)) {
                request.getSession().setAttribute("success", "Pengeluaran berhasil diperbarui!");
                response.sendRedirect(request.getContextPath() + "/expenses");
            } else {
                request.setAttribute("error", "Gagal memperbarui pengeluaran!");
                request.setAttribute("expense", existingExpense);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "expense"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/expense-form.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Format data tidak valid!");
            response.sendRedirect(request.getContextPath() + "/expenses");
        } catch (IllegalArgumentException e) {
            request.getSession().setAttribute("error", "Format tanggal tidak valid!");
            response.sendRedirect(request.getContextPath() + "/expenses");
        }
    }
    
    // Hapus pengeluaran
    private void deleteExpense(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/expenses");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            
            if (expenseDAO.delete(id, user.getId())) {
                request.getSession().setAttribute("success", "Pengeluaran berhasil dihapus!");
            } else {
                request.getSession().setAttribute("error", "Gagal menghapus pengeluaran!");
            }
            
            response.sendRedirect(request.getContextPath() + "/expenses");
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/expenses");
        }
    }
}
