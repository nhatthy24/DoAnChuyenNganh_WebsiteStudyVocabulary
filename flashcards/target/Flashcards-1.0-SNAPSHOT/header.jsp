<%-- User: TRAN NHAT THY --%>
<%@page import="com.flashcards.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<header>
    <div class="container-fluid">
        <div class="row">
            <div class="navbar">
                <!-- right element -->
                <div class="navbar__left">
                    <div class="navbar__logo">
                        <a href="${pageContext.request.contextPath}/home">
                            <img src="./img/logo.png" alt="">
                        </a>
                    </div>
                    <div class="navbar__menu">
                        <ul class="navbar__menu-list">
                            <li class="navbar__menu-item">
                                <a href="${pageContext.request.contextPath}/home" class="navbar__menu-link active">
                                    <span class="navbar__menu-text">Trang chủ</span>
                                </a>
                            </li>
                            <c:if test="${sessionScope.user_id!=null}">
                                <li class="navbar__menu-item ">
                                    <button class="navbar__menu-link btn-item" onclick="showLibraryDialog()"
                                            id="navbar__library-btn">
                                    <span class="navbar__menu-text">
                                        Thư viện của bạn
                                        <i class="fas fa-angle-down"></i>
                                    </span>
                                    </button>
                                </li>
                            </c:if>
                            <div class="navbar__library" id="navbar__library" style="display: none">
                                <div class="navbar__library-header">
                                    <ul class="navbar__library-tab">
                                        <li class="navbar__library-tab-item ">
                                            <button class="navbar__library-tab-btn" id="library__tab-term"
                                                    onclick="switchLibraryTab(this)">Học phần
                                            </button>
                                        </li>
                                        <li class="navbar__library-tab-item active">
                                            <button class="navbar__library-tab-btn" id="library__tab-folder"
                                                    onclick="switchLibraryTab(this)">Thư mục
                                            </button>
                                        </li>
                                        <li class="navbar__library-tab-item">
                                            <button class="navbar__library-tab-btn" id="library__tab-class"
                                                    onclick="switchLibraryTab(this)">Lớp học
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="navbar__library-content">
                                    <!-- list term -->
                                    <div id="library-term" class="library__tab-content"
                                         style="display: none">
                                        <c:choose>
                                            <c:when test="${sessionScope.listcourses.size()>0}">
                                                <div class="navbar__library-not-null">
                                                    <div class="navbar__library-term">
                                                        <ul class="navbar__library-term-list">
                                                            <c:forEach items="${sessionScope.listcourses}" var="lc">
                                                                <li class="navbar__library-term-item">
                                                                    <a href="detail-term?course_id=${lc.id}"
                                                                       class="navbar__library-term-link">
                                                            <span class="navbar__library-term-text">
                                                                    ${lc.courseName}
                                                            </span>
                                                                        <div class="navbar__term-author">
                                                                            <img class="navbar__term-author-img"
                                                                                 src="${lc.getAvatarCreator()}" alt="">
                                                                            <span class="navbar__term-author-name">
                                                                                    ${lc.creatorName}
                                                                            </span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    <div class="navbar__library-footer">
                                                        <a href="library-detail">Xem tất cả học phần</a>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="navbar__library-null">
                                                    <div class="navbar__library-null-content">
                                                        <img class="navbar__library-null-img"
                                                             src="./img/null-term.png" alt="">
                                                        <p class="navbar__library-null-text">
                                                            Bạn chưa có học phần nào được tạo
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- list folder -->
                                    <div id="library-folder" class="library__tab-content">
                                        <c:choose>
                                            <c:when test="${sessionScope.listfolders.size()>0}">
                                                <div class="navbar__library-not-null">
                                                    <div class="navbar__library-folder">
                                                        <ul class="navbar__library-folder-list">
                                                            <c:forEach items="${sessionScope.listfolders}" var="lf">
                                                                <li class="navbar__library-folder-item">
                                                                    <a href="library-folder?folder_id=${lf.folderId}"
                                                                       class="navbar__library-folder-link">
                                                                        <p class="navbar__library-folder-name">
                                                                                ${lf.title}
                                                                        </p>
                                                                        <p class="navbar__library-folder-des">${lf.courseList.size()}
                                                                            học phần</p>
                                                                    </a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    <div class="navbar__library-footer">
                                                        <a href="library-detail">Xem tất cả thư mục</a>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="navbar__library-null">
                                                    <div class="navbar__library-null-content">
                                                        <img class="navbar__library-null-img"
                                                             src="./img/null-folder.png" alt="">
                                                        <p class="navbar__library-null-text">
                                                            Bạn chưa có thư mục nào được tạo</p>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- list class -->

                                    <div id="library-class" class="library__tab-content"
                                         style="display: none">
                                        <c:choose>
                                            <c:when test="${sessionScope.listclassrooms.size()>0}">
                                                <div class="navbar__library-not-null">
                                                    <div class="navbar__library-class">
                                                        <ul class="navbar__library-class-list">
                                                            <c:forEach items="${sessionScope.listclassrooms}" var="lr">
                                                                <li class="navbar__library-class-item">
                                                                    <a href="library-class?class_id=${lr.classID}"
                                                                       class="navbar__library-class-link">
                                                            <span class="navbar__library-class-text">
                                                                    ${lr.title}
                                                            </span>
                                                                        <div class="navbar__class-author">
                                                                            <img class="navbar__class-author-img"
                                                                                 src="./img/avatar.jpg" alt="">
                                                                            <span class="navbar__class-author-name">
                                                                                    ${lr.creator}
                                                                            </span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>

                                                    <div class="navbar__library-footer">
                                                        <a href="library-detail">Xem tất cả lớp học</a>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="navbar__library-null">
                                                    <div class="navbar__library-null-content">
                                                        <img class="navbar__library-null-img"
                                                             src="./img/null-class.png" alt="">

                                                        <p class="navbar__library-null-text">
                                                            Bạn chưa có lớp nào được tạo
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </div>
                    <%--                </ul>--%>
                    <c:if test="${sessionScope.user==null}">
                        <a href="ProcessLogIn" class="navbar__menu-btn"
                           id="navbar__menu-create-btn">
                             <span class="navbar__menu-text">
                                Tạo <i class="fas fa-angle-down"></i>
                            </span>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <button class="navbar__menu-btn" onclick="showCreateButton()" id="navbar__menu-create-btn">
                            <span class="navbar__menu-text">
                                Tạo <i class="fas fa-angle-down"></i>
                            </span>

                            <div class="navbar__create-menu" id="navbar__create-menu"
                                 style="display: none">
                                <ul class="navbar__create-menu-list">
                                    <li class="navbar__create-menu-item">
                                        <a href="creation?type=term" class="navbar__create-menu-link">
                                            <i class="far fa-clone"></i>
                                            <span class="navbar__create-menu-text">Học phần</span>
                                        </a>
                                    </li>

                                    <li class="navbar__create-menu-item">
                                        <a href="javascript:showDialogCreateFolder()" class="navbar__create-menu-link">
                                            <i class="far fa-folder"></i>
                                            <span class="navbar__create-menu-text">Thư mục</span>
                                        </a>
                                    </li>
                                    <li class="navbar__create-menu-item">
                                        <a href="javascript:showDialogCreateClass()" class="navbar__create-menu-link">
                                            <i class="fas fa-user-friends"></i>
                                            <span class="navbar__create-menu-text"> Lớp </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </button>
                    </c:if>
                </div>


                <!-- left element -->
                <div class="navbar__right">
                    <form action="home" method="get" style="margin-bottom: 0" accept-charset="UTF-8">
                        <div class="navbar__search">
                            <button type="submit" class="navbar__search-btn">
                                <i class="fas fa-search"></i>
                            </button>
                            <input name="course-name" type="text" class="navbar__search-input"
                                   placeholder="Nhập tên học phần ...">
                        </div>
                    </form>
                    <c:if test="${sessionScope.user==null}">
                        <div class="navbar__login-null">
                            <a class="navbar__login-null-btn login-btn"
                               href="${pageContext.request.contextPath}/ProcessLogIn">Đăng nhập</a>
                            <a class="navbar__login-null-btn register-btn"
                               href="${pageContext.request.contextPath}/ProcessSignUp">Đăng ký</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <div class="navbar__login">
                            <div class="navbar__notify">
                                <button class="navbar__notify-btn">
                                    <i class="far fa-bell"></i>
                                </button>
                            </div>
                            <div class="navbar__user" id="navbar__user">
                                <button class="navbar__user-btn"
                                        onclick="showAccountDialog()">
                                    <img id="navbar__user-btn" src="${sessionScope.user.avatar}" alt="">
                                </button>
                                <div class="navbar__user-menu" id="navbar__user-menu" style="display: none">
                                    <div class="navbar__user-header">
                                        <img class="navbar__user-img" src="${sessionScope.user.avatar}" alt="">
                                        <div class="navbar_user-infor">
                                            <p class="navbar__user-name">
                                                    ${sessionScope.user.username}
                                            </p>
                                            <p class="navbar__user-email">
                                                    ${sessionScope.user.email}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="nav__user-line-spread"></div>
                                    <ul class="navbar__user-items">
                                        <li class="navbar__user-item">
                                            <a href="settinguser" class="navbar__user-link"> Cài đặt </a>
                                        </li>
                                        <div class="nav__user-line-spread"></div>
                                        <li class="navbar__user-item">
                                            <a href="LogOut" class="navbar__user-link">
                                                Đăng xuất
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="modal_create-folder-class" style="display: none">
        <div class="modal__overlay">
        </div>
        <div class="modal__body">
            <div class="modal__inner" id="modal__inner">
                <div class="dialog__create-folder">
                    <div id="dialog-create-folder" style="display: none">
                        <jsp:include page="dialog_create_folder.jsp"></jsp:include>
                    </div>
                    <div id="dialog-create-class" style="display: none">
                        <jsp:include page="dialog_create_class.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>

