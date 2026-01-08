package com.mycompany.personal.finance.management.controller;

import com.mycompany.personal.finance.management.dao.UserDAO;
import com.mycompany.personal.finance.management.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password"); // Plain text for now
            String fullName = request.getParameter("full_name");
            String role = request.getParameter("role");

            User newUser = new User(username, password, fullName, role);
            userDAO.addUser(newUser);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            userDAO.deleteUser(id);
        }
        response.sendRedirect("users");
    }
}
