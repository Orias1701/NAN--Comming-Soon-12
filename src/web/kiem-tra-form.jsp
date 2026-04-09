<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Modal Overlay for KiemTraPhong Form -->
<div id="modalKT" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            Dữ liệu chi tiết Kiểm tra Phòng
        </div>
        
        <form id="frmKT" action="kiem-tra-data" method="post">
            <input type="hidden" id="ktAction" name="action" value="add">
            
            <div class="modal-form-grid">
                <div class="form-group full-width">
                    <label>ID:</label>
                    <input type="text" id="maKiemTraPhong" name="maKiemTraPhong" class="rounded-input" readonly style="background-color: #f0f0f0;" placeholder="Tự động tạo">
                </div>
                
                <div class="form-group">
                    <label>Mã hóa đơn:</label>
                    <input type="number" id="maHoaDonKT" name="maHoaDon" class="rounded-input" required>
                </div>
                
                <div class="form-group">
                    <label>Mã phòng:</label>
                    <input type="number" id="maPhongKT" name="maPhong" class="rounded-input" required>
                </div>
                
                <div class="form-group">
                    <label>Ngày thanh toán:</label>
                    <input type="datetime-local" id="ngayThanhToan" name="ngayThanhToan" class="rounded-input" required>
                </div>
                
                <div class="form-group">
                    <label>Tiền bồi thường (VND):</label>
                    <input type="number" id="tienBoiThuong" name="tienBoiThuong" class="rounded-input" required step="1000" min="0">
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn-swing btn-primary">Lưu</button>
                <button type="button" class="btn-swing btn-secondary" onclick="closeModal('modalKT')">Hủy</button>
            </div>
        </form>
    </div>
</div>

<script>
function openKTForm(action, row_dataset) {
    const frm = document.getElementById('frmKT');
    frm.reset();
    document.getElementById('ktAction').value = action;
    
    if (action === 'update' && row_dataset) {
        document.getElementById('maKiemTraPhong').value = row_dataset.id;
        document.getElementById('maHoaDonKT').value = row_dataset.mahd;
        document.getElementById('maPhongKT').value = row_dataset.maphong;
        document.getElementById('ngayThanhToan').value = row_dataset.ngay;
        document.getElementById('tienBoiThuong').value = row_dataset.tien;
    } else {
        document.getElementById('maKiemTraPhong').value = '';
    }
    
    openModal('modalKT');
}
</script>
