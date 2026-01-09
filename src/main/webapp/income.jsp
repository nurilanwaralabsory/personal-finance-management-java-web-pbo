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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Tambah Pemasukan - Manajemen Keuangan Pribadi</title>
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
          <jsp:param name="activePage" value="income" />
        </jsp:include>
        <!-- / Menu -->
        <!-- / Menu -->

        <div class="layout-page">
          <!-- Navbar -->
           <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <!-- ... (Omit Navbar content for specific file content tool brevity, assume user expects template structure) ... -->
             <!-- Just basic navbar for minimal functional requirement -->
            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
               <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <span class="fw-bold">Tambah Pemasukan Baru</span>
                </div>
              </div>
            </div>
           </nav>
          
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              
              <div class="row">
                <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">Formulir Pemasukan</h5>
                    </div>
                    <div class="card-body">
                      <form action="transactions" method="POST">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="type" value="income">
                        
                        <div class="mb-3">
                          <label class="form-label" for="amount">Jumlah (Rp)</label>
                          <div class="input-group input-group-merge">
                            <span class="input-group-text">Rp</span>
                            <input type="number" step="0.01" class="form-control" id="amount" name="amount" placeholder="100000" required />
                          </div>
                        </div>

                        <div class="mb-3">
                          <label class="form-label" for="category_id">Kategori</label>
                          <select class="form-select" id="category_id" name="category_id" required>
                             <option value="" disabled selected>Pilih Kategori</option>
                             <% 
                                List<Category> categories = (List<Category>) request.getAttribute("categories");
                                if (categories != null) {
                                  for (Category cat : categories) {
                                      if ("income".equals(cat.getType())) {
                             %>
                                <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                             <%       }
                                  }
                                }
                             %>
                          </select>
                        </div>

                        <div class="mb-3">
                          <label class="form-label" for="date">Tanggal</label>
                          <input type="date" class="form-control" id="date" name="date" required />
                          <script>document.getElementById('date').valueAsDate = new Date();</script>
                        </div>
                        
                        <div class="mb-3">
                          <label class="form-label" for="description">Deskripsi</label>
                          <textarea id="description" name="description" class="form-control" placeholder="Sumber pemasukan"></textarea>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Simpan Pemasukan</button>
                      </form>
                    </div>
                  </div>
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
