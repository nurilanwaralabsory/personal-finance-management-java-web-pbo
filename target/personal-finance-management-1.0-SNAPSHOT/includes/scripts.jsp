<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- Core JS -->

    <!-- build:js assets/vendor/js/theme.js  -->

    <script src="assets/vendor/libs/jquery/jquery.js"></script>

    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/node-waves/node-waves.js"></script>

    <script src="assets/vendor/libs/@algolia/autocomplete-js.js"></script>

    <script src="assets/vendor/libs/pickr/pickr.js"></script>

    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/libs/hammer/hammer.js"></script>

    <script src="assets/vendor/libs/i18n/i18n.js"></script>

    <script src="assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="assets/vendor/libs/swiper/swiper.js"></script>

    <!-- Main JS -->

    <script src="assets/js/main.js"></script>

    <script>
      // Active Menu Handler
      document.addEventListener("DOMContentLoaded", function() {
        const currentPath = window.location.pathname.split("/").pop();
        const fullPath = window.location.href;
        
        // Find matching menu item
        const menuItems = document.querySelectorAll('.menu-item a');
        
        menuItems.forEach(link => {
            const href = link.getAttribute('href');
            if (href === currentPath || (currentPath === '' && href === 'index.jsp')) {
                // Add active class to direct parent
                link.parentElement.classList.add('active');
                
                // If it's a submenu, also expand the parent menu
                const parentItem = link.closest('.menu-sub')?.parentElement;
                if (parentItem) {
                    parentItem.classList.add('active', 'open');
                }
            }
        });
      });
    </script>
