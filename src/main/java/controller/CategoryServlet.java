package controller;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.User;

import java.io.IOException;
import java.util.List;

public class CategoryServlet extends HttpServlet {
    
    private CategoryDAO categoryDAO;
    
    @Override
    public void init() throws ServletException {
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
                listCategories(request, response, user);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response, user);
                break;
            case "delete":
                deleteCategory(request, response, user);
                break;
            default:
                listCategories(request, response, user);
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
                addCategory(request, response, user);
                break;
            case "update":
                updateCategory(request, response, user);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/categories");
                break;
        }
    }
    
    // Tampilkan daftar kategori
    private void listCategories(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        List<Category> categories;
        
        if (type != null && (type.equals("income") || type.equals("expense"))) {
            categories = categoryDAO.findByType(user.getId(), type);
        } else {
            categories = categoryDAO.findAllByUserId(user.getId());
        }
        
        request.setAttribute("categories", categories);
        request.setAttribute("selectedType", type);
        request.getRequestDispatcher("/categories.jsp").forward(request, response);
    }
    
    // Tampilkan form tambah kategori
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        request.setAttribute("categoryType", type);
        request.getRequestDispatcher("/category-form.jsp").forward(request, response);
    }
    
    // Tampilkan form edit kategori
    private void showEditForm(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Category category = categoryDAO.findById(id, user.getId());
            
            if (category == null) {
                request.setAttribute("error", "Kategori tidak ditemukan!");
                listCategories(request, response, user);
                return;
            }
            
            request.setAttribute("category", category);
            request.setAttribute("editMode", true);
            request.getRequestDispatcher("/category-form.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/categories");
        }
    }
    
    // Tambah kategori baru
    private void addCategory(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String icon = request.getParameter("icon");
        String color = request.getParameter("color");
        
        // Validasi input
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Nama kategori tidak boleh kosong!");
            request.setAttribute("categoryType", type);
            request.getRequestDispatcher("/category-form.jsp").forward(request, response);
            return;
        }
        
        if (type == null || (!type.equals("income") && !type.equals("expense"))) {
            request.setAttribute("error", "Tipe kategori tidak valid!");
            request.setAttribute("categoryType", type);
            request.getRequestDispatcher("/category-form.jsp").forward(request, response);
            return;
        }
        
        // Cek apakah nama sudah ada
        if (categoryDAO.isNameExists(user.getId(), name.trim(), type)) {
            request.setAttribute("error", "Nama kategori sudah ada untuk tipe ini!");
            request.setAttribute("categoryType", type);
            request.getRequestDispatcher("/category-form.jsp").forward(request, response);
            return;
        }
        
        // Buat kategori baru
        Category category = new Category();
        category.setUserId(user.getId());
        category.setName(name.trim());
        category.setType(type);
        category.setDescription(description);
        category.setIcon(icon != null && !icon.isEmpty() ? icon : "ri-folder-line");
        category.setColor(color != null && !color.isEmpty() ? color : "#7367f0");
        
        if (categoryDAO.insert(category)) {
            request.getSession().setAttribute("success", "Kategori berhasil ditambahkan!");
            response.sendRedirect(request.getContextPath() + "/categories?type=" + type);
        } else {
            request.setAttribute("error", "Gagal menambahkan kategori!");
            request.setAttribute("categoryType", type);
            request.getRequestDispatcher("/category-form.jsp").forward(request, response);
        }
    }
    
    // Update kategori
    private void updateCategory(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String icon = request.getParameter("icon");
        String color = request.getParameter("color");
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Category existingCategory = categoryDAO.findById(id, user.getId());
            
            if (existingCategory == null) {
                request.getSession().setAttribute("error", "Kategori tidak ditemukan!");
                response.sendRedirect(request.getContextPath() + "/categories");
                return;
            }
            
            // Validasi input
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Nama kategori tidak boleh kosong!");
                request.setAttribute("category", existingCategory);
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/category-form.jsp").forward(request, response);
                return;
            }
            
            // Cek apakah nama sudah ada (kecuali untuk kategori yang sedang diedit)
            if (categoryDAO.isNameExistsExcludeId(user.getId(), name.trim(), existingCategory.getType(), id)) {
                request.setAttribute("error", "Nama kategori sudah ada!");
                request.setAttribute("category", existingCategory);
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/category-form.jsp").forward(request, response);
                return;
            }
            
            // Update kategori
            existingCategory.setName(name.trim());
            existingCategory.setDescription(description);
            existingCategory.setIcon(icon != null && !icon.isEmpty() ? icon : existingCategory.getIcon());
            existingCategory.setColor(color != null && !color.isEmpty() ? color : existingCategory.getColor());
            
            if (categoryDAO.update(existingCategory)) {
                request.getSession().setAttribute("success", "Kategori berhasil diperbarui!");
                response.sendRedirect(request.getContextPath() + "/categories?type=" + existingCategory.getType());
            } else {
                request.setAttribute("error", "Gagal memperbarui kategori!");
                request.setAttribute("category", existingCategory);
                request.setAttribute("editMode", true);
                request.getRequestDispatcher("/category-form.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/categories");
        }
    }
    
    // Hapus kategori
    private void deleteCategory(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String type = request.getParameter("type");
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            
            if (categoryDAO.delete(id, user.getId())) {
                request.getSession().setAttribute("success", "Kategori berhasil dihapus!");
            } else {
                request.getSession().setAttribute("error", "Gagal menghapus kategori!");
            }
            
            if (type != null && !type.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/categories?type=" + type);
            } else {
                response.sendRedirect(request.getContextPath() + "/categories");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/categories");
        }
    }
}
