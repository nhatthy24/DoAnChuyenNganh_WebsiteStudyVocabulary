<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="./css/signup.css">
    <link rel="stylesheet" href="./css/base.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="container__left">
        <h1 class="title-img-cover">Quẳng gánh lo đi mà vui học. Hãy đăng ký ngay hôm nay.</h1>
        <div>
            <h1 class="logo-img-cover">Quizlet</h1>
        </div>
    </div>

    <div class="container__right">
        <div>
            <a class="exit-btn" href="${pageContext.request.contextPath}/home">
                <i class="fas fa-times"></i>
            </a>
        </div>
        <div class="ps-32 pe-32 pb-64">
            <div class="tablist">
                <div class="tablist__item">
                    <a href="login.jsp" class="tablist__item-link">
                        Đăng nhập
                    </a>
                </div>
                <div class="tablist__item">
                    <a href="#" class="tablist__item-link tablist__item-link--active">
                        Đăng ký
                    </a>
                </div>
            </div>

            <div class="social-login">
                <div class="social-login__item">
                    <a href="" class="social-login__item-link">
                        <img class="social-login__item-img" src="./img/facebook_icon.png" alt="">
                        <span class="social-login__item-text">Tiếp tục với Facebook</span>
                        <span></span>
                    </a>
                </div>
                <div class="social-login__item">
                    <a href="" class="social-login__item-link">
                        <img class="social-login__item-img" src="./img/google_icon.png" alt="">
                        <span class="social-login__item-text">Tiếp tục với Google</span>
                        <span></span>
                    </a>
                </div>
            </div>

            <div class="or__line">
                <span class="or__line-text">HOẶC EMAIL</span>
            </div>
            <form action="ProcessSignUp" method="post">
                <div class="signup-form">
                    <div class="signup__form-item">
                        <label id="signup-label-birthday" class="signup__form-item-label">NGÀY SINH</label>
                        <input id="signup-input-birthday" type="date" name="dateOfBirth" class="signup__form-item-input"
                               onblur="checkValidBirthday(this)"
                        >
                    </div>
                    <div class="signup__form-item">
                        <label id="signup-label-email"
                               class="signup__form-item-label">EMAIL</label>
                        <input id="signup-input-email" type="email" name="email"
                               class="signup__form-item-input"
                               placeholder="user@gmail.com"
                               spellcheck="false"
                               onkeyup="checkValidEmail(this)"
                        >
                    </div>
                    <div class="signup__form-item">
                        <label id="signup-label-username" class="signup__form-item-label">TÊN NGƯỜI DÙNG</label>
                        <input id="signup-input-username" type="text" name="username" class="signup__form-item-input"
                               placeholder="dudu123"
                               spellcheck="false"
                               onkeyup="checkValidUsername(this)"
                        >
                    </div>
                    <div class="signup__form-item">
                        <label id="signup-label-password" class="signup__form-item-label">MẬT KHẨU</label>
                        <input id="signup-input-password" type="password" name="password"
                               class="signup__form-item-input"
                               placeholder="Nhập mật khẩu"
                               onkeyup="checkValidPassword(this)"
                        >
                    </div>

                    <button type="submit" id="signup__form-btn" class="signup__form-btn" disabled>
                        ĐĂNG KÝ
                    </button>

                    <div class="route-login">
                        <span class="route-login__text">Bạn đã có tài khoản?</span>
                        <a href="login.jsp" class="route-login__link">
                            Đăng nhập
                        </a>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>

<script src="./js/signup.js"></script>
</body>
</html>