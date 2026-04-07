package service;

import java.util.List;
import model.ThietBiPhong;
import repository.ThietBiPhongDao;

public class ThietBiPhongService {

    private ThietBiPhongDao dao = new ThietBiPhongDao();

    public List<ThietBiPhong> getAll() {
        return dao.getAll();
    }

    public boolean add(ThietBiPhong tbp) {
        return dao.add(tbp);
    }

    public boolean update(ThietBiPhong tbp) {
        return dao.update(tbp);
    }

    public boolean delete(int id) {
        return dao.delete(id);
    }

    public ThietBiPhong getById(int id) {
        return dao.getById(id);
    }
    public ThietBiPhong getByPhongVaThietBi(int maPhong, int maThietBi) {
        return dao.getByPhongVaThietBi(maPhong, maThietBi);
    }
    public List<ThietBiPhong> getThietBiTheoPhong(int maPhong) {
        return dao.getThietBiTheoPhong(maPhong);
    }
    
}
