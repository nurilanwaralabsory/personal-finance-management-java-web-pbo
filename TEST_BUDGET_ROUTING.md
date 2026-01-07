# Test Budget Routing

## URL yang harus bisa diakses:

### 1. List Budgets

-    URL: `http://localhost:8080/personal-finance-management/budgets`
-    Method: GET
-    Action: Menampilkan daftar semua budget

### 2. Tambah Budget (NEW)

-    URL: `http://localhost:8080/personal-finance-management/budgets?action=new`
-    Method: GET
-    Action: Menampilkan form untuk membuat budget baru

### 3. Edit Budget

-    URL: `http://localhost:8080/personal-finance-management/budgets?action=edit&id=1`
-    Method: GET
-    Action: Menampilkan form edit budget dengan ID tertentu

### 4. Delete Budget

-    URL: `http://localhost:8080/personal-finance-management/budgets?action=delete&id=1`
-    Method: GET
-    Action: Menghapus budget dengan ID tertentu

### 5. Update Spent

-    URL: `http://localhost:8080/personal-finance-management/budgets?action=update-spent`
-    Method: GET
-    Action: Refresh data spent amount untuk semua budget

## Checklist untuk troubleshooting:

✅ BudgetServlet terdaftar di web.xml dengan URL pattern `/budgets`
✅ showNewForm() method sudah ada dan berfungsi
✅ Error handling ditambahkan untuk kasus tidak ada kategori
✅ Info message ditampilkan jika user belum punya kategori expense
✅ Form disable submit button jika tidak ada kategori
✅ Link ke halaman kategori disediakan dari info message

## Cara Test:

1. **Login terlebih dahulu** ke aplikasi
2. **Pastikan ada kategori expense** di menu Kategori
     - Jika belum ada, buat kategori dengan type "expense"
3. **Akses halaman budgets**: `http://localhost:8080/personal-finance-management/budgets`
4. **Klik tombol "Tambah Budget"** atau akses: `http://localhost:8080/personal-finance-management/budgets?action=new`
5. **Form budget harus muncul** dengan daftar kategori expense

## Jika masih tidak bisa:

1. Check log server untuk error messages
2. Pastikan sudah login (cek session)
3. Pastikan database terhubung dengan baik
4. Cek apakah ada kategori dengan type="expense" di database
5. Clear browser cache dan restart server
