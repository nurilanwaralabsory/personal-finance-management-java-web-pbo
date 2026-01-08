package com.mycompany.personal.finance.management.controller;

import com.mycompany.personal.finance.management.dao.DashboardDAO;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public class DashboardController extends HttpServlet {
    private DashboardDAO dashboardDAO;

    @Override
    public void init() {
        dashboardDAO = new DashboardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BigDecimal totalIncome = dashboardDAO.getTotalIncome();
        BigDecimal totalExpense = dashboardDAO.getTotalExpense();
        BigDecimal balance = totalIncome.subtract(totalExpense);
        List<Map<String, Object>> recentTransactions = dashboardDAO.getRecentTransactions();

        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("totalExpense", totalExpense);
        request.setAttribute("balance", balance);
        request.setAttribute("recentTransactions", recentTransactions);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
