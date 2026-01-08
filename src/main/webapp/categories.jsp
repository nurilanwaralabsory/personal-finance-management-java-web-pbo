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
    <title>Personal Finance Management - Kategori</title>
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
              <h4 class="py-3 mb-4">Kategori</h4>

              <div class="row">
                <!-- Form Add Category -->
                <div class="col-md-4">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h5 class="card-title mb-0">Tambah Kategori</h5>
                    </div>
                    <div class="card-body">
                      <form action="categories" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                          <label for="nama" class="form-label">Nama Kategori</label>
                          <input type="text" class="form-control" id="nama" name="nama" required>
                        </div>
                        <div class="mb-3">
                          <label for="tipe" class="form-label">Tipe</label>
                          <select class="form-select" id="tipe" name="tipe" required>
                            <option value="PEMASUKAN">Pemasukan</option>
                            <option value="PENGELUARAN">Pengeluaran</option>
                          </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                      </form>
                    </div>
                  </div>
                </div>

                <!-- List Categories -->
                <div class="col-md-8">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title mb-0">Daftar Kategori</h5>
                    </div>
                    <div class="table-responsive text-nowrap">
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Nama</th>
                            <th>Tipe</th>
                            <th>Aksi</th>
                          </tr>
                        </thead>
                        <tbody>
                          <%@ page import="java.util.List" %>
                          <%@ page import="com.mycompany.personal.finance.management.model.Category" %>
                          <%
                              List<Category> categories = (List<Category>) request.getAttribute("categories");
                              if (categories != null) {
                                  for (Category cat : categories) {
                          %>
                          <tr>
                            <td><%= cat.getNama() %></td>
                            <td>
                              <span class="badge <%= cat.getTipe().equals("PEMASUKAN") ? "bg-label-success" : "bg-label-danger" %>">
                                <%= cat.getTipe() %>
                              </span>
                            </td>
                            <td>
                              <form action="categories" method="POST" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= cat.getId() %>">
                                <button type="submit" class="btn btn-sm btn-icon btn-outline-danger" onclick="return confirm('Yakin ingin menghapus?')">
                                  <i class="bx bx-trash"></i>
                                </button>
                              </form>
                            </td>
                          </tr>
                          <%
                                  }
                              } else {
                          %>
                          <tr><td colspan="3" class="text-center">Belum ada data. Silakan refresh halaman atau tambah data.</td></tr>
                          <% } %>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
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
  </body>
</html>
