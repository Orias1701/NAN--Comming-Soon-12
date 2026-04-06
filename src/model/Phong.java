package model;

public class Phong {
    private int maPhong;
    private String soPhong;
    private int maLoaiPhong;
    private String tenLoaiPhong; // để hiển thị join
    private String trangThai;

    public Phong() {}

    public Phong(int id, String soPhong, int maLoaiPhong, String trangThai) {
        this.maPhong = id;
        this.soPhong = soPhong;
        this.maLoaiPhong = maLoaiPhong;
        this.trangThai = trangThai;
    }

    public Phong(int id, String soPhong, String tenLoaiPhong, String trangThai) {
        this.maPhong = id;
        this.soPhong = soPhong;
        this.tenLoaiPhong = tenLoaiPhong;
        this.trangThai = trangThai;
    }

    public int getMaPhong() { return maPhong; }
    public void setMaPhong(int maPhong) { this.maPhong = maPhong; }

    public String getSoPhong() { return soPhong; }
    public void setSoPhong(String soPhong) { this.soPhong = soPhong; }

    public int getMaLoaiPhong() { return maLoaiPhong; }
    public void setMaLoaiPhong(int maLoaiPhong) { this.maLoaiPhong = maLoaiPhong; }

    public String getTenLoaiPhong() { return tenLoaiPhong; }
    public void setTenLoaiPhong(String tenLoaiPhong) { this.tenLoaiPhong = tenLoaiPhong; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }

    @Override
    public String toString() {
        return soPhong;
    }
}
