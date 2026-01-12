<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    
    Category category = (Category) request.getAttribute("category");
    Boolean editMode = (Boolean) request.getAttribute("editMode");
    String categoryType = (String) request.getAttribute("categoryType");
    String error = (String) request.getAttribute("error");
    
    boolean isEdit = editMode != null && editMode;
    String type = isEdit ? category.getType() : (categoryType != null ? categoryType : "income");
    String pageTitle = isEdit ? "Edit Kategori" : "Tambah Kategori";
%>
<!doctype html>
<html
  lang="id"
  class="layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-skin="default"
  data-bs-theme="light"
  data-assets-path="assets/"
  data-template="vertical-menu-template">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title><%= pageTitle %> - Personal Finance Management</title>
    <meta name="description" content="<%= pageTitle %>" />
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="assets/vendor/fonts/iconify-icons.css" />
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/node-waves/node-waves.css" />
    <link rel="stylesheet" href="assets/vendor/libs/pickr/pickr-themes.css" />
    <link rel="stylesheet" href="assets/vendor/css/core.css" />
    <link rel="stylesheet" href="assets/css/demo.css" />
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    
    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <script src="assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <%@ include file="components/sidebar.jsp" %>
        <!-- / Menu -->

        <div class="menu-mobile-toggler d-xl-none rounded-1">
          <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large text-bg-secondary p-2 rounded-1">
            <i class="ri ri-menu-line icon-base"></i>
            <i class="ri ri-arrow-right-s-line icon-base"></i>
          </a>
        </div>

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          <%@ include file="components/navbar.jsp" %>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              
              <!-- Header -->
              <div class="d-flex align-items-center mb-4">
                <a href="<%= request.getContextPath() %>/categories" class="btn btn-icon btn-text-secondary me-3">
                  <i class="ri ri-arrow-left-line"></i>
                </a>
                <div>
                  <h4 class="mb-0"><%= pageTitle %></h4>
                  <p class="text-muted mb-0">
                    <% if ("income".equals(type)) { %>
                      Kategori Pemasukan
                    <% } else { %>
                      Kategori Pengeluaran
                    <% } %>
                  </p>
                </div>
              </div>
              
              <!-- Alert Messages -->
              <% if (error != null && !error.isEmpty()) { %>
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="ri ri-error-warning-line me-2"></i>
                <%= error %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>
              
              <!-- Form Card -->
              <div class="row">
                <div class="col-lg-8">
                  <div class="card">
                    <div class="card-body">
                      <form action="<%= request.getContextPath() %>/categories" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "add" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="id" value="<%= category.getId() %>">
                        <% } %>
                        <input type="hidden" name="type" value="<%= type %>">
                        
                        <div class="row g-3">
                          <!-- Nama Kategori -->
                          <div class="col-12">
                            <label class="form-label" for="name">Nama Kategori <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name" 
                                   value="<%= isEdit ? category.getName() : "" %>" 
                                   placeholder="Masukkan nama kategori" required>
                          </div>
                          
                          <!-- Deskripsi -->
                          <div class="col-12">
                            <label class="form-label" for="description">Deskripsi</label>
                            <textarea class="form-control" id="description" name="description" rows="3" 
                                      placeholder="Masukkan deskripsi kategori (opsional)"><%= isEdit && category.getDescription() != null ? category.getDescription() : "" %></textarea>
                          </div>
                          
                          
                          
                          <!-- Buttons -->
                          <div class="col-12">
                            <hr class="my-4">
                            <div class="d-flex justify-content-end gap-2">
                              <a href="<%= request.getContextPath() %>/categories" class="btn btn-danger">Batal</a>
                              <button type="submit" class="btn btn-primary">
                                <i class="ri ri-save-line me-1"></i>
                                <%= isEdit ? "Simpan Perubahan" : "Simpan Kategori" %>
                              </button>
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                
                <!-- Tips Card -->
                <div class="col-lg-4">
                  <div class="card bg-label-info">
                    <div class="card-body">
                      <h6 class="text-info mb-3">
                        <i class="ri ri-lightbulb-line me-2"></i>Tips
                      </h6>
                      <ul class="list-unstyled mb-0 small">
                        <li class="mb-2">• Gunakan nama kategori yang jelas dan mudah diingat</li>
                        <li class="mb-2">• Deskripsi membantu menjelaskan kegunaan kategori</li>
                        <li>• Pisahkan kategori pemasukan dan pengeluaran</li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <%@ include file="components/footer.jsp" %>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="assets/vendor/js/menu.js"></script>
    <script src="assets/js/main.js"></script>
    
    <script>
      // Live preview
      const nameInput = document.getElementById('name');
      const previewName = document.getElementById('previewName');
      
      nameInput.addEventListener('input', function() {
        previewName.textContent = this.value || 'Nama Kategori';
      });
    </script>
  </body>
</html>
