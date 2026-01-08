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
    <title>Personal Finance Management - Pengeluaran</title>
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
              <h4 class="py-3 mb-4"><span class="text-muted fw-light">Transaksi /</span> Pengeluaran</h4>

              <div class="row">
                <!-- Form Add Expense -->
                <div class="col-md-4">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h5 class="card-title mb-0">Tambah Pengeluaran</h5>
                    </div>
                    <div class="card-body">
                      <form action="expense" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                          <label for="jumlah" class="form-label">Jumlah</label>
                          <input type="number" class="form-control" id="jumlah" name="jumlah" required min="0" step="0.01">
                        </div>
                        <div class="mb-3">
                          <label for="tanggal" class="form-label">Tanggal</label>
                          <input type="date" class="form-control" id="tanggal" name="tanggal" required value="<%= java.time.LocalDate.now() %>">
                        </div>
                        <div class="mb-3">
                          <label for="kategori_id" class="form-label">Kategori</label>
                          <select class="form-select" id="kategori_id" name="kategori_id" required>
                            <option value="">Pilih Kategori</option>
                            <%@ page import="java.util.List" %>
                            <%@ page import="com.mycompany.personal.finance.management.model.Category" %>
                            <%@ page import="com.mycompany.personal.finance.management.model.Expense" %>
                            <%
                                List<Category> categories = (List<Category>) request.getAttribute("categories");
                                if (categories != null) {
                                    for (Category cat : categories) {
                            %>
                            <option value="<%= cat.getId() %>"><%= cat.getNama() %></option>
                            <%
                                    }
                                }
                            %>
                          </select>
                        </div>
                        <div class="mb-3">
                            <label for="deskripsi" class="form-label">Deskripsi</label>
                            <textarea class="form-control" id="deskripsi" name="deskripsi" rows="2"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                      </form>
                    </div>
                  </div>
                </div>

                <!-- List Expenses -->
                <div class="col-md-8">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title mb-0">Daftar Pengeluaran</h5>
                    </div>
                    <div class="table-responsive text-nowrap">
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Tanggal</th>
                            <th>Kategori</th>
                            <th>Deskripsi</th>
                            <th>Jumlah</th>
                            <th>Aksi</th>
                          </tr>
                        </thead>
                        <tbody>
                          <%
                              List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
                              if (expenses != null) {
                                  for (Expense exp : expenses) {
                          %>
                          <tr>
                            <td><%= exp.getTanggal() %></td>
                            <td><span class="badge bg-label-warning"><%= exp.getKategoriNama() != null ? exp.getKategoriNama() : "-" %></span></td>
                            <td><%= exp.getDeskripsi() != null ? exp.getDeskripsi() : "-" %></td>
                            <td class="fw-bold text-danger"><%= String.format("%,.2f", exp.getJumlah()) %></td>
                            <td>
                              <form action="expense" method="POST" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= exp.getId() %>">
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
                          <tr><td colspan="5" class="text-center">Belum ada data.</td></tr>
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
