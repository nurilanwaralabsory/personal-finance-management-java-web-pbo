package controller;

import dao.CategoryDAO;
import dao.TransactionDAO;
import model.Category;
import model.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class TransactionServlet extends HttpServlet {

    private TransactionDAO transactionDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        transactionDAO = new TransactionDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String servletPath = request.getServletPath();

        if (servletPath.equals("/income")) {
            List<Category> categories = categoryDAO.getAllCategories(userId);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/income.jsp").forward(request, response);

        } else if (servletPath.equals("/expense")) {
            List<Category> categories = categoryDAO.getAllCategories(userId);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/expense.jsp").forward(request, response);

        } else {
            // Default: List transactions
            List<Transaction> transactions = transactionDAO.getAllTransactions(userId);
            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("/transactions.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        int userId = (int) session.getAttribute("userId");

        if ("add".equals(action)) {
            String type = request.getParameter("type");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            Date date = Date.valueOf(request.getParameter("date"));

            Transaction t = new Transaction();
            t.setUserId(userId);
            t.setCategoryId(categoryId);
            t.setAmount(amount);
            t.setDescription(description);
            t.setType(type);
            t.setTransactionDate(date);

            transactionDAO.addTransaction(t);
            response.sendRedirect(request.getContextPath() + "/transactions");

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            transactionDAO.deleteTransaction(id, userId);
            response.sendRedirect(request.getContextPath() + "/transactions");
        }
    }
}
