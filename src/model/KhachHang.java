package model;

public class KhachHang {
    private int maKhachHang;
    private String tenKhachHang;
    private String soDienThoai;
    private String email;

    public KhachHang() {}

    public KhachHang(int id, String ten, String sdt, String email) {
        this.maKhachHang = id;
        this.tenKhachHang = ten;
        this.soDienThoai = sdt;
        this.email = email;
    }

    // GET - SET
    public int getMaKhachHang() { return maKhachHang; }
    public void setMaKhachHang(int ma) { this.maKhachHang = ma; }
    public String getTenKhachHang() { return tenKhachHang; }
    public void setTenKhachHang(String ten) { this.tenKhachHang = ten; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String sdt) { this.soDienThoai = sdt; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    @Override
    public String toString() {
        return tenKhachHang;
    }
}
