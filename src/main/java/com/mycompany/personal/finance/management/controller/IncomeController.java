package com.mycompany.personal.finance.management.controller;

import com.mycompany.personal.finance.management.dao.CategoryDAO;
import com.mycompany.personal.finance.management.dao.IncomeDAO;
import com.mycompany.personal.finance.management.model.Category;
import com.mycompany.personal.finance.management.model.Income;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class IncomeController extends HttpServlet {
    private IncomeDAO incomeDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        incomeDAO = new IncomeDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Income> incomes = incomeDAO.getAllIncome();
        List<Category> categories = categoryDAO.getCategoriesByType("PEMASUKAN");

        request.setAttribute("incomes", incomes);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("income.jsp").forward(request, response);
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

            Income newIncome = new Income(jumlah, tanggal, deskripsi, kategoriId);
            incomeDAO.addIncome(newIncome);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            incomeDAO.deleteIncome(id);
        }
        response.sendRedirect("income");
    }
}
