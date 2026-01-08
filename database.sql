-- Create Kategori Table
CREATE TABLE kategori (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tipe VARCHAR(20) CHECK (tipe IN ('PEMASUKAN', 'PENGELUARAN')) NOT NULL
);

-- Create Pemasukan Table
CREATE TABLE pemasukan (
    id SERIAL PRIMARY KEY,
    jumlah DECIMAL(15, 2) NOT NULL,
    tanggal DATE NOT NULL DEFAULT CURRENT_DATE,
    deskripsi TEXT,
    kategori_id INT REFERENCES kategori(id) ON DELETE SET NULL
);

-- Create Pengeluaran Table
CREATE TABLE pengeluaran (
    id SERIAL PRIMARY KEY,
    jumlah DECIMAL(15, 2) NOT NULL,
    tanggal DATE NOT NULL DEFAULT CURRENT_DATE,
    deskripsi TEXT,
    kategori_id INT REFERENCES kategori(id) ON DELETE SET NULL
);

-- Create Anggaran Table
CREATE TABLE anggaran (
    id SERIAL PRIMARY KEY,
    jumlah DECIMAL(15, 2) NOT NULL,
    kategori_id INT REFERENCES kategori(id) ON DELETE CASCADE,
    bulan DATE NOT NULL,
    UNIQUE (kategori_id, bulan)
);

-- SEED DATA --

-- Kategori
INSERT INTO kategori (nama, tipe) VALUES 
('Gaji', 'PEMASUKAN'),
('Bonus', 'PEMASUKAN'),
('Investasi', 'PEMASUKAN'),
('Makan & Minum', 'PENGELUARAN'),
('Transportasi', 'PENGELUARAN'),
('Hiburan', 'PENGELUARAN'),
('Tagihan', 'PENGELUARAN'),
('Belanja', 'PENGELUARAN'),
('Kesehatan', 'PENGELUARAN');

-- Pemasukan
INSERT INTO pemasukan (jumlah, tanggal, deskripsi, kategori_id) VALUES
(5000000, CURRENT_DATE - INTERVAL '10 days', 'Gaji Bulanan', 1),
(1000000, CURRENT_DATE - INTERVAL '5 days', 'Bonus Project', 2),
(250000, CURRENT_DATE - INTERVAL '2 days', 'Dividen Saham', 3);

-- Pengeluaran
INSERT INTO pengeluaran (jumlah, tanggal, deskripsi, kategori_id) VALUES
(25000, CURRENT_DATE, 'Makan Siang', 4),
(50000, CURRENT_DATE - INTERVAL '1 day', 'Bensin Motor', 5),
(150000, CURRENT_DATE - INTERVAL '2 days', 'Nonton Bioskop', 6),
(750000, CURRENT_DATE - INTERVAL '15 days', 'Bayar Listrik & Air', 7),
(300000, CURRENT_DATE - INTERVAL '3 days', 'Belanja Mingguan', 8);

-- Anggaran
INSERT INTO anggaran (jumlah, kategori_id, bulan) VALUES
(1500000, 4, DATE_TRUNC('month', CURRENT_DATE)), -- Budget Makan
(500000, 5, DATE_TRUNC('month', CURRENT_DATE)), -- Budget Transport
(1000000, 8, DATE_TRUNC('month', CURRENT_DATE)); -- Budget Belanja
