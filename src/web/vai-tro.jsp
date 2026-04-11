<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="section-title">VAI TRÒ</div>

        <div class="p-25">
            <!-- Toolbar -->
            <div class="toolbar flex-between mb-20 toolbar-standard">
                <div class="search-box">
                    <label class="mr-10 text-bold">Tìm kiếm:</label>
                    <input type="text" id="txtSearchVT" class="rounded-input w-250" placeholder="Nhập tên vai trò..."
                        onkeyup="filterVTTable()">

                    <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                    <select id="cboFilterVT" class="rounded-input" onchange="filterVTTable()">
                        <option value="all">Tất cả</option>
                        <option value="ten">Tên vai trò</option>
                    </select>
                </div>
                <button class="btn-swing btn-primary" onclick="openVTForm('add', null)">+ Thêm mới</button>
            </div>

            <!-- Table Content -->
            <div class="swing-table-container scroll-table-container">
                <table class="swing-table" id="tblVT">
                    <thead>
                        <tr>
                            <th class="center_cell id_cell">ID</th>
                            <th>Tên vai trò</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vt" items="${listVaiTro}">
                            <tr onclick="openVTForm('update', this.dataset)" data-id="${vt.getMaVaiTro()}"
                                data-ten="${vt.getTenVaiTro()}">
                                <td class="center_cell id_cell">${vt.getMaVaiTro()}</td>
                                <td>${vt.getTenVaiTro()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="vai-tro-form.jsp" />

        <script>
            function filterVTTable() {
                const key = document.getElementById('txtSearchVT').value.toLowerCase();
                const type = document.getElementById('cboFilterVT').value; // Just incase it expands later
                const table = document.getElementById('tblVT');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const ten = row.dataset.ten.toLowerCase();

                    let match = ten.includes(key);
                    row.style.display = match ? '' : 'none';
                }
            }
        </script>