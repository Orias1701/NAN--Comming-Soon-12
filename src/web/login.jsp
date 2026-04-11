<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập hệ thống - Hotel Manager</title>
        <link rel="stylesheet" href="css/style.css">
    <body class="login-body">
        <div class="login-card">
            <div class="login-left">
                <div class="brand-icon">🏨</div>
                <div class="brand-name">HOTEL MANAGER</div>
                <div class="brand-slogan">Quản lý chuyên nghiệp</div>
            </div>
            <div class="login-right">
                <div class="login-title">ĐĂNG NHẬP</div>
                <form action="login" method="post">
                    <div class="form-group">
                        <label for="username">Tài khoản</label>
                        <input type="text" id="username" name="username" class="login-input" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="password" class="login-input" required>
                    </div>
                    <button type="submit" class="btn-swing btn-primary login-btn">ĐĂNG NHẬP</button>
                    <% if(request.getAttribute("error") !=null) { %>
                        <div class="error-msg">
                            <%= request.getAttribute("error") %>
                        </div>
                        <% } %>
                </form>
            </div>
        </div>
    </body>

    </html>