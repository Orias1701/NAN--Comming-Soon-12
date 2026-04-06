package model;

public class NhanVien {

    private int maNhanVien;
    private String tenNhanVien;
    private String soDienThoai;
    private String email;

    public NhanVien() {}

    public NhanVien(int id, String ten, String sdt, String email) {
        this.maNhanVien = id;
        this.tenNhanVien = ten;
        this.soDienThoai = sdt;
        this.email = email;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(int maNhanVien) {
        this.maNhanVien = maNhanVien;
    }

    public String getTenNhanVien() {
        return tenNhanVien;
    }

    public void setTenNhanVien(String tenNhanVien) {
        this.tenNhanVien = tenNhanVien;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return tenNhanVien;
    }
}
