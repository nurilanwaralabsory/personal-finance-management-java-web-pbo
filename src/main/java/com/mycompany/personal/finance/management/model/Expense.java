package com.mycompany.personal.finance.management.model;

import java.math.BigDecimal;
import java.sql.Date;

public class Expense {
    private int id;
    private BigDecimal jumlah;
    private Date tanggal;
    private String deskripsi;
    private int kategoriId;
    private String kategoriNama; // For display

    public Expense() {
    }

    public Expense(int id, BigDecimal jumlah, Date tanggal, String deskripsi, int kategoriId, String kategoriNama) {
        this.id = id;
        this.jumlah = jumlah;
        this.tanggal = tanggal;
        this.deskripsi = deskripsi;
        this.kategoriId = kategoriId;
        this.kategoriNama = kategoriNama;
    }

    public Expense(BigDecimal jumlah, Date tanggal, String deskripsi, int kategoriId) {
        this.jumlah = jumlah;
        this.tanggal = tanggal;
        this.deskripsi = deskripsi;
        this.kategoriId = kategoriId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BigDecimal getJumlah() {
        return jumlah;
    }

    public void setJumlah(BigDecimal jumlah) {
        this.jumlah = jumlah;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public int getKategoriId() {
        return kategoriId;
    }

    public void setKategoriId(int kategoriId) {
        this.kategoriId = kategoriId;
    }

    public String getKategoriNama() {
        return kategoriNama;
    }

    public void setKategoriNama(String kategoriNama) {
        this.kategoriNama = kategoriNama;
    }
}
