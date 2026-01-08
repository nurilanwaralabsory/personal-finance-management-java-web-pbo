package com.mycompany.personal.finance.management.controller;

import com.mycompany.personal.finance.management.dao.BudgetDAO;
import com.mycompany.personal.finance.management.dao.CategoryDAO;
import com.mycompany.personal.finance.management.model.Budget;
import com.mycompany.personal.finance.management.model.Category;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class BudgetController extends HttpServlet {
    private BudgetDAO budgetDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        budgetDAO = new BudgetDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Budget> budgets = budgetDAO.getAllBudgets();
        List<Category> categories = categoryDAO.getCategoriesByType("PENGELUARAN");

        request.setAttribute("budgets", budgets);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("budgets.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            BigDecimal jumlah = new BigDecimal(request.getParameter("jumlah"));
            int kategoriId = Integer.parseInt(request.getParameter("kategori_id"));
            // For simplicity, using first day of current month or input month.
            // Better to let user pick month, or default to current month.
            // Let's assume user inputs a date and we use that (e.g. YYYY-MM-01).
            String bulanStr = request.getParameter("bulan"); // Expecting yyyy-MM-dd
            // Ensure day is 01? Or just store as date.
            Date bulan = Date.valueOf(bulanStr);

            Budget newBudget = new Budget(jumlah, kategoriId, bulan);
            budgetDAO.addBudget(newBudget);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            budgetDAO.deleteBudget(id);
        }
        response.sendRedirect("budgets");
    }
}
