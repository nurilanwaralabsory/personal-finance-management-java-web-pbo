<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Budget" %>
<%@ page import="model.Category" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }

    Budget budget = (Budget) request.getAttribute("budget");
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    boolean isEdit = (budget != null);
    String errorMessage = (String) request.getAttribute("errorMessage");
    String infoMessage = (String) request.getAttribute("infoMessage");
%>
<!doctype html>
<html lang="en" class="layout-navbar-fixed layout-menu-fixed layout-compact">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title><%= isEdit ? "Edit" : "Tambah" %> Budget - Personal Finance Management</title>
    
    <link rel="icon" type="image/x-icon" href="templates/assets/img/favicon/favicon.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="templates/assets/vendor/fonts/iconify-icons.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/node-waves/node-waves.css" />
    <link rel="stylesheet" href="templates/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="templates/assets/css/demo.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/flatpickr/flatpickr.css" />
    <script src="templates/assets/vendor/js/helpers.js"></script>
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
              <h4 class="fw-bold py-3 mb-4">
                <span class="text-muted fw-light">Budgets /</span> 
                <%= isEdit ? "Edit Budget" : "Tambah Budget Baru" %>
              </h4>

              <% if (errorMessage != null) { %>
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>
              
              <% if (infoMessage != null) { %>
              <div class="alert alert-info alert-dismissible fade show" role="alert">
                <i class="ri-information-line me-2"></i>
                <%= infoMessage %>
                <a href="<%= request.getContextPath() %>/categories?action=new" class="alert-link">Buat Kategori Sekarang</a>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
              <% } %>

              <div class="row">
                <div class="col-md-8">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h5 class="card-title mb-0">
                        <i class="ri-wallet-3-line me-2"></i>
                        Informasi Budget
                      </h5>
                    </div>
                    <div class="card-body">
                      <form method="post" action="<%= request.getContextPath() %>/budgets">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="id" value="<%= budget.getId() %>">
                        <% } %>

                        <!-- Category -->
                        <div class="mb-4">
                          <label for="categoryId" class="form-label">
                            Kategori <span class="text-danger">*</span>
                          </label>
                          <select class="form-select" id="categoryId" name="categoryId" required>
                            <option value="">Pilih Kategori</option>
                            <% 
                            if (categories != null && !categories.isEmpty()) {
                                for (Category category : categories) {
                                    boolean selected = isEdit && budget.getCategoryId().equals(category.getId());
                            %>
                            <option value="<%= category.getId() %>" <%= selected ? "selected" : "" %>>
                              <%= category.getName() %>
                            </option>
                            <% 
                                }
                            } else {
                            %>
                            <option value="" disabled>Belum ada kategori expense. Silakan buat kategori terlebih dahulu.</option>
                            <% 
                            }
                            %>
                          </select>
                          <small class="text-muted">Pilih kategori untuk budget ini</small>
                        </div>

                        <!-- Amount -->
                        <div class="mb-4">
                          <label for="amount" class="form-label">
                            Jumlah Budget <span class="text-danger">*</span>
                          </label>
                          <div class="input-group">
                            <span class="input-group-text">Rp</span>
                            <input type="number" class="form-control" id="amount" name="amount" 
                                   step="0.01" min="1" required
                                   value="<%= isEdit ? budget.getAmount() : "" %>"
                                   placeholder="Masukkan jumlah budget">
                          </div>
                          <small class="text-muted">Masukkan jumlah budget yang ingin dialokasikan</small>
                        </div>

                        <!-- Period -->
                        <div class="mb-4">
                          <label for="period" class="form-label">
                            Periode <span class="text-danger">*</span>
                          </label>
                          <select class="form-select" id="period" name="period" required onchange="updateDateRange()">
                            <option value="">Pilih Periode</option>
                            <option value="MONTHLY" <%= isEdit && "MONTHLY".equals(budget.getPeriod()) ? "selected" : "" %>>
                              Bulanan
                            </option>
                            <option value="WEEKLY" <%= isEdit && "WEEKLY".equals(budget.getPeriod()) ? "selected" : "" %>>
                              Mingguan
                            </option>
                            <option value="YEARLY" <%= isEdit && "YEARLY".equals(budget.getPeriod()) ? "selected" : "" %>>
                              Tahunan
                            </option>
                          </select>
                          <small class="text-muted">Pilih periode budget</small>
                        </div>

                        <!-- Date Range -->
                        <div class="row">
                          <div class="col-md-6 mb-4">
                            <label for="startDate" class="form-label">
                              Tanggal Mulai <span class="text-danger">*</span>
                            </label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required
                                   value="<%= isEdit ? budget.getStartDate().toString() : "" %>">
                          </div>
                          <div class="col-md-6 mb-4">
                            <label for="endDate" class="form-label">
                              Tanggal Selesai <span class="text-danger">*</span>
                            </label>
                            <input type="date" class="form-control" id="endDate" name="endDate" required
                                   value="<%= isEdit ? budget.getEndDate().toString() : "" %>">
                          </div>
                        </div>

                        <!-- Alert Threshold -->
                        <div class="mb-4">
                          <label for="alertThreshold" class="form-label">
                            Batas Peringatan (%)
                          </label>
                          <input type="number" class="form-control" id="alertThreshold" name="alertThreshold" 
                                 min="1" max="100" value="<%= isEdit ? budget.getAlertThreshold() : 80 %>">
                          <small class="text-muted">
                            Anda akan mendapat peringatan ketika budget mencapai persentase ini (default: 80%)
                          </small>
                          <div class="mt-2">
                            <span class="badge bg-label-info">
                              Peringatan pada: <span id="alertAmount">Rp 0</span>
                            </span>
                          </div>
                        </div>

                        <!-- Status -->
                        <div class="mb-4">
                          <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="isActive" name="isActive" 
                                   value="true" <%= !isEdit || budget.getIsActive() ? "checked" : "" %>>
                            <label class="form-check-label" for="isActive">
                              Budget Aktif
                            </label>
                          </div>
                          <small class="text-muted">Budget aktif akan digunakan untuk tracking pengeluaran</small>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-end gap-2">
                          <a href="<%= request.getContextPath() %>/budgets" class="btn btn-label-secondary">
                            <i class="ri-close-line me-1"></i> Batal
                          </a>
                          <button type="submit" class="btn btn-primary" <%= (categories == null || categories.isEmpty()) ? "disabled" : "" %>>
                            <i class="ri-save-line me-1"></i> 
                            <%= isEdit ? "Update Budget" : "Simpan Budget" %>
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>

                <!-- Info Card -->
                <div class="col-md-4">
                  <div class="card mb-4">
                    <div class="card-body">
                      <h6 class="card-title mb-3">
                        <i class="ri-information-line me-2"></i>
                        Tips Budget
                      </h6>
                      <ul class="list-unstyled mb-0">
                        <li class="mb-3">
                          <i class="ri-checkbox-circle-line text-success me-2"></i>
                          <small>Tetapkan budget untuk setiap kategori pengeluaran</small>
                        </li>
                        <li class="mb-3">
                          <i class="ri-checkbox-circle-line text-success me-2"></i>
                          <small>Gunakan periode bulanan untuk tracking lebih mudah</small>
                        </li>
                        <li class="mb-3">
                          <i class="ri-checkbox-circle-line text-success me-2"></i>
                          <small>Set alert threshold pada 70-80% untuk peringatan dini</small>
                        </li>
                        <li class="mb-3">
                          <i class="ri-checkbox-circle-line text-success me-2"></i>
                          <small>Review dan adjust budget secara berkala</small>
                        </li>
                        <li>
                          <i class="ri-checkbox-circle-line text-success me-2"></i>
                          <small>Sisakan buffer 10-20% untuk pengeluaran tidak terduga</small>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="card">
                    <div class="card-body">
                      <h6 class="card-title mb-3">
                        <i class="ri-lightbulb-line me-2"></i>
                        Catatan
                      </h6>
                      <p class="small text-muted mb-0">
                        Sistem akan otomatis menghitung jumlah pengeluaran yang telah digunakan 
                        berdasarkan transaksi expense yang sesuai dengan kategori dan periode budget.
                      </p>
                    </div>
                  </div>
                </div>
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
      // Calculate alert amount
      function updateAlertAmount() {
        const amount = parseFloat($('#amount').val()) || 0;
        const threshold = parseFloat($('#alertThreshold').val()) || 80;
        const alertAmount = (amount * threshold) / 100;
        
        $('#alertAmount').text(new Intl.NumberFormat('id-ID', {
          style: 'currency',
          currency: 'IDR'
        }).format(alertAmount));
      }

      // Update date range based on period
      function updateDateRange() {
        const period = $('#period').val();
        const today = new Date();
        let endDate = new Date();
        
        $('#startDate').val(today.toISOString().split('T')[0]);
        
        if (period === 'MONTHLY') {
          endDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
        } else if (period === 'WEEKLY') {
          endDate = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000);
        } else if (period === 'YEARLY') {
          endDate = new Date(today.getFullYear(), 11, 31);
        }
        
        $('#endDate').val(endDate.toISOString().split('T')[0]);
      }

      $(document).ready(function() {
        // Update alert amount on input
        $('#amount, #alertThreshold').on('input', updateAlertAmount);
        
        // Initialize alert amount
        updateAlertAmount();
        
        // Validate dates
        $('#startDate, #endDate').on('change', function() {
          const startDate = new Date($('#startDate').val());
          const endDate = new Date($('#endDate').val());
          
          if (endDate < startDate) {
            alert('Tanggal selesai harus lebih besar dari tanggal mulai!');
            $('#endDate').val('');
          }
        });
        
        // Form validation before submit
        $('form').on('submit', function(e) {
          const amount = parseFloat($('#amount').val());
          const categoryId = $('#categoryId').val();
          const startDate = $('#startDate').val();
          const endDate = $('#endDate').val();
          
          if (!categoryId) {
            e.preventDefault();
            alert('Silakan pilih kategori!');
            return false;
          }
          
          if (!amount || amount <= 0) {
            e.preventDefault();
            alert('Jumlah budget harus lebih besar dari 0!');
            return false;
          }
          
          if (!startDate || !endDate) {
            e.preventDefault();
            alert('Tanggal mulai dan selesai harus diisi!');
            return false;
          }
          
          if (new Date(endDate) < new Date(startDate)) {
            e.preventDefault();
            alert('Tanggal selesai harus lebih besar dari tanggal mulai!');
            return false;
          }
          
          return true;
        });
      });
    </script>
  </body>
</html>
