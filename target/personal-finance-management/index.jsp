<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="model.User" %>
<%@ page import="model.Category" %>
<%@ page import="model.Budget" %>
<%@ page import="model.Income" %>
<%@ page import="model.Expense" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    
    // Get data from request attributes
    BigDecimal totalBalance = (BigDecimal) request.getAttribute("totalBalance");
    BigDecimal balanceThisMonth = (BigDecimal) request.getAttribute("balanceThisMonth");
    BigDecimal totalIncome = (BigDecimal) request.getAttribute("totalIncome");
    BigDecimal incomeThisMonth = (BigDecimal) request.getAttribute("incomeThisMonth");
    BigDecimal totalExpense = (BigDecimal) request.getAttribute("totalExpense");
    BigDecimal expenseThisMonth = (BigDecimal) request.getAttribute("expenseThisMonth");
    Integer totalCategories = (Integer) request.getAttribute("totalCategories");
    Integer totalTransactions = (Integer) request.getAttribute("totalTransactions");
    List<Object[]> latestTransactions = (List<Object[]>) request.getAttribute("latestTransactions");
    List<Category> expenseCategories = (List<Category>) request.getAttribute("expenseCategories");
    List<Budget> budgets = (List<Budget>) request.getAttribute("budgets");
    List<Income> recentIncomes = (List<Income>) request.getAttribute("recentIncomes");
    List<Expense> recentExpenses = (List<Expense>) request.getAttribute("recentExpenses");
    
    // Default values if null
    if (totalBalance == null) totalBalance = BigDecimal.ZERO;
    if (balanceThisMonth == null) balanceThisMonth = BigDecimal.ZERO;
    if (totalIncome == null) totalIncome = BigDecimal.ZERO;
    if (incomeThisMonth == null) incomeThisMonth = BigDecimal.ZERO;
    if (totalExpense == null) totalExpense = BigDecimal.ZERO;
    if (expenseThisMonth == null) expenseThisMonth = BigDecimal.ZERO;
    if (totalCategories == null) totalCategories = 0;
    if (totalTransactions == null) totalTransactions = 0;
    
    // Format currency
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy", new Locale("id", "ID"));
%>
<%!
    // Helper function to format short currency
    String formatShortCurrency(BigDecimal amount, NumberFormat currencyFormat) {
        if (amount == null) return "Rp 0";
        if (amount.compareTo(new BigDecimal("1000000000")) >= 0) {
            return "Rp " + amount.divide(new BigDecimal("1000000000"), 1, java.math.RoundingMode.HALF_UP) + "M";
        } else if (amount.compareTo(new BigDecimal("1000000")) >= 0) {
            return "Rp " + amount.divide(new BigDecimal("1000000"), 1, java.math.RoundingMode.HALF_UP) + "jt";
        } else if (amount.compareTo(new BigDecimal("1000")) >= 0) {
            return "Rp " + amount.divide(new BigDecimal("1000"), 0, java.math.RoundingMode.HALF_UP) + "rb";
        }
        return currencyFormat.format(amount);
    }
%>
<!doctype html>

