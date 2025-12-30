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
              
              <div class="card">
                <div class="card-header">
                  <h5 class="card-title mb-0">Kelola Kategori</h5>
                </div>
                <div class="card-body">
                  <p>Halaman ini akan menampilkan daftar kategori dan manajemen kategori.</p>
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
