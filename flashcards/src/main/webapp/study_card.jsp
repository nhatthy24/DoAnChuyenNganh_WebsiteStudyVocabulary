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
    <link rel="stylesheet" href="./css/study.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<%--<jsp:include page="header.jsp"></jsp:include>--%>
<div class="study__container">
    <div class="study__header">

        <div class="study__header-menu">
            <div class="study__header-menu-logo">
                <i class="bi bi-info-circle"></i>
                <button class="study__header-menu-btn" id="study__header-menu-btn">
                    Học
                    <i class="fas fa-angle-down"></i>
                </button>
            </div>
            <ul class="study__header-list-items" id="study__header-list-items">
                <li class="study__header-list-item">
                    <a class="study__header-list-item-link" href="flashcard">
                        <i class="bi bi-back"></i>
                        Thẻ ghi nhớ
                    </a>
                </li>
                <li class="study__header-list-item">
                    <a class="study__header-list-item-link" href="#">
                        <i class="bi bi-file-earmark-check-fill"></i>
                        Kiểm tra
                    </a>
                </li>

                <li class="study__header-list-item study__header-list-item--separator">

                </li>
                <li class="study__header-list-item">
                    <a class="study__header-list-item-link" href="#">
                        Trang chủ
                    </a>
                </li>
                <li class="study__header-list-item">
                    <a class="study__header-list-item-link" href="#">
                        Tìm kiếm
                    </a>
                </li>
            </ul>
        </div>


        <div class="study__header-description">
            <a href="" class="study__header-description-link">
                Name of the Term
            </a>
        </div>

        <div class="study__header-control">
            <button class="study__header-control-btn" id="study__header-control-option-btn">
                Tùy chọn
            </button>
            <a href="term_details.html" class="study__header-control-btn">
                <i class="fas fa-times"></i>
            </a>
        </div>

    </div>
    <div class="study__progress-bar" id="study__progress-bar">

    </div>

    <div class="study__body">
        <div class="study__body-content">


            <div class="study__body-list study__body-list-multiple-choice">
                <c:forEach var="fi" items="${cards}">
                <div class="study__body-list-item ${fi.markedCard ? 'study__body-list-item--star' : ''}">
                    <div class="study__item-question">
                        <div class="study__item-question-title">
                                <span class="study__item-question-title-text">
                                    Thuật ngữ
                                </span>
                            <button class="study__item-question-title-btn">
                                <i class="bi bi-volume-up"></i>
                            </button>
                        </div>
                        <div class="study__item-question-content">
                            <p class="study__item-question-content-word">
                                    ${fi.term}
                            </p>
                            <p class="study__item-question-content-definition" style="display: none">
                                    ${fi.meaning}
                            </p>
                        </div>
                    </div>

                    <div class="study__item-answer study__item-answer-multiple-choice">
                        <div class="study__item-answer-title">
                                <span class="study__item-answer-title-text">
                                    Chọn định nghĩa đúng
                                </span>
                        </div>
                        <div class="study__item-answer-content">

                        </div>
                    </div>

                    <div class="study__item-answer study__item-answer-write" style="display: none">

                        <div class="study__item-answer-write-content">
                            <div class="answer__write-enter-area">
                                    <span class="answer__write-title-text">
                                        Đáp án của bạn
                                    </span>
                                <input type="text" spellcheck="false" class="answer__write-input"
                                       id="answer__write-input" placeholder="Nhập Tiếng Việt">
                                <div class="answer__write-group-btn">
                                    <button class="answer__write-btn answer__write-btn--cancel">
                                        Bạn không biết à?
                                    </button>
                                    <button class="answer__write-btn answer__write-btn--enter"
                                            id="answer__write-btn--enter">
                                        Đáp án
                                    </button>
                                </div>
                            </div>
                            <div class="answer__write-skip-answer" style="display: none">
                                    <span class="answer__write-correct-answer-title-text answer__write-title-skip">
                                        Thử lại câu hỏi này sau!
                                    </span>
                                <div class="answer__write-block answer__write-block-skip">
                                    <div class="answer__write-correct-answer-icon">
                                        <i class="bi bi-x"></i>
                                    </div>
                                    <div class="answer__write-correct-answer-text">
                                        Đã bỏ qua
                                    </div>
                                </div>
                            </div>
                            <div class="answer__write-incorrect-answer" style="display: none">
                                    <span class="answer__write-correct-answer-title-text answer__write-title-incorrect">
                                        Đừng lo, bạn vẫn đang học mà!
                                    </span>
                                <div class="answer__write-block answer__write-block-incorrect">
                                    <div
                                            class="answer__write-correct-answer-icon answer__write-correct-answer-icon--incorrect">
                                        <i class="bi bi-x"></i>
                                    </div>
                                    <div
                                            class="answer__write-correct-answer-text answer__write-incorrect-answer-text">
                                        Đã bỏ qua
                                    </div>
                                </div>
                            </div>
                            <div class="answer__write-correct-answer" style="display: none">
                                    <span class="answer__write-correct-answer-title-text answer__write-title-correct">
                                        Đáp án đúng
                                    </span>
                                <div class="answer__write-block answer__write-block-correct">
                                    <div
                                            class="answer__write-correct-answer-icon answer__write-correct-answer-icon--correct">
                                        <i class="bi bi-check2"></i>
                                    </div>
                                    <div
                                            class="answer__write-correct-answer-text answer__write-correct-answer-text-text">
                                        text
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                </c:forEach>

            </div>



            <div class="result__multiple-choice-successful" id="result__multiple-choice-successful"
                 style="display: none">
                <div class="item__successful-header">
                    <div class="item__successful-header-title">
                            <span class="item__successful-header-title-text">
                                Hãy tiếp tục phát huy.
                            </span>
                    </div>
                    <div class="item__successful-header-progress">
                        <div class="item__successful-header-progress-label">
                                <span class="item__successful-header-progress-current">

                                </span>
                            <span class="item__successful-header-progress-separator">
                                    /
                                </span>
                            <span class="item__successful-header-progress-total">

                                </span>
                            <span class="item___successful-header-progress-label-text">
                                    thuật ngữ
                                </span>
                        </div>
                        <div class="item__successful-header-progress-bar">
                        </div>
                    </div>
                </div>
                <div class="item__successful-body">
                    <div class="item__successful-body-title">
                            <span class="item__successful-body-title-text">
                                Thuật ngữ đã học trong vòng này
                            </span>
                    </div>
                    <div class="item__successful-body-list">

                    </div>
                </div>
            </div>



            <div class="study__body-list-item-champion" id="study__body-list-item-champion" style="display: none">
                <div class="item__champion-icon">
                    <img src="https://assets.quizlet.com/a/j/dist/app/i/tasks/sequence_completion/non_plus/Quizlet_Trophy@1x.622781cfc40c59e.png"
                         alt="">
                </div>
                <div class="item__champion-content">
                    <div class="item__champion-content-title">
                            <span class="item__champion-content-title-text">
                                Chúc mừng! Bạn đã học hết các nội dung
                            </span>
                    </div>
                    <div class="item__champion-content-description">
                            <span class="item__champion-content-description-text">
                                Học lại để luyện tập các câu hỏi tương tự, hoặc thử một chế độ học khác.
                            </span>
                    </div>

                </div>
                <div class="item__champion-control">
                    <a href="term_details.html" class="item__champion-control-btn item__champion-control-btn--left">
                            <span class="item__champion-control-btn-text">
                                Học xong
                            </span>
                    </a>
                    <button class="item__champion-control-btn item__champion-control-btn--right"
                            id="item__learn-again-btn">
                            <span class="item__champion-control-btn-text">
                                Học lại
                            </span>
                    </button>
                </div>
                <canvas class="confetti" id="canvas">

                </canvas>
            </div>




        </div>
    </div>



    <div class="study__footer" id="study__footer-control" style="display: none">
        <div class="study__footer-content">
            <div class="study__footer-title">
                Tiếp tục học
            </div>
            <button class="study__footer-continue-btn" id="study__footer-continue-btn">
                Tiếp tục
            </button>
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
<script src="./js/study.js"></script>
<script src="./js/confetti.js"></script>
<script src="./js/header.js"></script>
</body>

</html>