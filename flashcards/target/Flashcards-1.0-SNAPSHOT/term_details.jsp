<%--
  User: TRAN NHAT THY
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/term_details.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="term__container">
        <h1 class="term__title">
            ${course.courseName}
        </h1>
        <div class="term__content">
            <div class="study__mode">
                <div class="study__mode-title">
                    HỌC
                </div>
                <ul class="study__mode-content">
                    <li class="study__mode-item">
                        <a href="#" class="study__mode-link">
                            <i class="bi bi-back"></i>
                            <span class="study__mode-text">
                                Thẻ ghi nhớ
                            </span>
                        </a>
                    </li>
                    <li class="study__mode-item">
                        <a href="#" class="study__mode-link">
                            <i class="bi bi-info-circle"></i>
                            <span class="study__mode-text">
                                Học
                            </span>
                        </a>
                    </li>
                    <li class="study__mode-item">
                        <a href="#" class="study__mode-link">
                            <i class="fas fa-pen-nib"></i>
                            <span class="study__mode-text">
                                Viết
                            </span>
                        </a>
                    </li>


                    <li class="study__mode-item">
                        <a href="#" class="study__mode-link">
                            <i class="fas fa-volume-up"></i>
                            <span class="study__mode-text">
                                Chính tả
                            </span>
                        </a>
                    </li>

                    <li class="study__mode-item">
                        <a href="#" class="study__mode-link">
                            <i class="bi bi-file-earmark-check-fill"></i>
                            <span class="study__mode-text">
                                Kiểm tra
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="term__card-study">
                <div class="term__card-list">
                    <c:forEach items="${cards}" var="card">
                    <div class="term__card-item">
                        <button class="term__card-word-text term__card-text" onclick="flipWordToDefinition(this)">
                            ${card.term}
                        </button>
                        <button class="term__card-definition-text term__card-text" onclick="flipDefinitionToWord(this)">
                            ${card.meaning}
                        </button>
                    </div>
                    </c:forEach>
                </div>
                <div class="term__card-control">
                    <div></div>
                    <div class="card__control-slide">
                        <button class="card__control-prev-btn">
                            <i class="fas fa-arrow-left"></i>
                        </button>
                        <div class="card__control-progress-index">
                            <span class="card__control-progress-index-current" id="current-slide">
                                1
                            </span>
                            <span class="card__control-progress-index-separator">
                                /
                            </span>
                            <span class="card__control-progress-index-total" id="total-slide">

                            </span>
                        </div>
                        <button class="card__control-next-btn">
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>

                    <button class="card__control-fullscreen-btn">
                        <i class="fas fa-expand"></i>
                    </button>
                </div>
            </div>

        </div>

        <div class="term__information">
            <div class="term__information-header">
                <div class="term__information-author">
                    <img class="term__information-author-avatar" src="./assets/img/avatar.jpg" alt="">

                    <div class="term__information-author-info">
                        <p class="term__information-author-info-text">
                            Tạo bởi
                        </p>
                        <p class="term__information-author-info-name">
                            Nguyễn Văn A
                        </p>
                    </div>
                </div>

                <div class="term__information-tool">
                    <button class="term__information-tool-item term__information-tool-add"
                            id="add__term-to-folder-class-btn">
                        <i class="fas fa-plus"></i>
                    </button>
                    <a href="#" class="term__information-tool-item term__information-tool-edit">
                        <i class="fas fa-pen"></i>
                    </a>
                    <button class="term__information-tool-item term__information-tool-share"
                            id="term__information-tool-share">
                        <i class="bi bi-upload"></i>
                    </button>
                    <button class="term__information-tool-item term__information-tool-infor"
                            id="term__information-tool-infor">
                        <i class="fas fa-info"></i>
                    </button>
                    <button class="term__information-tool-item term__information-tool-menu">
                        <i class="fas fa-ellipsis-h"></i>

                        <ul class="term__information-tool-menu-list">
                            <div class="menu__arrow"></div>
                            <li class="term__information-tool-menu-item">
                                <a href="#" class="term__information-tool-menu-link">
                                    <i class="far fa-clone"></i>
                                    <span class="term__information-tool-menu-text">
                                        Lưu và chỉnh sửa
                                    </span>
                                </a>

                            </li>
                            <li class="term__information-tool-menu-item">
                                <a href="#" class="term__information-tool-menu-link">
                                    <i class="fas fa-copy"></i>
                                    <span class="term__information-tool-menu-text">
                                        Nhúng
                                    </span>
                                </a>
                            </li>
                            <li class="term__information-tool-menu-item">
                                <a href="#" class="term__information-tool-menu-link" onclick="deleteTerm()">
                                    <i class="bi bi-trash"></i>
                                    <span class="term__information-tool-menu-text">
                                        Xóa
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </button>


                </div>
            </div>
            <div class="term__information-description">
                <p class="term__information-description-text">
                    ${course.description}
                </p>
            </div>
        </div>


        <div class="term__detail">
            <div class="term__detail-header">
                <div class="term__detail-header-title">
                    Thuật ngữ trong học phần này (2)
                </div>

                <div class="term__detail-filter-group-btn" id="term__detail-filter-group-btn">
                    <button class="term__detail-filter-btn term__detail-filter-btn--active" id="filter-all-card-btn">
                        Tất cả
                    </button>
                    <button class="term__detail-filter-btn" id="filter-star-card-btn">
                        Gắn dấu sao (2)
                    </button>
                </div>
                <div class="term__detail-header-sort">
                    <select class="term__detail-header-sort-select" id="term__detail-header-sort-select">
                        <option value="initial">Thứ tự gốc</option>
                        <option value="alphabetically">Bảng chử cái</option>
                        <option value="other">Thông số của bạn</option>
                    </select>
                </div>
            </div>
            <div class="term__detail-notification">
                <div class="term__detail-notification-title">
                    Đang học (2)
                </div>
                <div class="term__detail-notification-content">
                    Bạn đã bắt đầu học những thuật ngữ này. Tiếp tục phát huy nhé!
                </div>

            </div>

            <div class="term__detail-list" id="term__detail-list">
                <c:forEach items="${cards}" var="card">
                <div class="term__detail-item">
                    <div class="term__detail-item-word">
                        <input type="text" value="${card.term}" class="term__detail-item-input term__detail-item-word-text" readonly>
                    </div>
                    <div class="term__detail-item-definition">
                        <input type="text" value="${card.meaning}" class="term__detail-item-input" readonly>
                    </div>
                    <div class="term__detail-item-control">
                        <button class="term__detail-item-control-btn term__detail-star-btn--active" onclick="tickStar(this)">
                            <i class="fas fa-star"></i>
                        </button>
                        <button class="term__detail-item-control-btn" onclick="speechWord(this)">
                            <i class="fas fa-volume-up"></i>
                        </button>
                        <button class="term__detail-item-control-btn" onclick="editWord(this)">
                            <i class="fas fa-pen"></i>
                        </button>
                    </div>
                </div>
                </c:forEach>
