## PANDUAN DEBUGGING - Fitur Tambah Budget

### Masalah: Halaman tambah budget tidak tampil

### Perbaikan yang telah dilakukan:

1. ✅ **Error handling yang lebih baik** di `showNewForm()` dan `showEditForm()`
2. ✅ **Logging untuk debugging** - System.out.println di berbagai titik
3. ✅ **Info message** jika tidak ada kategori expense
4. ✅ **Disable submit button** jika tidak ada kategori
5. ✅ **Link ke halaman kategori** dari info message
6. ✅ **Try-catch global** di doGet() method

### Langkah-langkah untuk test:

#### 1. Compile dan Deploy

```bash
cd d:\kuliah\pemrograman_berorientasi_object\praktikum\javaweb\personal-finance-management
mvn clean package
```

Kemudian deploy file WAR ke Tomcat atau restart server.

#### 2. Pastikan Login Berhasil

-    Buka browser: `http://localhost:8080/personal-finance-management/login`
-    Login dengan kredensial yang valid
-    Pastikan redirect ke dashboard berhasil

#### 3. Buat Kategori Expense (Jika Belum Ada)

-    Menu: **Keuangan > Kategori**
-    Klik **"Tambah Kategori"**
-    Isi form:
     -    **Nama**: Makanan
     -    **Tipe**: Expense
     -    **Deskripsi**: Pengeluaran untuk makanan
     -    **Icon**: ri-restaurant-line
     -    **Warna**: #FF6B6B
-    Simpan

#### 4. Akses Halaman Budgets

-    Menu: **Keuangan > Budgets**
-    URL: `http://localhost:8080/personal-finance-management/budgets`
-    Halaman daftar budget harus tampil

#### 5. Klik Tombol "Tambah Budget"

-    Klik tombol **"Tambah Budget"** (tombol biru di kanan atas)
-    Atau akses langsung: `http://localhost:8080/personal-finance-management/budgets?action=new`

#### 6. Halaman Form Harus Tampil

Form budget harus muncul dengan:

-    Dropdown kategori berisi kategori expense yang sudah dibuat
-    Field jumlah budget
-    Dropdown periode (Monthly, Weekly, Yearly)
-    Date picker untuk tanggal mulai dan selesai
-    Slider alert threshold
-    Toggle aktif/nonaktif

### Cek Log Server

Setelah klik "Tambah Budget", cek log server Anda. Seharusnya muncul:

```
BudgetServlet doGet - action: new, userId: 1
BudgetServlet: Calling showNewForm
BudgetServlet showNewForm: userId=1
BudgetServlet showNewForm: Found 3 expense categories
BudgetServlet showNewForm: Forwarding to /budget-form.jsp
```

### Jika Masih Error:

#### A. Cek Console/Log untuk Error Messages

Lihat log server untuk pesan error seperti:

-    `NullPointerException`
-    `ServletException`
-    `SQLException`

#### B. Cek Session

Tambahkan di browser console:

```javascript
// Di halaman budgets.jsp
console.log('<%= session.getAttribute("userId") %>');
```

#### C. Cek Database Connection

Pastikan:

-    PostgreSQL berjalan
-    Database sudah dibuat
-    Tabel categories dan budgets sudah ada
-    User memiliki permission yang benar

#### D. Cek Path JSP

Pastikan file ada di:

```
src/main/webapp/budget-form.jsp
```

#### E. Test URL Langsung

Coba akses URL langsung di browser:

```
http://localhost:8080/personal-finance-management/budgets?action=new
```

Lihat response:

-    **200 OK**: Form berhasil dimuat
-    **302 Redirect**: Ada redirect (cek ke mana)
-    **404 Not Found**: Path atau servlet tidak ditemukan
-    **500 Internal Error**: Ada error di server (cek log)

#### F. Cek web.xml

Pastikan BudgetServlet terdaftar:

```xml
<servlet>
    <servlet-name>BudgetServlet</servlet-name>
    <servlet-class>controller.BudgetServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>BudgetServlet</servlet-name>
    <url-pattern>/budgets</url-pattern>
</servlet-mapping>
```

#### G. Clear Cache

-    Clear browser cache
-    Restart server Tomcat
-    Rebuild project

### Troubleshooting Spesifik

#### Masalah: "Anda belum memiliki kategori expense"

**Solusi**: Buat kategori dengan type="expense" terlebih dahulu di menu Kategori.

#### Masalah: Redirect ke login terus

**Solusi**:

1. Cek session tidak null
2. Pastikan login berhasil
3. Cek AuthFilter tidak memblokir URL

#### Masalah: Tombol submit disabled

**Solusi**: Ini normal jika tidak ada kategori. Buat kategori expense dulu.

#### Masalah: Error 404

**Solusi**:

1. Cek URL pattern di web.xml
2. Cek file budget-form.jsp ada di webapp/
3. Restart server

#### Masalah: Error 500

**Solusi**:

1. Cek log server untuk stacktrace
2. Cek database connection
3. Cek semua DAO class tidak null

### Kontak Support

Jika masih ada masalah, screenshot:

1. Error message di browser
2. Log server (stacktrace lengkap)
3. URL yang sedang diakses
4. Hasil dari query: `SELECT * FROM categories WHERE type='expense';`
