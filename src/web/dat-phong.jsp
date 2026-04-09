<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="section-title">ĐẶT PHÒNG</div>

<style>
    .status-badge { padding: 4px 10px; border-radius: 20px; font-size: 13px; font-weight: bold; }
    .status-paid { background-color: #e6f7ef; color: var(--excel-green); border: 1px solid var(--excel-green); }
    .status-unpaid { background-color: #fff0f0; color: #ff4d4d; border: 1px solid #ff4d4d; }
</style>

<div style="padding: 10px 25px;">
    <!-- Toolbar -->
    <div class="toolbar" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 15px 25px; background-color: white; border: 1px solid var(--color-border); border-radius: 10px;">
        <div class="search-box">
            <label style="margin-right: 10px; font-weight: bold;">Tìm kiếm:</label>
            <input type="text" id="txtSearchDatPhong" class="rounded-input" placeholder="Nhập tên khách hoặc số phòng..." onkeyup="filterDatPhongTable()" style="width: 280px;">
            
            <label style="margin-left: 20px; margin-right: 10px; font-weight: bold;">Lọc theo:</label>
            <select id="cboFilterDatPhong" class="rounded-input" onchange="filterDatPhongTable()">
                <option value="all">Tất cả</option>
                <option value="khachHang">Khách hàng</option>
                <option value="phong">Phòng</option>
            </select>
        </div>
        <button class="btn-swing btn-primary" onclick="openDatPhongAdd()">+ Đặt phòng</button>
    </div>

    <!-- Table Content -->
    <div class="swing-table-container" style="max-height: calc(100vh - 220px); overflow-y: auto; padding: 0;">
        <table class="swing-table" id="tblDatPhong">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Khách hàng</th>
                    <th>Phòng</th>
                    <th>Ngày nhận</th>
                    <th>Hẹn trả</th>
                    <th>Ngày trả</th>
                    <th>Tiền phòng</th>
                    <th>Tiền phạt</th>
                    <th style="width: 110px; text-align: center;">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dp" items="${dataList}">
                    <tr onclick="openDatPhongView(this.dataset)" 
                        data-id="${dp.getMaDatPhong()}" 
                        data-makhach="${dp.getMaKhachHang()}"
                        data-sophong="${dp.getSoPhong()}"
                        data-maphong="${dp.getMaPhong()}"
                        data-nhan="${dp.getNgayNhanPhong() != null ? dp.getNgayNhanPhong().toString().substring(0, 16).replace(' ', 'T') : ''}"
                        data-hentra="${dp.getNgayHenTra() != null ? dp.getNgayHenTra().toString().substring(0, 16).replace(' ', 'T') : ''}"
                        data-trangthai="${dp.getNgayTraPhong() != null ? 'Đã trả' : 'Chưa trả'}">
                        <td>${dp.getMaDatPhong()}</td>
                        <td>${dp.getTenKhachHang()}</td>
                        <td>${dp.getSoPhong()}</td>
                        <td><fmt:formatDate value="${dp.getNgayNhanPhong()}" pattern="dd/MM/yyyy HH:mm" /></td>
                        <td><fmt:formatDate value="${dp.getNgayHenTra()}" pattern="dd/MM/yyyy HH:mm" /></td>
                        <td><fmt:formatDate value="${dp.getNgayTraPhong()}" pattern="dd/MM/yyyy HH:mm" /></td>
                        <td><fmt:formatNumber value="${dp.getTienPhong()}" type="currency" currencyCode="VND" /></td>
                        <td><fmt:formatNumber value="${dp.getTienPhat()}" type="currency" currencyCode="VND" /></td>
                        <td style="text-align: center;">
                            <c:choose>
                                <c:when test="${dp.getNgayTraPhong() != null}">
                                    <span class="status-badge status-paid">Đã trả</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-unpaid">Chưa trả</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="dat-phong-form.jsp" />

<script>
function filterDatPhongTable() {
    const key = document.getElementById('txtSearchDatPhong').value.toLowerCase();
    const type = document.getElementById('cboFilterDatPhong').value;
    const table = document.getElementById('tblDatPhong');
    const rows = table.getElementsByTagName('tr');

    for (let i = 1; i < rows.length; i++) {
        const row = rows[i];
        const khach = row.cells[1].innerText.toLowerCase();
        const phong = row.cells[2].innerText.toLowerCase();

        let match = false;
        if (type === 'khachHang') match = khach.includes(key);
        else if (type === 'phong') match = phong.includes(key);
        else match = khach.includes(key) || phong.includes(key);

        row.style.display = match ? '' : 'none';
    }
}
</script>
