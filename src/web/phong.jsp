<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="section-title">DANH SÁCH PHÒNG</div>

        <div class="p-25">
            <!-- Toolbar -->
            <div class="toolbar flex-between mb-20 toolbar-standard">
                <div class="search-box">
                    <label class="mr-10 text-bold">Tìm kiếm:</label>
                    <input type="text" id="txtSearchPhong" class="rounded-input w-250" placeholder="Nhập từ khóa..."
                        onkeyup="filterPhongTable()">

                    <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                    <select id="cboFilterPhong" class="rounded-input" onchange="filterPhongTable()">
                        <option value="all">Tất cả</option>
                        <option value="soPhong">Số phòng</option>
                        <option value="loaiPhong">Loại phòng</option>
                        <option value="trangThai">Trạng thái</option>
                    </select>
                </div>
                <button class="btn-swing btn-primary" onclick="openPhongForm('add', null)">+ Thêm mới</button>
            </div>

            <!-- Table Content -->
            <div class="swing-table-container scroll-table-container">
                <table class="swing-table" id="tblPhong">
                    <thead>
                        <tr>
                                <th class="center_cell id_cell">ID</th>
                            <th>Số phòng</th>
                            <th>Loại phòng</th>
                            <th class="center_cell status-cell">Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${listPhong}">
                            <tr onclick="openPhongForm('update', this.dataset)" data-id="${p.getMaPhong()}"
                                data-sophong="${p.getSoPhong()}" data-maloai="${p.getMaLoaiPhong()}"
                                data-tenloai="${p.getTenLoaiPhong()}" data-trangthai="${p.getTrangThai()}">
                                <td class="center_cell id_cell">${p.getMaPhong()}</td>
                                <td>${p.getSoPhong()}</td>
                                <td>${p.getTenLoaiPhong()}</td>
                                <td class="center_cell status-cell">
                                    <span class="status-badge ${p.trangThai == 'Trống' ? 'status-trong' : 
                                               p.trangThai == 'Đã đặt' ? 'status-booked' : 
                                               p.trangThai == 'Đang ở' ? 'status-occupied' : 'status-maintenance'}">
                                        ${p.trangThai}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="phong-form.jsp" />

        <script>
            /**
             * Basic client-side search filtering
             */
            function filterPhongTable() {
                const key = document.getElementById('txtSearchPhong').value.toLowerCase();
                const type = document.getElementById('cboFilterPhong').value;
                const table = document.getElementById('tblPhong');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const soPhong = row.dataset.sophong.toLowerCase();
                    const loaiPhong = row.dataset.tenloai.toLowerCase();
                    const trangThai = row.dataset.trangthai.toLowerCase();

                    let match = false;
                    if (type === 'soPhong') match = soPhong.includes(key);
                    else if (type === 'loaiPhong') match = loaiPhong.includes(key);
                    else if (type === 'trangThai') match = trangThai.includes(key);
                    else match = soPhong.includes(key) || loaiPhong.includes(key) || trangThai.includes(key);

                    row.style.display = match ? '' : 'none';
                }
            }
        </script>