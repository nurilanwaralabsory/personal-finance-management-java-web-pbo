<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.Income" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    
    Income income = (Income) request.getAttribute("income");
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    Boolean editMode = (Boolean) request.getAttribute("editMode");
    String error = (String) request.getAttribute("error");
    
    boolean isEdit = editMode != null && editMode;
    String pageTitle = isEdit ? "Edit Pemasukan" : "Tambah Pemasukan";
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String todayDate = dateFormat.format(new java.util.Date());
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
    <title><%= pageTitle %> - Personal Finance Management</title>
    <meta name="description" content="<%= pageTitle %>" />
    
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
              <div class="d-flex align-items-center mb-4">
                <a href="<%= request.getContextPath() %>/incomes" class="btn btn-icon btn-text-secondary me-3">
                  <i class="ri ri-arrow-left-line"></i>
                </a>
                <div>
                  <h4 class="mb-0"><%= pageTitle %></h4>
                  <p class="text-muted mb-0">Masukkan detail pemasukan Anda</p>
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
                      <form action="<%= request.getContextPath() %>/incomes" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "add" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="id" value="<%= income.getId() %>">
                        <% } %>
                        
                        <div class="row g-3">
                          <!-- Jumlah -->
                          <div class="col-md-6">
                            <label class="form-label" for="amount">Jumlah <span class="text-danger">*</span></label>
                            <div class="input-group">
                              <span class="input-group-text">Rp</span>
                              <input type="number" class="form-control" id="amount" name="amount" 
                                     value="<%= isEdit ? income.getAmount().longValue() : "" %>" 
                                     placeholder="0" min="1" required>
                            </div>
                          </div>
                          
                          <!-- Tanggal -->
                          <div class="col-md-6">
                            <label class="form-label" for="incomeDate">Tanggal <span class="text-danger">*</span></label>
                            <input type="date" class="form-control" id="incomeDate" name="incomeDate" 
                                   value="<%= isEdit ? dateFormat.format(income.getIncomeDate()) : todayDate %>" required>
                          </div>
                          
                          <!-- Kategori -->
                          <div class="col-md-6">
                            <label class="form-label" for="categoryId">Kategori</label>
                            <select class="form-select" id="categoryId" name="categoryId">
                              <option value="">-- Pilih Kategori --</option>
                              <% if (categories != null) { 
                                  for (Category cat : categories) { %>
                              <option value="<%= cat.getId() %>" 
                                      <%= isEdit && income.getCategoryId() != null && income.getCategoryId() == cat.getId() ? "selected" : "" %>>
                                <%= cat.getName() %>
                              </option>
                              <% } } %>
                            </select>
                            <div class="form-text">
                              <a href="<%= request.getContextPath() %>/categories?action=add&type=income">+ Tambah kategori baru</a>
                            </div>
                          </div>
                          
                          <!-- Sumber -->
                          <div class="col-md-6">
                            <label class="form-label" for="source">Sumber</label>
                            <input type="text" class="form-control" id="source" name="source" 
                                   value="<%= isEdit && income.getSource() != null ? income.getSource() : "" %>" 
                                   placeholder="Contoh: PT. ABC, Freelance, dll">
                          </div>
                          
                          <!-- Deskripsi -->
                          <div class="col-12">
                            <label class="form-label" for="description">Deskripsi</label>
                            <textarea class="form-control" id="description" name="description" rows="3" 
                                      placeholder="Masukkan deskripsi pemasukan (opsional)"><%= isEdit && income.getDescription() != null ? income.getDescription() : "" %></textarea>
                          </div>
                          
                          <!-- Buttons -->
                          <div class="col-12">
                            <hr class="my-4">
                            <div class="d-flex justify-content-end gap-2">
                              <a href="<%= request.getContextPath() %>/incomes" class="btn btn-secondary">Batal</a>
                              <button type="submit" class="btn btn-success">
                                <i class="ri ri-save-line me-1"></i>
                                <%= isEdit ? "Simpan Perubahan" : "Simpan Pemasukan" %>
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
                  <div class="card bg-label-success">
                    <div class="card-body">
                      <h6 class="text-success mb-3">
                        <i class="ri ri-lightbulb-line me-2"></i>Tips Mencatat Pemasukan
                      </h6>
                      <ul class="list-unstyled mb-0 small">
                        <li class="mb-2">• Catat pemasukan segera setelah menerima</li>
                        <li class="mb-2">• Gunakan kategori yang sesuai untuk analisis</li>
                        <li class="mb-2">• Tambahkan sumber untuk melacak asal pendapatan</li>
                        <li>• Deskripsi membantu mengingat detail transaksi</li>
                      </ul>
                    </div>
                  </div>
                  
                  <div class="card mt-3">
                    <div class="card-body">
                      <h6 class="mb-3">Kategori Tersedia</h6>
                      <% if (categories != null && !categories.isEmpty()) { 
                          for (Category cat : categories) { %>
                      <div class="d-flex align-items-center mb-2">
                        <div class="avatar avatar-sm me-2">
                          <span class="avatar-initial rounded" style="background-color: <%= cat.getColor() %>;">
                            <i class="<%= cat.getIcon() %> text-white" style="font-size: 12px;"></i>
                          </span>
                        </div>
                        <span class="small"><%= cat.getName() %></span>
                      </div>
                      <% } } else { %>
                      <p class="text-muted small mb-0">Belum ada kategori. <a href="<%= request.getContextPath() %>/categories?action=add&type=income">Tambah sekarang</a></p>
                      <% } %>
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
    <script src="templates/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="templates/assets/vendor/libs/popper/popper.js"></script>
    <script src="templates/assets/vendor/js/bootstrap.js"></script>
    <script src="templates/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="templates/assets/vendor/js/menu.js"></script>
    <script src="templates/assets/js/main.js"></script>
  </body>
</html>
