<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

          <nav
            class="layout-navbar container-xxl navbar-detached navbar navbar-expand-xl align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
                <i class="icon-base ri ri-menu-line icon-22px"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center justify-content-end" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item navbar-search-wrapper mb-0">
                  <a class="nav-item nav-link search-toggler px-0" href="javascript:void(0);">
                    <span class="d-inline-block text-body-secondary fw-normal" id="autocomplete"></span>
                  </a>
                </div>
              </div>

              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-md-auto">
                <li class="nav-item dropdown-language dropdown me-sm-2 me-xl-0">
                  <a
                    class="nav-link dropdown-toggle hide-arrow btn btn-icon btn-text-secondary rounded-pill"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <i class="icon-base ri ri-translate-2 icon-22px"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="en" data-text-direction="ltr">
                        <span>English</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="fr" data-text-direction="ltr">
                        <span>French</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="ar" data-text-direction="rtl">
                        <span>Arabic</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="de" data-text-direction="ltr">
                        <span>German</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ Language -->

                <!-- Style Switcher -->
                <li class="nav-item dropdown me-sm-2 me-xl-0">
                  <a
                    class="nav-link dropdown-toggle hide-arrow btn btn-icon btn-text-secondary rounded-pill"
                    id="nav-theme"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <i class="icon-base ri ri-sun-line icon-22px theme-icon-active"></i>
                    <span class="d-none ms-2" id="nav-theme-text">Toggle theme</span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="nav-theme-text">
                    <li>
                      <button
                        type="button"
                        class="dropdown-item align-items-center active"
                        data-bs-theme-value="light"
                        aria-pressed="false">
                        <span><i class="icon-base ri ri-sun-line icon-22px me-3" data-icon="sun-line"></i>Light</span>
                      </button>
                    </li>
                    <li>
                      <button
                        type="button"
                        class="dropdown-item align-items-center"
                        data-bs-theme-value="dark"
                        aria-pressed="true">
                        <span
                          ><i class="icon-base ri ri-moon-clear-line icon-22px me-3" data-icon="moon-clear-line"></i
                          >Dark</span
                        >
                      </button>
                    </li>
                    <li>
                      <button
                        type="button"
                        class="dropdown-item align-items-center"
                        data-bs-theme-value="system"
                        aria-pressed="false">
                        <span
                          ><i class="icon-base ri ri-computer-line icon-22px me-3" data-icon="computer-line"></i
                          >System</span
                        >
                      </button>
                    </li>
                  </ul>
                </li>
                <!-- / Style Switcher-->

                <!-- Quick links -->
                <li class="nav-item dropdown-shortcuts navbar-dropdown dropdown me-sm-2 me-xl-0">
                  <a
                    class="nav-link dropdown-toggle hide-arrow btn btn-icon btn-text-secondary rounded-pill"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown"
                    <!-- Navbar -->
                    <%@ include file="components/navbar.jsp" %>
                    <!-- / Navbar -->
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-warning"
                                  ><i class="icon-base ri ri-error-warning-line icon-18px"></i
                                ></span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">CPU is running high</h6>
                              <small class="mb-1 d-block text-body"
                                >CPU Utilization Percent is currently at 88.63%,</small
                              >
                              <small class="text-body-secondary">5 days ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="icon-base ri ri-close-line"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li class="border-top">
                      <div class="d-grid p-4">
                        <a class="btn btn-primary btn-sm d-flex" href="javascript:void(0);">
                          <small class="align-middle">View all notifications</small>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
                <!--/ Notification -->

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="templates/assets/img/avatars/1.png" alt="avatar" class="rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end mt-3 py-2">
                    <li>
                      <a class="dropdown-item" href="pages-account-settings-account.html">
                        <div class="d-flex align-items-center">
                          <div class="flex-shrink-0 me-2">
                            <div class="avatar avatar-online">
                              <img
                                src="templates/assets/img/avatars/1.png"
                                alt="alt"
                                class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0 small"><%= session.getAttribute("username") != null ? session.getAttribute("username") : "User" %></h6>
                            <small class="text-body-secondary">Member</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="pages-profile-user.html">
                        <i class="icon-base ri ri-user-3-line icon-22px me-3"></i
                        ><span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="pages-account-settings-account.html">
                        <i class="icon-base ri ri-settings-4-line icon-22px me-3"></i
                        ><span class="align-middle">Settings</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="pages-account-settings-billing.html">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 icon-base ri ri-file-text-line icon-22px me-3"></i>
                          <span class="flex-grow-1 align-middle">Billing Plan</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger">4</span>
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="pages-pricing.html">
                        <i class="icon-base ri ri-money-dollar-circle-line icon-22px me-3"></i
                        ><span class="align-middle">Pricing</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="pages-faq.html">
                        <i class="icon-base ri ri-question-line icon-22px me-3"></i
                        ><span class="align-middle">FAQ</span>
                      </a>
                    </li>
                    <li>
                      <div class="d-grid px-4 pt-2 pb-1">
                        <a class="btn btn-sm btn-danger d-flex" href="${pageContext.request.contextPath}/logout">
                          <small class="align-middle">Logout</small>
                          <i class="icon-base ri ri-logout-box-r-line ms-2 icon-16px"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

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
                          <h4 class="card-title mb-4">Selamat Datang! 👋</h4>
                          <p class="mb-0">Kelola keuangan pribadi Anda dengan mudah.</p>
                          <p>Pantau pemasukan, pengeluaran, dan anggaran Anda.</p>
                          <a href="transactions.jsp" class="btn btn-primary">Tambah Transaksi</a>
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
