<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Budget" %>
<%@ page import="model.Category" %>
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
    <title>Anggaran - Manajemen Keuangan Pribadi</title>
    <!-- Common CSS -->
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/assets/img/favicon/favicon.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&ampdisplay=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/fonts/iconify-icons.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/demo.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/node-waves/node-waves.css" />
    <script src="<%= request.getContextPath() %>/assets/vendor/js/helpers.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/config.js"></script>
  </head>

  <body>
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <!-- Menu -->
        <jsp:include page="includes/sidebar.jsp">
          <jsp:param name="activePage" value="budgets" />
        </jsp:include>
        <!-- / Menu -->
        <!-- / Menu -->

        <div class="layout-page">
          <!-- Navbar -->
           <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
               <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <span class="fw-bold">Anggaran Saya</span>
                </div>
              </div>
            </div>
           </nav>
          
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              
              <div class="d-flex justify-content-between align-items-center mb-4">
                  <h4 class="py-3 mb-0">Anggaran Aktif</h4>
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBudgetModal">
                    <i class="ri-add-line ri-16px me-1"></i> Tambah Anggaran
                  </button>
              </div>

              <div class="row">
                  <% 
                  List<Budget> budgets = (List<Budget>) request.getAttribute("budgets");
                  NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
                  if (budgets != null && !budgets.isEmpty()) {
                      for (Budget b : budgets) {
                          int pct = b.getPercentage();
                          String progressColor = "success";
                          if (pct > 75) progressColor = "danger";
                          else if (pct > 50) progressColor = "warning";
                  %>
                <div class="col-md-6 col-xl-4 mb-4">
                  <div class="card h-100">
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-start mb-3">
                        <div class="d-flex align-items-center">
                            <div class="avatar me-3">
                                <div class="avatar-initial bg-label-primary rounded">
                                    <i class="ri-wallet-3-line"></i>
                                </div>
                            </div>
                            <div class="me-2">
                                <h5 class="mb-0"><%= b.getCategoryName() %></h5>
                                <small class="text-muted"><%= b.getStartDate() %> - <%= b.getEndDate() %></small>
                            </div>
                        </div>
                        <div class="dropdown">
                          <button class="btn p-0" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ri-more-2-line"></i>
                          </button>
                          <div class="dropdown-menu dropdown-menu-end">
                            <form action="budgets" method="POST" onsubmit="return confirm('Hapus anggaran ini?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= b.getId() %>">
                                <button type="submit" class="dropdown-item text-danger">Hapus</button>
                            </form>
                          </div>
                        </div>
                      </div>
                      
                      <div class="mb-3">
                        <div class="d-flex justify-content-between mb-1">
                          <small>Terpakai: <%= currencyFormat.format(b.getSpentAmount()) %></small>
                          <small>Batas: <%= currencyFormat.format(b.getAmount()) %></small>
                        </div>
                        <div class="progress rounded" style="height: 10px;">
                          <div class="progress-bar bg-<%= progressColor %>" role="progressbar" style="width: <%= pct %>%;" aria-valuenow="<%= pct %>" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <small class="d-block mt-1 text-end"><%= pct %>% Terpakai</small>
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
                          <div class="card-body text-center">
                              <p>Tidak ada anggaran ditemukan. Buat satu untuk mulai melacak!</p>
                          </div>
                      </div>
                  </div>
                  <% } %>
              </div>

            </div>

             <!-- Add Budget Modal -->
              <div class="modal fade" id="addBudgetModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Atur Anggaran Baru</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="budgets" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="modal-body">
                          <div class="row">
                            <div class="col mb-3">
                              <label for="category_id" class="form-label">Kategori</label>
                              <select class="form-select" id="category_id" name="category_id" required>
                                <% 
                                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                                    if (categories != null) {
                                        for (Category cat : categories) {
                                            if ("expense".equals(cat.getType())) {
                                %>
                                    <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                                <%          }
                                        }
                                    }
                                %>
                              </select>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col mb-3">
                              <label for="amount" class="form-label">Batas Anggaran (Rp)</label>
                              <input type="number" step="0.01" class="form-control" id="amount" name="amount" required />
                            </div>
                          </div>
                           <div class="row g-2">
                            <div class="col mb-0">
                              <label for="start_date" class="form-label">Tanggal Mulai</label>
                              <input type="date" class="form-control" id="start_date" name="start_date" required />
                            </div>
                            <div class="col mb-0">
                              <label for="end_date" class="form-label">Tanggal Selesai</label>
                              <input type="date" class="form-control" id="end_date" name="end_date" required />
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Tutup</button>
                          <button type="submit" class="btn btn-primary">Simpan Anggaran</button>
                        </div>
                    </form>
                  </div>
                </div>
              </div>
            
            <div class="content-backdrop fade"></div>
          </div>
        </div>
      </div>
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/popper/popper.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/js/bootstrap.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/js/menu.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>
  </body>
</html>
