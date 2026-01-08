package com.mycompany.personal.finance.management.controller;

import com.mycompany.personal.finance.management.dao.CategoryDAO;
import com.mycompany.personal.finance.management.dao.ExpenseDAO;
import com.mycompany.personal.finance.management.model.Category;
import com.mycompany.personal.finance.management.model.Expense;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class ExpenseController extends HttpServlet {
    private ExpenseDAO expenseDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        expenseDAO = new ExpenseDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Expense> expenses = expenseDAO.getAllExpenses();
        List<Category> categories = categoryDAO.getCategoriesByType("PENGELUARAN");

        request.setAttribute("expenses", expenses);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("expense.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            BigDecimal jumlah = new BigDecimal(request.getParameter("jumlah"));
            Date tanggal = Date.valueOf(request.getParameter("tanggal"));
            String deskripsi = request.getParameter("deskripsi");
            int kategoriId = Integer.parseInt(request.getParameter("kategori_id"));

            Expense newExpense = new Expense(jumlah, tanggal, deskripsi, kategoriId);
            expenseDAO.addExpense(newExpense);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            expenseDAO.deleteExpense(id);
        }
        response.sendRedirect("expense");
    }
}
