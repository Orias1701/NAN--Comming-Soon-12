<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="section-title">CHI TIẾT KIỂM TRA</div>

<div style="padding: 10px 25px;">
    <!-- Toolbar -->
    <div class="toolbar" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 15px 25px; background-color: white; border: 1px solid var(--color-border); border-radius: 10px;">
        <div class="search-box">
            <label style="margin-right: 10px; font-weight: bold;">Tìm kiếm:</label>
            <input type="text" id="txtSearchKTCT" class="rounded-input" placeholder="Nhập mã kiểm tra hoặc phòng..." onkeyup="filterKTCTTable()" style="width: 280px;">
        </div>
        <button class="btn-swing btn-primary" onclick="openKTCTForm('add', null)">+ Thêm mới</button>
    </div>

    <!-- Table Content -->
    <div class="swing-table-container" style="max-height: calc(100vh - 220px); overflow-y: auto; padding: 0;">
        <table class="swing-table" id="tblKTCT">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã kiểm tra</th>
                    <th>Phòng</th>
                    <th>Thiết bị</th>
                    <th>Số lượng hỏng</th>
                    <th>Nhân viên</th>
                    <th>Ngày kiểm tra</th>
                    <th style="width: 100px; text-align: center;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ktct" items="${listKiemTraChiTiet}">
                    <tr onclick="openKTCTForm('update', this.dataset)" 
                        data-id="${ktct.maKiemTraChiTiet}" 
                        data-maktp="${ktct.maKiemTraPhong}"
                        data-matb="${ktct.maThietBiPhong}"
                        data-soluong="${ktct.soLuongBiHong}"
                        data-manv="${ktct.maNhanVien}"
                        data-ngay="<fmt:formatDate value='${ktct.ngayKiemTra}' pattern='dd/MM/yyyy' />">
                        <td>${ktct.maKiemTraChiTiet}</td>
                        <td>${ktct.maKiemTraPhong}</td>
                        <td>${ktct.tenPhong}</td>
                        <td>${ktct.tenThietBi}</td>
                        <td style="color: #ff4d4d; font-weight: bold;">${ktct.soLuongBiHong}</td>
                        <td>${ktct.maNhanVien}</td>
                        <td><fmt:formatDate value="${ktct.ngayKiemTra}" pattern="dd/MM/yyyy" /></td>
                        <td class="action-cell">
                                                            <form id="frmDelKTCT_${ktct.maKiemTraChiTiet}" action="kiem-tra-chi-tiet-data" method="post" style="display:none;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="maKiemTraChiTiet" value="${ktct.maKiemTraChiTiet}">
                                </form>
                                <button type="button" class="btn-swing btn-danger" style="padding: 5px 10px; font-size: 13px;" onclick="event.stopPropagation(); confirmDelete('Bạn có chắc chắn muốn xóa chi tiết kiểm tra này?', 'kiemtrachitiet', this.closest('tr').dataset.id, 'frmDelKTCT_' + this.closest('tr').dataset.id);">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="kiem-tra-chi-tiet-form.jsp" />

<script>
function filterKTCTTable() {
    const key = document.getElementById('txtSearchKTCT').value.toLowerCase();
    const table = document.getElementById('tblKTCT');
    const rows = table.getElementsByTagName('tr');

    for (let i = 1; i < rows.length; i++) {
        const row = rows[i];
        const makt = row.cells[1].innerText.toLowerCase();
        const phong = row.cells[2].innerText.toLowerCase();

        let match = makt.includes(key) || phong.includes(key);
        row.style.display = match ? '' : 'none';
    }
}
</script>
