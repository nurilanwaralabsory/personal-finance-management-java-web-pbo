<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="model.Income" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    
    List<Income> incomes = (List<Income>) request.getAttribute("incomes");
    BigDecimal totalIncome = (BigDecimal) request.getAttribute("totalIncome");
    BigDecimal totalThisMonth = (BigDecimal) request.getAttribute("totalThisMonth");
    String success = (String) session.getAttribute("success");
    String error = (String) session.getAttribute("error");
    
    // Clear session messages
    session.removeAttribute("success");
    session.removeAttribute("error");
    
    // Format currency
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy", new Locale("id", "ID"));
    
    if (totalIncome == null) totalIncome = BigDecimal.ZERO;
    if (totalThisMonth == null) totalThisMonth = BigDecimal.ZERO;
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
    <title>Pemasukan - Personal Finance Management</title>
    <meta name="description" content="Kelola pemasukan keuangan" />
    
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
                  <h4 class="mb-1">Pemasukan</h4>
                  <p class="text-muted mb-0">Kelola semua pemasukan keuangan Anda</p>
                </div>
                <a href="<%= request.getContextPath() %>/incomes?action=add" class="btn btn-success">
                  <i class="ri ri-add-line me-1"></i> Tambah Pemasukan
                </a>
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
              
              <!-- Summary Cards -->
              <div class="row g-4 mb-4">
                <div class="col-md-6">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="avatar avatar-lg me-3">
                          <span class="avatar-initial rounded bg-label-success">
                            <i class="ri ri-wallet-3-line ri-24px"></i>
                          </span>
                        </div>
                        <div>
                          <h6 class="mb-0 text-muted">Total Pemasukan</h6>
                          <h4 class="mb-0 text-success"><%= currencyFormat.format(totalIncome) %></h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="avatar avatar-lg me-3">
                          <span class="avatar-initial rounded bg-label-info">
                            <i class="ri ri-calendar-line ri-24px"></i>
                          </span>
                        </div>
                        <div>
                          <h6 class="mb-0 text-muted">Pemasukan Bulan Ini</h6>
                          <h4 class="mb-0 text-info"><%= currencyFormat.format(totalThisMonth) %></h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Incomes Table -->
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h5 class="mb-0">Daftar Pemasukan</h5>
                </div>
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th>Tanggal</th>
                        <th>Kategori</th>
                        <th>Deskripsi</th>
                        <th>Sumber</th>
                        <th class="text-end">Jumlah</th>
                        <th class="text-center">Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% if (incomes != null && !incomes.isEmpty()) { 
                          for (Income income : incomes) { %>
                      <tr>
                        <td>
                          <span class="text-nowrap"><%= dateFormat.format(income.getIncomeDate()) %></span>
                        </td>
                        <td>
                          <% if (income.getCategoryName() != null) { %>
                          <div class="d-flex align-items-center">
                            <div class="avatar avatar-sm me-2">
                              <span class="avatar-initial rounded" style="background-color: <%= income.getCategoryColor() != null ? income.getCategoryColor() : "#7367f0" %>;">
                                <i class="<%= income.getCategoryIcon() != null ? income.getCategoryIcon() : "ri-folder-line" %> text-white" style="font-size: 12px;"></i>
                              </span>
                            </div>
                            <span><%= income.getCategoryName() %></span>
                          </div>
                          <% } else { %>
                          <span class="text-muted">-</span>
                          <% } %>
                        </td>
                        <td>
                          <% if (income.getDescription() != null && !income.getDescription().isEmpty()) { %>
                          <%= income.getDescription() %>
                          <% } else { %>
                          <span class="text-muted">-</span>
                          <% } %>
                        </td>
                        <td>
                          <% if (income.getSource() != null && !income.getSource().isEmpty()) { %>
                          <%= income.getSource() %>
                          <% } else { %>
                          <span class="text-muted">-</span>
                          <% } %>
                        </td>
                        <td class="text-end">
                          <span class="text-success fw-semibold"><%= currencyFormat.format(income.getAmount()) %></span>
                        </td>
                        <td class="text-center">
                          <div class="dropdown">
                            <button class="btn btn-icon btn-text-secondary rounded-pill" data-bs-toggle="dropdown">
                              <i class="ri ri-more-2-fill"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                              <li>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/incomes?action=edit&id=<%= income.getId() %>">
                                  <i class="ri ri-edit-line me-2"></i> Edit
                                </a>
                              </li>
                              <li>
                                <a class="dropdown-item text-danger" href="#" 
                                   onclick="confirmDelete(<%= income.getId() %>, '<%= currencyFormat.format(income.getAmount()) %>')">
                                  <i class="ri ri-delete-bin-line me-2"></i> Hapus
                                </a>
                              </li>
                            </ul>
                          </div>
                        </td>
                      </tr>
                      <% } } else { %>
                      <tr>
                        <td colspan="6" class="text-center py-5">
                          <i class="ri ri-inbox-line ri-3x text-muted mb-3 d-block"></i>
                          <h6>Belum Ada Pemasukan</h6>
                          <p class="text-muted">Klik tombol "Tambah Pemasukan" untuk menambahkan data.</p>
                        </td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
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

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Konfirmasi Hapus</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <p>Apakah Anda yakin ingin menghapus pemasukan sebesar <strong id="incomeAmount"></strong>?</p>
            <p class="text-muted small">Data yang dihapus tidak dapat dikembalikan.</p>
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
      function confirmDelete(id, amount) {
        document.getElementById('incomeAmount').textContent = amount;
        document.getElementById('deleteLink').href = '<%= request.getContextPath() %>/incomes?action=delete&id=' + id;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
      }
    </script>
  </body>
</html>
