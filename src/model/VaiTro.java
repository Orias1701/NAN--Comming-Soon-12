package model;


public class VaiTro {
    private int maVaiTro;
    private String tenVaiTro;

    public VaiTro() {}

    public VaiTro(int id, String ten) {
        this.maVaiTro = id;
        this.tenVaiTro = ten;
    }

    public int getMaVaiTro() { return maVaiTro; }
    public void setMaVaiTro(int maVaiTro) { this.maVaiTro = maVaiTro; }

    public String getTenVaiTro() { return tenVaiTro; }
    public void setTenVaiTro(String tenVaiTro) { this.tenVaiTro = tenVaiTro; }

    @Override
    public String toString() {
        return tenVaiTro;
    }
}
