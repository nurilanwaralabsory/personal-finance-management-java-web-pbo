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

        <aside id="layout-menu" class="layout-menu menu-vertical menu">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
              <span class="app-brand-logo demo">
                <span class="text-primary">
                  <svg width="32" height="18" viewBox="0 0 38 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M30.0944 2.22569C29.0511 0.444187 26.7508 -0.172113 24.9566 0.849138C23.1623 1.87039 22.5536 4.14247 23.5969 5.92397L30.5368 17.7743C31.5801 19.5558 33.8804 20.1721 35.6746 19.1509C37.4689 18.1296 38.0776 15.8575 37.0343 14.076L30.0944 2.22569Z"
                      fill="currentColor" />
                    <path
                      d="M30.171 2.22569C29.1277 0.444187 26.8274 -0.172113 25.0332 0.849138C23.2389 1.87039 22.6302 4.14247 23.6735 5.92397L30.6134 17.7743C31.6567 19.5558 33.957 20.1721 35.7512 19.1509C37.5455 18.1296 38.1542 15.8575 37.1109 14.076L30.171 2.22569Z"
                      fill="url(#paint0_linear_2989_100980)"
                      fill-opacity="0.4" />
                    <path
                      d="M22.9676 2.22569C24.0109 0.444187 26.3112 -0.172113 28.1054 0.849138C29.8996 1.87039 30.5084 4.14247 29.4651 5.92397L22.5251 17.7743C21.4818 19.5558 19.1816 20.1721 17.3873 19.1509C15.5931 18.1296 14.9843 15.8575 16.0276 14.076L22.9676 2.22569Z"
                      fill="currentColor" />
                    <path
                      d="M14.9558 2.22569C13.9125 0.444187 11.6122 -0.172113 9.818 0.849138C8.02377 1.87039 7.41502 4.14247 8.45833 5.92397L15.3983 17.7743C16.4416 19.5558 18.7418 20.1721 20.5361 19.1509C22.3303 18.1296 22.9391 15.8575 21.8958 14.076L14.9558 2.22569Z"
                      fill="currentColor" />
                    <path
                      d="M14.9558 2.22569C13.9125 0.444187 11.6122 -0.172113 9.818 0.849138C8.02377 1.87039 7.41502 4.14247 8.45833 5.92397L15.3983 17.7743C16.4416 19.5558 18.7418 20.1721 20.5361 19.1509C22.3303 18.1296 22.9391 15.8575 21.8958 14.076L14.9558 2.22569Z"
                      fill="url(#paint1_linear_2989_100980)"
                      fill-opacity="0.4" />
                    <path
                      d="M7.82901 2.22569C8.87231 0.444187 11.1726 -0.172113 12.9668 0.849138C14.7611 1.87039 15.3698 4.14247 14.3265 5.92397L7.38656 17.7743C6.34325 19.5558 4.04298 20.1721 2.24875 19.1509C0.454514 18.1296 -0.154233 15.8575 0.88907 14.076L7.82901 2.22569Z"
                      fill="currentColor" />
                    <defs>
                      <linearGradient
                        id="paint0_linear_2989_100980"
                        x1="5.36642"
                        y1="0.849138"
                        x2="10.532"
                        y2="24.104"
                        gradientUnits="userSpaceOnUse">
                        <stop offset="0" stop-opacity="1" />
                        <stop offset="1" stop-opacity="0" />
                      </linearGradient>
                      <linearGradient
                        id="paint1_linear_2989_100980"
                        x1="5.19475"
                        y1="0.849139"
                        x2="10.3357"
                        y2="24.1155"
                        gradientUnits="userSpaceOnUse">
                        <stop offset="0" stop-opacity="1" />
                        <stop offset="1" stop-opacity="0" />
                      </linearGradient>
                    </defs>
                  </svg>
                </span>
              </span>
              <span class="app-brand-text demo menu-text fw-semibold ms-2">FinanceApp</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M8.47365 11.7183C8.11707 12.0749 8.11707 12.6531 8.47365 13.0097L12.071 16.607C12.4615 16.9975 12.4615 17.6305 12.071 18.021C11.6805 18.4115 11.0475 18.4115 10.657 18.021L5.83009 13.1941C5.37164 12.7356 5.37164 11.9924 5.83009 11.5339L10.657 6.707C11.0475 6.31653 11.6805 6.31653 12.071 6.707C12.4615 7.09747 12.4615 7.73053 12.071 8.121L8.47365 11.7183Z"
                  fill-opacity="0.9" />
                <path
                  d="M14.3584 11.8336C14.0654 12.1266 14.0654 12.6014 14.3584 12.8944L18.071 16.607C18.4615 16.9975 18.4615 17.6305 18.071 18.021C17.6805 18.4115 17.0475 18.4115 16.657 18.021L11.6819 13.0459C11.3053 12.6693 11.3053 12.0587 11.6819 11.6821L16.657 6.707C17.0475 6.31653 17.6805 6.31653 18.071 6.707C18.4615 7.09747 18.4615 7.73053 18.071 8.121L14.3584 11.8336Z"
                  fill-opacity="0.4" />
              </svg>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Main Menu -->
            <li class="menu-header small mt-3">
              <span class="menu-header-text" data-i18n="Main Menu">Main Menu</span>
            </li>

            <!-- Dashboard -->
            <li class="menu-item active">
              <a href="index.jsp" class="menu-link">
                <i class="menu-icon icon-base ri ri-home-smile-line"></i>
                <div data-i18n="Dashboard">Dashboard</div>
              </a>
            </li>

            <!-- Transactions -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon icon-base ri ri-exchange-funds-line"></i>
                <div data-i18n="Transaksi">Transaksi</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="transactions.jsp" class="menu-link">
                    <div data-i18n="Semua Transaksi">Semua Transaksi</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="income.jsp" class="menu-link">
                    <div data-i18n="Pemasukan">Pemasukan</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="expense.jsp" class="menu-link">
                    <div data-i18n="Pengeluaran">Pengeluaran</div>
                  </a>
                </li>
              </ul>
            </li>

            <!-- Categories -->
            <li class="menu-item">
              <a href="categories.jsp" class="menu-link">
                <i class="menu-icon icon-base ri ri-price-tag-3-line"></i>
                <div data-i18n="Kategori">Kategori</div>
              </a>
            </li>

            <!-- Budgets -->
            <li class="menu-item">
              <a href="budgets.jsp" class="menu-link">
                <i class="menu-icon icon-base ri ri-wallet-3-line"></i>
                <div data-i18n="Anggaran">Anggaran</div>
              </a>
            </li>

            <!-- Reports -->
            <li class="menu-header small mt-5">
              <span class="menu-header-text" data-i18n="Laporan">Laporan</span>
            </li>

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon icon-base ri ri-bar-chart-2-line"></i>
                <div data-i18n="Laporan">Laporan Keuangan</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="report-monthly.jsp" class="menu-link">
                    <div data-i18n="Laporan Bulanan">Laporan Bulanan</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="report-yearly.jsp" class="menu-link">
                    <div data-i18n="Laporan Tahunan">Laporan Tahunan</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="report-category.jsp" class="menu-link">
                    <div data-i18n="Laporan per Kategori">Laporan per Kategori</div>
                  </a>
                </li>
              </ul>
            </li>

            <!-- Settings -->
            <li class="menu-header small mt-5">
              <span class="menu-header-text" data-i18n="Pengaturan">Pengaturan</span>
            </li>

            <li class="menu-item">
              <a href="profile.jsp" class="menu-link">
                <i class="menu-icon icon-base ri ri-user-line"></i>
                <div data-i18n="Profil">Profil</div>
              </a>
            </li>

            <li class="menu-item">
              <a href="settings.jsp" class="menu-link">
                <i class="menu-icon icon-base ri ri-settings-3-line"></i>
                <div data-i18n="Pengaturan">Pengaturan</div>
              </a>
            </li>

            <li class="menu-item">
              <a href="logout.jsp" class="menu-link">
                <i class="menu-icon icon-base ri ri-logout-box-r-line"></i>
                <div data-i18n="Keluar">Keluar</div>
              </a>
            </li>
          </ul>
        </aside>

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
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    <i class="icon-base ri ri-star-smile-line icon-22px"></i>
                  </a>
                  <div class="dropdown-menu dropdown-menu-end p-0">
                    <div class="dropdown-menu-header border-bottom">
                      <div class="dropdown-header d-flex align-items-center py-3">
                        <h6 class="mb-0 me-auto">Shortcuts</h6>
                        <a
                          href="javascript:void(0)"
                          class="btn btn-text-secondary rounded-pill btn-icon dropdown-shortcuts-add text-heading"
                          data-bs-toggle="tooltip"
                          data-bs-placement="top"
                          title="Add shortcuts">
                          <i class="icon-base ri ri-add-line text-heading"></i>
                        </a>
                      </div>
                    </div>
                    <div class="dropdown-shortcuts-list scrollable-container">
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-calendar-line icon-26px text-heading"></i>
                          </span>
                          <a href="app-calendar.html" class="stretched-link">Calendar</a>
                          <small>Appointments</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-file-text-line icon-26px text-heading"></i>
                          </span>
                          <a href="app-invoice-list.html" class="stretched-link">Invoice App</a>
                          <small>Manage Accounts</small>
                        </div>
                      </div>
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-user-line icon-26px text-heading"></i>
                          </span>
                          <a href="app-user-list.html" class="stretched-link">User App</a>
                          <small>Manage Users</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-computer-line icon-26px text-heading"></i>
                          </span>
                          <a href="app-access-roles.html" class="stretched-link">Role Management</a>
                          <small>Permission</small>
                        </div>
                      </div>
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-pie-chart-2-line icon-26px text-heading"></i>
                          </span>
                          <a href="index.html" class="stretched-link">Dashboard</a>
                          <small>User Dashboard</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-settings-4-line icon-26px text-heading"></i>
                          </span>
                          <a href="pages-account-settings-account.html" class="stretched-link">Setting</a>
                          <small>Account Settings</small>
                        </div>
                      </div>
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-question-line icon-26px text-heading"></i>
                          </span>
                          <a href="pages-faq.html" class="stretched-link">FAQs</a>
                          <small>FAQs & Articles</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon rounded-circle mb-3">
                            <i class="icon-base ri ri-tv-2-line icon-26px text-heading"></i>
                          </span>
                          <a href="modal-examples.html" class="stretched-link">Modals</a>
                          <small>Useful Popups</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- Quick links -->

                <!-- Notification -->
                <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-4 me-xl-1">
                  <a
                    class="nav-link dropdown-toggle hide-arrow btn btn-icon btn-text-secondary rounded-pill"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    <i class="icon-base ri ri-notification-2-line icon-22px"></i>
                    <span
                      class="position-absolute top-0 start-50 translate-middle-y badge badge-dot bg-danger mt-2 border"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end py-0">
                    <li class="dropdown-menu-header border-bottom py-50">
                      <div class="dropdown-header d-flex align-items-center py-2">
                        <h6 class="mb-0 me-auto">Notification</h6>
                        <div class="d-flex align-items-center h6 mb-0">
                          <span class="badge rounded-pill bg-label-primary fs-xsmall me-2">8 New</span>
                          <a
                            href="javascript:void(0)"
                            class="dropdown-notifications-all p-2"
                            data-bs-toggle="tooltip"
                            data-bs-placement="top"
                            title="Mark all as read"
                            ><i class="icon-base ri ri-mail-open-line text-heading"></i
                          ></a>
                        </div>
                      </div>
                    </li>
                    <li class="dropdown-notifications-list scrollable-container">
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="templates/assets/img/avatars/1.png" alt="avatar" class="rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Congratulation Lettie 🎉</h6>
                              <small class="mb-1 d-block text-body">Won the monthly best seller gold badge</small>
                              <small class="text-body-secondary">1h ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-danger">CF</span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Charles Franklin</h6>
                              <small class="mb-1 d-block text-body">Accepted your connection</small>
                              <small class="text-body-secondary">12hr ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="templates/assets/img/avatars/2.png" alt="avatar" class="rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">New Message ✉️</h6>
                              <small class="mb-1 d-block text-body">You have new message from Natalie</small>
                              <small class="text-body-secondary">1h ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-success"
                                  ><i class="icon-base ri ri-shopping-cart-2-line icon-18px"></i
                                ></span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Whoo! You have new order 🛒</h6>
                              <small class="mb-1 d-block text-body">ACME Inc. made new order $1,154</small>
                              <small class="text-body-secondary">1 day ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="templates/assets/img/avatars/9.png" alt="avatar" class="rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Application has been approved 🚀</h6>
                              <small class="mb-1 d-block text-body"
                                >Your ABC project application has been approved.</small
                              >
                              <small class="text-body-secondary">2 days ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-success"
                                  ><i class="icon-base ri ri-pie-chart-2-line icon-18px"></i
                                ></span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Monthly report is generated</h6>
                              <small class="mb-1 d-block text-body">July monthly financial report is generated </small>
                              <small class="text-body-secondary">3 days ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="templates/assets/img/avatars/5.png" alt="avatar" class="rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Send connection request</h6>
                              <small class="mb-1 d-block text-body">Peter sent you connection request</small>
                              <small class="text-body-secondary">4 days ago</small>
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
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="templates/assets/img/avatars/6.png" alt="avatar" class="rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">New message from Jane</h6>
                              <small class="mb-1 d-block text-body">Your have new message from Jane</small>
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
                            <h6 class="mb-0 small">John Doe</h6>
                            <small class="text-body-secondary">Admin</small>
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
                        <a class="btn btn-sm btn-danger d-flex" href="auth-login-cover.html" target="_blank">
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
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl">
                <div
                  class="footer-container d-flex align-items-center justify-content-between py-4 flex-md-row flex-column">
                  <div class="mb-2 mb-md-0">
                    &#169;
                    <script>
                      document.write(new Date().getFullYear());
                    </script>
                    Personal Finance Management - Kelola Keuangan Anda dengan Mudah
                  </div>
                  <div class="d-none d-lg-inline-block">
                    <a href="index.jsp" class="footer-link me-4">Dashboard</a>
                    <a href="transactions.jsp" class="footer-link me-4">Transaksi</a>
                    <a href="categories.jsp" class="footer-link me-4">Kategori</a>
                    <a href="budgets.jsp" class="footer-link d-none d-sm-inline-block">Anggaran</a>a
                    >
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
