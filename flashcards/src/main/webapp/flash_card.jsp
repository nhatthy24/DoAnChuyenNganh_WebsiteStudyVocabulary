<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 5/18/2022
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link rel="stylesheet" href="./css/flash_card.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<!-- main content -->
<div class="container__remember-card">
    <div class="layout__controls">
        <div class="control__back">
            <a href="#" class="control__back-btn">
                <i class="fas fa-angle-left"></i>
                <span class="control__back-btn-text">Trở về</span>
            </a>
        </div>
        <div class="control__main">
            <div class="control__main-title">
                <i class="fas fa-tags"></i>
                <span class="control__main-title-text">
                        Thẻ ghi nhớ
                    </span>
            </div>
            <div class="control__main-progress">
                <div class="control__main-progress-bar">
                    <div class="control__main-progress-bar-fill" id="control__main-progress-bar-fill"></div>
                </div>
                <div class="control__main-progress-label">
                        <span class="control__main-progress-label-text">
                            TIẾN ĐỘ
                        </span>
                    <div class="control__main-progress-value">
                            <span class="control__main-progress-value-current" id="progress__current">
                                1
                            </span>
                        <span class="control__main-progress-value-separator">
                                /
                            </span>
                        <span class="control__main-progress-value-total" id="progress__total">
                                5
                            </span>
                    </div>
                </div>
            </div>
            <div class="control__main-actions">
                <button class="control__main-action" id="control__main-action-start">
                    <i class="fas fa-play"></i>
                    <span class="control__main-action-text">
                            Bắt đầu
                        </span>
                </button>
                <button class="control__main-action" id="control__main-action-mix">
                    <i class="bi bi-shuffle"></i>
                    <span class="control__main-action-text">
                            Trộn thẻ
                        </span>
                </button>
                <button class="control__main-action" id="control__main-action-option">
                    <i class="fas fa-sliders-h"></i>
                    <span class="control__main-action-text">
                            Tùy chọn
                        </span>
                </button>
            </div>
        </div>

    </div>
    <div class="layout__content">
        <div class="card__items" id="list__card-items">
            <c:forEach var="fi" items="${cards}">
            <div class="card__item ${fi.markedCard ? 'card__item-tick-star' : ''}">
                <div class="card__item-word card__item-text">
                    <div class="card__item-side card__item-side-word">
                            ${fi.term}
                    </div>
                    <div style="display:none;" class="card__item-card-id" id="card_id">
                            ${fi.id}
                    </div>
                    <div style="display: none" class="card__item-course-id">
                            ${fi.courseId}
                    </div>
                    <div style="display: none" class="card__item-creator-id" id="creator_id">
                            ${fi.creator}
                    </div>
                    <div class="card__item-control">
                        <button class="card__item-control-btn card__item-control-edit-btn">
                            <i class="fas fa-pencil-alt"></i>
                        </button>
                        <button class="card__item-control-btn card__item-control-speech-btn">
                            <i class="fas fa-volume-up"></i>
                        </button>
                        <button onclick="updateStarCardState(${fi.creator},${fi.id})" class="card__item-control-btn card__item-control-star-btn ${fi.markedCard ? 'card__item-control-star-btn--active' : ''}">
                            <i class="fas fa-star"></i>
                        </button>
                    </div>
                    <div class="card__item-hint">
                            <span class="card__item-hint-text">
                                Nhấn vào thẻ để xem định nghĩa
                            </span>
                        <i class="fas fa-hand-pointer"></i>
                    </div>
                </div>
                <div class="card__item-definition card__item-text">
                    <div class="card__item-side card__item-side-definition">
                            ${fi.meaning}
                    </div>
                    <div class="card__item-control">
                        <button class="card__item-control-btn card__item-control-edit-btn">
                            <i class="fas fa-pencil-alt"></i>
                        </button>
                        <button class="card__item-control-btn card__item-control-star-btn">
                            <i class="fas fa-star"></i>
                        </button>
                    </div>
                    <div class="card__item-hint">
                            <span class="card__item-hint-text">
                                Nhấn vào thẻ để xem thuật ngữ
                            </span>
                        <i class="fas fa-hand-pointer"></i>
                    </div>
                </div>
            </div>
            </c:forEach>
            <div class="card__item card__item-special">
                <div class="card__item-special-title">
                    <img src="https://assets.quizlet.com/a/j/dist/app/i/cards/learn_preview/trophy.0c9b06e0b8da370.svg"
                         alt="">
                    <h3 class="card__item-special-title-text">
                        Chúc mừng! Bạn đã ôn tập tất cả các thuật ngữ.
                        </h2>
                </div>
                <div class="card__item-special-content">
                    <div class="card__item-special-content-item" style="margin-top: 0">
                        <div class="card__item-special-icon card__item-special-icon--green">
                            <i class="bi bi-check-circle-fill"></i>
                        </div>
                        <div class="card__item-special-description">
                            <h4 class="card__item-special-description-title">Hoàn thành thẻ ghi nhớ</h4>
                            <span class="card__item-special-description-text" id="counter__word-learned">2 thuật
                                    ngữ</span>
                        </div>
                    </div>
                    <div class="card__item-special-content-item">
                        <div class="card__item-special-icon card__item-special-icon--blue">
                            <i class="bi bi-arrow-right-circle-fill"></i>
                        </div>
                        <div class="card__item-special-description">
                            <h4 class="card__item-special-description-title">Hãy duy trì động lực với chế độ Học
                            </h4>
                            <span class="card__item-special-description-text">Ôn luyện để cải thiện kỹ năng của
                                    bạn</span>
                        </div>
                    </div>
                    <div class="card__item-special-btn">
                        <a href="#" class="card__item-special-btn-item">
                            Tiếp tục với chế độ Học
                        </a>
                        <button class="card__item-special-btn-item" id="card__item-repeat-btn">
                            Lặp lại Thẻ ghi nhớ
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="card__toolbar" id="card__toolbar">
            <div class="card__toolbar-item">
            </div>
            <div class="card__toolbar-item">
                <div class="card__toolbar-navigation">
                    <button class="card__toolbar-btn card__toolbar-nav-left">
                        <i class="fas fa-angle-left"></i>
                    </button>
                    <button class="card__toolbar-btn card__toolbar-nav-right">
                        <i class="fas fa-angle-right"></i>
                    </button>
                </div>
            </div>
            <div class="card__toolbar-item">
                <button class="card__toolbar-btn card__toolbar-reverse-btn" id="card__toolbar-reverse-btn">
                    <i class="fas fa-exchange-alt"></i>
                </button>
            </div>
        </div>

    </div>
