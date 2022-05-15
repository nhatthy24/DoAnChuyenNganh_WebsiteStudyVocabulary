<%--
  User: TRAN NHAT THY
--%>
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
                        <img src="./img/logo.png" alt="">
                    </div>
                    <div class="navbar__menu">
                        <ul class="navbar__menu-list">
                            <li class="navbar__menu-item">
                                <a href="#" class="navbar__menu-link active">
                                    <span class="navbar__menu-text">Trang chủ</span>
                                </a>
                            </li>
                            <li class="navbar__menu-item ">
                                <button class="navbar__menu-link btn-item" id="navbar__library-btn">
                                        <span class="navbar__menu-text">
                                            Thư viện của bạn
                                            <i class="fas fa-angle-down"></i>
                                        </span>
                                </button>
                            </li>
                            <div class="navbar__library" id="navbar__library" style="display: none">
                                <div class="navbar__library-header">
                                    <ul class="navbar__library-tab">
                                        <li class="navbar__library-tab-item ">
                                            <button class="navbar__library-tab-btn" id="library__tab-term">
                                                Học phần
                                            </button>

                                        </li>
                                        <li class="navbar__library-tab-item active">
                                            <button class="navbar__library-tab-btn" id="library__tab-folder">
                                                Thư mục
                                            </button>
                                        </li>
                                        <li class="navbar__library-tab-item">
                                            <button class="navbar__library-tab-btn" id="library__tab-class">
                                                Lớp học
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="navbar__library-content">

                                    <!-- list term -->

                                    <div id="library-term" class="library__tab-content" style="display: none">
                                        <div class="navbar__library-not-null">
                                            <div class="navbar__library-term">
                                                <ul class="navbar__library-term-list">
                                                    <li class="navbar__library-term-item">
                                                        <a href="#" class="navbar__library-term-link">
                                                                <span class="navbar__library-term-text">
                                                                    Học phần 1
                                                                </span>
                                                            <div class="navbar__term-author">
                                                                <img class="navbar__term-author-img"
                                                                     src="./img/avatar.jpg" alt="">
                                                                <span class="navbar__term-author-name">
                                                                        Nguyễn Văn A
                                                                    </span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="navbar__library-term-item">
                                                        <a href="#" class="navbar__library-term-link">
                                                                <span class="navbar__library-term-text">
                                                                    Học phần 1
                                                                </span>
                                                            <div class="navbar__term-author">
                                                                <img class="navbar__term-author-img"
                                                                     src="./img/avatar.jpg" alt="">
                                                                <span class="navbar__term-author-name">
                                                                        Nguyễn Văn A
                                                                    </span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="navbar__library-term-item">
                                                        <a href="#" class="navbar__library-term-link">
                                                                <span class="navbar__library-term-text">
                                                                    Học phần 1
                                                                </span>
                                                            <div class="navbar__term-author">
                                                                <img class="navbar__term-author-img"
                                                                     src="./img/avatar.jpg" alt="">
                                                                <span class="navbar__term-author-name">
                                                                        Nguyễn Văn A
                                                                    </span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="navbar__library-term-item">
                                                        <a href="#" class="navbar__library-term-link">
                                                                <span class="navbar__library-term-text">
                                                                    Học phần 1
                                                                </span>
                                                            <div class="navbar__term-author">
                                                                <img class="navbar__term-author-img"
                                                                     src="./img/avatar.jpg" alt="">
                                                                <span class="navbar__term-author-name">
                                                                        Nguyễn Văn A
                                                                    </span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="navbar__library-footer">
                                                <a href="#">Xem tất cả học phần</a>
                                            </div>
                                        </div>

                                        <!-- use for list term is null -->

                                        <div class="navbar__library-null" style="display: none">
                                            <div class="navbar__library-null-content">
                                                <img class="navbar__library-null-img"
                                                     src="./img/null-term.png" alt="">

                                                <p class="navbar__library-null-text">
                                                    Tìm kiếm một chủ đề hoặc lớp học để tìm các học phần có
                                                    liên
                                                    quan.
                                                </p>
                                                <a class="navbar__library-null-link" href="#">
                                                    Tìm học phần
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- list folder -->

                                    <div id="library-folder" class="library__tab-content">
                                        <div class="navbar__library-not-null" style="display: none">

                                            <div class="navbar__library-folder">
                                                <ul class="navbar__library-folder-list">
                                                    <li class="navbar__library-folder-item">
                                                        <a href="#" class="navbar__library-folder-link">
                                                            <p class="navbar__library-folder-name">
                                                                hom nay toi dang lam template website cho
                                                                mon do
                                                                an
                                                                cho mon do an chuyen nganh
                                                            </p>
                                                            <p class="navbar__library-folder-des">
                                                                0 học phần
                                                            </p>
                                                        </a>
                                                    </li>
                                                    <li class="navbar__library-folder-item">
                                                        <a href="#" class="navbar__library-folder-link">
                                                            <p class="navbar__library-folder-name">
                                                                hom nay toi dang lam template website cho
                                                                mon do
                                                                an
                                                                cho mon do an chuyen nganh
                                                            </p>
                                                            <p class="navbar__library-folder-des">
                                                                0 học phần
                                                            </p>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="navbar__library-footer">
                                                <a href="#">Xem tất cả thư mục</a>
                                            </div>
                                        </div>

                                        <!-- use for list folder is null -->

                                        <div class="navbar__library-null">
                                            <div class="navbar__library-null-content">
                                                <img class="navbar__library-null-img"
                                                     src="./img/null-folder.png" alt="">

                                                <p class="navbar__library-null-text">
                                                    Sắp xếp tất cả các học phần đang học cho một môn cụ thể.
                                                </p>
                                                <a class="navbar__library-null-link" href="#">
                                                    Tạo thư mục
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- list class -->

                                    <div id="library-class" class="library__tab-content" style="display: none">

                                        <div class="navbar__library-not-null">
                                            <div class="navbar__library-class">
                                                <ul class="navbar__library-class-list">
                                                    <li class="navbar__library-class-item">
                                                        <a href="#" class="navbar__library-class-link">
                                                                <span class="navbar__library-class-text">
                                                                    Lớp học 1
                                                                </span>
                                                            <div class="navbar__class-author">
                                                                <img class="navbar__class-author-img"
                                                                     src="./img/avatar.jpg" alt="">
                                                                <span class="navbar__class-author-name">
                                                                        Nguyễn Văn A
                                                                    </span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="navbar__library-footer">
                                                <a href="#">Xem tất cả lớp học</a>
                                            </div>
                                        </div>

                                        <!-- use for list class is null -->

                                        <div class="navbar__library-null" style="display: none">
                                            <div class="navbar__library-null-content">
                                                <img class="navbar__library-null-img"
                                                     src="./img/null-class.png" alt="">

                                                <p class="navbar__library-null-text">
                                                    Tìm lớp học của giáo viên của bạn trên Quizlet.
                                                </p>
                                                <a class="navbar__library-null-link" href="#">
                                                    Tìm một lớp học
                                                </a>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </ul>

                        <button class="navbar__menu-btn" id="navbar__menu-create-btn">
                                <span class="navbar__menu-text">
                                    Tạo
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            <div class="navbar__create-menu" id="navbar__create-menu" style="display: none">
                                <ul class="navbar__create-menu-list">
                                    <li class="navbar__create-menu-item">
                                        <a href="creation?type=term" class="navbar__create-menu-link">
                                            <i class="far fa-clone"></i>
                                            <span class="navbar__create-menu-text">
                                                    Học phần
                                                </span>
                                        </a>
                                    </li>

                                    <li class="navbar__create-menu-item">
                                        <a href="#" class="navbar__create-menu-link">
                                            <i class="far fa-folder"></i>
                                            <span class="navbar__create-menu-text">
                                                    Thư mục
                                                </span>
                                        </a>
                                    </li>
                                    <li class="navbar__create-menu-item">
                                        <a href="#" class="navbar__create-menu-link">
                                            <i class="fas fa-user-friends"></i>
                                            <span class="navbar__create-menu-text">
                                                    Lớp
                                                </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </button>

                    </div>
                </div>

                <!-- left element -->
                <div class="navbar__right">
                    <div class="navbar__search">
                        <button class="navbar__search-btn"><i class="fas fa-search"></i></button>
                        <input type="text" class="navbar__search-input" placeholder="Học phần, câu hỏi">
                    </div>
                    <div class="navbar__notify">
                        <button class="navbar__notify-btn"><i class="far fa-bell"></i></button>
                    </div>
                    <div class="navbar__user" id="navbar__user">
                        <button class="navbar__user-btn">
                            <img id="navbar__user-btn" src="./img/avatar.jpg" alt="">
                        </button>

                        <div class="navbar__user-menu" id="navbar__user-menu" style="display: none">
                            <div class="navbar__user-header">
                                <img class="navbar__user-img" src="./img/avatar.jpg" alt="">
                                <div class="navbar_user-infor">
                                    <p class="navbar__user-name">
                                        Nguyễn Văn A
                                    </p>
                                    <p class="navbar__user-email">
                                        dukhanhqt@gmail.comffffffffff
                                    </p>
                                </div>
                            </div>

                            <div class="nav__user-line-spread"></div>

                            <ul class="navbar__user-items">
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Hồ sơ
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Tiến độ
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        <button>
                                            Chế độ ban đêm <i class="fas fa-toggle-on"></i>
                                        </button>
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Cài đặt
                                    </a>
                                </li>

                                <div class="nav__user-line-spread"></div>

                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Giới thiệu bạn bè
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Giúp đỡ và phản hồi
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Ứng dụng di dộng
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Blog
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Quyền riêng tư
                                    </a>
                                </li>
                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        Nâng cấp
                                    </a>
                                </li>

                                <div class="nav__user-line-spread"></div>


                                <li class="navbar__user-item">
                                    <a href="#" class="navbar__user-link">
                                        <button>
                                            Đăng xuất
                                        </button>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>
