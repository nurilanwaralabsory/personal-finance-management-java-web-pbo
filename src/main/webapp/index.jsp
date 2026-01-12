<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance Manager - Kelola Keuanganmu</title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <!-- Icons -->
    <link rel="stylesheet" href="templates/assets/vendor/fonts/iconify-icons.css" />
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="templates/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="templates/assets/css/demo.css" />
    
    <style>
        /* Custom Landing Page Styles */
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
        }
        
        /* Navbar */
        .navbar {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.95) !important;
        }
        
        /* Hero Section */
        .hero-section {
            padding: 120px 0 100px;
            background: linear-gradient(135deg, #666cff 0%, #a3a7ff 100%);
            color: white;
            border-radius: 0 0 50px 50px;
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
        }
        .hero-bg-pattern {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.1;
            background-image: radial-gradient(#ffffff 2px, transparent 2px);
            background-size: 30px 30px;
        }
        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }
        .hero-subtitle {
            font-size: 1.25rem;
            opacity: 0.95;
            margin-bottom: 2.5rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 300;
        }
        
        /* Team Section */
        .team-card {
            transition: all 0.3s ease;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border-radius: 16px;
            background: white;
            overflow: hidden;
        }
        .team-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(102, 108, 255, 0.15);
        }
        .avatar-wrapper {
            padding: 2rem 0;
            background: #f8f9fa;
            margin-bottom: 1rem;
        }
        .avatar-placeholder {
            width: 100px;
            height: 100px;
            background-color: white;
            color: #666cff;
            border-radius: 50%;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        
        /* Feature Cards */
        .feature-card {
            border: 1px solid rgba(0,0,0,0.05);
            transition: 0.3s;
        }
        .feature-card:hover {
            border-color: #666cff;
        }
        .feature-icon-box {
            width: 60px;
            height: 60px;
            background: rgba(102, 108, 255, 0.1);
            color: #666cff;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.75rem;
            margin: 0 auto 1.5rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary d-flex align-items-center gap-2" href="#">
                <i class="ri-wallet-3-fill icon-24px"></i>
                <span>FinanceApp</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link fw-medium" href="#home">Home</a></li>
                    <li class="nav-item"><a class="nav-link fw-medium" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link fw-medium" href="#team">Team</a></li>
                </ul>
                <div class="d-flex gap-2">
                    <a href="login.jsp" class="btn btn-outline-primary px-4">Masuk</a>
                    <a href="register.jsp" class="btn btn-primary px-4">Daftar</a>
                </div>
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
            
            <!-- Dashboard Preview Image Placeholder -->
            <div class="mt-5 pt-4 d-none d-lg-block">
                <div class="bg-white p-3 rounded-top-4 shadow-lg mx-auto" style="max-width: 900px; opacity: 0.9;">
                    <div class="bg-light rounded-top-3" style="height: 300px; display: flex; align-items: center; justify-content: center; color: #adb5bd;">
                        <div class="text-center">
                            <i class="ri-dashboard-line" style="font-size: 4rem;"></i>
                            <p class="mt-2">Dashboard Preview</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="py-5">
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
                                <i class="ri-money-dollar-circle-line"></i>
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
                                <i class="ri-pie-chart-2-line"></i>
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
                                <i class="ri-shield-keyhole-line"></i>
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
    <section id="team" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-label-primary rounded-pill mb-2">OUR TEAM</span>
                <h2 class="fw-bold display-6">Tim Pengembang</h2>
                <p class="text-muted">Inovator di balik Finance Manager</p>
            </div>
            
            <div class="row g-4">
                <!-- 6 Developer Placeholders -->
                <% for(int i=1; i<=6; i++) { %>
                <div class="col-md-4 col-lg-4">
                    <div class="card team-card text-center">
                        <div class="avatar-wrapper">
                            <div class="avatar-placeholder">
                                <i class="ri-user-smile-line"></i>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <h5 class="card-title fw-bold mb-1">Developer <%= i %></h5>
                            <span class="badge bg-label-secondary rounded-pill mb-3">Full Stack Engineer</span>
                            <p class="card-text text-muted small">Ahli dalam membangun sistem yang skalabel dan user-friendly.</p>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="ri-github-line"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="ri-linkedin-fill"></i></a>
                                <a href="#" class="btn btn-icon btn-sm btn-outline-primary rounded-pill"><i class="ri-twitter-x-line"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-white py-5 mt-5 border-top">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-4">
                    <h5 class="fw-bold text-primary mb-3">Finance Manager</h5>
                    <p class="text-muted">Membantu Anda mencapai tujuan finansial, satu langkah demi satu langkah.</p>
                </div>
                <div class="col-lg-2 col-6">
                    <h6 class="fw-bold mb-3">Links</h6>
                    <ul class="list-unstyled text-muted">
                        <li class="mb-2"><a href="#home" class="text-decoration-none text-muted">Home</a></li>
                        <li class="mb-2"><a href="#about" class="text-decoration-none text-muted">About</a></li>
                        <li class="mb-2"><a href="#team" class="text-decoration-none text-muted">Team</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-6">
                    <h6 class="fw-bold mb-3">Legal</h6>
                    <ul class="list-unstyled text-muted">
                        <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Privacy Policy</a></li>
                        <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Terms of Service</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h6 class="fw-bold mb-3">Newsletter</h6>
                    <form class="d-flex gap-2">
                        <input type="email" class="form-control" placeholder="Email Anda">
                        <button class="btn btn-primary">Subscribe</button>
                    </form>
                </div>
            </div>
            <hr class="my-4">
            <div class="text-center text-muted small">
                &copy; 2026 Personal Finance Management. Created with <i class="ri-heart-fill text-danger"></i> by Our Team.
            </div>
        </div>
    </footer>

    <!-- Core Scripts -->
    <script src="templates/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="templates/assets/vendor/libs/popper/popper.js"></script>
    <script src="templates/assets/vendor/js/bootstrap.js"></script>
    <script src="templates/assets/vendor/libs/node-waves/node-waves.js"></script>
</body>
</html>
