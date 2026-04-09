<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Modal Overlay for DatPhong Form (Thêm mới) -->
<div id="modalDatPhong" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            Đặt phòng mới
        </div>
        
        <form id="frmDatPhong" action="dat-phong-data" method="post">
            <input type="hidden" id="dpAction" name="action" value="add">
            <input type="hidden" id="maDatPhong" name="maDatPhong">
            
            <div class="modal-form-grid">
                <div class="form-group">
                    <label>Khách hàng:</label>
                    <select id="maKhachHang" name="maKhachHang" class="rounded-input" required>
                        <c:forEach var="kh" items="${listKhachHang}">
                            <option value="${kh.getMaKhachHang()}">${kh.getTenKhachHang()}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Phòng (Trống):</label>
                    <select id="maPhong" name="maPhong" class="rounded-input" required>
                        <c:forEach var="p" items="${listPhongTrong}">
                            <option value="${p.getMaPhong()}">${p.getSoPhong()}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label>Ngày nhận phòng:</label>
                    <input type="datetime-local" id="ngayNhan" name="ngayNhan" class="rounded-input" required>
                </div>
                
                <div class="form-group">
                    <label>Ngày hẹn trả phòng:</label>
                    <input type="datetime-local" id="ngayHenTra" name="ngayHenTra" class="rounded-input" required>
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn-swing btn-primary">Lưu</button>
                <button type="button" class="btn-swing btn-secondary" onclick="closeModal('modalDatPhong')">Hủy</button>
            </div>
        </form>
    </div>
</div>

<!-- Modal: Trả phòng (Sửa / Checkout) -->
<div id="modalTraPhong" class="modal-overlay">
    <div class="modal-content" style="max-width: 500px;">
        <div class="modal-header">
            Thông tin Đặt phòng
        </div>
        
        <div class="modal-form-grid">
            <div class="form-group">
                <label>Mã đặt phòng:</label>
                <input type="text" id="viewMaDatPhong" class="rounded-input" readonly style="background-color: #f0f0f0;">
            </div>
            <div class="form-group">
                <label>Phòng:</label>
                <input type="text" id="viewSoPhong" class="rounded-input" readonly style="background-color: #f0f0f0;">
            </div>
            <div class="form-group">
                <label>Ngày nhận:</label>
                <input type="text" id="viewNgayNhan" class="rounded-input" readonly style="background-color: #f0f0f0;">
            </div>
            <div class="form-group">
                <label>Ngày hẹn trả:</label>
                <input type="text" id="viewNgayHenTra" class="rounded-input" readonly style="background-color: #f0f0f0;">
            </div>
        </div>

        <div class="modal-footer" style="gap: 10px; flex-wrap: wrap;">
            <!-- Checkout -->
            <form id="frmCheckout" action="dat-phong-data" method="post" style="display:inline;">
                <input type="hidden" name="action" value="checkout">
                <input type="hidden" id="checkoutId" name="maDatPhong">
                <button type="submit" class="btn-swing btn-warning" style="color: white;">Trả phòng</button>
            </form>
            <!-- Delete (Hủy đặt) -->
            <form id="frmDelDP" action="dat-phong-data" method="post" style="display:none;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" id="deleteId" name="maDatPhong">
            </form>
            <button type="button" class="btn-swing btn-danger" id="btnHuyDat" onclick="if(confirm('Bạn có chắc chắn muốn hủy đơn đặt phòng này?')) { document.getElementById('frmDelDP').submit(); }">Hủy đặt</button>
            <button type="button" class="btn-swing btn-secondary" onclick="closeModal('modalTraPhong')">Đóng</button>
        </div>
    </div>
</div>

<script>
function openDatPhongAdd() {
    document.getElementById('frmDatPhong').reset();
    document.getElementById('dpAction').value = 'add';
    document.getElementById('maDatPhong').value = '';
    openModal('modalDatPhong');
}

function openDatPhongView(row_dataset) {
    document.getElementById('viewMaDatPhong').value = row_dataset.id;
    document.getElementById('viewSoPhong').value = row_dataset.sophong || '';
    document.getElementById('viewNgayNhan').value = row_dataset.nhan || '';
    document.getElementById('viewNgayHenTra').value = row_dataset.hentra || '';
    document.getElementById('checkoutId').value = row_dataset.id;
    document.getElementById('deleteId').value = row_dataset.id;
    
    // Only show "Hủy đặt" if room is not yet checked out
    const btnHuy = document.getElementById('btnHuyDat');
    btnHuy.style.display = (row_dataset.trangthai === 'Chưa trả') ? '' : 'none';
    
    openModal('modalTraPhong');
}
</script>
