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
            Tên học phần
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
                    <div class="term__card-item">
                        <button class="term__card-word-text term__card-text" onclick="flipWordToDefinition(this)">
                            Hello
                        </button>
                        <button class="term__card-definition-text term__card-text" onclick="flipDefinitionToWord(this)">
                            xin chào
                        </button>
                    </div>

                    <div class="term__card-item">
                        <button class="term__card-word-text term__card-text"  onclick="flipWordToDefinition(this)">
                            Goodbye
                        </button>
                        <button class="term__card-definition-text term__card-text" onclick="flipDefinitionToWord(this)">
                            Tạm biệt
                        </button>
                    </div>

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
                    <img class="term__information-author-avatar" src="./img/avatar.jpg" alt="">

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
                    <button class="term__information-tool-item term__information-tool-add">
                        <i class="fas fa-plus"></i>
                    </button>
                    <a href="#" class="term__information-tool-item term__information-tool-edit">
                        <i class="fas fa-pen"></i>
                    </a>
                    <button class="term__information-tool-item term__information-tool-share">
                        <i class="bi bi-upload"></i>
                    </button>
                    <button class="term__information-tool-item term__information-tool-infor">
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
                                <a href="#" class="term__information-tool-menu-link">
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
                    Một học phần kiểm thử Một học phần kiểm thử Một học phần kiểm thử Một học phần kiểm thử
                </p>
            </div>
        </div>


        <div class="term__detail">
            <div class="term__detail-header">
                <div class="term__detail-header-title">
                    Thuật ngữ trong học phần này (2)
                </div>
                <div class="term__detail-header-sort">
                    <select class="term__detail-header-sort-select">
                        <option value="">Thứ tự gốc</option>
                        <option value="">Bảng chử cái</option>
                        <option value="">Thông số của bạn</option>
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

            <div class="term__detail-list">
                <div class="term__detail-item">
                    <div class="term__detail-item-word">
                        Goodbye
                    </div>
                    <div class="term__detail-item-definition">
                        Tạm biệt
                    </div>
                    <div class="term__detail-item-control">
                        <button class="term__detail-item-control-btn">
                            <i class="fas fa-star"></i>
                        </button>
                        <button class="term__detail-item-control-btn">
                            <i class="fas fa-volume-up"></i>
                        </button>
                        <button class="term__detail-item-control-btn">
                            <i class="fas fa-pen"></i>
                        </button>
                    </div>
                </div>
                <div class="term__detail-item">
                    <div class="term__detail-item-word">
                        Hello
                    </div>
                    <div class="term__detail-item-definition">
                        xin chào
                    </div>
                    <div class="term__detail-item-control">
                        <button class="term__detail-item-control-btn">
                            <i class="fas fa-star"></i>
                        </button>
                        <button class="term__detail-item-control-btn">
                            <i class="fas fa-volume-up"></i>
                        </button>
                        <button class="term__detail-item-control-btn">
                            <i class="fas fa-pen"></i>
                        </button>
                    </div>
                </div>
            </div>

            <button class="term__detail-edit-btn">
                Thêm hoặc xóa thuật ngữ
            </button>
        </div>
    </div>

    <script src="./js/header.js"></script>
    <script src="./js/term_details.js"></script>

</body>
</html>
