package controller;

import dao.UserDAO;
import model.User;
import util.CSRFUtil;
import util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
        
        // Cek jika user sudah login, redirect ke dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }
        
        // Generate CSRF token
        request.setAttribute("csrfToken", CSRFUtil.getToken(request));
        
        // Redirect ke halaman register.jsp
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // Validasi CSRF token
        if (!CSRFUtil.validateToken(request)) {
            request.setAttribute("error", "Sesi tidak valid. Silakan refresh halaman dan coba lagi.");
            request.setAttribute("csrfToken", CSRFUtil.getToken(request));
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        
        String username = ValidationUtil.trim(request.getParameter("username"));
        String email = ValidationUtil.trim(request.getParameter("email"));
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validasi username
        String usernameError = ValidationUtil.getUsernameValidationError(username);
        if (usernameError != null) {
            setErrorAndForward(request, response, usernameError, null, email);
            return;
        }
        
        // Validasi email
        String emailError = ValidationUtil.getEmailValidationError(email);
        if (emailError != null) {
            setErrorAndForward(request, response, emailError, username, null);
            return;
        }
        
        // Validasi password
        String passwordError = ValidationUtil.getPasswordValidationError(password);
        if (passwordError != null) {
            setErrorAndForward(request, response, passwordError, username, email);
            return;
        }
        
        // Validasi confirm password
        if (!password.equals(confirmPassword)) {
            setErrorAndForward(request, response, "Password dan konfirmasi password tidak sama!", username, email);
            return;
        }
        
        // Cek apakah username sudah digunakan
        if (userDAO.isUsernameExists(username)) {
            setErrorAndForward(request, response, "Username sudah digunakan!", null, email);
            return;
        }
        
        // Cek apakah email sudah digunakan
        if (userDAO.isEmailExists(email)) {
            setErrorAndForward(request, response, "Email sudah digunakan!", username, null);
            return;
        }
        
        // Buat user baru dan simpan ke database (password akan di-hash di UserDAO)
        User user = new User(username, email, password);
        boolean success = userDAO.register(user);
        
        if (success) {
            // Regenerate CSRF token setelah registrasi berhasil
            CSRFUtil.regenerateToken(request);
            response.sendRedirect(request.getContextPath() + "/login?registered=true");
        } else {
            setErrorAndForward(request, response, "Registrasi gagal! Silakan coba lagi.", username, email);
        }
    }
    
    private void setErrorAndForward(HttpServletRequest request, HttpServletResponse response,
                                     String error, String username, String email) 
            throws ServletException, IOException {
        request.setAttribute("error", error);
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("csrfToken", CSRFUtil.getToken(request));
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
