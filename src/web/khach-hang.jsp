<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="section-title">KHÁCH HÀNG</div>

        <div class="p-25">
            <!-- Toolbar -->
            <div class="toolbar flex-between mb-20 toolbar-standard">
                <div class="search-box">
                    <label class="mr-10 text-bold">Tìm kiếm:</label>
                    <input type="text" id="txtSearchKH" class="rounded-input w-250" placeholder="Nhập tên, SĐT hoặc Email..."
                        onkeyup="filterKHTable()">

                    <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                    <select id="cboFilterKH" class="rounded-input" onchange="filterKHTable()">
                        <option value="all">Tất cả</option>
                        <option value="ten">Tên khách</option>
                        <option value="sdt">Số điện thoại</option>
                        <option value="email">Email</option>
                    </select>
                </div>
                <button class="btn-swing btn-primary" onclick="openKHForm('add', null)">+ Thêm mới</button>
            </div>

            <!-- Table Content -->
            <div class="swing-table-container scroll-table-container">
                <table class="swing-table" id="tblKH">
                    <thead>
                        <tr>
                            <th class="center_cell id_cell">ID</th>
                            <th>Tên khách</th>
                            <th>Số điện thoại</th>
                            <th class="email-cell">Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="kh" items="${listKhachHang}">
                            <tr onclick="openKHForm('update', this.dataset)" data-id="${kh.getMaKhachHang()}"
                                data-ten="${kh.getTenKhachHang()}" data-sdt="${kh.getSoDienThoai()}"
                                data-email="${kh.getEmail()}">
                                <td class="center_cell id_cell">${kh.getMaKhachHang()}</td>
                                <td>${kh.getTenKhachHang()}</td>
                                <td>${kh.getSoDienThoai()}</td>
                                <td class="email-cell">${kh.getEmail()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="khach-hang-form.jsp" />

        <script>
            /**
             * Basic client-side search filtering
             */
            function filterKHTable() {
                const key = document.getElementById('txtSearchKH').value.toLowerCase();
                const type = document.getElementById('cboFilterKH').value;
                const table = document.getElementById('tblKH');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const ten = row.dataset.ten.toLowerCase();
                    const sdt = row.dataset.sdt.toLowerCase();
                    const email = row.dataset.email.toLowerCase();

                    let match = false;
                    if (type === 'ten') match = ten.includes(key);
                    else if (type === 'sdt') match = sdt.includes(key);
                    else if (type === 'email') match = email.includes(key);
                    else match = ten.includes(key) || sdt.includes(key) || email.includes(key);

                    row.style.display = match ? '' : 'none';
                }
            }
        </script>