<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Modal Overlay for KiemTraChiTiet Form -->
<div id="modalKTCT" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            Dữ liệu chi tiết Thiết bị Hỏng
        </div>
        
        <form id="frmKTCT" action="kiem-tra-chi-tiet-data" method="post">
            <input type="hidden" id="ktctAction" name="action" value="add">
            <input type="hidden" id="maKiemTraChiTiet" name="maKiemTraChiTiet">
            
            <div class="modal-form-grid">
                <div class="form-group full-width">
                    <label>Kiểm tra phòng:</label>
                    <select id="maKiemTraPhong" name="maKiemTraPhong" class="rounded-input" required>
                        <c:forEach var="ktp" items="${listKiemTraPhong}">
                            <option value="${ktp.getMaKiemTraPhong()}">Kiểm tra ID: ${ktp.getMaKiemTraPhong()} (Phòng: ${ktp.getMaPhong()})</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Thiết bị:</label>
                    <select id="maThietBiKTCT" name="maThietBi" class="rounded-input" required>
                        <c:forEach var="tb" items="${listThietBi}">
                            <option value="${tb.getMaThietBi()}">${tb.getTenThietBi()}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Số lượng hỏng:</label>
                    <input type="number" id="soLuongBiHong" name="soLuongBiHong" class="rounded-input" required min="0">
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn-swing btn-primary">Lưu</button>
                <button type="button" class="btn-swing btn-secondary" onclick="closeModal('modalKTCT')">Hủy</button>
            </div>
        </form>
    </div>
</div>

<script>
function openKTCTForm(action, row_dataset) {
    const frm = document.getElementById('frmKTCT');
    frm.reset();
    document.getElementById('ktctAction').value = action;
    
    if (action === 'update' && row_dataset) {
        document.getElementById('maKiemTraChiTiet').value = row_dataset.id;
        document.getElementById('maKiemTraPhong').value = row_dataset.maktp;
        document.getElementById('maThietBiKTCT').value = row_dataset.matb;
        document.getElementById('soLuongBiHong').value = row_dataset.soluong;
    } else {
        document.getElementById('maKiemTraChiTiet').value = '';
    }
    
    openModal('modalKTCT');
}
</script>
