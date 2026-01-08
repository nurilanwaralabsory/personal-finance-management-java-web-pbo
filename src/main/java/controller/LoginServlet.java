package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Cek jika user sudah login, redirect ke dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }
        
        // Cek parameter registered untuk menampilkan pesan sukses
        String registered = request.getParameter("registered");
        if ("true".equals(registered)) {
            request.setAttribute("success", "Registrasi berhasil! Silakan login.");
        }
        
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String usernameOrEmail = request.getParameter("usernameOrEmail");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        // Validasi input
        if (usernameOrEmail == null || usernameOrEmail.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("error", "Username/Email dan Password harus diisi!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        
        // Proses login
        User user = userDAO.login(usernameOrEmail.trim(), password);
        
        if (user != null) {
            // Login berhasil, buat session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            
            // Set session timeout (30 menit)
            session.setMaxInactiveInterval(30 * 60);
            
            // Redirect ke dashboard
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            // Login gagal
            request.setAttribute("error", "Username/Email atau Password salah!");
            request.setAttribute("usernameOrEmail", usernameOrEmail);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
