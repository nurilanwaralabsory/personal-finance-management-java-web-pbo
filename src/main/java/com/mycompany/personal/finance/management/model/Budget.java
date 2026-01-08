package com.mycompany.personal.finance.management.model;

import java.math.BigDecimal;
import java.sql.Date;

public class Budget {
    private int id;
    private BigDecimal jumlah;
    private int kategoriId;
    private String kategoriNama;
    private Date bulan;

    public Budget() {
    }

    public Budget(int id, BigDecimal jumlah, int kategoriId, String kategoriNama, Date bulan) {
        this.id = id;
        this.jumlah = jumlah;
        this.kategoriId = kategoriId;
        this.kategoriNama = kategoriNama;
        this.bulan = bulan;
    }

    public Budget(BigDecimal jumlah, int kategoriId, Date bulan) {
        this.jumlah = jumlah;
        this.kategoriId = kategoriId;
        this.bulan = bulan;
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

    public Date getBulan() {
        return bulan;
    }

    public void setBulan(Date bulan) {
        this.bulan = bulan;
    }
}
