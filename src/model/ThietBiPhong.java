package model;

public class ThietBiPhong {

    private int maThietBiPhong;
    private int maPhong;
    private int maThietBi;
    private int soLuong;
    private String trangThai; // enum('Tốt','Hỏng','Bảo trì')

    private String soPhong;
    private String tenThietBi;

    public String getSoPhong() { return soPhong; }
    public String getTenPhong() { return soPhong; }
    public String getTenThietBi() { return tenThietBi; }
    public void setSoPhong(String so) { this.soPhong = so; }
    public void setTenPhong(String ten) { this.soPhong = ten; }
    public void setTenThietBi(String ten) { this.tenThietBi = ten; }

    public ThietBiPhong() {}

    public ThietBiPhong(int maThietBiPhong, int maPhong, int maThietBi, int soLuong, String trangThai) {
        this.maThietBiPhong = maThietBiPhong;
        this.maPhong = maPhong;
        this.maThietBi = maThietBi;
        this.soLuong = soLuong;
        this.trangThai = trangThai;
    }

    // GETTERS
    public int getMaThietBiPhong() { return maThietBiPhong; }
    public int getMaPhong() { return maPhong; }
    public int getMaThietBi() { return maThietBi; }
    public int getSoLuong() { return soLuong; }
    public String getTrangThai() { return trangThai; }

    // SETTERS
    public void setMaThietBiPhong(int maThietBiPhong) { this.maThietBiPhong = maThietBiPhong; }
    public void setMaPhong(int maPhong) { this.maPhong = maPhong; }
    public void setMaThietBi(int maThietBi) { this.maThietBi = maThietBi; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }
    
}
