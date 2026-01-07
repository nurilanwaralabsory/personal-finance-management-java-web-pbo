<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%
    User navUser = (User) session.getAttribute("user");
    String username = navUser != null ? navUser.getUsername() : "User";
    String email = navUser != null ? navUser.getEmail() : "";
%>
<nav class="layout-navbar container-xxl navbar-detached navbar navbar-expand-xl align-items-center bg-navbar-theme" id="layout-navbar">
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
          <i class="icon-base ri ri-search-line icon-22px me-2"></i>
          <span class="d-none d-md-inline-block text-muted">Cari...</span>
        </a>
      </div>
    </div>
    <!-- /Search -->

    <ul class="navbar-nav flex-row align-items-center ms-md-auto">
      <!-- Style Switcher -->
      <li class="nav-item dropdown me-2">
        <a class="nav-link dropdown-toggle hide-arrow btn btn-icon btn-text-secondary rounded-pill" id="nav-theme" href="javascript:void(0);" data-bs-toggle="dropdown">
          <i class="icon-base ri ri-sun-line icon-22px theme-icon-active"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li>
            <button type="button" class="dropdown-item align-items-center active" data-bs-theme-value="light">
              <span><i class="icon-base ri ri-sun-line icon-22px me-3"></i>Light</span>
            </button>
          </li>
          <li>
            <button type="button" class="dropdown-item align-items-center" data-bs-theme-value="dark">
              <span><i class="icon-base ri ri-moon-clear-line icon-22px me-3"></i>Dark</span>
            </button>
          </li>
          <li>
            <button type="button" class="dropdown-item align-items-center" data-bs-theme-value="system">
              <span><i class="icon-base ri ri-computer-line icon-22px me-3"></i>System</span>
            </button>
          </li>
        </ul>
      </li>
      <!-- / Style Switcher-->

      <!-- Quick Actions -->
      <li class="nav-item dropdown me-2">
        <a class="nav-link dropdown-toggle hide-arrow btn btn-icon btn-text-secondary rounded-pill" href="javascript:void(0);" data-bs-toggle="dropdown">
          <i class="icon-base ri ri-add-circle-line icon-22px"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li>
            <h6 class="dropdown-header">Tambah Cepat</h6>
          </li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/incomes?action=add">
              <i class="icon-base ri ri-arrow-up-circle-line text-success me-2"></i>
              <span>Pemasukan Baru</span>
            </a>
          </li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/expenses?action=add">
              <i class="icon-base ri ri-arrow-down-circle-line text-danger me-2"></i>
              <span>Pengeluaran Baru</span>
            </a>
          </li>
          <li><hr class="dropdown-divider"></li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/categories?action=add&type=income">
              <i class="icon-base ri ri-folder-add-line me-2"></i>
              <span>Kategori Baru</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- / Quick Actions -->

      <!-- User -->
      <li class="nav-item navbar-dropdown dropdown-user dropdown">
        <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);" data-bs-toggle="dropdown">
          <div class="avatar avatar-online">
            <span class="avatar-initial rounded-circle bg-primary">
              <%= username.substring(0, 1).toUpperCase() %>
            </span>
          </div>
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li>
            <a class="dropdown-item mt-0" href="<%= request.getContextPath() %>/profile">
              <div class="d-flex align-items-center">
                <div class="flex-shrink-0 me-2">
                  <div class="avatar avatar-online">
                    <span class="avatar-initial rounded-circle bg-primary">
                      <%= username.substring(0, 1).toUpperCase() %>
                    </span>
                  </div>
                </div>
                <div class="flex-grow-1">
                  <h6 class="mb-0"><%= username %></h6>
                  <small class="text-muted"><%= email %></small>
                </div>
              </div>
            </a>
          </li>
          <li>
            <div class="dropdown-divider my-1 mx-n2"></div>
          </li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/profile">
              <i class="icon-base ri ri-user-line icon-22px me-3"></i>
              <span>Profil Saya</span>
            </a>
          </li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/incomes">
              <i class="icon-base ri ri-arrow-up-circle-line icon-22px me-3"></i>
              <span>Pemasukan</span>
            </a>
          </li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/expenses">
              <i class="icon-base ri ri-arrow-down-circle-line icon-22px me-3"></i>
              <span>Pengeluaran</span>
            </a>
          </li>
          <li>
            <div class="dropdown-divider my-1 mx-n2"></div>
          </li>
          <li>
            <a class="dropdown-item" href="<%= request.getContextPath() %>/logout">
              <i class="icon-base ri ri-logout-box-r-line icon-22px me-3"></i>
              <span>Keluar</span>
            </a>
          </li>
        </ul>
      </li>
      <!--/ User -->
    </ul>
  </div>
</nav>
