<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
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
    <title>Kategori - Manajemen Keuangan Pribadi</title>
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
          <jsp:param name="activePage" value="categories" />
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
                      <img src="<%= request.getContextPath() %>/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
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
                          <span>Total Kategori</span>
                          <div class="d-flex align-items-center my-1">
                            <h4 class="mb-0 me-2"><%= request.getAttribute("categories") != null ? ((java.util.List)request.getAttribute("categories")).size() : 0 %></h4>
                          </div>
                          <small>Total jenis pemasukan & pengeluaran</small>
                        </div>
                        <span class="badge bg-label-primary rounded p-2">
                          <i class="ri-price-tag-3-line ri-24px"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Categories Table -->
              <div class="card">
                <div class="card-header border-bottom">
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">Daftar Kategori</h5>
                    <div class="d-flex align-items-center row-gap-3 gap-2">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                            <i class="ri-add-line ri-16px me-1"></i> Tambah Kategori
                        </button>
                    </div>
                  </div>
                </div>
                <div class="card-datatable table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Nama</th>
                        <th>Tipe</th>
                        <th>Dibuat Pada</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% 
                      List<Category> categories = (List<Category>) request.getAttribute("categories");
                      if (categories != null && !categories.isEmpty()) {
                          int i = 1;
                          for (Category cat : categories) {
                      %>
                      <tr>
                        <td><%= i++ %></td>
                        <td><span class="fw-medium"><%= cat.getName() %></span></td>
                        <td>
                            <% if ("income".equals(cat.getType())) { %>
                                <span class="badge bg-label-success">Pemasukan</span>
                            <% } else { %>
                                <span class="badge bg-label-danger">Pengeluaran</span>
                            <% } %>
                        </td>
                        <td><%= cat.getCreatedAt() %></td>
                        <td>
                          <div class="d-flex align-items-center">
                            <a href="javascript:;" class="text-body me-2" 
                               data-bs-toggle="modal" 
                               data-bs-target="#editCategoryModal"
                               onclick="setEditModal(<%= cat.getId() %>, '<%= cat.getName() %>', '<%= cat.getType() %>')">
                               <i class="ri-edit-line ri-20px"></i>
                            </a>
                            <form action="categories" method="POST" onsubmit="return confirm('Apakah Anda yakin ingin menghapus kategori ini?');" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= cat.getId() %>">
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
                          <td colspan="5" class="text-center">Tidak ada kategori ditemukan.</td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Categories Table -->

              <!-- Add Category Modal -->
              <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Tambah Kategori Baru</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="categories" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="modal-body">
                          <div class="row">
                            <div class="col mb-3">
                              <label for="name" class="form-label">Nama Kategori</label>
                              <input type="text" id="name" name="name" class="form-control" placeholder="Masukkan Nama" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col mb-0">
                              <label for="type" class="form-label">Tipe</label>
                              <select id="type" name="type" class="form-select" required>
                                  <option value="expense">Pengeluaran</option>
                                  <option value="income">Pemasukan</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Tutup</button>
                          <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </form>
                  </div>
                </div>
              </div>

              <!-- Edit Category Modal -->
              <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Edit Kategori</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="categories" method="POST">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" id="edit_id">
                        <div class="modal-body">
                          <div class="row">
                            <div class="col mb-3">
                              <label for="edit_name" class="form-label">Nama Kategori</label>
                              <input type="text" id="edit_name" name="name" class="form-control" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col mb-0">
                              <label for="edit_type" class="form-label">Tipe</label>
                              <select id="edit_type" name="type" class="form-select" required>
                                  <option value="expense">Pengeluaran</option>
                                  <option value="income">Pemasukan</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Tutup</button>
                          <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                        </div>
                    </form>
                  </div>
                </div>
              </div>

              <script>
                  function setEditModal(id, name, type) {
                      document.getElementById('edit_id').value = id;
                      document.getElementById('edit_name').value = name;
                      document.getElementById('edit_type').value = type;
                  }
              </script>

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

      <!-- Drag Target Area To SlideIn Menu On   Small Screens -->
      <div class="drag-target"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/theme.js  -->
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/popper/popper.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/js/bootstrap.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="<%= request.getContextPath() %>/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Main JS -->
    <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>
  </body>
</html>
