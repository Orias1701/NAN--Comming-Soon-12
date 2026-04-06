package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

// import controller.PhongController;

public class KiemTraPhong {
    private int maKiemTraPhong;
    private int maHoaDon;
    private int maPhong;
    private Timestamp ngayThanhToan;
    private BigDecimal tienBoiThuong;

    private String soPhong;

    public String getSoPhong() {
        return soPhong;
    }

    public void setSoPhong(String so) {
        this.soPhong = so;
    }

    // Constructor mặc định
    public KiemTraPhong() {
    }

    // Constructor đầy đủ
    public KiemTraPhong(int maKiemTraPhong, int maHoaDon, int maPhong, Timestamp ngayThanhToan,
            BigDecimal tienBoiThuong) {
        this.maKiemTraPhong = maKiemTraPhong;
        this.maHoaDon = maHoaDon;
        this.maPhong = maPhong;
        this.ngayThanhToan = ngayThanhToan;
        this.tienBoiThuong = tienBoiThuong;
    }

    // Getter / Setter
    public int getMaKiemTraPhong() {
        return maKiemTraPhong;
    }

    public void setMaKiemTraPhong(int maKiemTraPhong) {
        this.maKiemTraPhong = maKiemTraPhong;
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(int maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public int getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(int maPhong) {
        this.maPhong = maPhong;
    }

    public Timestamp getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(Timestamp ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }

    public BigDecimal getTienBoiThuong() {
        return tienBoiThuong;
    }

    public void setTienBoiThuong(BigDecimal tienBoiThuong) {
        this.tienBoiThuong = tienBoiThuong;
    }
}
