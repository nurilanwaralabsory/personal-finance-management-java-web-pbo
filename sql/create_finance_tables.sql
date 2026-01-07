-- =====================================================
-- SQL Script untuk membuat tabel Kategori, Pemasukan, dan Pengeluaran
-- Database: PostgreSQL
-- Database Name: db_personal_finance_management
-- =====================================================

-- =====================================================
-- Tabel Kategori
-- =====================================================
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('income', 'expense')),
    description TEXT,
    icon VARCHAR(50) DEFAULT 'ri-folder-line',
    color VARCHAR(20) DEFAULT '#7367f0',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, name, type)
);

-- Index untuk kategori
CREATE INDEX IF NOT EXISTS idx_categories_user_id ON categories(user_id);
CREATE INDEX IF NOT EXISTS idx_categories_type ON categories(type);

-- Komentar tabel kategori
COMMENT ON TABLE categories IS 'Tabel untuk menyimpan kategori pemasukan dan pengeluaran';
COMMENT ON COLUMN categories.id IS 'ID unik kategori (auto increment)';
COMMENT ON COLUMN categories.user_id IS 'ID pengguna pemilik kategori';
COMMENT ON COLUMN categories.name IS 'Nama kategori';
COMMENT ON COLUMN categories.type IS 'Tipe kategori: income (pemasukan) atau expense (pengeluaran)';
COMMENT ON COLUMN categories.description IS 'Deskripsi kategori';
COMMENT ON COLUMN categories.icon IS 'Icon kategori (class icon)';
COMMENT ON COLUMN categories.color IS 'Warna kategori (hex)';

-- =====================================================
-- Tabel Pemasukan (Income)
-- =====================================================
CREATE TABLE IF NOT EXISTS incomes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
    description TEXT,
    source VARCHAR(255),
    income_date DATE NOT NULL DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index untuk pemasukan
CREATE INDEX IF NOT EXISTS idx_incomes_user_id ON incomes(user_id);
CREATE INDEX IF NOT EXISTS idx_incomes_category_id ON incomes(category_id);
CREATE INDEX IF NOT EXISTS idx_incomes_income_date ON incomes(income_date);

-- Komentar tabel pemasukan
COMMENT ON TABLE incomes IS 'Tabel untuk menyimpan data pemasukan pengguna';
COMMENT ON COLUMN incomes.id IS 'ID unik pemasukan (auto increment)';
COMMENT ON COLUMN incomes.user_id IS 'ID pengguna pemilik pemasukan';
COMMENT ON COLUMN incomes.category_id IS 'ID kategori pemasukan';
COMMENT ON COLUMN incomes.amount IS 'Jumlah pemasukan';
COMMENT ON COLUMN incomes.description IS 'Deskripsi pemasukan';
COMMENT ON COLUMN incomes.source IS 'Sumber pemasukan';
COMMENT ON COLUMN incomes.income_date IS 'Tanggal pemasukan';