</div>

<div class="edit__word-dialog" id="edit__word-dialog" style="display: none">

    <button class="edit__word-dialog-close-btn" onclick="closeEditWordDialog()">
        <i class="fas fa-times"></i>
    </button>

    <div class="edit__word-dialog-content">
        <div class="edit__word-dialog-header">
            <h1 class="edit__word-dialog-title">
                Sửa
            </h1>
        </div>
        <div class="edit__word-dialog-body">
            <div class="edit__word-dialog-body-item">
                <input class="edit__word-dialog-item-input" id="edit__word-dialog-item-input-word" name="word"
                       type="text">
            </div>
            <div class="edit__word-dialog-body-item">
                <input class="edit__word-dialog-item-input" id="edit__word-dialog-item-input-definition"
                       name="definition" type="text">
            </div>
            <div style="display: none" class="edit__word-dialog-body-item">
                <input class="edit__word-dialog-item-input" id="edit__word-dialog-item-input-card-id"
                       name="card_id" type="text">
            </div>
            <div style="display:none;" class="edit__word-dialog-body-item">
                <input class="edit__word-dialog-item-input" id="edit__word-dialog-item-input-course-id"
                       name="course_id" type="text">
            </div>
        </div>
        <div class="edit__word-dialog-footer">
            <button class="edit__word-dialog-exit-btn" id="edit__word-dialog-exit-btn"
                    onclick="closeEditWordDialog()">
                Hủy
            </button>
            <button type="button" onclick="updateFlashCard()" class="edit__word-dialog-save-btn" id="edit__word-dialog-save-btn">
                Lưu
            </button>
        </div>
    </div>
</div>

<div class="setting__learning-dialog" id="setting__learning-dialog" style="display: none">
    <div class="dialog__header">
        <div class="dialog__header-title">
            Tùy chọn
        </div>
        <button class="dialog__header-close" id="setting__learning-dialog-close-btn">
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="setting__dialog-body">
        <div class="setting__dialog-body-row">
            <div class="setting__dialog-body-item">
                <div class="setting__dialog-body-item-title">
                    HỌC THUẬT NGỮ CÓ GẮN DẤU SAO
                </div>
                <div class="setting__dialog-body-item-content">
                    <div class="setting__dialog-body-group-btn">
                        <button class="setting__dialog-body-btn-item
                             setting__dialog-body-btn--active" id="setting__list-card-all-btn">Tất cả</button>
                        <button class="setting__dialog-body-btn-item" id="setting__list-card-star-btn">Có gắn
                            sao</button>
                    </div>
                </div>
            </div>
            <div class="setting__dialog-body-item">
                <div class="setting__dialog-body-item-title">
                    TRẢ LỜI BẰNG
                </div>
                <div class="setting__dialog-body-item-content">
                    <select class="setting__dialog-body-select" name="language" id="change__answer-language">
                        <option value="vi">Tiếng Việt</option>
                        <option value="en">Tiếng Anh</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="setting__dialog-body-row-separator">

        </div>

        <div class="setting__dialog-body-row">
            <div class="setting__dialog-body-item">
                <div class="setting__dialog-body-item-title">
                    ÂM THANH
                </div>
                <div class="setting__dialog-body-item-content">
                    <div class="setting__dialog-body-group-btn">
                        <button class="setting__dialog-body-btn-item" id="setting__open-speaker">
                            Bật</button>
                        <button class="setting__dialog-body-btn-item setting__dialog-body-btn--active"
                                id="setting__close-speaker">Tắt</button>
                    </div>
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

        </div>
    </div>
</div>


<script src="./js/main.js"></script>
<script src="./js/flash_card.js"></script>
<script src="./js/header.js"></script>
</body>

</html>