<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 7/20/2022
  Time: 10:53 PM
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
    <link rel="stylesheet" href="./css/library_class.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="class__container">
    <div class="class__header">
        <div class="class__header-top">
            <div class="class__header-top-left">
                <i class="bi bi-people class__header-top-left-icon"></i>
                <p class="class__header-top-left-title">
                    Lớp học
                </p>
            </div>
            <div class="class__header-top-right">
                <a href="" class="class__header-top-right-btn class__header-top-right-add-term">
                    <i class="bi bi-plus-lg"></i>
                </a>
                <a href="" class="class__header-top-right-btn class__header-top-right-add-people">
                    <i class="bi bi-person-plus"></i>
                </a>
                <a href="" class="class__header-top-right-btn class__header-top-right-add-folder">
                    <i class="bi bi-folder-plus"></i>
                </a>
                <a href="" class="class__header-top-right-btn class__header-top-right-edit">
                    <i class="bi bi-pencil"></i>
                </a>
                <button class="class__header-top-right-btn class__header-top-right-delete">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        </div>
        <div class="class__header-tab">
            <button id="class__tab-term-btn" onclick="switchTermTab(this)" class="class__header-tab-item class__header-tab-item--active">
                Các học phần
            </button>
            <button id="class__tab-member-btn" onclick="switchMemberTab(this)" class="class__header-tab-item ">
                Thành viên
            </button>
        </div>
    </div>

    <div class="class__content">
        <div class="class__dashboard-main">

            <div id="class__content-terms" class="class__content-terms">
                <div class="class__content-null" style="display: none;">
                    <p class="class__content-null-title">
                        Lớp học này chưa có học phần nào
                    </p>
                    <p class="class__content-null-description">
                        Thêm một học phần hiện có hoặc tạo học phần mới để chia sẻ.
                    </p>
                    <a href="" class="class__content-null-link">
                        Thêm học phần
                    </a>
                </div>

                <div>
                    <div class="class__content-separate">
                            <span class="class__content-separate-label">
                                THƯ MỤC
                            </span>
                        <div class="class__content-separate-line">
                        </div>
                    </div>


                    <div class="class__content-folder">
                        <div class="class__content-folder-card">
                            <a href="" class="class__content-folder-card-link">
                                <div class="class__content-folder-card-content">
                                    <span class="class__content-folder-card-count">0 học phần</span>
                                    <div class="class__content-folder-card-name">
                                        <i class="bi bi-folder class__content-folder-card-icon"></i>
                                        <p class="class__content-folder-card-name-text">Thư mục</p>
                                    </div>
                                </div>
                            </a>
                            <button class="class__content-folder-card-action">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>

                        <div class="class__content-folder-card">
                            <a href="" class="class__content-folder-card-link">
                                <div class="class__content-folder-card-content">
                                    <span class="class__content-folder-card-count">0 học phần</span>
                                    <div class="class__content-folder-card-name">
                                        <i class="bi bi-folder class__content-folder-card-icon"></i>
                                        <p class="class__content-folder-card-name-text">Thư mục</p>
                                    </div>
                                </div>
                            </a>
                            <button class="class__content-folder-card-action">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>

                    </div>


                    <div class="class__content-separate" style="padding-top: 20px;">
                            <span class="class__content-separate-label">
                                HỌC PHẦN
                            </span>
                        <div class="class__content-separate-line">
                        </div>
                    </div>


                    <div class="class__content-term">
                        <div class="class__content-term-card">
                            <a href="" class="class__content-term-card-link">
                                <div class="class__content-term-card-content">
                                    <div class="class__content-term-card-top">
                                        <span class="class__content-term-card-count">5 thuật ngữ</span>
                                        <span class="class__content-term-card-author">Khanh_Du5</span>
                                        <span class="class__content-term-card-class">Lớp học</span>
                                    </div>
                                    <div class="class__content-term-card-name">
                                        <p class="class__content-term-card-name-text">Sinh học</p>
                                    </div>
                                </div>
                            </a>
                            <button class="class__content-term-card-action">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>

                        <div class="class__content-term-card">
                            <a href="" class="class__content-term-card-link">
                                <div class="class__content-term-card-content">
                                    <div class="class__content-term-card-top">
                                        <span class="class__content-term-card-count">5 thuật ngữ</span>
                                        <span class="class__content-term-card-author">Khanh_Du5</span>
                                        <span class="class__content-term-card-class">Lớp học</span>
                                    </div>
                                    <div class="class__content-term-card-name">
                                        <p class="class__content-term-card-name-text">Sinh học</p>
                                    </div>
                                </div>
                            </a>
                            <button class="class__content-term-card-action">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="class__content-member" class="class__content-member" style="display: none">
                <div class="class__content-member-share">
                    <p class="class__content-member-share-title">
                        Chia sẻ liên kết này với các bạn cùng lớp của bạn
                    </p>
                    <p class="class__content-member-share-description">
                        Bất kỳ ai có URL đều có thể đăng ký và tự động tham gia lớp của bạn
                    </p>
                    <input type="text" value="https://quizlet.com/join/evRCqk6fR?i=4d0ln1&x=1rqt"
                           class="class__content-member-share-input" readonly><br>

                    <button class="class__content-member-share-copy">
                        Chép liên kết
                    </button>
                </div>

                <div class="class__content-separate">
                        <span class="class__content-separate-label">
                            THÀNH VIÊN
                        </span>
                    <div class="class__content-separate-line">
                    </div>
                </div>

                <div class="class__content-member-list">
                    <div class="class__content-member-card">
                        <img class="class__content-member-card-avatar"
                             src="https://gtjai.com.vn/wp-content/uploads/2021/07/avt.png" alt=""/>
                        <div class="class__content-member-card-infor">
                            <p class="class__content-member-card-infor-role">
                                Quản trị viên lớp học
                            </p>
                            <p class="class__content-member-card-infor-name">
                                Khanh_Du5
                            </p>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="class__dashboard-adz">
            <div class="class__content-detail">
                <p class="class__content-detail-title">
                    CHI TIẾT LỚP HỌC
                </p>
                <div class="class__content-detail-item">
                    <i class="bi bi-building class__content-detail-item-icon"></i>
                    <p class="class__content-detail-item-text">
                        Nông Lâm University, Ho Chi Minh City
                    </p>
                </div>
                <div class="class__content-detail-item">
                    <i class="bi bi-stickies class__content-detail-item-icon"></i>
                    <p class="class__content-detail-item-text">
                        0 học phần
                    </p>
                </div>
                <div class="class__content-detail-item">
                    <i class="bi bi-person class__content-detail-item-icon"></i>
                    <p class="class__content-detail-item-text">
                        1 thành viên
                    </p>
                </div>
                <div class="class__content-detail-item">
                    <i class="bi bi-info-circle class__content-detail-item-icon"></i>
                    <p class="class__content-detail-item-text">
                        This API provides the largest webcomics data in the world to create a comic
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="./js/header.js"></script>
<script src="./js/library_class.js"></script>

</body>

