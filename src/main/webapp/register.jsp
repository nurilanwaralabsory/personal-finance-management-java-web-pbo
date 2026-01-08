<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html
  lang="id"
  class="layout-wide"
  dir="ltr"
  data-skin="default"
  data-bs-theme="light"
  data-assets-path="templates/assets/"
  data-template="vertical-menu-template">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <meta name="robots" content="noindex, nofollow" />
    <title>Register - Personal Finance Management</title>

    <meta name="description" content="Daftar akun Personal Finance Management" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="templates/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
      rel="stylesheet" />

    <link rel="stylesheet" href="templates/assets/vendor/fonts/iconify-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="templates/assets/vendor/libs/node-waves/node-waves.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/pickr/pickr-themes.css" />
    <link rel="stylesheet" href="templates/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="templates/assets/css/demo.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="templates/assets/vendor/css/pages/page-auth.css" />

    <!-- Helpers -->
    <script src="templates/assets/vendor/js/helpers.js"></script>
    <script src="templates/assets/vendor/js/template-customizer.js"></script>
    <script src="templates/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->
    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner py-6">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center mb-6">
                <a href="index.jsp" class="app-brand-link">
                  <span class="app-brand-logo demo">
                    <span class="text-primary">
                      <svg width="32" height="18" viewBox="0 0 38 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M30.0944 2.22569C29.0511 0.444187 26.7508 -0.172113 24.9566 0.849138C23.1623 1.87039 22.5536 4.14247 23.5969 5.92397L30.5368 17.7743C31.5801 19.5558 33.8804 20.1721 35.6746 19.1509C37.4689 18.1296 38.0776 15.8575 37.0343 14.076L30.0944 2.22569Z" fill="currentColor" />
                        <path d="M22.9676 2.22569C24.0109 0.444187 26.3112 -0.172113 28.1054 0.849138C29.8996 1.87039 30.5084 4.14247 29.4651 5.92397L22.5251 17.7743C21.4818 19.5558 19.1816 20.1721 17.3873 19.1509C15.5931 18.1296 14.9843 15.8575 16.0276 14.076L22.9676 2.22569Z" fill="currentColor" />
                        <path d="M14.9558 2.22569C13.9125 0.444187 11.6122 -0.172113 9.818 0.849138C8.02377 1.87039 7.41502 4.14247 8.45833 5.92397L15.3983 17.7743C16.4416 19.5558 18.7418 20.1721 20.5361 19.1509C22.3303 18.1296 22.9391 15.8575 21.8958 14.076L14.9558 2.22569Z" fill="currentColor" />
                        <path d="M7.82901 2.22569C8.87231 0.444187 11.1726 -0.172113 12.9668 0.849138C14.7611 1.87039 15.3698 4.14247 14.3265 5.92397L7.38656 17.7743C6.34325 19.5558 4.04298 20.1721 2.24875 19.1509C0.454514 18.1296 -0.154233 15.8575 0.88907 14.076L7.82901 2.22569Z" fill="currentColor" />
                      </svg>
                    </span>
                  </span>
                  <span class="app-brand-text demo text-heading fw-bold">Finance</span>
                </a>
              </div>
              <!-- /Logo -->
              
              <h4 class="mb-1">Buat Akun Baru 🚀</h4>
              <p class="mb-6">Daftar untuk mulai mengelola keuangan Anda</p>

              <!-- Alert Messages -->
              <% if (request.getAttribute("error") != null) { %>
              <div class="alert alert-danger alert-dismissible mb-4" role="alert">
                <%= request.getAttribute("error") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <% } %>
              
              <% if (request.getAttribute("success") != null) { %>
              <div class="alert alert-success alert-dismissible mb-4" role="alert">
                <%= request.getAttribute("success") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <% } %>

              <form id="formAuthentication" class="mb-4" action="register" method="POST">
                <div class="mb-4">
                  <label for="username" class="form-label">Username</label>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    placeholder="Masukkan username"
                    value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>"
                    autofocus
                    required />
                </div>
                <div class="mb-4">
                  <label for="email" class="form-label">Email</label>
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="Masukkan email"
                    value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                    required />
                </div>
                <div class="mb-4 form-password-toggle">
                  <label class="form-label" for="password">Password</label>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="password"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="password"
                      required
                      minlength="6" />
                    <span class="input-group-text cursor-pointer" onclick="togglePassword('password', this)">
                      <i class="icon-base bx bx-hide"></i>
                    </span>
                  </div>
                  <small class="text-muted">Minimal 6 karakter</small>
                </div>
                <div class="mb-4 form-password-toggle">
                  <label class="form-label" for="confirmPassword">Konfirmasi Password</label>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="confirmPassword"
                      class="form-control"
                      name="confirmPassword"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="confirmPassword"
                      required
                      minlength="6" />
                    <span class="input-group-text cursor-pointer" onclick="togglePassword('confirmPassword', this)">
                      <i class="icon-base bx bx-hide"></i>
                    </span>
                  </div>
                </div>

                <div class="mb-4 form-check">
                  <input class="form-check-input" type="checkbox" id="terms" name="terms" required />
                  <label class="form-check-label" for="terms">
                    Saya setuju dengan
                    <a href="javascript:void(0);">syarat dan ketentuan</a>
                  </label>
                </div>

                <button class="btn btn-primary d-grid w-100" type="submit">Daftar</button>
              </form>

              <p class="text-center">
                <span>Sudah punya akun?</span>
                <a href="login">
                  <span>Login di sini</span>
                </a>
              </p>
            </div>
          </div>
          <!-- /Register Card -->
        </div>
      </div>
    </div>
    <!-- / Content -->

    <!-- Core JS -->
    <script src="templates/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="templates/assets/vendor/libs/popper/popper.js"></script>
    <script src="templates/assets/vendor/js/bootstrap.js"></script>
    <script src="templates/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="templates/assets/vendor/js/menu.js"></script>

    <!-- Main JS -->
    <script src="templates/assets/js/main.js"></script>

    <!-- Page JS -->
    <script>
      function togglePassword(inputId, element) {
        const passwordInput = document.getElementById(inputId);
        const icon = element.querySelector('i');
        
        if (passwordInput.type === 'password') {
          passwordInput.type = 'text';
          icon.classList.remove('bx-hide');
          icon.classList.add('bx-show');
        } else {
          passwordInput.type = 'password';
          icon.classList.remove('bx-show');
          icon.classList.add('bx-hide');
        }
      }

      // Validasi form sebelum submit
      document.getElementById('formAuthentication').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (password !== confirmPassword) {
          e.preventDefault();
          alert('Password dan Konfirmasi Password tidak sama!');
        }
      });
    </script>
  </body>
</html>
