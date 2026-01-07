<footer class="content-footer footer bg-footer-theme">
  <div class="container-xxl">
    <div class="footer-container d-flex align-items-center justify-content-between py-4 flex-md-row flex-column">
      <div class="text-body mb-2 mb-md-0">
        &copy; <%= new java.util.Date().getYear() + 1900 %> 
        <a href="<%= request.getContextPath() %>/dashboard" class="footer-link">Personal Finance Management</a>
      </div>
      <div class="d-none d-lg-inline-block">
        <a href="<%= request.getContextPath() %>/dashboard" class="footer-link me-4">
          <i class="ri ri-home-line me-1"></i> Dashboard
        </a>
        <a href="<%= request.getContextPath() %>/incomes" class="footer-link me-4">
          <i class="ri ri-arrow-up-circle-line me-1"></i> Pemasukan
        </a>
        <a href="<%= request.getContextPath() %>/expenses" class="footer-link">
          <i class="ri ri-arrow-down-circle-line me-1"></i> Pengeluaran
        </a>
      </div>
    </div>
  </div>
</footer>
