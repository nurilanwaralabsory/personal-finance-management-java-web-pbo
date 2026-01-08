-- Tabel untuk menyimpan data budgets/anggaran
CREATE TABLE budgets (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    period VARCHAR(20) NOT NULL, -- 'MONTHLY', 'WEEKLY', 'YEARLY'
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    spent DECIMAL(15, 2) DEFAULT 0.00,
    alert_threshold INTEGER DEFAULT 80, -- Persentase untuk alert (default 80%)
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Index untuk performa query
CREATE INDEX idx_budgets_user_id ON budgets(user_id);
CREATE INDEX idx_budgets_category_id ON budgets(category_id);
CREATE INDEX idx_budgets_period ON budgets(period);
CREATE INDEX idx_budgets_dates ON budgets(start_date, end_date);

-- Trigger untuk update updated_at
CREATE OR REPLACE FUNCTION update_budgets_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_budgets_updated_at
    BEFORE UPDATE ON budgets
    FOR EACH ROW
    EXECUTE FUNCTION update_budgets_updated_at();

-- Contoh data untuk testing
-- INSERT INTO budgets (user_id, category_id, amount, period, start_date, end_date) 
-- VALUES 
-- (1, 1, 1000000.00, 'MONTHLY', '2026-01-01', '2026-01-31'),
-- (1, 2, 500000.00, 'MONTHLY', '2026-01-01', '2026-01-31');
