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
import java.sql.Date;
import java.util.List;

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
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        List<Budget> budgets = budgetDAO.getAllBudgets(userId);
        List<Category> categories = categoryDAO.getAllCategories(userId); // For the add modal

        request.setAttribute("budgets", budgets);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/budgets.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        int userId = (int) session.getAttribute("userId");

        if ("add".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            Date startDate = Date.valueOf(request.getParameter("start_date"));
            Date endDate = Date.valueOf(request.getParameter("end_date"));

            Budget b = new Budget();
            b.setUserId(userId);
            b.setCategoryId(categoryId);
            b.setAmount(amount);
            b.setStartDate(startDate);
            b.setEndDate(endDate);

            budgetDAO.addBudget(b);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            budgetDAO.deleteBudget(id, userId);
        }

        response.sendRedirect("budgets");
    }
}
