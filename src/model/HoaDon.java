package model;

import java.math.BigDecimal;
import java.sql.Timestamp; // Import BigDecimal
import java.util.ArrayList;
import java.util.List;

public class HoaDon {

    private int maHoaDon;
    private int maNhanVien;
    private int maKhachHang;
    private Timestamp ngayTao;
    private Timestamp ngayThanhToan;
    private BigDecimal tongTien; // Đổi từ double sang BigDecimal
    private String trangThai;

    private String tenKhachHang;
    private String tenNhanVien;
    private List<DatPhong> chiTiet = new ArrayList<>();

    public List<DatPhong> getChiTiet() { return chiTiet; }
    public void setChiTiet(List<DatPhong> list) { this.chiTiet = list; }

    public String getChiTietJson() {
        if (chiTiet == null || chiTiet.isEmpty()) return "[]";
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < chiTiet.size(); i++) {
            DatPhong dp = chiTiet.get(i);
            sb.append("{");
            sb.append("\"id\":").append(dp.getMaDatPhong()).append(",");
            sb.append("\"soPhong\":\"").append(dp.getSoPhong()).append("\",");
            sb.append("\"tienPhong\":").append(dp.getTienPhong() != null ? dp.getTienPhong() : 0).append(",");
            sb.append("\"tienPhat\":").append(dp.getTienPhat() != null ? dp.getTienPhat() : 0);
            sb.append("}");
            if (i < chiTiet.size() - 1) sb.append(",");
        }
        sb.append("]");
        return sb.toString().replace("\"", "&quot;"); // Escape for HTML attribute
    }

    public String getTenKhachHang() { return tenKhachHang; }
    public void setTenKhachHang(String ten) { this.tenKhachHang = ten; }

    public String getTenNhanVien() { return tenNhanVien; }
    public void setTenNhanVien(String ten) { this.tenNhanVien = ten; }

    public HoaDon() {
    }

    public HoaDon(int maHD, int maNV, int maKH, Timestamp ngayTao, Timestamp ngayTT,
            BigDecimal tongTien, String trangThai) { // Cập nhật kiểu dữ liệu trong constructor
        this.maHoaDon = maHD;
        this.maNhanVien = maNV;
        this.maKhachHang = maKH;
        this.ngayTao = ngayTao;
        this.ngayThanhToan = ngayTT;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String tt) {
        this.trangThai = tt;
    }

    // constructor khi tạo mới
    public HoaDon(int nv, int kh) {
        this.maNhanVien = nv;
        this.maKhachHang = kh;
        this.ngayTao = new Timestamp(System.currentTimeMillis());
        this.tongTien = BigDecimal.ZERO; // Khởi tạo bằng BigDecimal.ZERO thay vì 0
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }

    public int getMaKhachHang() {
        return maKhachHang;
    }

    public Timestamp getNgayTao() {
        return ngayTao;
    }

    public Timestamp getNgayThanhToan() {
        return ngayThanhToan;
    }

    public BigDecimal getTongTien() {
        return tongTien;
    } // Cập nhật kiểu trả về

    public void setMaHoaDon(int maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public void setNgayTao(Timestamp ngayTao) {
        this.ngayTao = ngayTao;
    }

    public void setNgayThanhToan(Timestamp tt) {
        this.ngayThanhToan = tt;
    }

    public void setTongTien(BigDecimal tongTien) {
        this.tongTien = tongTien;
    } // Cập nhật kiểu tham số
}