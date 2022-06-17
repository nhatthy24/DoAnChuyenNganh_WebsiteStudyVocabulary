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
    <link rel="stylesheet" href="./css/write_page.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container__write">
    <div class="layout__control">
        <div class="control__back">
            <a href="term_details.html" class="control__back-link">
                <i class="fas fa-chevron-left"></i>
                <span class="control__back-btn-text">Trở về</span>
            </a>
        </div>

        <div class="control__main">
            <div class="control__main-title">
                <i class="fas fa-pen-fancy"></i>
                <span class="control__main-title-text">
                        Viết
                    </span>
            </div>

            <div class="control__main-progress">
                <div class="control__main-progress-item">
                    <div class="control__main-progress-bar control__main-progress-bar--rest">
                        <div class="control__main-progress-bar-fill control__main-progress-bar-fill--rest"
                             id="control__main-progress-bar-fill--rest"></div>
                    </div>
                    <div class="control__main-progress-text">
                            <span class="control__main-progress-text-title">
                                CÒN LẠI
                            </span>
                        <span class="control__main-progress-text-number"
                              id="control__main-progress-text-number--rest">
                            ${count}
                            </span>
                    </div>
                </div>

                <div class="control__main-progress-item">
                    <div class="control__main-progress-bar control__main-progress-bar--incorrect">
                        <div class="control__main-progress-bar-fill control__main-progress-bar-fill--incorrect"
                             id="control__main-progress-bar-fill--incorrect">
                        </div>
                    </div>
                    <div class="control__main-progress-text">
                            <span class="control__main-progress-text-title">
                                SAI
                            </span>
                        <span class="control__main-progress-text-number"
                              id="control__main-progress-text-number--incorrect">
                                0
                            </span>
                    </div>
                </div>

                <div class="control__main-progress-item">
                    <div class="control__main-progress-bar control__main-progress-bar--correct">
                        <div class="control__main-progress-bar-fill control__main-progress-bar-fill--correct"
                             id="control__main-progress-bar-fill--correct"></div>
                    </div>
                    <div class="control__main-progress-text">
                            <span class="control__main-progress-text-title">
                                ĐÚNG
                            </span>
                        <span class="control__main-progress-text-number"
                              id="control__main-progress-text-number--correct">
                                0
                            </span>
                    </div>
                </div>

            </div>

            <div class="control__main-action">
                <button class="control__main-action-btn" id="control__main-action-option">
                    <i class="fas fa-sliders-h"></i>
                    <span class="control__main-action-text">
                            Tùy chọn
                        </span>
                </button>
            </div>

        </div>
    </div>

    <div class="layout__content">
        <div class="write__card-items">
            <c:forEach var="fi" items="${cards}">
            <div class="write__card-item ${fi.markedCard ? 'write__card-item--star' : ''}">
                <div class="write__card-item-title" style="display: none">
                        <span class="write__card-item-title-text">
                            Chép lại đáp án
                        </span>
                </div>
                <div class="write__card-item-question">
                    <div class="write__card-item-question-body">
                        <div class="write__card-item-question-word">
                            <div class="write__card-item-question-title" style="display: none">
                                    <span class="write__card-item-question-title-text">
                                        CÂU HỎI
                                    </span>
                            </div>
                            <div class="write__card-item-question-content">
                                    <span class="write__card-item-question-content-text write__card-item-question-word-text">
                                            ${fi.term}
                                    </span>
                                <button class="write__card-item-question-content-btn" style="display: none">
                                    <i class="fas fa-volume-up"></i>
                                </button>
                            </div>
                        </div>

                        <div class="write__card-item-separator write__card-item-separator--one"
                             style="display: none">

                        </div>

                        <div class="write__card-item-question-definition" style="display: none">
                            <div class="write__card-item-question-title">
                                    <span class="write__card-item-question-title-text">
                                        ĐÁP ÁN
                                    </span>
                            </div>
                            <div class="write__card-item-question-content">
                                    <span class="write__card-item-question-content-text write__card-item-question-definition-text">
                                            ${fi.meaning}
                                    </span>
                            </div>
                        </div>
                    </div>

                    <div class="write__card-item-question-unknown">
                        <button class="write__card-item-unknown-btn">
                            Không biết
                        </button>
                    </div>
                </div>
                <div class="write__card-item-separator">

                </div>
                <div class="write__card-item-answer">
                    <div class="write__card-item-answer-input-field">
                        <input type="text" spellcheck="false" autocomplete="off"value=" "  class="write__card-item-answer-input">
                        <span class="write__card-item-answer-label">NHẬP TIẾNG VIỆT</span>
                    </div>
                    <button class="write__card-item-answer-btn">
                        Đáp án
                    </button>
                </div>
            </div>
            </c:forEach>

            <div class="write__card-item-incorrect" id="write__card-item-incorrect" style="display: none">
                <div class="write__card-item-incorrect-title">
                        <span class="write__card-item-incorrect-title-text">
                            Học thuật ngữ này!
                        </span>
                </div>

                <div class="write__card-item-incorrect-separator">

                </div>

                <div class="write__card-item-incorrect-content">
                    <div class="write__card-incorrect-content-item">
                        <div class="write__card-incorrect-content-item-title">
                                <span class="write__card-incorrect-content-item-title-text">
                                    THUẬT NGỮ
                                </span>
                        </div>
                        <div class="write__card-incorrect-content-item-content">
                                <span
                                        class="write__card-incorrect-content-item-content-text write__card-incorrect-text-word">
                                    Door
                                </span>
                            <button class="write__card-incorrect-content-item-content-btn">
                                <i class="fas fa-volume-up"></i>
                            </button>
                        </div>
                    </div>

                    <div class="write__card-item-incorrect-separator">

                    </div>

                    <div class="write__card-incorrect-content-item">
                        <div class="write__card-incorrect-content-item-title">
                                <span class="write__card-incorrect-content-item-title-text">
                                    ĐÁP ÁN CỦA BẠN
                                </span>
                        </div>
                        <div class="write__card-incorrect-content-item-content">
                                <span
                                        class="write__card-incorrect-content-item-content-text write__card-incorrect-text-wrong">
                                    Cái bàn
                                </span>
                        </div>
                    </div>

                    <div class="write__card-item-incorrect-separator">

                    </div>

                    <div class="write__card-incorrect-content-item">
                        <div class="write__card-incorrect-content-item-title">
                                <span class="write__card-incorrect-content-item-title-text">
                                    ĐÁP ÁN ĐÚNG
                                </span>
                        </div>
                        <div class="write__card-incorrect-content-item-content">
                                <span
                                        class="write__card-incorrect-content-item-content-text  write__card-incorrect-text-correct">
                                    Cái cửa
                                </span>
                        </div>
                    </div>
                </div>

                <div class="write__card-item-incorrect-footer">
                    <button class="write__card-item-incorrect-continue-btn"
                            id="write__card-item-incorrect-continue-btn">
                        Tiếp tục
                    </button>
                </div>
            </div>

            <div class="write__card-item-result" id="write__card-item-result" style="display: none">
                <div class="write__card-result-header">
                    <div class="write__card-result-header-title">
                            <span class="write__card-result-header-title-text">
                                Kết quả
                            </span>
                        <div class="write__card-result-header-title-scores">
                            5/6 - 86%
                        </div>
                    </div>
                    <button class="write__card-result-restart-btn" id="write__card-result-restart-btn">
                        Bắt đầu lại
                    </button>
                </div>
                <div class="write__card-item-result-content">
                    <div class="write__card-result-content-lists">
                        <!-- <div class="write__card-result-content-item write__card-result-content-item--correct">
                            <div class="write__card-result-content-item-definition">
                                <div class="write__card-result-content-item-definition-icon">
                                    <i class="fas fa-check"></i>
                                </div>
                                <span class="write__card-result-content-item-definition-text">
                                   Nước
                                </span>
                            </div>
                            <div class="write__card-result-content-item-word">
                                <span class="write__card-result-content-item-word-text">
                                    Water
                                </span>
                            </div>

                        </div>
                        <div class="write__card-result-content-item write__card-result-content-item--incorrect">
                            <div class="write__card-result-content-item-definition">
                                <div class="write__card-result-content-item-definition-icon">
                                    <i class="fas fa-times"></i>
                                </div>
                                <span class="write__card-result-content-item-definition-text">
                                  Xin chào
                                </span>
                            </div>
                            <div class="write__card-result-content-item-word">
                                <span class="write__card-result-content-item-word-text">
                                    Hello
                                </span>
                            </div>

                        </div>
                        <div class="write__card-result-content-item write__card-result-content-item--correct">
                            <div class="write__card-result-content-item-definition">
                                <div class="write__card-result-content-item-definition-icon">
                                    <i class="fas fa-check"></i>
                                </div>
                                <span class="write__card-result-content-item-definition-text">
                                   Cái đèn
                                </span>
                            </div>
                            <div class="write__card-result-content-item-word">
                                <span class="write__card-result-content-item-word-text">
                                   Lamp
                                </span>
                            </div>


                        </div>
                        <div class="write__card-result-content-item write__card-result-content-item--correct">
                            <div class="write__card-result-content-item-definition">
                                <div class="write__card-result-content-item-definition-icon">
                                    <i class="fas fa-check"></i>
                                </div>
                                <span class="write__card-result-content-item-definition-text">
                                   Cái thang
                                </span>
                            </div>
                            <div class="write__card-result-content-item-word">
                                <span class="write__card-result-content-item-word-text">
                                   Stair
                                </span>
                            </div>


                        </div> -->
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
            <div class="modal__header">
                <div class="modal__header-title">
                        <span class="modal__header-title-text">
                            Tùy chọn
                        </span>
                </div>
                <button class="modal__header-close-btn" id="modal__header-close-btn">
                        <span class="modal__header-close-text">
                            <i class="bi bi-x"></i>
                        </span>
                </button>
            </div>

            <div class="modal__body-content">
                <div class="modal__body-content-row">
                    <div class="modal__body-content-item">
                        <div class="modal__body-content-item-title">
                                <span class="modal__body-content-item-title-text">
                                    HỌC THUẬT NGỮ CÓ GẮN DẤU SAO
                                </span>
                        </div>
                        <div class="modal__body-content-item-group-btn">
                            <button class="modal__body-content-item-btn modal__body-content-item-btn--active"
                                    id="filter__learn-all">
                                    <span class="modal__body-content-item-btn-text">
                                        Tất cả
                                    </span>
                            </button>
                            <button class="modal__body-content-item-btn" id="filter__learn-star">
                                    <span class="modal__body-content-item-btn-text">
                                        Có gắn dấu sao
                                    </span>
                            </button>
                        </div>
                    </div>

                    <div class="modal__body-content-item">
                        <div class="modal__body-content-item-title">
                                <span class="modal__body-content-item-title-text">
                                    TRẢ LỜI BẰNG
                                </span>
                        </div>
                        <div class="modal__body-content-item-group-btn">
                            <button class="modal__body-content-item-btn modal__body-content-item-btn--active"
                                    id="language__answer-vi">
                                    <span class="modal__body-content-item-btn-text">
                                        Tiếng việt
                                    </span>
                            </button>
                            <button class="modal__body-content-item-btn" id="language__answer-en">
                                    <span class="modal__body-content-item-btn-text">
                                        Tiếng anh
                                    </span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal__body-content-row-separator">

                </div>
                <div class="modal__body-content-row">
                    <div class="modal__body-content-item">
                        <div class="modal__body-content-item-title">
                                <span class="modal__body-content-item-title-text">
                                    ÂM THANH
                                </span>
                        </div>
                        <div class="modal__body-content-item-group-btn">
                            <button class="modal__body-content-item-btn " id="open__speech-word">
                                    <span class="modal__body-content-item-btn-text">
                                        Bật
                                    </span>
                            </button>
                            <button class="modal__body-content-item-btn modal__body-content-item-btn--active"
                                    id="close__speech-word">
                                    <span class="modal__body-content-item-btn-text">
                                        Tắt
                                    </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="./js/main.js"></script>
<script src="./js/write_page.js"></script>
<script src="./js/header.js"></script>
</body>

</html>