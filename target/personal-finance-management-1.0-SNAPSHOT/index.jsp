<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (request.getAttribute("totalIncome") == null) {
        response.sendRedirect("dashboard");
        return;
    }
%>
<!doctype html>
<html
  lang="en"
  class="layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-skin="default"
  data-bs-theme="light"
  data-assets-path="assets/"
  data-template="vertical-menu-template">
  <head>
    <jsp:include page="includes/head.jsp" />
    <title>Personal Finance Management - Dashboard</title>
  </head>

  <body>
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        
        <jsp:include page="includes/sidebar.jsp" />

        <div class="layout-page">
          
          <jsp:include page="includes/navbar.jsp" />

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
                          <h4 class="card-title mb-4">Selamat Datang! 👋</h4>
                          <p class="mb-0">Kelola keuangan pribadi Anda dengan mudah.</p>
                          <p>Pantau pemasukan, pengeluaran, dan anggaran Anda.</p>
                          <a href="transactions.jsp" class="btn btn-primary">Tambah Transaksi</a>
                        </div>
                      </div>
                      <div class="col-md-6 text-center text-md-end order-1 order-md-2">
                        <div class="card-body pb-0 px-0 pt-2">
                          <img
                            src="assets/img/illustrations/illustration-john-light.png"
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
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1">Rp <%= String.format("%,.2f", request.getAttribute("balance")) %></h5>
                        <p>Total Saldo</p>
                        <div class="badge bg-label-secondary rounded-pill">Total Keseluruhan</div>
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
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1">Rp <%= String.format("%,.2f", request.getAttribute("totalIncome")) %></h5>
                        <p>Pemasukan</p>
                        <div class="badge bg-label-secondary rounded-pill">Total Keseluruhan</div>
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
                                <h4 class="mb-0">Rp <%= String.format("%,.0f k", ((java.math.BigDecimal)request.getAttribute("totalIncome")).divide(new java.math.BigDecimal(1000))) %></h4>
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
                                <h4 class="mb-0">Rp <%= String.format("%,.0f k", ((java.math.BigDecimal)request.getAttribute("totalExpense")).divide(new java.math.BigDecimal(1000))) %></h4>
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
                            <%@ page import="java.util.List" %>
                            <%@ page import="java.util.Map" %>
                            <%
                                List<Map<String, Object>> transactions = (List<Map<String, Object>>) request.getAttribute("recentTransactions");
                                if (transactions != null) {
                                    for (Map<String, Object> trx : transactions) {
                                        boolean isIncome = "PEMASUKAN".equals(trx.get("type"));
                            %>
                            <tr>
                              <td><%= trx.get("tanggal") %></td>
                              <td><%= trx.get("deskripsi") != null ? trx.get("deskripsi") : "-" %></td>
                              <td><span class="badge rounded-pill <%= isIncome ? "bg-label-success" : "bg-label-warning" %>"><%= trx.get("kategori") %></span></td>
                              <td class="text-end fw-medium <%= isIncome ? "text-success" : "text-danger" %>">
                                <%= isIncome ? "+" : "-" %> Rp <%= String.format("%,.2f", trx.get("jumlah")) %>
                              </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr><td colspan="4" class="text-center">Belum ada transaksi.</td></tr>
                            <% } %>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Transaksi Terakhir -->

                <!-- Quick Actions -->
                <div class="col-12 col-xxl-4 col-md-6">
                  <div class="card h-100">
                    <div class="card-header">
                      <h5 class="card-title mb-0">Aksi Cepat</h5>
                    </div>
                    <div class="card-body">
                      <div class="row g-4">
                        <div class="col-6">
                          <a href="income.jsp" class="btn btn-outline-success w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-add-circle-line icon-24px mb-2"></i>
                            <span>Tambah Pemasukan</span>
                          </a>
                        </div>
                        <div class="col-6">
                          <a href="expense.jsp" class="btn btn-outline-danger w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-subtract-line icon-24px mb-2"></i>
                            <span>Tambah Pengeluaran</span>
                          </a>
                        </div>
                        <div class="col-6">
                          <a href="categories.jsp" class="btn btn-outline-warning w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-price-tag-3-line icon-24px mb-2"></i>
                            <span>Kelola Kategori</span>
                          </a>
                        </div>
                        <div class="col-6">
                          <a href="report-monthly.jsp" class="btn btn-outline-info w-100 d-flex flex-column align-items-center py-4">
                            <i class="icon-base ri ri-bar-chart-2-line icon-24px mb-2"></i>
                            <span>Lihat Laporan</span>
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
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-success"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Pemasukan: Gaji Bulanan</h6>
                              <small class="text-body-secondary">25 Des 2025</small>
                            </div>
                            <p class="mb-2">Menerima gaji bulanan dari perusahaan</p>
                            <div class="badge bg-label-success rounded-pill">+ Rp 8.500.000</div>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-danger"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Pengeluaran: Tagihan Listrik</h6>
                              <small class="text-body-secondary">24 Des 2025</small>
                            </div>
                            <p class="mb-2">Pembayaran tagihan PLN bulan Desember</p>
                            <div class="badge bg-label-danger rounded-pill">- Rp 450.000</div>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-warning"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Anggaran Tercapai: Makanan</h6>
                              <small class="text-body-secondary">23 Des 2025</small>
                            </div>
                            <p class="mb-2">Anggaran makanan sudah mencapai 85% dari limit</p>
                            <div class="badge bg-label-warning rounded-pill">Peringatan</div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- Aktivitas Terbaru -->
              </div>
            </div>
            <!-- / Content -->

            <jsp:include page="includes/footer.jsp" />

            <div class="content-backdrop fade"></div>
          </div>
        </div>
      </div>

      <div class="layout-overlay layout-menu-toggle"></div>
      <div class="drag-target"></div>
    </div>

    <jsp:include page="includes/scripts.jsp" />
    
    <!-- Page JS -->
    <script src="assets/js/dashboards-analytics.js"></script>
  </body>
</html>
