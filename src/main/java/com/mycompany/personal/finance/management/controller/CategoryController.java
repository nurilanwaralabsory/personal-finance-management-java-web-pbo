package com.mycompany.personal.finance.management.controller;

import com.mycompany.personal.finance.management.dao.CategoryDAO;
import com.mycompany.personal.finance.management.model.Category;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CategoryController extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String nama = request.getParameter("nama");
            String tipe = request.getParameter("tipe");
            Category newCategory = new Category(nama, tipe);
            categoryDAO.addCategory(newCategory);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            categoryDAO.deleteCategory(id);
        }
        response.sendRedirect("categories");
    }
}
