package model;

import java.math.BigDecimal;

public class ThietBi {

    private int maThietBi;           // PK, AI
    private String tenThietBi;       // varchar(100)
    private BigDecimal giaThietBi;   // decimal(15,2)

    public ThietBi() {}

    public ThietBi(int maThietBi, String tenThietBi, BigDecimal giaThietBi) {
        this.maThietBi = maThietBi;
        this.tenThietBi = tenThietBi;
        this.giaThietBi = giaThietBi;
    }

    // GETTERS
    public int getMaThietBi() { return maThietBi; }
    public String getTenThietBi() { return tenThietBi; }
    public BigDecimal getGiaThietBi() { return giaThietBi; }

    // SETTERS
    public void setMaThietBi(int maThietBi) { this.maThietBi = maThietBi; }
    public void setTenThietBi(String tenThietBi) { this.tenThietBi = tenThietBi; }
    public void setGiaThietBi(BigDecimal giaThietBi) { this.giaThietBi = giaThietBi; }
    @Override
    public String toString() {
        return tenThietBi;
    }
    
}
