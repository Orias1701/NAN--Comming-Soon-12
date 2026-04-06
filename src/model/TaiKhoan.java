package model;

public class TaiKhoan {
    private int id;
    private String taiKhoan;
    private String matKhau;
    private int maNhanVien;
    private int maVaiTro;

    private String tenNhanVien;
    private String tenVaiTro;

    public String getTenNhanVien() { return tenNhanVien; }
    public String getTenVaiTro() { return tenVaiTro; }
    public void setTenNhanVien(String ten) { this.tenNhanVien = ten; }
    public void setTenVaiTro(String ten) { this.tenVaiTro = ten; }

    public TaiKhoan() {}

    public TaiKhoan(int id, String tk, String mk, int nv, int vt) {
        this.id = id;
        this.taiKhoan = tk;
        this.matKhau = mk;
        this.maNhanVien = nv;
        this.maVaiTro = vt;
    }

    public int getId() { return id; }
    public String getTaiKhoan() { return taiKhoan; }
    public String getMatKhau() { return matKhau; }
    public int getMaNhanVien() { return maNhanVien; }
    public int getMaVaiTro() { return maVaiTro; }

    public void setId(int id) { this.id = id; }
    public void setTaiKhoan(String tk) { this.taiKhoan = tk; }
    public void setMatKhau(String mk) { this.matKhau = mk; }
    public void setMaNhanVien(int nv) { this.maNhanVien = nv; }
    public void setMaVaiTro(int vt) { this.maVaiTro = vt; }
}