<html
  lang="en"
  class="layout-navbar-fixed layout-menu-fixed layout-compact"
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
    <title>Personal Finance Management - Dashboard</title>

    <meta name="description" content="Aplikasi manajemen keuangan pribadi" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="templates/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&ampdisplay=swap"
      rel="stylesheet" />

    <link rel="stylesheet" href="templates/assets/vendor/fonts/iconify-icons.css" />

    <!-- Core CSS -->
    <!-- build:css assets/vendor/css/theme.css -->

    <link rel="stylesheet" href="templates/assets/vendor/libs/node-waves/node-waves.css" />

    <link rel="stylesheet" href="templates/assets/vendor/libs/pickr/pickr-themes.css" />

    <link rel="stylesheet" href="templates/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="templates/assets/css/demo.css" />

    <!-- Vendors CSS -->

    <link rel="stylesheet" href="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- endbuild -->

    <link rel="stylesheet" href="templates/assets/vendor/libs/apex-charts/apex-charts.css" />
    <link rel="stylesheet" href="templates/assets/vendor/libs/swiper/swiper.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="templates/assets/vendor/css/pages/cards-statistics.css" />

    <!-- Helpers -->
    <script src="templates/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->

    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js. -->
    <script src="templates/assets/vendor/js/template-customizer.js"></script>

    <!--? Config: Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file. -->

    <script src="templates/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <%@ include file="components/sidebar.jsp" %>

        <div class="menu-mobile-toggler d-xl-none rounded-1">
          <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large text-bg-secondary p-2 rounded-1">
            <i class="ri ri-menu-line icon-base"></i>
            <i class="ri ri-arrow-right-s-line icon-base"></i>
          </a>
        </div>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <%@ include file="components/navbar.jsp" %>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row g-6">
                <!-- Welcome Card -->
                <div class="col-md-12 col-xxl-8">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-md-6 order-2 order-md-1">
                        <div class="card-body">
                          <h4 class="card-title mb-4">Selamat Datang, <%= user.getUsername() %>! 👋</h4>
                          <p class="mb-0">Kelola keuangan pribadi Anda dengan mudah.</p>
                          <p>Pantau pemasukan, pengeluaran, dan anggaran Anda.</p>
                          <a href="<%= request.getContextPath() %>/incomes?action=add" class="btn btn-primary">Tambah Transaksi</a>
                        </div>
                      </div>
                      <div class="col-md-6 text-center text-md-end order-1 order-md-2">
                        <div class="card-body pb-0 px-0 pt-2">
                          <img
                            src="templates/assets/img/illustrations/illustration-john-light.png"
                            height="186"
                            class="scaleX-n1-rtl"
                            alt="Welcome"
                            data-app-light-img="illustrations/illustration-john-light.png"
                            data-app-dark-img="illustrations/illustration-john-dark.png" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Welcome Card -->

                <!-- Total Saldo -->
                <div class="col-xxl-2 col-sm-6">
                  <div class="card h-100">
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-start flex-wrap gap-2">
                        <div class="avatar">
                          <div class="avatar-initial bg-label-success rounded-3">
                            <i class="icon-base ri ri-wallet-3-line icon-24px"></i>
                          </div>
                        </div>
                        <div class="d-flex align-items-center">
                          <% if (balanceThisMonth.compareTo(BigDecimal.ZERO) >= 0) { %>
                          <p class="mb-0 text-success me-1">+</p>
                          <i class="icon-base ri ri-arrow-up-s-line text-success"></i>
                          <% } else { %>
                          <p class="mb-0 text-danger me-1">-</p>
                          <i class="icon-base ri ri-arrow-down-s-line text-danger"></i>
                          <% } %>
                        </div>
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1"><%= currencyFormat.format(totalBalance) %></h5>
                        <p>Total Saldo</p>
                        <div class="badge bg-label-secondary rounded-pill">Keseluruhan</div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Total Saldo -->

                <!-- Total Pemasukan -->
                <div class="col-xxl-2 col-sm-6">
                  <div class="card h-100">
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-start flex-wrap gap-2">
                        <div class="avatar">
                          <div class="avatar-initial bg-label-primary rounded-3">
                            <i class="icon-base ri ri-arrow-down-circle-line icon-24px"></i>
                          </div>
                        </div>
                        <div class="d-flex align-items-center">
                          <p class="mb-0 text-success me-1">+</p>
                          <i class="icon-base ri ri-arrow-up-s-line text-success"></i>
                        </div>
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1"><%= currencyFormat.format(incomeThisMonth) %></h5>
                        <p>Pemasukan</p>
                        <div class="badge bg-label-secondary rounded-pill">Bulan Ini</div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Total Pemasukan -->

                <!-- Cards Statistics -->
                <div class="col-12">
                  <div class="card">
                    <div class="card-widget-separator-wrapper">
                      <div class="card-body card-widget-separator">
                        <div class="row gy-4 gy-sm-1">
                          <div class="col-sm-6 col-lg-3">
                            <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-4 pb-sm-0">
                              <div>
                                <h4 class="mb-0"><%= currencyFormat.format(totalIncome) %></h4>
                                <p class="mb-0">Total Pemasukan</p>
                              </div>
                              <div class="avatar me-sm-6">
                                <span class="avatar-initial rounded-3 bg-label-success">
                                  <i class="icon-base ri ri-arrow-down-circle-line text-heading icon-26px"></i>
                                </span>
                              </div>
                            </div>
                            <hr class="d-none d-sm-block d-lg-none me-6" />
                          </div>
                          <div class="col-sm-6 col-lg-3">
                            <div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
                              <div>
                                <h4 class="mb-0"><%= currencyFormat.format(totalExpense) %></h4>
                                <p class="mb-0">Total Pengeluaran</p>
                              </div>
                              <div class="avatar me-lg-6">
                                <span class="avatar-initial rounded-3 bg-label-danger">
                                  <i class="icon-base ri ri-arrow-up-circle-line text-heading icon-26px"></i>
                                </span>
                              </div>
                            </div>
                            <hr class="d-none d-sm-block d-lg-none" />
                          </div>
                          <div class="col-sm-6 col-lg-3">
                            <div class="d-flex justify-content-between align-items-start border-end pb-4 pb-sm-0 card-widget-3">
                              <div>
                                <h4 class="mb-0"><%= totalTransactions %></h4>
                                <p class="mb-0">Total Transaksi</p>
                              </div>
                              <div class="avatar me-sm-6">
                                <span class="avatar-initial rounded-3 bg-label-info">
                                  <i class="icon-base ri ri-exchange-funds-line text-heading icon-26px"></i>
                                </span>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-6 col-lg-3">
                            <div class="d-flex justify-content-between align-items-start">
                              <div>
                                <h4 class="mb-0"><%= totalCategories %></h4>
                                <p class="mb-0">Kategori Aktif</p>
                              </div>
                              <div class="avatar">
                                <span class="avatar-initial rounded-3 bg-label-warning">
                                  <i class="icon-base ri ri-price-tag-3-line text-heading icon-26px"></i>
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Cards Statistics -->

               

                <!-- Transaksi Terakhir -->
                <div class="col-12 col-xxl-8">
                  <div class="card h-100">
                    <div class="card-header d-flex justify-content-between">
                      <div>
                        <h5 class="card-title mb-1">Transaksi Terakhir</h5>
                        <p class="card-subtitle mb-0">Riwayat transaksi terbaru</p>
                      </div>
                      <div>
                        <a href="<%= request.getContextPath() %>/incomes" class="btn btn-primary btn-sm">Lihat Semua</a>
                      </div>
                    </div>
                    <div class="card-body pb-0">
                      <div class="table-responsive">
                        <table class="table border-top">
                          <thead>
                            <tr>
                              <th class="bg-transparent border-bottom">Tanggal</th>
                              <th class="bg-transparent border-bottom">Keterangan</th>
                              <th class="bg-transparent border-bottom">Kategori</th>
                              <th class="bg-transparent border-bottom text-end">Jumlah</th>
                            </tr>
                          </thead>
                          <tbody class="table-border-bottom-0">
                            <% if (latestTransactions != null && !latestTransactions.isEmpty()) {
                                for (Object[] transaction : latestTransactions) {
                                    java.sql.Date txDate = (java.sql.Date) transaction[0];
                                    String txDesc = (String) transaction[1];
                                    String txCategory = (String) transaction[2];
                                    BigDecimal txAmount = (BigDecimal) transaction[3];
                                    String txType = (String) transaction[4];
                                    boolean isIncome = "income".equals(txType);
                            %>
                            <tr>
                              <td><%= txDate != null ? dateFormat.format(txDate) : "-" %></td>
                              <td><%= txDesc != null && !txDesc.isEmpty() ? txDesc : "-" %></td>
                              <td><span class="badge bg-label-<%= isIncome ? "success" : "danger" %> rounded-pill"><%= txCategory != null ? txCategory : "-" %></span></td>
                              <td class="text-end <%= isIncome ? "text-success" : "text-danger" %> fw-medium">
                                <%= isIncome ? "+ " : "- " %><%= txAmount != null ? currencyFormat.format(txAmount) : "Rp 0" %>
                              </td>
                            </tr>
                            <% } } else { %>
                            <tr>
                              <td colspan="4" class="text-center py-4 text-muted">
                                <i class="ri ri-inbox-line ri-2x mb-2 d-block"></i>
                                Belum ada transaksi
                              </td>
                            </tr>
                            <% } %>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Transaksi Terakhir -->

                 <!-- Pengeluaran per Kategori -->
                <div class="col-12 col-xxl-4 col-md-6">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="card-title m-0 me-2">Pengeluaran per Kategori</h5>
                      <div class="dropdown">
                        <button class="btn btn-text-secondary rounded-pill text-body-secondary border-0 p-1" type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="icon-base ri ri-more-2-line"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="categoryDropdown">
                          <a class="dropdown-item" href="<%= request.getContextPath() %>/categories">Lihat Semua</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <ul class="p-0 m-0">
                        <% if (expenseCategories != null && !expenseCategories.isEmpty()) {
                            String[] colors = {"primary", "danger", "warning", "info", "success", "secondary"};
                            int colorIndex = 0;
                            for (Category cat : expenseCategories) { 
                                String color = colors[colorIndex % colors.length];
                                colorIndex++;
                        %>
                        <li class="d-flex align-items-center mb-4">
                          <div class="avatar avatar-md flex-shrink-0 me-4">
                            <span class="avatar-initial rounded-3 bg-label-<%= color %>">
                              <i class="icon-base ri ri-folder-line"></i>
                            </span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-1"><%= cat.getName() != null ? cat.getName() : "Kategori" %></h6>
                              <small class="text-body-secondary"><%= cat.getDescription() != null ? cat.getDescription() : "Kategori pengeluaran" %></small>
                            </div>
                          </div>
                        </li>
                        <% } } else { %>
                        <li class="text-center py-4 text-muted">
                          <i class="ri ri-folder-line ri-2x mb-2 d-block"></i>
                          Belum ada kategori pengeluaran
                        </li>
                        <% } %>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Pengeluaran per Kategori -->

                 <!-- Budget Overview -->
                <div class="col-12 col-xxl-8">
                  <div class="card h-100">
                    <div class="card-header d-flex justify-content-between">
                      <div>
                        <h5 class="card-title mb-1">Ringkasan Anggaran</h5>
                        <p class="card-subtitle mb-0">Penggunaan anggaran bulan ini</p>
                      </div>
                      <div class="dropdown">
                        <button class="btn btn-text-secondary rounded-pill text-body-secondary border-0 p-1" type="button" id="budgetDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="icon-base ri ri-more-2-line"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="budgetDropdown">
                          <a class="dropdown-item" href="<%= request.getContextPath() %>/budgets">Lihat Semua</a>
                          <a class="dropdown-item" href="<%= request.getContextPath() %>/budgets">Kelola Anggaran</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="row g-4">
                        <% if (budgets != null && !budgets.isEmpty()) {
                            String[] budgetColors = {"primary", "info", "warning", "success", "danger", "secondary"};
                            int budgetColorIndex = 0;
                            for (Budget budget : budgets) {
                                String budgetColor = budgetColors[budgetColorIndex % budgetColors.length];
                                budgetColorIndex++;
                                double usedAmount = budget.getSpent() != null ? budget.getSpent().doubleValue() : 0;
                                double limitAmount = budget.getAmount() != null ? budget.getAmount().doubleValue() : 1;
                                int percentage = (int) Math.min(100, (usedAmount / limitAmount) * 100);
                                String progressColor = percentage >= 90 ? "danger" : (percentage >= 75 ? "warning" : budgetColor);
                        %>
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-<%= budgetColor %>">
                                <i class="icon-base ri ri-wallet-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium"><%= budget.getCategoryName() != null ? budget.getCategoryName() : "Anggaran" %></span>
                                <span class="text-body-secondary"><%= currencyFormat.format(usedAmount) %> / <%= currencyFormat.format(limitAmount) %></span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-<%= progressColor %>" role="progressbar" style="width: <%= percentage %>%;" aria-valuenow="<%= percentage %>" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <% } } else { %>
                        <div class="col-12 text-center py-4 text-muted">
                          <i class="ri ri-wallet-line ri-2x mb-2 d-block"></i>
                          Belum ada anggaran yang dibuat
                        </div>
                        <% } %>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Budget Overview -->

               

                

                <!-- Quick Actions -->
                <div class="col-12 col-xxl-4 col-md-6">
                  <div class="card h-100">
                    <div class="card-header">
                      <h5 class="card-title mb-0">Aksi Cepat</h5>
                    </div>
                    <div class="card-body">
                      <div class="row g-4">
                        <div class="col-6">
                          <a href="<%= request.getContextPath() %>/incomes?action=add" class="btn btn-outline-success w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-add-circle-line icon-24px mb-2"></i>
                            <span>Tambah Pemasukan</span>
                          </a>
                        </div>
                        <div class="col-6">
                          <a href="<%= request.getContextPath() %>/expenses?action=add" class="btn btn-outline-danger w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-subtract-line icon-24px mb-2"></i>
                            <span>Tambah Pengeluaran</span>
                          </a>
                        </div>
                        <div class="col-6">
                          <a href="<%= request.getContextPath() %>/categories" class="btn btn-outline-warning w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-price-tag-3-line icon-24px mb-2"></i>
                            <span>Kelola Kategori</span>
                          </a>
                        </div>
                        <div class="col-6">
                          <a href="<%= request.getContextPath() %>/budgets" class="btn btn-outline-info w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-wallet-line icon-24px mb-2"></i>
                            <span>Kelola Anggaran</span>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Quick Actions -->

                <!-- Aktivitas Terbaru -->
                <div class="col-12 col-xxl-8">
                  <div class="card h-100">
                    <div class="card-header">
                      <div class="d-flex justify-content-between">
                        <h5 class="mb-0">Aktivitas Keuangan</h5>
                      </div>
                    </div>
                    <div class="card-body pt-4">
                      <ul class="timeline card-timeline mb-0">
                        <% 
                        // Combine recent incomes and expenses for activity timeline
                        if ((recentIncomes != null && !recentIncomes.isEmpty()) || (recentExpenses != null && !recentExpenses.isEmpty())) {
                            // Show latest incomes
                            if (recentIncomes != null) {
                                int incomeCount = 0;
                                for (Income inc : recentIncomes) {
                                    if (incomeCount >= 2) break;
                                    incomeCount++;
                        %>
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-success"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Pemasukan: <%= inc.getDescription() != null ? inc.getDescription() : (inc.getSource() != null ? inc.getSource() : "-") %></h6>
                              <small class="text-body-secondary"><%= inc.getIncomeDate() != null ? dateFormat.format(inc.getIncomeDate()) : "-" %></small>
                            </div>
                            <p class="mb-2"><%= inc.getCategoryName() != null ? inc.getCategoryName() : "Pemasukan" %></p>
                            <div class="badge bg-label-success rounded-pill">+ <%= inc.getAmount() != null ? currencyFormat.format(inc.getAmount()) : "Rp 0" %></div>
                          </div>
                        </li>
                        <% } }
                            // Show latest expenses
                            if (recentExpenses != null) {
                                int expenseCount = 0;
                                for (Expense exp : recentExpenses) {
                                    if (expenseCount >= 2) break;
                                    expenseCount++;
                        %>
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-danger"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Pengeluaran: <%= exp.getDescription() != null ? exp.getDescription() : (exp.getRecipient() != null ? exp.getRecipient() : "-") %></h6>
                              <small class="text-body-secondary"><%= exp.getExpenseDate() != null ? dateFormat.format(exp.getExpenseDate()) : "-" %></small>
                            </div>
                            <p class="mb-2"><%= exp.getCategoryName() != null ? exp.getCategoryName() : "Pengeluaran" %></p>
                            <div class="badge bg-label-danger rounded-pill">- <%= exp.getAmount() != null ? currencyFormat.format(exp.getAmount()) : "Rp 0" %></div>
                          </div>
                        </li>
                        <% } }
                        } else { %>
                        <li class="text-center py-4 text-muted">
                          <i class="ri ri-history-line ri-2x mb-2 d-block"></i>
                          Belum ada aktivitas keuangan
                        </li>
                        <% } %>
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- Aktivitas Terbaru -->
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

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>

      <!-- Drag Target Area To SlideIn Menu On   Small Screens -->
      <div class="drag-target"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->

    <!-- build:js assets/vendor/js/theme.js  -->

    <script src="templates/assets/vendor/libs/jquery/jquery.js"></script>

    <script src="templates/assets/vendor/libs/popper/popper.js"></script>
    <script src="templates/assets/vendor/js/bootstrap.js"></script>
    <script src="templates/assets/vendor/libs/node-waves/node-waves.js"></script>

    <script src="templates/assets/vendor/libs/@algolia/autocomplete-js.js"></script>

    <script src="templates/assets/vendor/libs/pickr/pickr.js"></script>

    <script src="templates/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="templates/assets/vendor/libs/hammer/hammer.js"></script>

    <script src="templates/assets/vendor/libs/i18n/i18n.js"></script>

    <script src="templates/assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="templates/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="templates/assets/vendor/libs/swiper/swiper.js"></script>

    <!-- Main JS -->

    <script src="templates/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="templates/assets/js/dashboards-analytics.js"></script>
  </body>
</html>