package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect ke halaman register.jsp
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validasi input
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("error", "Semua field harus diisi!");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        // Validasi confirm password
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Password dan konfirmasi password tidak sama!");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        // Validasi panjang password
        if (password.length() < 6) {
            request.setAttribute("error", "Password minimal 6 karakter!");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        // Cek apakah username sudah digunakan
        if (userDAO.isUsernameExists(username)) {
            request.setAttribute("error", "Username sudah digunakan!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        // Cek apakah email sudah digunakan
        if (userDAO.isEmailExists(email)) {
            request.setAttribute("error", "Email sudah digunakan!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        // Buat user baru dan simpan ke database
        User user = new User(username.trim(), email.trim(), password);
        boolean success = userDAO.register(user);
        
        if (success) {
            request.setAttribute("success", "Registrasi berhasil! Silakan login.");
            response.sendRedirect(request.getContextPath() + "/login?registered=true");
        } else {
            request.setAttribute("error", "Registrasi gagal! Silakan coba lagi.");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
