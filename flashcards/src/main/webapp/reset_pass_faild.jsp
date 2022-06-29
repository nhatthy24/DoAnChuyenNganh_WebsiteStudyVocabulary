<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 6/17/2022
  Time: 2:05 PM
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
</head>

<body class="password_reset show_forgot_password white has-footer has-sticky-header qad-is-showing theme-default"
      itemscope itemtype="http://schema.org/WebPage">

<div class="site">

    <main class="page" id="page" role="main" itemscope itemprop="mainContentOfPage">
        <div class="SiteSimpleLayout">
            <div class="SiteSimpleLayout-background SiteSimpleLayout-background--a"></div>
            <div class="SiteSimpleLayout-background SiteSimpleLayout-background--b"></div>
            <div class="SiteSimpleLayout-background SiteSimpleLayout-background--c"></div>
            <div class="UIContainer">
                <div class="UIDiv SiteSimpleLayout-centered">
                    <h2 class="UIHeading UIHeading--two">Cập nhật mật khẩu không thành công</h2>
                    <div class="UIDiv">
                        <form action="/forgotten/password" method="get">
                            <p class="UIParagraph">Tên người dùng hoặc email không đúng. Vui lòng kiểm tra lại</p>
                            <p class="UIParagraph">Quay về trang chủ <a href="home">Trang chủ</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>

</html>
