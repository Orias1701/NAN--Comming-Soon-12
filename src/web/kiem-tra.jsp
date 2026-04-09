<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="section-title">KIỂM TRA PHÒNG</div>

<div style="padding: 10px 25px;">
    <!-- Toolbar -->
    <div class="toolbar" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 15px 25px; background-color: white; border: 1px solid var(--color-border); border-radius: 10px;">
        <div class="search-box">
            <label style="margin-right: 10px; font-weight: bold;">Tìm kiếm:</label>
            <input type="text" id="txtSearchKT" class="rounded-input" placeholder="Nhập mã HD hoặc phòng..." onkeyup="filterKTTable()" style="width: 250px;">
            
            <label style="margin-left: 20px; margin-right: 10px; font-weight: bold;">Lọc theo:</label>
            <select id="cboFilterKT" class="rounded-input" onchange="filterKTTable()">
                <option value="all">Tất cả</option>
                <option value="hd">Mã hóa đơn</option>
                <option value="phong">Mã phòng</option>
            </select>
        </div>
        <button class="btn-swing btn-primary" onclick="openKTForm('add', null)">+ Thêm mới</button>
    </div>

    <!-- Table Content -->
    <div class="swing-table-container" style="max-height: calc(100vh - 220px); overflow-y: auto; padding: 0;">
        <table class="swing-table" id="tblKT">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã Hóa Đơn</th>
                    <th>Mã Phòng</th>
                    <th>Ngày Thanh Toán</th>
                    <th>Tiền Bồi Thường</th>
                    <th style="width: 100px; text-align: center;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="kt" items="${listKiemTra}">
                    <tr onclick="openKTForm('update', this.dataset)" 
                        data-id="${kt.maKiemTraPhong}" 
                        data-mahd="${kt.maHoaDon}"
                        data-maphong="${kt.maPhong}"
                        data-ngay="<fmt:formatDate value='${kt.ngayThanhToan}' pattern='yyyy-MM-dd HH:mm' />"
                        data-tien="${kt.tienBoiThuong}">
                        <td>${kt.maKiemTraPhong}</td>
                        <td>${kt.maHoaDon}</td>
                        <td>${kt.maPhong}</td>
                        <td><fmt:formatDate value="${kt.ngayThanhToan}" pattern="dd/MM/yyyy HH:mm" /></td>
                        <td><fmt:formatNumber value="${kt.tienBoiThuong}" type="currency" currencyCode="VND" /></td>
                        <td class="action-cell">
                                                            <form id="frmDelKT_${kt.maKiemTraPhong}" action="kiem-tra-data" method="post" style="display:none;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="maKiemTraPhong" value="${kt.maKiemTraPhong}">
                                </form>
                                <button type="button" class="btn-swing btn-danger" style="padding: 5px 10px; font-size: 13px;" onclick="event.stopPropagation(); confirmDelete('Bạn có chắc chắn muốn xóa bản kiểm tra này?', 'kiemtraphong', this.closest('tr').dataset.id, 'frmDelKT_' + this.closest('tr').dataset.id);">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="kiem-tra-form.jsp" />

<script>
function filterKTTable() {
    const key = document.getElementById('txtSearchKT').value.toLowerCase();
    const type = document.getElementById('cboFilterKT').value;
    const table = document.getElementById('tblKT');
    const rows = table.getElementsByTagName('tr');

    for (let i = 1; i < rows.length; i++) {
        const row = rows[i];
        const hd = row.dataset.mahd.toLowerCase();
        const phong = row.dataset.maphong.toLowerCase();

        let match = false;
        if (type === 'hd') match = hd.includes(key);
        else if (type === 'phong') match = phong.includes(key);
        else match = hd.includes(key) || phong.includes(key);

        row.style.display = match ? '' : 'none';
    }
}
</script>
