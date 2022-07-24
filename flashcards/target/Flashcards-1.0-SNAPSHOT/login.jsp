<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/base.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="container__left">
        <h1 class="title-img-cover">Học hiệu quả mà thật thoải mái.</h1>
        <div>
            <h1 class="logo-img-cover">Flashcards</h1>
        </div>
    </div>

    <div class="container__right">
        <div>
            <a class="exit-btn" href="${pageContext.request.contextPath}/">
                <i class="fas fa-times"></i>
            </a>
        </div>
        <div class="ps-32 pe-32 pb-64">
            <div class="tablist">
                <div class="tablist__item">
                    <a href="#" class="tablist__item-link tablist__item-link--active">
                        Đăng nhập
                    </a>
                </div>
                <div class="tablist__item">
                    <a href="signup.jsp" class="tablist__item-link">
                        Đăng ký
                    </a>
                </div>
            </div>
            <div class="social-login">
                <div class="social-login__item">
                    <a href="" class="social-login__item-link">
                        <img width="30" src="./img/facebook_icon.png" alt="">
                        <span class="social-login__item-text">Đăng nhập bằng Facebook</span>
                        <span></span>
                    </a>
                </div>
                <div class="social-login__item">
                    <a href="" class="social-login__item-link">
                        <img width="30" src="./img/google_icon.png" alt="">
                        <span class="social-login__item-text">Đăng nhập bằng Google</span>
                        <span></span>
                    </a>
                </div>
            </div>
            <form onsubmit="return checkValidForm()" action="ProcessLogIn" method="post">
                <div class="login-form">
                    <div class="login-form__item">
                        <input id="login-form-input-username" class="login-form-input"
                               spellcheck="false"
                               type="text" name="username"
                               placeholder="Nhập email hoặc tên người dùng của bạn" required
                               onkeyup="checkUsername()">
                        <label id="login-label-username" class="login-form-label">TÊN NGƯỜI DÙNG</label>
                    </div>
                    <div class="login-form__item">
                        <input id="login-form-input-password" class="login-form-input" type="password"
                               name="password" placeholder="Nhập mật khẩu" required
                               spellcheck="false"
                               onkeyup="checkPassword()">
                        <label id="login-label-password" class="login-form-label">MẬT KHẨU</label>
                    </div>

                    <div class="route-forget-password">
                        <a href="reset_pass.jsp" class="route-forget-password__item">
                            Quên mật khẩu?
                        </a>
                    </div>

                    <button onclick="checkValidForm()" type="submit" class="login-submit-btn">Đăng nhập</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="./js/login.js"></script>
</body>
</html>