<%--                <div class="term__detail-item">--%>
<%--                    <div class="term__detail-item-word">--%>
<%--                        <input type="text" value="Hello" class="term__detail-item-input term__detail-item-word-text" readonly>--%>
<%--                    </div>--%>
<%--                    <div class="term__detail-item-definition">--%>
<%--                        <input type="text" value="Xin chào" class="term__detail-item-input" readonly>--%>
<%--                    </div>--%>
<%--                    <div class="term__detail-item-control">--%>
<%--                        <button class="term__detail-item-control-btn" onclick="tickStar(this)">--%>
<%--                            <i class="fas fa-star"></i>--%>
<%--                        </button>--%>
<%--                        <button class="term__detail-item-control-btn" onclick="speechWord(this)">--%>
<%--                            <i class="fas fa-volume-up"></i>--%>
<%--                        </button>--%>
<%--                        <button class="term__detail-item-control-btn" onclick="editWord(this)">--%>
<%--                            <i class="fas fa-pen"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="term__detail-item">--%>
<%--                    <div class="term__detail-item-word">--%>
<%--                        <input type="text" value="Apple" class="term__detail-item-input term__detail-item-word-text" readonly>--%>
<%--                    </div>--%>
<%--                    <div class="term__detail-item-definition">--%>
<%--                        <input type="text" value="Quả táo" class="term__detail-item-input" readonly>--%>
<%--                    </div>--%>
<%--                    <div class="term__detail-item-control">--%>
<%--                        <button class="term__detail-item-control-btn" onclick="tickStar(this)">--%>
<%--                            <i class="fas fa-star"></i>--%>
<%--                        </button>--%>
<%--                        <button class="term__detail-item-control-btn" onclick="speechWord(this)">--%>
<%--                            <i class="fas fa-volume-up"></i>--%>
<%--                        </button>--%>
<%--                        <button class="term__detail-item-control-btn" onclick="editWord(this)">--%>
<%--                            <i class="fas fa-pen"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>

            <button class="term__detail-edit-btn">
                Thêm hoặc xóa thuật ngữ
            </button>
        </div>
    </div>

    <div class="add__term-to-folder-class" id="add__term-to-folder-class" style="display: none">
        <div class="dialog__header">
            <div class="dialog__header-title">
                Thêm vào lớp học hoặc thư mục
            </div>
            <button class="dialog__header-close" id="add__term-to-folder-class-close-btn">
                <i class="fas fa-times"></i>
            </button>
        </div>

        <div class="dialog__content-add-to-class-folder">

            <div class="add__term-switch-btn">
                <button class="add__term-switch-btn-item add__term-switch-btn-item--active"
                        id="add__term-switch-btn-class">Thêm vào lớp
                    học</button>
                <button class="add__term-switch-btn-item" id="add__term-switch-btn-folder">Thêm vào thư mục</button>
            </div>

            <div class="add__term-to-class" id="add__term-to-class">
                <button class="add__term-new-btn">
                    <span class="add__term-new-btn-text">
                        <i class="fas fa-plus"></i>
                        TẠO MỘT LỚP MỚI
                    </span>
                </button>

                <div class="add__term-to-list">
                    <div class="add__term-to-list-item">
                        <div class="add__term-to-list-item-title">
                            Lớp học 1
                        </div>
                        <button class="add__term-to-list-item-btn add__term-to-list-item-btn-plus">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                    <div class="add__term-to-list-item">
                        <div class="add__term-to-list-item-title">
                            Lớp học 2
                        </div>
                        <button class="add__term-to-list-item-btn add__term-to-list-item-btn-plus">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                    <div class="add__term-to-list-item">
                        <div class="add__term-to-list-item-title">
                            Lớp học 2
                        </div>
                        <button class="add__term-to-list-item-btn add__term-to-list-item-btn-minus">
                            <i class="fas fa-minus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="add__term-to-folder" id="add__term-to-folder" style="display: none">
                <button class="add__term-new-btn">

                    <span class="add__term-new-btn-text">
                        <i class="fas fa-plus"></i>
                        TAO MỘT THƯ MỤC MỚI
                    </span>
                </button>

                <div class="add__term-to-list">
                    <div class="add__term-to-list-item">
                        <div class="add__term-to-list-item-title">
                            Folder 2
                        </div>
                        <button class="add__term-to-list-item-btn add__term-to-list-item-btn-plus">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                    <div class="add__term-to-list-item">
                        <div class="add__term-to-list-item-title">
                            Folder 1
                        </div>
                        <button class="add__term-to-list-item-btn add__term-to-list-item-btn-minus">
                            <i class="fas fa-minus"></i>
                        </button>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="share__dialog" id="share__dialog" style="display: none;">
        <div class="dialog__header">
            <div class="dialog__header-title">
                Chia sẻ học phần
            </div>
            <button class="dialog__header-close" id="share__dialog-close-btn">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="share__dialog-content">
            <div class="share__dialog-content-email">
                <div class="share__dialog-content-email-input">
                    <input type="email" placeholder="Địa chỉ email của bạn bè">
                    <label>CHIA SẺ LIÊN KẾT QUA EMAIL</label>
                </div>
                <div class="share__dialog-content-email-btn">
                    Gửi email
                </div>
            </div>

            <div class="share__dialog-separator"></div>

            <div class="share__dialog-content-link">
                <div class="share__dialog-content-link-input">
                    <input type="email" placeholder="Địa chỉ email của bạn bè">
                </div>
                <div class="share__dialog-content-link-btn">
                    Chép liên kết
                </div>
            </div>

            <div class="share__dialog-separator"></div>

            <a href="#" class="share__dialog-content-social">
                <div class="share__dialog-content-face">
                    <div class="share__dialog-content-face-icon">
                        <i class="fab fa-facebook-square"></i>
                    </div>
                    <div class="share__dialog-content-face-title">
                        Chia sẻ trên Facebook
                    </div>
                    <div></div>
                </div>
            </a>
            <a href="#" class="share__dialog-content-social">
                <div class="share__dialog-content-twitter">
                    <div class="share__dialog-content-twitter-icon">
                        <i class="fab fa-twitter"></i>
                    </div>
                    <div class="share__dialog-content-twitter-title">
                        Chia sẻ trên Twitter
                    </div>
                    <div></div>
                </div>
            </a>

        </div>
    </div>

    <div class="information__dialog" id="information__dialog" style="display: none;">
    </div>

    <div class="confirm__delete-term" id="confirm__delete-term" style="display: none">
        <div class="dialog__header">
            <div class="dialog__header-title">
                Xóa học phần này
            </div>
            <button class="dialog__header-close" onclick="closeDeleteDialog()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="confirm__delete-term-content">
            <div class="confirm__delete-term-name">
                Tên học phần
            </div>
            <div class="confirm__delete-term-description">
                Bạn sắp xoá học phần này và toàn bộ dữ liệu trong đó. Không ai có thể truy cập vào học phần này nữa.
            </div>
            <div class="confirm__delete-term-question">
                Bạn có chắc chắn không? Bạn sẽ không được hoàn tác.
            </div>
            <div class="confirm__delete-term-btn">
                <button class="confirm__delete-term-btn-cancel" onclick="closeDeleteDialog()">
                    Hủy bỏ
                </button>
                <button class="confirm__delete-term-btn-confirm">
                    Xóa học phần
                </button>
            </div>

        </div>
    </div>

    <div class="modal" id="modal" style="display: none">
        <div class="modal__overlay">

        </div>

        <div class="modal__body">
            <div class="modal__inner" id="modal__inner">

            </div>
        </div>
    </div>

    <script src="./js/main.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/term_details.js"></script>

</body>
</html>
