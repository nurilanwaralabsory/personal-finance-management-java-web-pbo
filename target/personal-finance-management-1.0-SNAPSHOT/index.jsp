<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                        <div class="d-flex align-items-center">
                          <p class="mb-0 text-success me-1">+12%</p>
                          <i class="icon-base ri ri-arrow-up-s-line text-success"></i>
                        </div>
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1">Rp 15.250.000</h5>
                        <p>Total Saldo</p>
                        <div class="badge bg-label-secondary rounded-pill">Bulan Ini</div>
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
                          <p class="mb-0 text-success me-1">+8%</p>
                          <i class="icon-base ri ri-arrow-up-s-line text-success"></i>
                        </div>
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1">Rp 8.500.000</h5>
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
                                <h4 class="mb-0">Rp 8.5jt</h4>
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
                                <h4 class="mb-0">Rp 3.2jt</h4>
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
                                <h4 class="mb-0">24</h4>
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
                                <h4 class="mb-0">5</h4>
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
                          <a class="dropdown-item" href="budgets.jsp">Lihat Semua</a>
                          <a class="dropdown-item" href="budgets.jsp">Kelola Anggaran</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="row g-4">
                        <!-- Makanan & Minuman -->
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-primary">
                                <i class="icon-base ri ri-restaurant-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium">Makanan & Minuman</span>
                                <span class="text-body-secondary">Rp 850.000 / Rp 1.000.000</span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-primary" role="progressbar" style="width: 85%;" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Transportasi -->
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-info">
                                <i class="icon-base ri ri-car-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium">Transportasi</span>
                                <span class="text-body-secondary">Rp 400.000 / Rp 500.000</span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 80%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Belanja -->
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-warning">
                                <i class="icon-base ri ri-shopping-bag-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium">Belanja</span>
                                <span class="text-body-secondary">Rp 600.000 / Rp 800.000</span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Hiburan -->
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-success">
                                <i class="icon-base ri ri-movie-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium">Hiburan</span>
                                <span class="text-body-secondary">Rp 150.000 / Rp 300.000</span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Tagihan -->
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-danger">
                                <i class="icon-base ri ri-bill-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium">Tagihan</span>
                                <span class="text-body-secondary">Rp 1.200.000 / Rp 1.200.000</span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Tabungan -->
                        <div class="col-md-6">
                          <div class="d-flex align-items-center mb-2">
                            <div class="avatar avatar-sm me-3">
                              <span class="avatar-initial rounded-3 bg-label-secondary">
                                <i class="icon-base ri ri-safe-line"></i>
                              </span>
                            </div>
                            <div class="w-100">
                              <div class="d-flex justify-content-between mb-1">
                                <span class="fw-medium">Tabungan</span>
                                <span class="text-body-secondary">Rp 500.000 / Rp 1.000.000</span>
                              </div>
                              <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-secondary" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Budget Overview -->

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
                          <a class="dropdown-item" href="categories.jsp">Lihat Semua</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <ul class="p-0 m-0">
                        <li class="d-flex align-items-center mb-6">
                          <div class="avatar avatar-md flex-shrink-0 me-4">
                            <span class="avatar-initial rounded-3 bg-label-primary">
                              <i class="icon-base ri ri-restaurant-line"></i>
                            </span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-1">Makanan & Minuman</h6>
                              <small class="text-body-secondary">8 transaksi</small>
                            </div>
                            <div class="badge bg-label-primary rounded-pill">Rp 850.000</div>
                          </div>
                        </li>
                        <li class="d-flex align-items-center mb-6">
                          <div class="avatar avatar-md flex-shrink-0 me-4">
                            <span class="avatar-initial rounded-3 bg-label-danger">
                              <i class="icon-base ri ri-bill-line"></i>
                            </span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-1">Tagihan</h6>
                              <small class="text-body-secondary">3 transaksi</small>
                            </div>
                            <div class="badge bg-label-danger rounded-pill">Rp 1.200.000</div>
                          </div>
                        </li>
                        <li class="d-flex align-items-center mb-6">
                          <div class="avatar avatar-md flex-shrink-0 me-4">
                            <span class="avatar-initial rounded-3 bg-label-warning">
                              <i class="icon-base ri ri-shopping-bag-line"></i>
                            </span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-1">Belanja</h6>
                              <small class="text-body-secondary">5 transaksi</small>
                            </div>
                            <div class="badge bg-label-warning rounded-pill">Rp 600.000</div>
                          </div>
                        </li>
                        <li class="d-flex align-items-center mb-6">
                          <div class="avatar avatar-md flex-shrink-0 me-4">
                            <span class="avatar-initial rounded-3 bg-label-info">
                              <i class="icon-base ri ri-car-line"></i>
                            </span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-1">Transportasi</h6>
                              <small class="text-body-secondary">6 transaksi</small>
                            </div>
                            <div class="badge bg-label-info rounded-pill">Rp 400.000</div>
                          </div>
                        </li>
                        <li class="d-flex align-items-center">
                          <div class="avatar avatar-md flex-shrink-0 me-4">
                            <span class="avatar-initial rounded-3 bg-label-success">
                              <i class="icon-base ri ri-movie-line"></i>
                            </span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-1">Hiburan</h6>
                              <small class="text-body-secondary">2 transaksi</small>
                            </div>
                            <div class="badge bg-label-success rounded-pill">Rp 150.000</div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Pengeluaran per Kategori -->

                <!-- Transaksi Terakhir -->
                <div class="col-12 col-xxl-8">
                  <div class="card h-100">
                    <div class="card-header d-flex justify-content-between">
                      <div>
                        <h5 class="card-title mb-1">Transaksi Terakhir</h5>
                        <p class="card-subtitle mb-0">Riwayat transaksi terbaru</p>
                      </div>
                      <div>
                        <a href="transactions.jsp" class="btn btn-primary btn-sm">Lihat Semua</a>
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
                            <tr>
                              <td>26 Des 2025</td>
                              <td>Makan siang</td>
                              <td><span class="badge bg-label-primary rounded-pill">Makanan</span></td>
                              <td class="text-end text-danger fw-medium">- Rp 35.000</td>
                            </tr>
                            <tr>
                              <td>25 Des 2025</td>
                              <td>Gaji Bulanan</td>
                              <td><span class="badge bg-label-success rounded-pill">Pemasukan</span></td>
                              <td class="text-end text-success fw-medium">+ Rp 8.500.000</td>
                            </tr>
                            <tr>
                              <td>24 Des 2025</td>
                              <td>Listrik PLN</td>
                              <td><span class="badge bg-label-danger rounded-pill">Tagihan</span></td>
                              <td class="text-end text-danger fw-medium">- Rp 450.000</td>
                            </tr>
                            <tr>
                              <td>23 Des 2025</td>
                              <td>Grab Car</td>
                              <td><span class="badge bg-label-info rounded-pill">Transportasi</span></td>
                              <td class="text-end text-danger fw-medium">- Rp 75.000</td>
                            </tr>
                            <tr>
                              <td>22 Des 2025</td>
                              <td>Belanja Groceries</td>
                              <td><span class="badge bg-label-warning rounded-pill">Belanja</span></td>
                              <td class="text-end text-danger fw-medium">- Rp 320.000</td>
                            </tr>
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
