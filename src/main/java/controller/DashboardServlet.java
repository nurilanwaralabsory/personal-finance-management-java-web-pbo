package controller;

import dao.BudgetDAO;
import dao.CategoryDAO;
import dao.ExpenseDAO;
import dao.IncomeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Budget;
import model.Category;
import model.Expense;
import model.Income;
import model.User;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class DashboardServlet extends HttpServlet {

    private IncomeDAO incomeDAO;
    private ExpenseDAO expenseDAO;
    private CategoryDAO categoryDAO;
    private BudgetDAO budgetDAO;

    @Override
    public void init() throws ServletException {
        incomeDAO = new IncomeDAO();
        expenseDAO = new ExpenseDAO();
        categoryDAO = new CategoryDAO();
        budgetDAO = new BudgetDAO();
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

        try {
            User user = (User) session.getAttribute("user");
            int userId = user.getId();

            // Ambil data pemasukan
            BigDecimal totalIncome = incomeDAO.getTotalByUserId(userId);
            BigDecimal incomeThisMonth = incomeDAO.getTotalThisMonth(userId);
            List<Income> recentIncomes = incomeDAO.findAllByUserId(userId);

            // Ambil data pengeluaran
            BigDecimal totalExpense = expenseDAO.getTotalByUserId(userId);
            BigDecimal expenseThisMonth = expenseDAO.getTotalThisMonth(userId);
            List<Expense> recentExpenses = expenseDAO.findAllByUserId(userId);

            // Handle null values
            if (totalIncome == null)
                totalIncome = BigDecimal.ZERO;
            if (incomeThisMonth == null)
                incomeThisMonth = BigDecimal.ZERO;
            if (totalExpense == null)
                totalExpense = BigDecimal.ZERO;
            if (expenseThisMonth == null)
                expenseThisMonth = BigDecimal.ZERO;
            if (recentIncomes == null)
                recentIncomes = new ArrayList<>();
            if (recentExpenses == null)
                recentExpenses = new ArrayList<>();

            // Hitung saldo
            BigDecimal totalBalance = totalIncome.subtract(totalExpense);
            BigDecimal balanceThisMonth = incomeThisMonth.subtract(expenseThisMonth);

            // Ambil data kategori
            List<Category> incomeCategories = categoryDAO.findByType(userId, "income");
            List<Category> expenseCategories = categoryDAO.findByType(userId, "expense");
            if (incomeCategories == null)
                incomeCategories = new ArrayList<>();
            if (expenseCategories == null)
                expenseCategories = new ArrayList<>();
            int totalCategories = incomeCategories.size() + expenseCategories.size();

            // Hitung total transaksi
            int totalTransactions = recentIncomes.size() + recentExpenses.size();

            // Ambil 5 transaksi terakhir (gabungkan income dan expense)
            List<Object[]> recentTransactions = new ArrayList<>();

            // Tambahkan income ke list transaksi
            for (Income income : recentIncomes) {
                Object[] transaction = new Object[5];
                transaction[0] = income.getIncomeDate();
                transaction[1] = income.getDescription() != null ? income.getDescription() : income.getSource();
                transaction[2] = income.getCategoryName() != null ? income.getCategoryName() : "Pemasukan";
                transaction[3] = income.getAmount();
                transaction[4] = "income";
                recentTransactions.add(transaction);
            }

            // Tambahkan expense ke list transaksi
            for (Expense expense : recentExpenses) {
                Object[] transaction = new Object[5];
                transaction[0] = expense.getExpenseDate();
                transaction[1] = expense.getDescription() != null ? expense.getDescription() : expense.getRecipient();
                transaction[2] = expense.getCategoryName() != null ? expense.getCategoryName() : "Pengeluaran";
                transaction[3] = expense.getAmount();
                transaction[4] = "expense";
                recentTransactions.add(transaction);
            }

            // Sort berdasarkan tanggal (descending)
            recentTransactions.sort((a, b) -> {
                java.sql.Date dateA = (java.sql.Date) a[0];
                java.sql.Date dateB = (java.sql.Date) b[0];
                if (dateA == null && dateB == null)
                    return 0;
                if (dateA == null)
                    return 1;
                if (dateB == null)
                    return -1;
                return dateB.compareTo(dateA);
            });

            // Ambil hanya 5 transaksi terakhir
            List<Object[]> latestTransactions = recentTransactions.size() > 5
                    ? recentTransactions.subList(0, 5)
                    : recentTransactions;

            // Ambil data budget
            List<Budget> budgets = budgetDAO.getAllByUserId(userId);
            if (budgets == null)
                budgets = new ArrayList<>();

            // Set attributes untuk JSP
            request.setAttribute("totalBalance", totalBalance);
            request.setAttribute("balanceThisMonth", balanceThisMonth);
            request.setAttribute("totalIncome", totalIncome);
            request.setAttribute("incomeThisMonth", incomeThisMonth);
            request.setAttribute("totalExpense", totalExpense);
            request.setAttribute("expenseThisMonth", expenseThisMonth);
            request.setAttribute("totalCategories", totalCategories);
            request.setAttribute("totalTransactions", totalTransactions);
            request.setAttribute("latestTransactions", latestTransactions);
            request.setAttribute("expenseCategories", expenseCategories);
            request.setAttribute("budgets", budgets);
            request.setAttribute("recentIncomes",
                    recentIncomes.size() > 3 ? recentIncomes.subList(0, 3) : recentIncomes);
            request.setAttribute("recentExpenses",
                    recentExpenses.size() > 3 ? recentExpenses.subList(0, 3) : recentExpenses);

            // Forward ke halaman dashboard (dashboard.jsp)
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            System.err.println("Error di DashboardServlet: " + e.getMessage());
            e.printStackTrace();
            // Set default values and forward anyway
            request.setAttribute("totalBalance", java.math.BigDecimal.ZERO);
            request.setAttribute("totalIncome", java.math.BigDecimal.ZERO);
            request.setAttribute("totalExpense", java.math.BigDecimal.ZERO);
            request.setAttribute("totalCategories", 0);
            request.setAttribute("totalTransactions", 0);
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        }
    }
}
