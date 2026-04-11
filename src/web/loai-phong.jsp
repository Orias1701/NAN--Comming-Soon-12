<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <div class="section-title">LOẠI PHÒNG</div>

            <div class="p-25">
                <!-- Toolbar -->
                <div class="toolbar flex-between mb-20 toolbar-standard">
                    <div class="search-box">
                        <label class="mr-10 text-bold">Tìm kiếm:</label>
                        <input type="text" id="txtSearchLP" class="rounded-input w-250"
                            placeholder="Nhập tên loại phòng hoặc giá..." onkeyup="filterLPTable()">

                        <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                        <select id="cboFilterLP" class="rounded-input" onchange="filterLPTable()">
                            <option value="all">Tất cả</option>
                            <option value="ten">Tên loại phòng</option>
                        </select>
                    </div>
                    <button class="btn-swing btn-primary" onclick="openLPForm('add', null)">+ Thêm mới</button>
                </div>

                <!-- Table Content -->
                <div class="swing-table-container scroll-table-container">
                    <table class="swing-table" id="tblLP">
                        <thead>
                            <tr>
                                <th class="center_cell id_cell">ID</th>
                                <th>Tên loại phòng</th>
                                <th class="currency-cell">Giá cơ bản</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="lp" items="${listLoaiPhong}">
                                <tr onclick="openLPForm('update', this.dataset)" data-id="${lp.getMaLoaiPhong()}"
                                    data-ten="${lp.getTenLoaiPhong()}" data-gia="${lp.getGiaCoBan()}">
                                    <td class="center_cell id_cell">${lp.getMaLoaiPhong()}</td>
                                    <td>${lp.getTenLoaiPhong()}</td>
                                    <td class="currency-cell">
                                        <fmt:setLocale value="vi_VN" />
                                        <fmt:formatNumber value="${lp.getGiaCoBan()}" pattern="#,###" /> VNĐ
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <jsp:include page="loai-phong-form.jsp" />

            <script>
                function filterLPTable() {
                    const key = document.getElementById('txtSearchLP').value.toLowerCase();
                    const type = document.getElementById('cboFilterLP').value;
                    const table = document.getElementById('tblLP');
                    const rows = table.getElementsByTagName('tr');

                    for (let i = 1; i < rows.length; i++) {
                        const row = rows[i];
                        const ten = row.dataset.ten.toLowerCase();
                        const gia = row.dataset.gia.toLowerCase();

                        let match = false;
                        if (type === 'ten') match = ten.includes(key);
                        else match = ten.includes(key) || gia.includes(key);

                        row.style.display = match ? '' : 'none';
                    }
                }
            </script>