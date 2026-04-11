<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="section-title">NHÂN VIÊN</div>

        <div class="p-25">
            <!-- Toolbar -->
            <div class="toolbar flex-between mb-20 toolbar-standard">
                <div class="search-box">
                    <label class="mr-10 text-bold">Tìm kiếm:</label>
                    <input type="text" id="txtSearchNV" class="rounded-input w-250" placeholder="Nhập tên, Email hoặc SĐT..."
                        onkeyup="filterNVTable()">

                    <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                    <select id="cboFilterNV" class="rounded-input" onchange="filterNVTable()">
                        <option value="all">Tất cả</option>
                        <option value="ten">Tên nhân viên</option>
                        <option value="email">Email</option>
                        <option value="sdt">SĐT</option>
                    </select>
                </div>
                <button class="btn-swing btn-primary" onclick="openNVForm('add', null)">+ Thêm mới</button>
            </div>

            <!-- Table Content -->
            <div class="swing-table-container scroll-table-container">
                <table class="swing-table" id="tblNV">
                    <thead>
                        <tr>
                            <th class="center_cell id_cell">ID</th>
                            <th>Tên nhân viên</th>
                            <th>Số điện thoại</th>
                            <th class="email-cell">Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="nv" items="${listNhanVien}">
                            <c:set var="accountsStr" value="" />
                            <c:forEach var="tk" items="${nv.getListTaiKhoan()}" varStatus="status">
                                <c:set var="accountsStr"
                                    value="${accountsStr}${tk.getId()}|${tk.getTaiKhoan()}|${tk.getTenVaiTro()}|${tk.getMatKhau()}${not status.last ? ',' : ''}" />
                            </c:forEach>
                            <tr onclick="openNVForm('update', this.dataset)" data-id="${nv.getMaNhanVien()}"
                                data-ten="${nv.getTenNhanVien()}" data-sdt="${nv.getSoDienThoai()}"
                                data-email="${nv.getEmail()}" data-accounts="${accountsStr}">
                                <td class="center_cell id_cell">${nv.getMaNhanVien()}</td>
                                <td>${nv.getTenNhanVien()}</td>
                                <td>${nv.getSoDienThoai()}</td>
                                <td class="email-cell">${nv.getEmail()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
            /**
             * Basic client-side search filtering
             */
            function filterNVTable() {
                const key = document.getElementById('txtSearchNV').value.toLowerCase();
                const type = document.getElementById('cboFilterNV').value;
                const table = document.getElementById('tblNV');
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