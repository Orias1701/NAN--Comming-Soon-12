package model;

import java.math.BigDecimal;

public class LoaiPhong {
    private int maLoaiPhong;
    private String tenLoaiPhong;
    private BigDecimal giaCoBan; // ✅ Đã sửa: double -> BigDecimal

    public LoaiPhong() {}

    // ✅ Đã sửa: double -> BigDecimal trong constructor
    public LoaiPhong(int id, String ten, BigDecimal gia) {
        this.maLoaiPhong = id;
        this.tenLoaiPhong = ten;
        this.giaCoBan = gia;
    }

    public int getMaLoaiPhong() { return maLoaiPhong; }
    public void setMaLoaiPhong(int id) { this.maLoaiPhong = id; }

    public String getTenLoaiPhong() { return tenLoaiPhong; }
    public void setTenLoaiPhong(String ten) { this.tenLoaiPhong = ten; }

    // ✅ Đã sửa: Getter trả về BigDecimal
    public BigDecimal getGiaCoBan() { return giaCoBan; }
    
    // ✅ Đã sửa: Setter nhận vào BigDecimal
    public void setGiaCoBan(BigDecimal gia) { this.giaCoBan = gia; }

    @Override
    public String toString() {
        return tenLoaiPhong;
    }
}