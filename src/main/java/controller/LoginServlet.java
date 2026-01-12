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

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;
    
    private static final int MAX_LOGIN_ATTEMPTS = 5;
    private static final long LOCKOUT_DURATION_MS = 15 * 60 * 1000;

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
        
        // Generate CSRF token
        request.setAttribute("csrfToken", CSRFUtil.getToken(request));

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        
        // Validasi CSRF token
        if (!CSRFUtil.validateToken(request)) {
            request.setAttribute("error", "Sesi tidak valid. Silakan refresh halaman dan coba lagi.");
            request.setAttribute("csrfToken", CSRFUtil.getToken(request));
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        String usernameOrEmail = ValidationUtil.trim(request.getParameter("usernameOrEmail"));
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("remember"));
        
        // Cek rate limiting (login attempts)
        HttpSession tempSession = request.getSession(true);
        if (isLockedOut(tempSession)) {
            long lockoutEndTime = (Long) tempSession.getAttribute("lockoutEndTime");
            long remainingMinutes = (lockoutEndTime - System.currentTimeMillis()) / 60000;
            request.setAttribute("error", "Terlalu banyak percobaan login. Coba lagi dalam " + 
                                          (remainingMinutes + 1) + " menit.");
            request.setAttribute("csrfToken", CSRFUtil.getToken(request));
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Validasi input
        if (ValidationUtil.isEmpty(usernameOrEmail) || ValidationUtil.isEmpty(password)) {
            request.setAttribute("error", "Username/Email dan Password harus diisi!");
            request.setAttribute("csrfToken", CSRFUtil.getToken(request));
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Proses login (password verification dilakukan di UserDAO)
        User user = userDAO.login(usernameOrEmail, password);

        if (user != null) {
            // Login berhasil
            // Reset login attempts
            tempSession.removeAttribute("loginAttempts");
            tempSession.removeAttribute("lockoutEndTime");
            
            // Invalidate session lama dan buat session baru (mencegah session fixation)
            tempSession.invalidate();
            HttpSession session = request.getSession(true);
            
            // Set session attributes
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("lastActivity", System.currentTimeMillis());

            // Set session timeout berdasarkan remember me
            if (rememberMe) {
                session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 hari
            } else {
                session.setMaxInactiveInterval(30 * 60); // 30 menit
            }
            
            // Regenerate CSRF token setelah login
            CSRFUtil.regenerateToken(request);
            
            // Cek apakah ada redirect URL yang disimpan
            String redirectUrl = (String) session.getAttribute("redirectUrl");
            session.removeAttribute("redirectUrl");
            
            if (redirectUrl != null && !redirectUrl.contains("/login") && !redirectUrl.contains("/register")) {
                response.sendRedirect(redirectUrl);
            } else {
                // Redirect ke dashboard
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        } else {
            // Login gagal
            incrementLoginAttempts(tempSession);
            
            int attempts = getLoginAttempts(tempSession);
            int remainingAttempts = MAX_LOGIN_ATTEMPTS - attempts;
            
            String errorMessage = "Username/Email atau Password salah!";
            if (remainingAttempts > 0 && remainingAttempts <= 3) {
                errorMessage += " (" + remainingAttempts + " percobaan tersisa)";
            }
            
            request.setAttribute("error", errorMessage);
            request.setAttribute("usernameOrEmail", usernameOrEmail);
            request.setAttribute("csrfToken", CSRFUtil.getToken(request));
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
    
    private boolean isLockedOut(HttpSession session) {
        Long lockoutEndTime = (Long) session.getAttribute("lockoutEndTime");
        if (lockoutEndTime != null) {
            if (System.currentTimeMillis() < lockoutEndTime) {
                return true;
            } else {
                session.removeAttribute("lockoutEndTime");
                session.removeAttribute("loginAttempts");
            }
        }
        return false;
    }
    
    private int getLoginAttempts(HttpSession session) {
        Integer attempts = (Integer) session.getAttribute("loginAttempts");
        return attempts != null ? attempts : 0;
    }
    
    private void incrementLoginAttempts(HttpSession session) {
        int attempts = getLoginAttempts(session) + 1;
        session.setAttribute("loginAttempts", attempts);
        
        if (attempts >= MAX_LOGIN_ATTEMPTS) {
            session.setAttribute("lockoutEndTime", System.currentTimeMillis() + LOCKOUT_DURATION_MS);
        }
    }
}
