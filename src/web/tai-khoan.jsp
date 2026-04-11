<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="section-title">TÀI KHOẢN</div>

        <div class="p-25">
            <!-- Toolbar -->
            <div class="toolbar flex-between mb-20 toolbar-standard">
                <div class="search-box">
                    <label class="mr-10 text-bold">Tìm kiếm:</label>
                    <input type="text" id="txtSearchTK" class="rounded-input w-280"
                        placeholder="Nhập Username, Nhân viên hoặc Vai trò..." onkeyup="filterTKTable()">

                    <label class="ml-20 mr-10 text-bold">Lọc theo:</label>
                    <select id="cboFilterTK" class="rounded-input" onchange="filterTKTable()">
                        <option value="all">Tất cả</option>
                        <option value="user">Username</option>
                        <option value="nv">Nhân viên</option>
                        <option value="vt">Vai trò</option>
                    </select>
                </div>
                <button class="btn-swing btn-primary" onclick="openTKForm('add', null)">+ Thêm mới</button>
            </div>

            <!-- Table Content -->
            <div class="swing-table-container scroll-table-container">
                <table class="swing-table" id="tblTK">
                    <thead>
                        <tr>
                            <th class="center_cell id_cell">ID</th>
                            <th>Tài khoản</th>
                            <th>Mật khẩu</th>
                            <th>Nhân viên</th>
                            <th>Vai trò</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tk" items="${listTaiKhoan}">
                            <tr onclick="openTKForm('update', this.dataset)" data-id="${tk.getId()}"
                                data-user="${tk.getTaiKhoan()}" data-pass="${tk.getMatKhau()}"
                                data-manv="${tk.getMaNhanVien()}" data-tennv="${tk.getTenNhanVien()}"
                                data-mavt="${tk.getMaVaiTro()}" data-tenvt="${tk.getTenVaiTro()}">
                                <td class="center_cell id_cell">${tk.getId()}</td>
                                <td>${tk.getTaiKhoan()}</td>
                                <td>••••••••</td>
                                <td>${tk.getTenNhanVien()}</td>
                                <td>${tk.getTenVaiTro()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="tai-khoan-form.jsp" />

        <script>
            function filterTKTable() {
                const key = document.getElementById('txtSearchTK').value.toLowerCase();
                const type = document.getElementById('cboFilterTK').value;
                const table = document.getElementById('tblTK');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const row = rows[i];
                    const user = row.dataset.user.toLowerCase();
                    const tenNV = row.dataset.tennv.toLowerCase();
                    const tenVT = row.dataset.tenvt.toLowerCase();

                    let match = false;
                    if (type === 'user') match = user.includes(key);
                    else if (type === 'nv') match = tenNV.includes(key);
                    else if (type === 'vt') match = tenVT.includes(key);
                    else match = user.includes(key) || tenNV.includes(key) || tenVT.includes(key);

                    row.style.display = match ? '' : 'none';
                }
            }
        </script>