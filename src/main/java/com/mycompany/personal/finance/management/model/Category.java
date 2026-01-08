package com.mycompany.personal.finance.management.model;

public class Category {
    private int id;
    private String nama;
    private String tipe; // PEMASUKAN or PENGELUARAN

    public Category() {
    }

    public Category(int id, String nama, String tipe) {
        this.id = id;
        this.nama = nama;
        this.tipe = tipe;
    }

    public Category(String nama, String tipe) {
        this.nama = nama;
        this.tipe = tipe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getTipe() {
        return tipe;
    }

    public void setTipe(String tipe) {
        this.tipe = tipe;
    }
}
