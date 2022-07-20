<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 7/20/2022
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"/>
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link rel="stylesheet" href="./css/library_folder.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="folder__container">
    <div class="folder__header">
        <div class="folder__header-top">
            <div class="folder__header-left">
                <p class="folder__header-left-count">
                    0 học phần
                </p>
                <p class="folder__header-left-author">
                        <span class="folder__header-left-author--title">
                            Tạo bởi
                        </span>
                    <span class="folder__header-left-author-name">
                            Khanh_Du5
                        </span>
                </p>
            </div>
            <div class="folder__header-right">
                <a class="folder__header-tool-btn folder__header-tool-btn--add" href="">
                    <i class="bi bi-plus-lg"></i>
                </a>
                <a class="folder__header-tool-btn folder__header-tool-btn--edit" href="">
                    <i class="bi bi-pencil"></i>
                </a>
                <button class="folder__header-tool-btn folder__header-tool-btn--delete">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        </div>
        <div class="folder__header-title">
            <i class="bi bi-folder folder__header-title-icon"></i>
            <p class="folder__header-title-text">Thư mục mới</p>
        </div>
        <div class="folder__header-description">
                <span class="folder__header-description-text">
                    Nothing
                </span>
        </div>
    </div>

    <div class="folder__content">

        <div class="folder__dashboard-main">


            <div class="folder__content-null" style="display: none">
                <p class="folder__content-null-title">
                    Thư mục này chưa có học phần
                </p>
                <p class="folder__content-null-description">
                    Sắp xếp mọi học phần của bạn theo thư mục
                </p>
                <a href="" class="folder__content-null-link">
                    Thêm học phần
                </a>
            </div>


            <div class="folder__content-main">

                <div class="folder__card">
                    <div class="folder__card-header">
                        <a href="#" class="folder__card-title">
                            This API provides the largest webcomics data in the world to create a comic This API
                            provides the largest webcomics data in the world to create a comic
                        </a>
                        <p class="folder__card-count">
                            20 thuật ngữ
                        </p>
                    </div>
                    <div class="folder__card-footer">
                        <div class="folder__card-footer-author">
                            <div class="folder__card-footer-author-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>
                            <div class="folder__card-footer-author-name">
                                Khanh_Du5
                            </div>
                        </div>
                        <div class="folder__card-footer-delete">
                            <a href="" class="folder__card-footer-delete-btn">
                                <i class="bi bi-trash"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="folder__card">
                    <div class="folder__card-header">

                        <a href="#" class="folder__card-title">
                            This API provides the largest webcomics data in the world to create a comic This API
                            provides the largest webcomics data in the world to create a comic
                        </a>
                        <p class="folder__card-count">
                            20 thuật ngữ
                        </p>
                    </div>
                    <div class="folder__card-footer">
                        <div class="folder__card-footer-author">
                            <div class="folder__card-footer-author-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>
                            <div class="folder__card-footer-author-name">
                                Khanh_Du5
                            </div>
                        </div>
                        <div class="folder__card-footer-delete">
                            <a href="" class="folder__card-footer-delete-btn">
                                <i class="bi bi-trash"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="folder__card">
                    <div class="folder__card-header">

                        <a href="#" class="folder__card-title">
                            This API provides the largest webcomics data in the world to create a comic
                        </a>
                        <p class="folder__card-count">
                            20 thuật ngữ
                        </p>
                    </div>
                    <div class="folder__card-footer">
                        <div class="folder__card-footer-author">
                            <div class="folder__card-footer-author-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>
                            <div class="folder__card-footer-author-name">
                                Khanh_Du5
                            </div>
                        </div>
                        <div class="folder__card-footer-delete">
                            <a href="" class="folder__card-footer-delete-btn">
                                <i class="bi bi-trash"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="folder__card">
                    <div class="folder__card-header">
                        <a href="#" class="folder__card-title">
                            This API provides the largest webcomics data in the world to create a comic
                        </a>
                        <p class="folder__card-count">
                            20 thuật ngữ
                        </p>
                    </div>
                    <div class="folder__card-footer">
                        <div class="folder__card-footer-author">
                            <div class="folder__card-footer-author-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>
                            <div class="folder__card-footer-author-name">
                                Khanh_Du5
                            </div>
                        </div>
                        <div class="folder__card-footer-delete">
                            <a href="" class="folder__card-footer-delete-btn">
                                <i class="bi bi-trash"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="folder__dashboard-adz">

        </div>
    </div>
</div>
<script src="./js/header.js"></script>
</body>

