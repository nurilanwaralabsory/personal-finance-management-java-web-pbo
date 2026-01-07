-- =====================================================
-- SQL Script untuk membuat tabel Users
-- Database: PostgreSQL
-- Database Name: db_personal_finance_management
-- =====================================================

-- Buat tabel users jika belum ada
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tambahkan index untuk optimasi pencarian
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Komentar tabel
COMMENT ON TABLE users IS 'Tabel untuk menyimpan data pengguna aplikasi';
COMMENT ON COLUMN users.id IS 'ID unik pengguna (auto increment)';
COMMENT ON COLUMN users.username IS 'Username untuk login (unik)';
COMMENT ON COLUMN users.email IS 'Email pengguna (unik)';
COMMENT ON COLUMN users.password IS 'Password pengguna (hashed)';
COMMENT ON COLUMN users.created_at IS 'Waktu pembuatan akun';

-- =====================================================
-- Contoh Insert Data (Opsional - untuk testing)
-- Password: 123456
-- =====================================================
-- INSERT INTO users (username, email, password) 
-- VALUES ('admin', 'admin@example.com', '123456');
