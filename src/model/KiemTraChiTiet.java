package model;

import java.util.Date;

public class KiemTraChiTiet {

    private int maKiemTraChiTiet;
    private int maNhanVien;
    private int maKiemTraPhong;
    private int maThietBiPhong;
    private Date ngayKiemTra;
    private int soLuongBiHong;
    private String ghiChu;

    private String tenPhong;
    private String tenThietBi;

    public String getTenPhong() { return tenPhong; }
    public String getTenThietBi() { return tenThietBi; }
    public void setTenPhong(String ten) { this.tenPhong = ten; }
    public void setTenThietBi(String ten) { this.tenThietBi = ten; }

    public KiemTraChiTiet() {}

    public KiemTraChiTiet(int maKiemTraChiTiet, int maNhanVien, int maKiemTraPhong, int maThietBiPhong,
                          Date ngayKiemTra, int soLuongBiHong, String ghiChu) {
        this.maKiemTraChiTiet = maKiemTraChiTiet;
        this.maNhanVien = maNhanVien;
        this.maKiemTraPhong = maKiemTraPhong;
        this.maThietBiPhong = maThietBiPhong;
        this.ngayKiemTra = ngayKiemTra;
        this.soLuongBiHong = soLuongBiHong;
        this.ghiChu = ghiChu;
    }

    // GETTERS
    public int getMaKiemTraChiTiet() { return maKiemTraChiTiet; }
    public int getMaNhanVien() { return maNhanVien; }
    public int getMaKiemTraPhong() { return maKiemTraPhong; }
    public int getMaThietBiPhong() { return maThietBiPhong; }
    public Date getNgayKiemTra() { return ngayKiemTra; }
    public int getSoLuongBiHong() { return soLuongBiHong; }
    public String getGhiChu() { return ghiChu; }

    // SETTERS
    public void setMaKiemTraChiTiet(int maKiemTraChiTiet) { this.maKiemTraChiTiet = maKiemTraChiTiet; }
    public void setMaNhanVien(int maNhanVien) { this.maNhanVien = maNhanVien; }
    public void setMaKiemTraPhong(int maKiemTraPhong) { this.maKiemTraPhong = maKiemTraPhong; }
    public void setMaThietBiPhong(int maThietBiPhong) { this.maThietBiPhong = maThietBiPhong; }
    public void setNgayKiemTra(Date ngayKiemTra) { this.ngayKiemTra = ngayKiemTra; }
    public void setSoLuongBiHong(int soLuongBiHong) { this.soLuongBiHong = soLuongBiHong; }
    public void setGhiChu(String ghiChu) { this.ghiChu = ghiChu; }
}
