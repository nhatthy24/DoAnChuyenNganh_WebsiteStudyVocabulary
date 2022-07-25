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
    <title>${title} ${folder.title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"/>
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link rel="stylesheet" href="./css/library_folder.css">
    <link rel="stylesheet" href="./css/dialog/base.css">
    <link rel="stylesheet" href="./css/dialog/add_term.css">
    <link rel="stylesheet" href="./css/dialog/learn_folder.css">
    <link rel="stylesheet" href="./css/dialog/confirm_delete.css">
    <link rel="stylesheet" href="./css/dialog_create_folder.css">

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
                    ${folder.courseList.size()} học phần
                </p>
                <p class="folder__header-left-author">
                        <span class="folder__header-left-author--title">
                            Tạo bởi
                        </span>
                    <span class="folder__header-left-author-name">
                        ${folder.creator}
                        </span>
                </p>
            </div>
            <div class="folder__header-right">
                <button onclick="openDialogAddTerm()" class="folder__header-tool-btn folder__header-tool-btn--add">
                    <i class="bi bi-plus-lg"></i>
                </button>
<%--                <button onclick="openDialogLearn()" class="folder__header-tool-btn folder__header-tool-btn--learn">--%>
<%--                    <i class="fa-solid fa-book-open-reader"></i>--%>
<%--                </button>--%>

<%--                <a class="folder__header-tool-btn folder__header-tool-btn--share" href="">--%>
<%--                    <i class="bi bi-upload"></i>--%>
<%--                </a>--%>

                <button onclick="openDialogEdit()" class="folder__header-tool-btn folder__header-tool-btn--edit">
                    <i class="bi bi-pencil"></i>
                </button>
                <button onclick="openDialogConfirmDelete()"
                        class="folder__header-tool-btn folder__header-tool-btn--delete">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        </div>
        <div class="folder__header-title">
            <i class="bi bi-folder folder__header-title-icon"></i>
            <p class="folder__header-title-text">Thư mục ${folder.title}</p>
        </div>
        <div class="folder__header-description">
                <span class="folder__header-description-text">
                    ${folder.description}
                </span>
        </div>
    </div>

    <div class="folder__content">

        <div class="folder__dashboard-main">

            <c:if test="${folder.courseList.size()==0}">
            <div class="folder__content-null">
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
            </c:if>
            <c:if test="${folder.courseList.size()!=0}">
            <div class="folder__content-main">
                <c:forEach items="${courses}" var="course">
                <div class="folder__card">
                    <div class="folder__card-header">
                        <a href="detail-term?course_id=${course.id}" class="folder__card-title">
                            ${course.courseName}
                        </a>
                        <p class="folder__card-count">
                            ${course.cards.size()} thuật ngữ
                        </p>
                    </div>
                    <div class="folder__card-footer">
                        <div class="folder__card-footer-author">
                            <div class="folder__card-footer-author-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>
                            <div class="folder__card-footer-author-name">
                                ${course.creatorName}
                            </div>
                        </div>
                        <div class="folder__card-footer-delete">
                            <a href="library-folder?folder_id=${folder.folderId}&type=delete&course_id=${course.id}" class="folder__card-footer-delete-btn">
                                <i style="color: #ff5252" class="bi bi-trash"></i>
                            </a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
        </div>

        <div class="folder__dashboard-adz">

        </div>
    </div>
</div>

<div class="modal" id="modal" style="display: none">
    <div class="modal__overlay">

    </div>

    <div class="modal__body">
        <div class="modal__inner" id="modal__inner">
            <div id="modal__without-edit" style="display: none">
                <div class="modal__header">
                    <div class="modal__header-title">
                        <span class="modal__header-title-text" id="modal_title">
                            Tùy chọn
                        </span>
                    </div>
                    <button onclick="closeModalLibraryFolder()" class="modal__header-close-btn">
                        <i class="bi bi-x"></i>
                    </button>
                </div>

                <div class="modal__body-content" id="modal__body-content">
                    <div class="dialog__add-term" id="dialog__add-term" style="display: none">
                        <div class="dialog__add-term-row">
                            <div class="dialog__add-term-redirect">
                                <a href="created-term?type=term" class="dialog__add-term-redirect-link">
                                    + TẠO HỌC PHẦN MỚI
                                </a>
                            </div>
                        </div>

                        <div class="dialog__add-term-row">
                        <c:forEach items="${coursesInAddBox}" var="course">
                            <div class="dialog__add-term-item">
                                <p class="dialog__add-term-item-name">
                                        ${course.courseName}
                                </p>
                                <a href="library-folder?folder_id=${folder.folderId}&type=add&course_id=${course.id}" class="dialog__add-term-item-btn dialog__add-term-item-btn--plus">
                                    <i class="bi bi-plus-lg"></i>
                                </a>
                            </div>
                        </c:forEach>
                        </div>
                    </div>

<%--                    <div class="dialog__learn-folder" id="dialog__learn-folder" style="display: none">--%>
<%--                        <div class="dialog__learn-folder-content">--%>
<%--                            <a href="" class="dialog__learn-folder-link">--%>
<%--                                <img src="./img/library_folder/dialog_learn/learn.png" alt=""--%>
<%--                                     class="dialog__learn-folder-link-img">--%>
<%--                                <p class="dialog__learn-folder-content-name">Thẻ ghi nhớ</p>--%>
<%--                            </a>--%>
<%--                            <a href="" class="dialog__learn-folder-link">--%>
<%--                                <img src="./img/library_folder/dialog_learn/write.png" alt=""--%>
<%--                                     class="dialog__learn-folder-link-img">--%>
<%--                                <p class="dialog__learn-folder-content-name">Viết</p>--%>
<%--                            </a>--%>
<%--                            <a href="" class="dialog__learn-folder-link">--%>
<%--                                <img src="./img/library_folder/dialog_learn/speaker.png" alt=""--%>
<%--                                     class="dialog__learn-folder-link-img">--%>
<%--                                <p class="dialog__learn-folder-content-name">Chính tả</p>--%>
<%--                            </a>--%>
<%--                            <a href="" class="dialog__learn-folder-link">--%>
<%--                                <img src="./img/library_folder/dialog_learn/check.png" alt=""--%>
<%--                                     class="dialog__learn-folder-link-img">--%>
<%--                                <p class="dialog__learn-folder-content-name">Kiểm tra</p>--%>
<%--                            </a>--%>
<%--                            <a href="" class="dialog__learn-folder-link">--%>
<%--                                <img src="./img/library_folder/dialog_learn/ghe_the.png" alt=""--%>
<%--                                     class="dialog__learn-folder-link-img">--%>
<%--                                <p class="dialog__learn-folder-content-name">Ghép thẻ</p>--%>
<%--                            </a>--%>
<%--                            <a href="" class="dialog__learn-folder-link">--%>
<%--                                <img src="./img/library_folder/dialog_learn/thien_thach.png" alt=""--%>
<%--                                     class="dialog__learn-folder-link-img">--%>
<%--                                <p class="dialog__learn-folder-content-name">Thiên thạch</p>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="dialog__confirm-delete" id="dialog__confirm-delete">
                        <p class="dialog__confirm-delete-name">
                            ${folder.title}
                        </p>
                        <p class="dialog__confirm-delete-description">
                            Xóa thư mục là thao tác VĨNH VIỄN. Bạn không thể hoàn tác.
                        </p>
                        <p class="dialog__confirm-delete-description">
                            Bạn chắc chắn muốn xóa thư mục này? Học phần trong thư mục này sẽ không bị xoá.
                        </p>

                        <div class="dialog__confirm-delete-action">
                            <button onclick="closeModalLibraryFolder()" class="dialog__confirm-delete-cancel-btn dialog__confirm-delete-action-btn">
                                Hủy
                            </button>
                            <button class="dialog__confirm-delete-submit-btn dialog__confirm-delete-action-btn">
                                <a href="delete-folder?folder_id=${folder.folderId}" style="color: #fff">Xóa thư mục</a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal__with-edit" style="display: none">
                <div class="dialog__create-folder">
                    <button onclick="closeModalLibraryFolder()" class="dialog__create-folder-btn-close">
                        <i class="fas fa-times"></i>
                    </button>
                    <form action="edit-folder" method="post">
                        <div class="dialog__create-folder-content">
                            <h1 class="dialog__create-folder-title">Sửa thư mục</h1>
                            <div class="dialog__create-folder-input">
                                <input type="text" name="fname" class="dialog__create-folder-input-text" placeholder="Nhập tiêu đề" value="${folder.title}" >
                            </div>
                            <div class="dialog__create-folder-area">
                                <textarea class="dialog__create-folder-area-text" placeholder="Nhập mô tả" name="fdescription">${folder.description}</textarea>
                            </div>
                            <div class="dialog_create-folder-input">
                                <input type="text" class="dialog__create-folder-input-text" name="fid" value="${folder.folderId}" hidden>
                            </div>
                        </div>
                        <div class="dialog__create-folder-separate"></div>

                        <div class="dialog__create-folder-btn">
                            <button class="dialog__create-folder-btn-create" type="submit">Lưu</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="./js/header.js"></script>
<script src="./js/library_folder.js"></script>
</body>

