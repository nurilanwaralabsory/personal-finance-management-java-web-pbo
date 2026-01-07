<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Budget" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }

    List<Budget> budgets = (List<Budget>) request.getAttribute("budgets");
    String filter = (String) request.getAttribute("filter");
  String successMessage = (String) session.getAttribute("successMessage");
  String errorMessage = (String) session.getAttribute("errorMessage");
  String success = (String) session.getAttribute("success");
  String error = (String) session.getAttribute("error");
    
  // Prefer budgets-specific keys, fallback to generic keys
  String successToShow = (successMessage != null && !successMessage.isEmpty()) ? successMessage : success;
  String errorToShow = (errorMessage != null && !errorMessage.isEmpty()) ? errorMessage : error;
    
  // Clear all possible message keys
  session.removeAttribute("successMessage");
  session.removeAttribute("errorMessage");
  session.removeAttribute("success");
  session.removeAttribute("error");
    
  NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
  DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd MMM yyyy", new Locale("id", "ID"));
%>
<!doctype html>
<html lang="en" class="layout-navbar-fixed layout-menu-fixed layout-compact">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Budgets - Personal Finance Management</title>
    
    <link rel="icon" type="image/x-icon" href="templates/assets/img/favicon/favicon.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="templates/assets/vendor/fonts/iconify-icons.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/node-waves/node-waves.css" />
    <link rel="stylesheet" href="templates/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="templates/assets/css/demo.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <script src="templates/assets/vendor/js/helpers.js"></script>
    <script src="templates/assets/vendor/js/template-customizer.js"></script>
    <script src="templates/assets/js/config.js"></script>
  </head>

  <body>
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Sidebar -->
        <%@ include file="components/sidebar.jsp" %>
        <!-- / Sidebar -->

        <div class="layout-page">
          <!-- Navbar -->
          <%@ include file="components/navbar.jsp" %>
          <!-- / Navbar -->

          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Header -->
              <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="fw-bold py-3 mb-0">
                  <span class="text-muted fw-light">Keuangan /</span> Budgets
                </h4>
                <div>
                  <a href="<%= request.getContextPath() %>/budgets?action=update-spent" class="btn btn-outline-primary me-2">
                    <i class="ri-refresh-line me-1"></i> Refresh Data
                  </a>
                  <a href="<%= request.getContextPath() %>/budgets?action=new" class="btn btn-primary">
                    <i class="ri-add-line me-1"></i> Tambah Budget
                  </a>
                </div>
              </div>

              <% if (successToShow != null && !successToShow.isEmpty()) { %>
              <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= successToShow %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>
              
              <% if (errorToShow != null && !errorToShow.isEmpty()) { %>
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= errorToShow %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>

              <!-- Filter Tabs -->
              <ul class="nav nav-pills mb-4" role="tablist">
                <li class="nav-item">
                  <a class="nav-link <%= filter == null || "all".equals(filter) ? "active" : "" %>" 
                     href="<%= request.getContextPath() %>/budgets">
                    <i class="ri-list-check me-1"></i> Semua Budget
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link <%= "active".equals(filter) ? "active" : "" %>" 
                     href="<%= request.getContextPath() %>/budgets?filter=active">
                    <i class="ri-checkbox-circle-line me-1"></i> Budget Aktif
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link <%= "alert".equals(filter) ? "active" : "" %>" 
                     href="<%= request.getContextPath() %>/budgets?filter=alert">
                    <i class="ri-alert-line me-1"></i> Peringatan
                  </a>
                </li>
              </ul>

              <!-- Budget Cards -->
              <div class="row g-4">
                <% 
                if (budgets != null && !budgets.isEmpty()) {
                    for (Budget budget : budgets) {
                        double percentage = budget.getUsagePercentage();
                        String progressColor = budget.getStatusClass();
                        
                        // Additional safety check for null category name
                        String categoryDisplayName = budget.getCategoryName();
                        if (categoryDisplayName == null || categoryDisplayName.trim().isEmpty()) {
                            categoryDisplayName = "Kategori Tidak Diketahui";
                        }
                %>
                <div class="col-md-6 col-lg-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="card-title mb-0">
                        <i class="ri-price-tag-3-line me-2"></i>
                        <%= categoryDisplayName %>
                      </h5>
                      <div class="dropdown">
                        <button class="btn btn-text-secondary rounded-pill btn-icon dropdown-toggle hide-arrow" 
                                data-bs-toggle="dropdown">
                          <i class="ri-more-2-line"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                          <li>
                            <a class="dropdown-item" href="<%= request.getContextPath() %>/budgets?action=edit&id=<%= budget.getId() %>">
                              <i class="ri-edit-line me-2"></i> Edit
                            </a>
                          </li>
                          <li>
                            <a class="dropdown-item text-danger" href="#" 
                               onclick="confirmDelete(<%= budget.getId() %>)">
                              <i class="ri-delete-bin-line me-2"></i> Hapus
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="card-body">
                      <!-- Period Badge -->
                      <div class="mb-3">
                        <span class="badge bg-label-primary rounded-pill me-2">
                          <%= budget.getPeriod() %>
                        </span>
                        <span class="badge bg-label-<%= budget.getIsActive() ? "success" : "secondary" %> rounded-pill">
                          <%= budget.getIsActive() ? "Aktif" : "Nonaktif" %>
                        </span>
                      </div>

                      <!-- Amount Info -->
                      <div class="mb-3">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                          <span class="text-muted">Terpakai</span>
                          <span class="fw-bold text-<%= progressColor %>">
                            <%= currencyFormat.format(budget.getSpent()) %>
                          </span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-2">
                          <span class="text-muted">Budget</span>
                          <span class="fw-bold">
                            <%= currencyFormat.format(budget.getAmount()) %>
                          </span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-muted">Sisa</span>
                          <span class="fw-bold text-<%= budget.getRemaining().signum() >= 0 ? "success" : "danger" %>">
                            <%= currencyFormat.format(budget.getRemaining()) %>
                          </span>
                        </div>
                      </div>

                      <!-- Progress Bar -->
                      <div class="mb-3">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                          <span class="text-muted small">Penggunaan</span>
                          <span class="fw-medium text-<%= progressColor %>">
                            <%= String.format("%.1f", percentage) %>%
                          </span>
                        </div>
                        <div class="progress" style="height: 8px;">
                          <div class="progress-bar bg-<%= progressColor %>" 
                               role="progressbar" 
                               style="width: <%= Math.min(percentage, 100) %>%"
                               aria-valuenow="<%= percentage %>" 
                               aria-valuemin="0" 
                               aria-valuemax="100">
                          </div>
                        </div>
                        <% if (budget.isOverBudget()) { %>
                        <small class="text-danger mt-1 d-block">
                          <i class="ri-alert-line"></i> Melebihi budget!
                        </small>
                        <% } else if (budget.isNearLimit()) { %>
                        <small class="text-warning mt-1 d-block">
                          <i class="ri-error-warning-line"></i> Mendekati limit (<%= budget.getAlertThreshold() %>%)
                        </small>
                        <% } %>
                      </div>

                      <!-- Date Range -->
                      <div class="text-muted small">
                        <i class="ri-calendar-line me-1"></i>
                        <%= budget.getStartDate().format(dateFormat) %> - 
                        <%= budget.getEndDate().format(dateFormat) %>
                      </div>
                    </div>
                  </div>
                </div>
                <% 
                    }
                } else {
                %>
                <div class="col-12">
                  <div class="card">
                    <div class="card-body text-center py-5">
                      <i class="ri-wallet-3-line" style="font-size: 4rem; opacity: 0.3;"></i>
                      <h5 class="mt-3">Belum Ada Budget</h5>
                      <p class="text-muted">Mulai kelola anggaran Anda dengan membuat budget baru</p>
                      <a href="<%= request.getContextPath() %>/budgets?action=new" class="btn btn-primary">
                        <i class="ri-add-line me-1"></i> Buat Budget Pertama
                      </a>
                    </div>
                  </div>
                </div>
                <% } %>
              </div>
            </div>

            <!-- Footer -->
            <%@ include file="components/footer.jsp" %>
            <!-- / Footer -->
          </div>
        </div>
      </div>
      
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>

    <!-- Scripts -->
    <script src="templates/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="templates/assets/vendor/libs/popper/popper.js"></script>
    <script src="templates/assets/vendor/js/bootstrap.js"></script>
    <script src="templates/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="templates/assets/vendor/js/menu.js"></script>
    <script src="templates/assets/js/main.js"></script>

    <script>
      function confirmDelete(id) {
        if (confirm('Apakah Anda yakin ingin menghapus budget ini?')) {
          window.location.href = '<%= request.getContextPath() %>/budgets?action=delete&id=' + id;
        }
      }
    </script>
  </body>
</html>
