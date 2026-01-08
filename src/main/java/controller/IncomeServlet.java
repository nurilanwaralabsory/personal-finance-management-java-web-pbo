package controller;

import dao.CategoryDAO;
import dao.IncomeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Income;
import model.User;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class IncomeServlet extends HttpServlet {
    
    private IncomeDAO incomeDAO;
    private CategoryDAO categoryDAO;
    
    @Override
    public void init() throws ServletException {
        incomeDAO = new IncomeDAO();
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
                listIncomes(request, response, user);
                break;
            case "add":
                showAddForm(request, response, user);
                break;
            case "edit":
                showEditForm(request, response, user);
                break;
            case "delete":
                deleteIncome(request, response, user);
                break;
            default:
                listIncomes(request, response, user);
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
                addIncome(request, response, user);
                break;
            case "update":
                updateIncome(request, response, user);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/incomes");
                break;
        }
    }
    
    // Tampilkan daftar pemasukan
    private void listIncomes(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        List<Income> incomes = incomeDAO.findAllByUserId(user.getId());
        BigDecimal totalIncome = incomeDAO.getTotalByUserId(user.getId());
        BigDecimal totalThisMonth = incomeDAO.getTotalThisMonth(user.getId());
        
        request.setAttribute("incomes", incomes);
        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("totalThisMonth", totalThisMonth);
        request.getRequestDispatcher("/incomes.jsp").forward(request, response);
    }
    
    // Tampilkan form tambah pemasukan
    private void showAddForm(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        List<Category> categories = categoryDAO.findByType(user.getId(), "income");
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/income-form.jsp").forward(request, response);
    }
    
    // Tampilkan form edit pemasukan
    private void showEditForm(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/incomes");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Income income = incomeDAO.findById(id, user.getId());
            
            if (income == null) {
                request.getSession().setAttribute("error", "Pemasukan tidak ditemukan!");
                response.sendRedirect(request.getContextPath() + "/incomes");
                return;
            }
            
            List<Category> categories = categoryDAO.findByType(user.getId(), "income");
            
            request.setAttribute("income", income);
            request.setAttribute("categories", categories);
            request.setAttribute("editMode", true);
            request.getRequestDispatcher("/income-form.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/incomes");
        }
    }
    
    // Tambah pemasukan baru
    private void addIncome(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String categoryIdParam = request.getParameter("categoryId");
        String amountParam = request.getParameter("amount");
        String description = request.getParameter("description");
        String source = request.getParameter("source");
        String incomeDateParam = request.getParameter("incomeDate");
        
        // Validasi input
        if (amountParam == null || amountParam.trim().isEmpty()) {
            request.setAttribute("error", "Jumlah pemasukan tidak boleh kosong!");
            showAddForm(request, response, user);
            return;
        }
        
        if (incomeDateParam == null || incomeDateParam.trim().isEmpty()) {
            request.setAttribute("error", "Tanggal pemasukan tidak boleh kosong!");
            showAddForm(request, response, user);
            return;
        }
        
        try {
            BigDecimal amount = new BigDecimal(amountParam.replace(",", "").replace(".", "").trim());
            
            if (amount.compareTo(BigDecimal.ZERO) <= 0) {
                request.setAttribute("error", "Jumlah pemasukan harus lebih dari 0!");
                showAddForm(request, response, user);
                return;
            }
            
            Date incomeDate = Date.valueOf(incomeDateParam);
            
            Integer categoryId = null;
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdParam);
            }
            
            // Buat pemasukan baru
            Income income = new Income();
            income.setUserId(user.getId());
            income.setCategoryId(categoryId);
            income.setAmount(amount);
            income.setDescription(description);
            income.setSource(source);
            income.setIncomeDate(incomeDate);
            
            if (incomeDAO.insert(income)) {
                request.getSession().setAttribute("success", "Pemasukan berhasil ditambahkan!");
                response.sendRedirect(request.getContextPath() + "/incomes");
            } else {
                request.setAttribute("error", "Gagal menambahkan pemasukan!");
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
    
    // Update pemasukan
    private void updateIncome(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String categoryIdParam = request.getParameter("categoryId");
        String amountParam = request.getParameter("amount");
        String description = request.getParameter("description");
        String source = request.getParameter("source");
        String incomeDateParam = request.getParameter("incomeDate");
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/incomes");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Income existingIncome = incomeDAO.findById(id, user.getId());
            
            if (existingIncome == null) {
                request.getSession().setAttribute("error", "Pemasukan tidak ditemukan!");
                response.sendRedirect(request.getContextPath() + "/incomes");
                return;
            }
            
            // Validasi input
            if (amountParam == null || amountParam.trim().isEmpty()) {
                request.setAttribute("error", "Jumlah pemasukan tidak boleh kosong!");
                request.setAttribute("income", existingIncome);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "income"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/income-form.jsp").forward(request, response);
                return;
            }
            
            if (incomeDateParam == null || incomeDateParam.trim().isEmpty()) {
                request.setAttribute("error", "Tanggal pemasukan tidak boleh kosong!");
                request.setAttribute("income", existingIncome);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "income"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/income-form.jsp").forward(request, response);
                return;
            }
            
            BigDecimal amount = new BigDecimal(amountParam.replace(",", "").replace(".", "").trim());
            
            if (amount.compareTo(BigDecimal.ZERO) <= 0) {
                request.setAttribute("error", "Jumlah pemasukan harus lebih dari 0!");
                request.setAttribute("income", existingIncome);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "income"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/income-form.jsp").forward(request, response);
                return;
            }
            
            Date incomeDate = Date.valueOf(incomeDateParam);
            
            Integer categoryId = null;
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdParam);
            }
            
            // Update pemasukan
            existingIncome.setCategoryId(categoryId);
            existingIncome.setAmount(amount);
            existingIncome.setDescription(description);
            existingIncome.setSource(source);
            existingIncome.setIncomeDate(incomeDate);
            
            if (incomeDAO.update(existingIncome)) {
                request.getSession().setAttribute("success", "Pemasukan berhasil diperbarui!");
                response.sendRedirect(request.getContextPath() + "/incomes");
            } else {
                request.setAttribute("error", "Gagal memperbarui pemasukan!");
                request.setAttribute("income", existingIncome);
                request.setAttribute("categories", categoryDAO.findByType(user.getId(), "income"));
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/income-form.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Format data tidak valid!");
            response.sendRedirect(request.getContextPath() + "/incomes");
        } catch (IllegalArgumentException e) {
            request.getSession().setAttribute("error", "Format tanggal tidak valid!");
            response.sendRedirect(request.getContextPath() + "/incomes");
        }
    }
    
    // Hapus pemasukan
    private void deleteIncome(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/incomes");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            
            if (incomeDAO.delete(id, user.getId())) {
                request.getSession().setAttribute("success", "Pemasukan berhasil dihapus!");
            } else {
                request.getSession().setAttribute("error", "Gagal menghapus pemasukan!");
            }
            
            response.sendRedirect(request.getContextPath() + "/incomes");
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/incomes");
        }
    }
}