-- =====================================================
-- Tabel Pengeluaran (Expense)
-- =====================================================
CREATE TABLE IF NOT EXISTS expenses (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
    description TEXT,
    recipient VARCHAR(255),
    expense_date DATE NOT NULL DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index untuk pengeluaran
CREATE INDEX IF NOT EXISTS idx_expenses_user_id ON expenses(user_id);
CREATE INDEX IF NOT EXISTS idx_expenses_category_id ON expenses(category_id);
CREATE INDEX IF NOT EXISTS idx_expenses_expense_date ON expenses(expense_date);

-- Komentar tabel pengeluaran
COMMENT ON TABLE expenses IS 'Tabel untuk menyimpan data pengeluaran pengguna';
COMMENT ON COLUMN expenses.id IS 'ID unik pengeluaran (auto increment)';
COMMENT ON COLUMN expenses.user_id IS 'ID pengguna pemilik pengeluaran';
COMMENT ON COLUMN expenses.category_id IS 'ID kategori pengeluaran';
COMMENT ON COLUMN expenses.amount IS 'Jumlah pengeluaran';
COMMENT ON COLUMN expenses.description IS 'Deskripsi pengeluaran';
COMMENT ON COLUMN expenses.recipient IS 'Penerima/tujuan pengeluaran';
COMMENT ON COLUMN expenses.expense_date IS 'Tanggal pengeluaran';

-- =====================================================
-- Insert Default Categories untuk User Baru
-- Catatan: Jalankan ini untuk setiap user baru atau 
-- gunakan trigger untuk otomatis insert
-- =====================================================

-- Fungsi untuk membuat kategori default untuk user baru
CREATE OR REPLACE FUNCTION create_default_categories()
RETURNS TRIGGER AS $$
BEGIN
    -- Kategori Pemasukan Default
    INSERT INTO categories (user_id, name, type, description, icon, color) VALUES
    (NEW.id, 'Gaji', 'income', 'Pendapatan dari gaji bulanan', 'ri-money-dollar-circle-line', '#28c76f'),
    (NEW.id, 'Bonus', 'income', 'Pendapatan dari bonus kerja', 'ri-gift-line', '#00cfe8'),
    (NEW.id, 'Investasi', 'income', 'Pendapatan dari investasi', 'ri-stock-line', '#7367f0'),
    (NEW.id, 'Freelance', 'income', 'Pendapatan dari pekerjaan freelance', 'ri-computer-line', '#ff9f43'),
    (NEW.id, 'Lainnya', 'income', 'Pendapatan lainnya', 'ri-more-line', '#82868b');
    
    -- Kategori Pengeluaran Default
    INSERT INTO categories (user_id, name, type, description, icon, color) VALUES
    (NEW.id, 'Makanan & Minuman', 'expense', 'Pengeluaran untuk makan dan minum', 'ri-restaurant-line', '#ea5455'),
    (NEW.id, 'Transportasi', 'expense', 'Pengeluaran untuk transportasi', 'ri-car-line', '#ff9f43'),
    (NEW.id, 'Belanja', 'expense', 'Pengeluaran untuk belanja', 'ri-shopping-cart-line', '#00cfe8'),
    (NEW.id, 'Tagihan', 'expense', 'Pengeluaran untuk tagihan bulanan', 'ri-file-list-line', '#7367f0'),
    (NEW.id, 'Hiburan', 'expense', 'Pengeluaran untuk hiburan', 'ri-gamepad-line', '#28c76f'),
    (NEW.id, 'Kesehatan', 'expense', 'Pengeluaran untuk kesehatan', 'ri-heart-pulse-line', '#ea5455'),
    (NEW.id, 'Pendidikan', 'expense', 'Pengeluaran untuk pendidikan', 'ri-book-open-line', '#7367f0'),
    (NEW.id, 'Lainnya', 'expense', 'Pengeluaran lainnya', 'ri-more-line', '#82868b');
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger untuk otomatis membuat kategori default saat user baru register
DROP TRIGGER IF EXISTS trigger_create_default_categories ON users;
CREATE TRIGGER trigger_create_default_categories
    AFTER INSERT ON users
    FOR EACH ROW
    EXECUTE FUNCTION create_default_categories();

-- =====================================================
-- Insert kategori default untuk user yang sudah ada
-- =====================================================
DO $$
DECLARE
    user_record RECORD;
BEGIN
    FOR user_record IN SELECT id FROM users LOOP
        -- Cek apakah user sudah punya kategori
        IF NOT EXISTS (SELECT 1 FROM categories WHERE user_id = user_record.id) THEN
            -- Kategori Pemasukan Default
            INSERT INTO categories (user_id, name, type, description, icon, color) VALUES
            (user_record.id, 'Gaji', 'income', 'Pendapatan dari gaji bulanan', 'ri-money-dollar-circle-line', '#28c76f'),
            (user_record.id, 'Bonus', 'income', 'Pendapatan dari bonus kerja', 'ri-gift-line', '#00cfe8'),
            (user_record.id, 'Investasi', 'income', 'Pendapatan dari investasi', 'ri-stock-line', '#7367f0'),
            (user_record.id, 'Freelance', 'income', 'Pendapatan dari pekerjaan freelance', 'ri-computer-line', '#ff9f43'),
            (user_record.id, 'Lainnya', 'income', 'Pendapatan lainnya', 'ri-more-line', '#82868b');
            
            -- Kategori Pengeluaran Default
            INSERT INTO categories (user_id, name, type, description, icon, color) VALUES
            (user_record.id, 'Makanan & Minuman', 'expense', 'Pengeluaran untuk makan dan minum', 'ri-restaurant-line', '#ea5455'),
            (user_record.id, 'Transportasi', 'expense', 'Pengeluaran untuk transportasi', 'ri-car-line', '#ff9f43'),
            (user_record.id, 'Belanja', 'expense', 'Pengeluaran untuk belanja', 'ri-shopping-cart-line', '#00cfe8'),
            (user_record.id, 'Tagihan', 'expense', 'Pengeluaran untuk tagihan bulanan', 'ri-file-list-line', '#7367f0'),
            (user_record.id, 'Hiburan', 'expense', 'Pengeluaran untuk hiburan', 'ri-gamepad-line', '#28c76f'),
            (user_record.id, 'Kesehatan', 'expense', 'Pengeluaran untuk kesehatan', 'ri-heart-pulse-line', '#ea5455'),
            (user_record.id, 'Pendidikan', 'expense', 'Pengeluaran untuk pendidikan', 'ri-book-open-line', '#7367f0'),
            (user_record.id, 'Lainnya', 'expense', 'Pengeluaran lainnya', 'ri-more-line', '#82868b');
        END IF;
    END LOOP;
END $$;
