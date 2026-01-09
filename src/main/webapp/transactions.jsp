<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Transaction" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!doctype html>

<html
  lang="en"
  class="layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-skin="default"
  data-bs-theme="light"
  data-assets-path="<%= request.getContextPath() %>/assets/"
  data-template="vertical-menu-template">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <meta name="robots" content="noindex, nofollow" />
    <title>Transaksi - Manajemen Keuangan Pribadi</title>
    <meta name="description" content="Aplikasi manajemen keuangan pribadi" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&ampdisplay=swap"
      rel="stylesheet" />

    <!-- Icons -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/fonts/iconify-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/node-waves/node-waves.css" />

    <!-- Helpers -->
    <script src="<%= request.getContextPath() %>/assets/vendor/js/helpers.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <!-- Menu -->
        <jsp:include page="includes/sidebar.jsp">
          <jsp:param name="activePage" value="transactions" />
        </jsp:include>
        <!-- / Menu -->
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="ri-menu-fill ri-24px"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="ri-search-line ri-22px me-2"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none ps-1 ps-sm-2"
                    placeholder="Cari..."
                    aria-label="Cari..." />
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="templates/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end mt-3 py-2">
                    <li>
                      <a class="dropdown-item" href="pages-account-settings-account.html">
                        <div class="d-flex align-items-center">
                          <div class="flex-shrink-0 me-2">
                            <div class="avatar avatar-online">
                              <img src="<%= request.getContextPath() %>/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0 small">User</h6>
                            <small class="text-muted">Admin</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="logout">
                        <i class="ri-logout-box-r-line me-2"></i>
                        <span class="align-middle">Keluar</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              
              <div class="row g-4 mb-4">
                <div class="col-sm-6 col-xl-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-start justify-content-between">
                        <div class="content-left">
                          <span>Semua Transaksi</span>
                          <div class="d-flex align-items-center my-1">
                            <h4 class="mb-0 me-2"><%= request.getAttribute("transactions") != null ? ((java.util.List)request.getAttribute("transactions")).size() : 0 %></h4>
                          </div>
                        </div>
                        <span class="badge bg-label-primary rounded p-2">
                          <i class="ri-exchange-funds-line ri-24px"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Transactions Table -->
              <div class="card">
                <div class="card-header border-bottom">
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">Riwayat Transaksi</h5>
                    <div class="d-flex align-items-center row-gap-3 gap-2">
                        <a href="income" class="btn btn-success">
                            <i class="ri-add-line ri-16px me-1"></i> Tambah Pemasukan
                        </a>
                        <a href="expense" class="btn btn-danger">
                            <i class="ri-subtract-line ri-16px me-1"></i> Tambah Pengeluaran
                        </a>
                    </div>
                  </div>
                </div>
                <div class="card-datatable table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>Tanggal</th>
                        <th>Deskripsi</th>
                        <th>Kategori</th>
                        <th class="text-end">Jumlah</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% 
                      List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                      NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
                      if (transactions != null && !transactions.isEmpty()) {
                          for (Transaction t : transactions) {
                              boolean isIncome = "income".equals(t.getType());
                              String textClass = isIncome ? "text-success" : "text-danger";
                              String amountPrefix = isIncome ? "+ " : "- ";
                      %>
                      <tr>
                        <td><%= t.getTransactionDate() %></td>
                        <td><span class="fw-medium"><%= t.getDescription() %></span></td>
                        <td>
                            <span class="badge bg-label-secondary rounded-pill"><%= t.getCategoryName() != null ? t.getCategoryName() : "Tanpa Kategori" %></span>
                        </td>
                        <td class="text-end <%= textClass %> fw-medium">
                            <%= amountPrefix + currencyFormat.format(t.getAmount()) %>
                        </td>
                        <td>
                          <div class="d-flex align-items-center">
                             <!-- Delete only for now -->
                             <form action="transactions" method="POST" onsubmit="return confirm('Apakah Anda yakin?');" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= t.getId() %>">
                                <button type="submit" class="btn btn-icon btn-text-secondary rounded-pill waves-effect waves-light"><i class="ri-delete-bin-7-line ri-20px"></i></button>
                            </form>
                          </div>
                        </td>
                      </tr>
                      <% 
                          }
                      } else {
                      %>
                      <tr>
                          <td colspan="5" class="text-center">Tidak ada transaksi ditemukan.</td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Transactions Table -->

            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl">
                <div
                  class="footer-container d-flex align-items-center justify-content-between py-4 flex-md-row flex-column">
                  <div class="mb-2 mb-md-0">
                    &#169;
                    <script>
                      document.write(new Date().getFullYear());
                    </script>
                    Personal Finance Management
                  </div>
                </div>
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
      <div class="drag-target"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/popper/popper.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/js/bootstrap.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/js/menu.js"></script>
    <!-- Main JS -->
    <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>
  </body>
</html>
