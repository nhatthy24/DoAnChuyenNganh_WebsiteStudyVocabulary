<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 6/17/2022
  Time: 1:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en-us" class="windows webkit chrome cursor">

<head>
    <title>Forgotten Password | Quizlet</title>
    <link rel="stylesheet" type="text/css" href="https://assets.quizlet.com/a/j/dist/c/global.94b13d779d33c16.css">
    <link rel="stylesheet" type="text/css"
          href="https://assets.quizlet.com/a/j/dist/c/password_reset.95aa1937b647b4f.css">
    <link rel="stylesheet" type="text/css" href="https://assets.quizlet.com/a/j/dist/c/ui.b6c3316c0c4b67f.css">
    <link rel="stylesheet" type="text/css" href="https://assets.quizlet.com/a/j/dist/c/common.af8990f9a6eff93.css">
    <link rel="stylesheet" type="text/css"
          href="https://assets.quizlet.com/a/j/dist/c/quizlet_global.84706e3d7b9efd3.css">
    <link as="script" href="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"
          rel="preload">
    <script src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js" async></script>


<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />--%>
<%--    <link rel="stylesheet" href="./css/header.css">--%>
<%--    <link rel="stylesheet" href="./css/base.css">--%>
<%--    <link rel="stylesheet" href="./css/responsive.css">--%>
<%--    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"--%>
<%--          rel="stylesheet">--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>


</head>

<body class="password_reset show_forgot_password white has-footer has-sticky-header qad-is-showing theme-default"
      itemscope itemtype="http://schema.org/WebPage">
<%--<jsp:include page="header.jsp"></jsp:include>--%>
<div class="site">

    <main class="page" id="page" role="main" itemscope itemprop="mainContentOfPage">
        <div class="SiteSimpleLayout">
            <div class="SiteSimpleLayout-background SiteSimpleLayout-background--a"></div>
            <div class="SiteSimpleLayout-background SiteSimpleLayout-background--b"></div>
            <div class="SiteSimpleLayout-background SiteSimpleLayout-background--c"></div>
            <div class="UIContainer">
                <div class="UIDiv SiteSimpleLayout-centered">
                    <h2 class="UIHeading UIHeading--two">Lấy lại mật khẩu</h2>
                    <div class="UIDiv">
                        <form action="forgetpass" method="post">
                            <p class="UIParagraph">Nhập tên người dùng và địa chỉ email mà bạn đã đăng ký tài khoản.
                                Chúng tôi sẽ gửi cho bạn mật khẩu mới.</p>
                            <label
                                    class="UIInput"><span class="UIInput-content">
										<input required autocomplete="username"
                                               class="UIInput-input" name="user_name"
                                               placeholder="Tên người dùng" type="text"><span
                                    class="UIInput-border"></span></span><span class="UIInput-label">Tên người dùng</span></label>
                            <label
                                    class="UIInput"><span class="UIInput-content">
										<input required autocomplete="username"
                                               class="UIInput-input" name="email"
                                               placeholder="Email" type="email"><span
                                    class="UIInput-border"></span></span><span class="UIInput-label">
										Email</span></label>
                            <div class="UIDiv"><button class="UIButton UIButton--hero" type="submit"><span
                                    class="UIButton-wrapper">Gửi</span></button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
<script src="./js/main.js"></script>
<script src="./js/header.js"></script>

</html>
