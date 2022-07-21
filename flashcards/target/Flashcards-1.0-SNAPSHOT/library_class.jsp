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
    <link rel="stylesheet" href="./css/dialog/base.css">
    <link rel="stylesheet" href="./css/dialog/add_term.css">
    <link rel="stylesheet" href="./css/dialog/confirm_delete.css">
    <link rel="stylesheet" href="./css/dialog/add_member.css">

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
                <button onclick="openDialogAddTermToClass()"
                        class="class__header-top-right-btn class__header-top-right-add-term">
                    <i class="bi bi-plus-lg"></i>
                </button>
                <button onclick="openDialogAddMember()"
                        class="class__header-top-right-btn class__header-top-right-add-people">
                    <i class="bi bi-person-plus"></i>
                </button>
                <button onclick="openDialogAddFolderToClass()"
                        class="class__header-top-right-btn class__header-top-right-add-folder">
                    <i class="bi bi-folder-plus"></i>
                </button>
                <button onclick="openDialogEditClass()"
                        class="class__header-top-right-btn class__header-top-right-edit">
                    <i class="bi bi-pencil"></i>
                </button>
                <button onclick="openDialogConfirmDeleteClass()"
                        class="class__header-top-right-btn class__header-top-right-delete">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        </div>
        <div class="class__header-tab">
            <button id="class__tab-term-btn" onclick="switchTermTab(this)"
                    class="class__header-tab-item class__header-tab-item--active">
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

<div class="modal" id="modal" style="display: none">
    <div class="modal__overlay">

    </div>

    <div class="modal__body">
        <div class="modal__inner" id="modal__inner">

            <div id="modal__without-edit-class" style="display: none">

                <div class="modal__header">
                    <div class="modal__header-title">
                        <span class="modal__header-title-text" id="modal_title">
                            Tùy chọn
                        </span>
                    </div>
                    <button onclick="closeModalLibraryClass()" class="modal__header-close-btn">
                        <i class="bi bi-x"></i>
                    </button>
                </div>

                <div class="modal__body-content" id="modal__body-content">
                    <div class="dialog__add-term" id="dialog__add-term" style="display: none">
                        <div class="dialog__add-term-row">
                            <div class="dialog__add-term-redirect">
                                <a href="#" class="dialog__add-term-redirect-link">
                                    + TẠO HỌC PHẦN MỚI
                                </a>
                            </div>
                        </div>

                        <div class="dialog__add-term-row">
                            <div class="dialog__add-term-item">
                                <p class="dialog__add-term-item-name">
                                    Tien hoa Một học phần kiểm thử Một học phần kiểm thử Một học phần kiểm thử
                                </p>
                                <button class="dialog__add-term-item-btn dialog__add-term-item-btn--plus">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                            </div>

                            <div class="dialog__add-term-item">
                                <p class="dialog__add-term-item-name">
                                    Tien hoa Một học phần kiểm thử Một học phần kiểm thử Một học phần kiểm thử
                                </p>
                                <a href="" class="dialog__add-term-item-btn dialog__add-term-item-btn--minus">
                                    <i class="bi bi-dash-lg"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="dialog__confirm-delete" id="dialog__confirm-delete" style="display: none">
                        <p class="dialog__confirm-delete-name">
                            Lớp học
                        </p>
                        <p class="dialog__confirm-delete-description">
                            Bạn chuẩn bị xoá lớp này. Không ai có thể truy cập vào lớp này nữa.
                        </p>
                        <p class="dialog__confirm-delete-description">
                            Bạn có chắc chắn không? Bạn sẽ không được hoàn tác.
                        </p>

                        <div class="dialog__confirm-delete-action">
                            <button class="dialog__confirm-delete-cancel-btn dialog__confirm-delete-action-btn">
                                Hủy
                            </button>
                            <button class="dialog__confirm-delete-submit-btn dialog__confirm-delete-action-btn">
                                Xóa lớp
                            </button>
                        </div>
                    </div>

                    <div class="dialog__add-term" id="dialog__add-folder" style="display: none">
                        <div class="dialog__add-term-row">
                            <div class="dialog__add-term-redirect">
                                <a href="#" class="dialog__add-term-redirect-link">
                                    + TẠO THƯ MỤC MỚI
                                </a>
                            </div>
                        </div>

                        <div class="dialog__add-term-row">
                            <div class="dialog__add-term-item">
                                <p class="dialog__add-term-item-name">
                                    Thư mục
                                </p>
                                <button class="dialog__add-term-item-btn dialog__add-term-item-btn--plus">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                            </div>

                            <div class="dialog__add-term-item">
                                <p class="dialog__add-term-item-name">
                                    Thư mục khác
                                </p>
                                <a href="" class="dialog__add-term-item-btn dialog__add-term-item-btn--minus">
                                    <i class="bi bi-dash-lg"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="dialog__add-member" id="dialog__add-member" style="display: none">
                        <p class="dialog__add-member-description">
                            Để mời thành viên tham gia lớp học này, hãy nhập tên người dùng hoặc email Quizlet của họ
                            bên dưới (phân tách bằng dấu phẩy hoặc ngắt dòng).
                        </p>
                        <div class="dialog__add-member-action">
                            <div class="dialog__add-member-action-left">
                                <input class="dialog__add-member-action-input" type="text"
                                       placeholder="Nhập tên người dùng hoặc email">
                                <label class="dialog__add-member-action-label">MỜI THÀNH VIÊN</label>
                            </div>
                            <button class="dialog__add-member-action-btn">
                                Gửi lời mời
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal__with-edit-class" style="display: none">
                <div class="dialog__create-class">
                    <button onclick="closeModalLibraryClass()" class="dialog__create-class-btn-close">
                        <i class="fas fa-times"></i>
                    </button>
                    <div class="dialog__create-class-content">
                        <h1 class="dialog__create-class-title">Sửa lớp</h1>
                        <form method="post" action="create-class">
                            <div class="dialog__create-class-form">
                                <input type="text" class="dialog__create-class-input" placeholder="Nhập tên lớp"
                                       name="cname">
                                <label class="dialog__create-class-label">TÊN LỚP</label>
                            </div>
                            <div class="dialog__create-class-form">
            <textarea class="dialog__create-class-input"
                      placeholder="Nhập mô tả (tuỳ chọn)" name="cdescription"></textarea>
                                <label class="dialog__create-class-label">MÔ TẢ</label>
                            </div>
                            <div class="dialog__create-class-form">
                                <input type="text" class="dialog__create-class-input" placeholder="Nhập tên trường"
                                       name="schoolname">
                                <label class="dialog__create-class-label">TRƯỜNG</label>
                            </div>

                            <button class="dialog__create-class-btn" type="submit">
                                Lưu
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="./js/header.js"></script>
    <script src="./js/library_class.js"></script>

</body>

