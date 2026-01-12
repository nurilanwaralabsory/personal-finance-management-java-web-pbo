<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="assets/img/favicon/favicon.ico" type="image/x-icon">
    <title>FinanceApp - Kelola Keuanganmu</title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <!-- Icons -->
    <link rel="stylesheet" href="assets/vendor/fonts/iconify-icons.css" />
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" />
    <link rel="stylesheet" href="assets/css/demo.css" />
    
    <link rel="stylesheet" href="assets/css/landing-page.css?v=1.0" />
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary d-flex align-items-center gap-2" href="#">
                <img src="assets/img/branding/logo.png" alt="Logo" class="img-fluid" style="width: 50px; height: 25px; object-fit: cover;">
                <span>FinanceApp</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link mx-2" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" href="#gallery">Gallery</a>
                    </li>
                    <li class="nav-item ms-3">
                        <a class="btn btn-outline-primary rounded-pill px-4" href="login.jsp">Masuk</a>
                    </li>
                    <li class="nav-item ms-2">
                        <a class="btn btn-primary rounded-pill px-4" href="register.jsp">Daftar</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero-section text-center">
        <div class="hero-bg-pattern"></div>
        <div class="container position-relative">
            <h1 class="hero-title">Kelola Keuangan,<br>Wujudkan Impian</h1>
            <p class="hero-subtitle">Platform all-in-one untuk mencatat pemasukan, melacak pengeluaran, dan merencanakan anggaran masa depan Anda dengan cerdas dan efisien.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="register.jsp" class="btn btn-light btn-lg text-primary fw-bold px-5 py-3 shadow-lg">Mulai Sekarang</a>
                <a href="#about" class="btn btn-outline-light btn-lg fw-semibold px-5 py-3">Pelajari Lebih Lanjut</a>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-label-primary rounded-pill mb-2">FEATURES</span>
                <h2 class="fw-bold display-6">Mengapa Memilih Kami?</h2>
                <p class="text-muted text-center mx-auto" style="max-width: 600px;">
                    Kami menyediakan fitur lengkap untuk membantu Anda mencapai kebebasan finansial.
                </p>
            </div>
            
            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="card h-100 p-4 feature-card shadow-sm rounded-4">
                        <div class="card-body">
                            <div class="feature-icon-box">
                                <i class="bi bi-card-list"></i>
                            </div>
                            <h4 class="mb-3">Pencatatan Mudah</h4>
                            <p class="text-muted">Cata setiap transaksi masuk dan keluar dalam hitungan detik. Antarmuka yang intuitif membuat pembukuan jadi menyenangkan.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 p-4 feature-card shadow-sm rounded-4">
                        <div class="card-body">
                            <div class="feature-icon-box">
                                <i class="bi bi-pie-chart"></i>
                            </div>
                            <h4 class="mb-3">Analisis Visual</h4>
                            <p class="text-muted">Pahami kebiasaan belanja Anda dengan grafik interaktif. Lihat kemana uang Anda pergi setiap bulannya.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 p-4 feature-card shadow-sm rounded-4">
                        <div class="card-body">
                            <div class="feature-icon-box">
                                <i class="bi bi-cash-stack"></i>
                            </div>
                            <h4 class="mb-3">Anggaran Pintar</h4>
                            <p class="text-muted">Tetapkan batas belanja untuk setiap kategori. Kami akan mengingatkan Anda jika sudah mendekati batas anggaran.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section id="gallery" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-label-primary rounded-pill mb-2">OUR GALLERY</span>
                <h2 class="fw-bold display-6">Tim Pengembang</h2>
            </div>
            
            <div class="row g-4 py-5">
                <!-- 6 Developer Placeholders -->
                <!-- Developer 1 -->
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <img src="assets/img/team/daffa.jpg" alt="Developer 1" class="">
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Daffa</h5>
                            <p class="card-text text-muted small">Ahli dalam membangun sistem yang skalabel dan user-friendly.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-github"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-twitter-x"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Developer 2 -->
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <img src="assets/img/team/mutia.jpeg" alt="Developer 1" class="">
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Mutia</h5>
                            <p class="card-text text-muted small">Fokus pada keamanan data dan optimasi performa server.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-github"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-twitter-x"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Developer 3 -->
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <img src="assets/img/team/nuril.jpeg" alt="Developer 1" class="">
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Nuril</h5>
                            <p class="card-text text-muted small">Menciptakan antarmuka pengguna yang intuitif dan responsif.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-github"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-twitter-x"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Developer 4 -->
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <i class="bi bi-person-circle"></i>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Developer 4</h5>
                            <p class="card-text text-muted small">Merancang pengalaman pengguna yang menyenangkan.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-github"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-twitter-x"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Developer 5 -->
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <i class="bi bi-person-circle"></i>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Developer 5</h5>
                            <p class="card-text text-muted small">Menjaga infrastruktur dan deployment berjalan lancar.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-github"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-twitter-x"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Developer 6 -->
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <i class="bi bi-person-circle"></i>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Developer 6</h5>
                            <p class="card-text text-muted small">Memastikan proyek selesai tepat waktu dan sesuai target.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-github"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="bi bi-twitter-x"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-white py-5 mt-5 border-top">
        <div class="container">
            <div class="text-center text-muted small">
                &copy; 2026 Personal Finance Management. All rights reserved.
            </div>
        </div>
    </footer>

    <!-- Core Scripts -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/node-waves/node-waves.js"></script>
</body>
</html>
