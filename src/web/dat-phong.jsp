<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <div class="section-title">ĐẶT PHÒNG</div>

            <div class="p-25">
                <!-- Toolbar -->
                <div class="toolbar flex-between mb-20 toolbar-standard">
                    <div class="search-box">
                        <label class="mr-10 text-bold">Tìm kiếm:</label>
                        <input type="text" id="txtSearchDatPhong" class="rounded-input w-280"
                            placeholder="Nhập tên khách hoặc số phòng..." onkeyup="filterDatPhongTable()">

                        <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                        <select id="cboFilterDatPhong" class="rounded-input" onchange="filterDatPhongTable()">
                            <option value="all">Tất cả</option>
                            <option value="khachHang">Khách hàng</option>
                            <option value="phong">Phòng</option>
                        </select>
                    </div>
                    <button class="btn-swing btn-primary" onclick="openDatPhongAdd()">+ Đặt phòng</button>
                </div>

                <!-- Table Content -->
                <div class="swing-table-container scroll-table-container">
                    <table class="swing-table" id="tblDatPhong">
                        <thead>
                            <tr>
                                <th class="center_cell id_cell">ID</th>
                                <th class="center_cell id_cell">HD</th>
                                <th>Khách hàng</th>
                                <th>Nhân viên</th>
                                <th>Phòng</th>
                                <th>Ngày nhận</th>
                                <th>Hẹn trả</th>
                                <th>Ngày trả</th>
                                <th class="currency-cell">Tiền phòng</th>
                                <th class="currency-cell">Tiền phạt</th>
                                <th class="center_cell status-cell">Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dp" items="${dataList}">
                                <tr onclick="openDatPhongView(this.dataset)" data-id="${dp.getMaDatPhong()}"
                                    data-makhach="${dp.getMaKhachHang()}" data-tenkhach="${dp.getTenKhachHang()}"
                                    data-tennv="${dp.getTenNhanVien()}" data-sophong="${dp.getSoPhong()}"
                                    data-maphong="${dp.getMaPhong()}"
                                    data-nhan="<fmt:formatDate value='${dp.getNgayNhanPhong()}' pattern='dd/MM/yyyy HH:mm' />"
                                    data-hentra="<fmt:formatDate value='${dp.getNgayHenTra()}' pattern='dd/MM/yyyy HH:mm' />"
                                    data-tra="<fmt:formatDate value='${dp.getNgayTraPhong()}' pattern='dd/MM/yyyy HH:mm' />"
                                    data-tienphong="${dp.getTienPhong()}" data-tienphat="${dp.getTienPhat()}"
                                    data-trangthai="${dp.getTrangThai()}" data-mahoadon="${dp.getMaHoaDon()}">
                                    <td class="center_cell id_cell">${dp.getMaDatPhong()}</td>
                                    <td class="center_cell id_cell">${dp.getMaHoaDon()}</td>
                                    <td>${dp.getTenKhachHang()}</td>
                                    <td>${dp.getTenNhanVien()}</td>
                                    <td>${dp.getSoPhong()}</td>
                                    <td>
                                        <fmt:formatDate value="${dp.getNgayNhanPhong()}" pattern="dd/MM/yyyy HH:mm" />
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${dp.getNgayHenTra()}" pattern="dd/MM/yyyy HH:mm" />
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${dp.getNgayTraPhong()}" pattern="dd/MM/yyyy HH:mm" />
                                    </td>
                                    <td class="currency-cell">
                                        <fmt:setLocale value="vi_VN" />
                                        <fmt:formatNumber value="${dp.getTienPhong()}" pattern="#,###" /> VNĐ
                                    </td>
                                    <td class="currency-cell">
                                        <fmt:setLocale value="vi_VN" />
                                        <fmt:formatNumber value="${dp.getTienPhat()}" pattern="#,###" /> VNĐ
                                    </td>

                                    <td class="center_cell status-cell">
                                        <c:choose>
                                            <c:when test="${dp.getTrangThai() == 'Đã trả'}">
                                                <span class="status-badge status-paid">Đã trả</span>
                                            </c:when>
                                            <c:when test="${dp.getTrangThai() == 'Đã hủy'}">
                                                <span class="status-badge status-cancelled">Đã hủy</span>
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