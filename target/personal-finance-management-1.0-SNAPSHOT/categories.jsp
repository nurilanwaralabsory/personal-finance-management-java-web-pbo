<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    String selectedType = (String) request.getAttribute("selectedType");
    String success = (String) session.getAttribute("success");
    String error = (String) session.getAttribute("error");
    
    // Clear session messages
    session.removeAttribute("success");
    session.removeAttribute("error");
%>
<!doctype html>
<html
  lang="id"
  class="layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-skin="default"
  data-bs-theme="light"
  data-assets-path="templates/assets/"
  data-template="vertical-menu-template">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Kategori - Personal Finance Management</title>
    <meta name="description" content="Kelola kategori pemasukan dan pengeluaran" />
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="templates/assets/img/favicon/favicon.ico" />
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="templates/assets/vendor/fonts/iconify-icons.css" />
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="templates/assets/vendor/libs/node-waves/node-waves.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/pickr/pickr-themes.css" />
    <link rel="stylesheet" href="templates/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="templates/assets/css/demo.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    
    <!-- Helpers -->
    <script src="templates/assets/vendor/js/helpers.js"></script>
    <script src="templates/assets/vendor/js/template-customizer.js"></script>
    <script src="templates/assets/js/config.js"></script>
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
              <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                  <h4 class="mb-1">Kategori</h4>
                  <p class="text-muted mb-0">Kelola kategori pemasukan dan pengeluaran</p>
                </div>
                <div class="dropdown">
                  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="ri ri-add-line me-1"></i> Tambah Kategori
                  </button>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/categories?action=add&type=income">
                      <i class="ri ri-arrow-up-circle-line text-success me-2"></i> Kategori Pemasukan
                    </a></li>
                    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/categories?action=add&type=expense">
                      <i class="ri ri-arrow-down-circle-line text-danger me-2"></i> Kategori Pengeluaran
                    </a></li>
                  </ul>
                </div>
              </div>
              
              <!-- Alert Messages -->
              <% if (success != null && !success.isEmpty()) { %>
              <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="ri ri-checkbox-circle-line me-2"></i>
                <%= success %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>
              
              <% if (error != null && !error.isEmpty()) { %>
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="ri ri-error-warning-line me-2"></i>
                <%= error %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>
              
              <!-- Filter Tabs -->
              <ul class="nav nav-pills mb-4" role="tablist">
                <li class="nav-item">
                  <a class="nav-link <%= (selectedType == null || selectedType.isEmpty()) ? "active" : "" %>" 
                     href="<%= request.getContextPath() %>/categories">
                    <i class="ri ri-apps-line me-1"></i> Semua
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link <%= "income".equals(selectedType) ? "active" : "" %>" 
                     href="<%= request.getContextPath() %>/categories?type=income">
                    <i class="ri ri-arrow-up-circle-line me-1"></i> Pemasukan
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link <%= "expense".equals(selectedType) ? "active" : "" %>" 
                     href="<%= request.getContextPath() %>/categories?type=expense">
                    <i class="ri ri-arrow-down-circle-line me-1"></i> Pengeluaran
                  </a>
                </li>
              </ul>
              
              <!-- Categories Grid -->
              <div class="row g-4">
                <% if (categories != null && !categories.isEmpty()) { 
                    for (Category category : categories) { %>
                <div class="col-md-6 col-lg-4">
                  <div class="card h-100">
                    <div class="card-body">
                      <div class="d-flex align-items-center mb-3">
                        <div class="avatar me-3" style="background-color: <%= category.getColor() %>20;">
                          <span class="avatar-initial rounded" style="background-color: <%= category.getColor() %>;">
                            <i class="<%= category.getIcon() %> text-white"></i>
                          </span>
                        </div>
                        <div class="flex-grow-1">
                          <h6 class="mb-0"><%= category.getName() %></h6>
                          <small class="text-muted">
                            <% if ("income".equals(category.getType())) { %>
                              <span class="badge bg-label-success">Pemasukan</span>
                            <% } else { %>
                              <span class="badge bg-label-danger">Pengeluaran</span>
                            <% } %>
                          </small>
                        </div>
                        <div class="dropdown">
                          <button class="btn btn-icon btn-text-secondary rounded-pill" data-bs-toggle="dropdown">
                            <i class="ri ri-more-2-fill"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                              <a class="dropdown-item" href="<%= request.getContextPath() %>/categories?action=edit&id=<%= category.getId() %>">
                                <i class="ri ri-edit-line me-2"></i> Edit
                              </a>
                            </li>
                            <li>
                              <a class="dropdown-item text-danger" href="#" 
                                 onclick="confirmDelete(<%= category.getId() %>, '<%= category.getType() %>', '<%= category.getName() %>')">
                                <i class="ri ri-delete-bin-line me-2"></i> Hapus
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <% if (category.getDescription() != null && !category.getDescription().isEmpty()) { %>
                      <p class="text-muted small mb-0"><%= category.getDescription() %></p>
                      <% } %>
                    </div>
                  </div>
                </div>
                <% } } else { %>
                <div class="col-12">
                  <div class="card">
                    <div class="card-body text-center py-5">
                      <i class="ri ri-folder-line ri-4x text-muted mb-3"></i>
                      <h5>Belum Ada Kategori</h5>
                      <p class="text-muted">Klik tombol "Tambah Kategori" untuk menambahkan kategori baru.</p>
                    </div>
                  </div>
                </div>
                <% } %>
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

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Konfirmasi Hapus</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <p>Apakah Anda yakin ingin menghapus kategori "<span id="categoryName"></span>"?</p>
            <p class="text-muted small">Kategori yang sudah digunakan di transaksi tidak akan mempengaruhi data transaksi.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
            <a id="deleteLink" href="#" class="btn btn-danger">Hapus</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Core JS -->
    <script src="templates/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="templates/assets/vendor/libs/popper/popper.js"></script>
    <script src="templates/assets/vendor/js/bootstrap.js"></script>
    <script src="templates/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="templates/assets/vendor/js/menu.js"></script>
    <script src="templates/assets/js/main.js"></script>
    
    <script>
      function confirmDelete(id, type, name) {
        document.getElementById('categoryName').textContent = name;
        document.getElementById('deleteLink').href = '<%= request.getContextPath() %>/categories?action=delete&id=' + id + '&type=' + type;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
      }
    </script>
  </body>
</html>
