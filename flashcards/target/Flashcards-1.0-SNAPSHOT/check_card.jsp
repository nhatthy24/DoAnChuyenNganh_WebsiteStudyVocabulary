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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/check.css">
    <link rel="stylesheet" href="./css/popupCheck.css">
    <link rel="stylesheet" href="./css/reponsiveCheck.css">
    <link rel="stylesheet" href="./css/reponsivePopupCheck.css">
    <link rel="stylesheet" href="./css/optionCheck.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        /*.container {*/
        /*  margin-bottom: 56px;*/
        /*  width: 100%;*/
        /*  padding: 50px 0;*/
        /*  background: white;*/
        /*  box-shadow: 0 0 30px gray(0, 0, 0, 0.8);*/
        /*  border-radius: 5px;*/
        /*  text-align: center;*/
        /*}*/
        .bar {
            background: #b6b6b6;
            width: 90%;
            height: 50px;
            margin: 10px auto;
            border-radius: 50px;
            overflow: hidden;
        }
        .fill {
            height: 100%;
            width: 1%;
            background: linear-gradient(45deg, #f00144, #fd5900);
        }
        .counter {
            font-size: 40px;
            font-family: monospace;
            font-weight: 800;
            color: #f00144;
            padding: 5px 0;
        }
        content {
            text-transform: uppercase;
            font-size: 20px;
            font-weight: 800;
            font-family: monospace;
            color: #fff;

            margin-top: 20px;
            padding: 5px 10px;
            cursor: pointer;
            outline: none;
            border: 2px solid #f00144;
            border-radius: 50px;
        }
        .output {
            width: 48%;
            padding: 30px 0;
            margin-left: 426px;
            margin-bottom: 28px;
            background: white;
            border-radius: 40px;
            box-shadow: 0 0 30px gray(0, 0, 0, 0.8);
            text-align: center;
            display: none;
        }
        .output .fa-check {
            height: 150px;
            width: 150px;
            border: 5px solid #f00144;
            line-height: 150px;
            border-radius: 50%;
            color: #f00144;
            font-size: 85px;
            margin-bottom: 30px;
            animation: animate 1s ease;
        }
        @keyframes animate {
            0% {
                transform: translateY(60px) scale(0.7) rotate(0deg);
                opacity: 0.2;
            }
            50% {
                transform: scale(0.3) rotate(90deg) skewY(-40deg);
                width: 50px;
            }
            75% {
                transform: scale(1.4) rotate(180deg) skewY(20deg);
                width: 10px;
            }
            100% {
                transform: translateY(0px) scale(1) rotate(360deg);
                opacity: 1;
            }
        }


    </style>
</head>
<body class="theme-default">
<div class="carbon-ads __isAdBlockerEnabled" style="
        position: absolute;
        width: 10px;
        height: 10px;
        left: -100px;
        top: -100px;
      ">
    &nbsp;
</div>
<div class="site">
    <main class="page" id="page" role="main" itemscope="" itemprop="mainContentOfPage">
        <div id="AssistantModeTarget">
            <div class="StudyModesLayout">
                <div class="StudyModesLayout_main">
                    <div class="StudyModesLayout_header_navbar">
                        <div class="StudyModesLayout_header_navbar_bi">
                            <div class="StudyModesLayout_header_navbar_bi_bi">
                                <div class="StudyModesLayout_header_navbar_bi_bi_bi">
                                    <div class="StudyModesLayout_header_navbar_bi_bi_bi_left">
                                        <div
                                                aria-label="chế độ kiểm tra"
                                                class="AssemblyIcon AssemblyIcon--large"
                                                role="img"
                                        >
                                            <i class="fa fa-file-text" aria-hidden="true" style="font-size: 2em; color: #4255ff;"></i>
                                        </div>
                                        <div>
                                            <button
                                                    aria-label="Kiểm tra"
                                                    class="AssemblyButtonBase AssemblyTextButton AssemblyTextButton--secondary AssemblyButtonBase--xlarge"
                                            >
                            <span>Kiểm tra</span
                            ><div
                                                    aria-label="chevron down"
                                                    class="AssemblyIcon AssemblyIcon--small"
                                                    role="img"
                                                    id="AssemblyIcon"
                                            >
                                                <i class="fa fa-chevron-down" aria-hidden="true" style="font-size: 1em"></i>
                                            </div>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="StudyModesLayout_header_navbar_bi_bi_bi_center">
                                        <section class="navbar__center">
                                            <section class="navar__center_number">${cards.size()} câu hỏi</section>
                                            <section class="navbar__center_text">${course.courseName}</section>
                                        </section>
                                    </div>
                                    <div class="StudyModesLayout_header_navbar_bi_bi_bi_right">
                                        <div
                                                class="navbar__right_print"
                                                style="--navbar__right_print-0: 1rem; --navbar__right_print-2: 0.5rem"
                                        >
                                            <div class="hideBelow--l">
                                                <div class="print-tests">
                                                    <button
                                                            onclick="myPrint('myPrint')"
                                                            value="print"
                                                            type="button"
                                                            aria-label="In bài kiểm tra"
                                                            class="AssemblyButtonBase AssemblySecondaryButton AssemblyButtonBase--medium AssemblyButtonBase--padding"
                                                    >
                                                        <span>In bài kiểm tra</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="hideBelow--m hideAbove--l">
                                                <div class="print-tests">
                                                    <button
                                                            type="button"
                                                            aria-label="In bài kiểm tra"
                                                            class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--secondary AssemblyIconButton--square AssemblyButtonBase--medium AssemblyButtonBase--square"
                                                    >
                                                        <div
                                                                aria-label="In bài kiểm tra"
                                                                class="AssemblyIcon AssemblyIcon--medium"
                                                                role="img"
                                                        >
                                                            <i class="fa fa-print" aria-hidden="true" style="font-size: 1.5em;"></i>
                                                        </div>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="hideAbove--l">
                                                <div class="print-tests">
                                                    <button
                                                            type="button"
                                                            aria-label="Hiển thị danh sách câu hỏi"
                                                            class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--secondary AssemblyIconButton--square AssemblyButtonBase--medium AssemblyButtonBase--square"
                                                    >
                                                        <div
                                                                aria-label="Hiển thị danh sách câu hỏi"
                                                                class="AssemblyIcon AssemblyIcon--medium"
                                                                role="img"
                                                        >
                                                            <i class="fa fa-leanpub" aria-hidden="true" style="font-size: 1.4em;"></i>
                                                        </div>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
<%--                                        <div class="navbar__right_option">--%>
<%--                                            <button--%>
<%--                                                    type="button"--%>
<%--                                                    aria-label="Tùy chọn"--%>
<%--                                                    class="AssemblyButtonBase AssemblySecondaryButton AssemblyButtonBase--medium AssemblyButtonBase--padding"--%>
<%--                                                    onclick="openOption()"--%>
<%--                                            >--%>
<%--                                                <span>Tùy chọn</span>--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
                                        <div class="navbar__right_btnReturn">
                                            <button type="button"
                                                    aria-label="Trở về"
                                                    class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--secondary AssemblyIconButton--square AssemblyButtonBase--medium AssemblyButtonBase--square">
                                                <a href="detail-term?course_id=${course.id}" style="text-decoration: none;">
                                                    <div
                                                            aria-label="Trở về"
                                                            class="AssemblyIcon AssemblyIcon--medium"
                                                            role="img"
                                                    >
                                                        <i class="fa fa-times" aria-hidden="true" style="font-size: 1.5em;"></i>
                                                    </div>
                                                </a>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="b1bxhw81">
                                    <div
                                            class="pwi055w"
                                            style="width: 0%"
                                    ></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="StudyModesLayout_body_navbar" style="--StudyModesLayout_body_navbar-0: 100%">
                        <div class="StudyModesLayout_body_navbar_bi" style="

                    --StudyModesLayout_body_navbar_bi-1: 2rem 1.5rem 1.5rem;
                    --StudyModesLayout_body_navbar_bi-3: 1.5rem;
                  ">
                            <div data-testid="print-content" class="print-content" id="myPrint">
                                <div class="print-content-title">
                                    <div>Name:_______________________________________________</div>
                                    <div class="print-content-name"></div>
                                    <div>Score:_______________________________________________</div>
                                    <div class="print-content-name"></div>
                                    <div>Class:_______________________________________________</div>
                                    <div class="print-content-name"></div>
                                </div>
                                <section class="sectionSB StudyModesLayout_section_scores_board">
                                    <h4 class="sectionSB-h4">Câu hỏi tự luận</h4>
                                    <c:forEach items="${cards}" var="card">
                                    <div class="sectionSB-div" style="--sectionSB-div-1: avoid">
                                        <div class="sectionSB-sub-div">
                                            <div class="sectionSB-sub-div-definition">1. <span class="sectionSB-sub-div-definition">Định nghĩa: ${card.meaning}</span></div>
                                            <span class="QuestionElements">
<%--                                                <span class="TextMedia textMd">--%>
<%--                                                    <div aria-label="the process of acquiring new and relatively enduring information or behaviors" class="FormattedText notranslate lang-en">--%>
<%--                                                        --%>
<%--                                                    </div>--%>
<%--                                                </span>--%>
                                                <div aria-label="" class="FormattedText notranslate lang-en">
                                                Thuật ngữ:___________________________________________________
                                                </div>
                                            </span>
                                        </div>
                                        <div class="div-none"></div>
                                        <div class="div-none-1"><div class="div-none-1-1"></div>
                                        </div>
                                    </div>
                                    <div class="q1n5ly75"></div>
                                    </c:forEach>
                                </section>
                            </div>
                            <div class="container" id="container" style="display: none;">
                                <div class="bar">
                                    <div class="fill" id="fill"></div>
                                </div>
                                <div class="counter" id="counter">0%</div>
                                <div class="content">Vui lòng đợi, đang tải kết quả của bạn</div>
                            </div>

                            <div class="output" id="output">
                                <span class="fa fa-check"></span>
                                <div class="text">Tiến trình hoàn tất !!</div>
                            </div>
                            <div class="my-questions" id="myQuestions">
                                <div data-testid="screen-content">
                                    <div class="screen-content-div" style="--screen-content-div-5: auto">
                                        <nav class="screen-content-nav">
                                            <div class="screen-content-nav-div">
                                                <div aria-label="x" class="AssemblyIcon AssemblyIcon--small" role="img" id="Assembly">
                                                    <i class="fa fa-align-left" aria-hidden="true" style="font-size: 1.5em; margin-top: 24px;"></i>
                                                </div>
                                            </div>
                                            <div class="screen-content list_question" id="menu-list-question" style="--list_question-1: #3ccfcf; --list_question-6: 0; margin-left: 34px;">
                                                Danh sách câu hỏi
                                            </div>
                                            <ul class="head-list">
                                                <li class="list_question" style="--list_question-1: #3ccfcf; --list_question-6: 1rem">Tự luận</li>
                                                <li class="list_question" style="--list_question-1: #3ccfcf; --list_question-6: 0">1</li>
                                                <li class="list_question" style="--list_question-1: #3ccfcf; --list_question-6: 0">2</li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="StudyModesLayout_sb smLayout">
                                        <section class="StudyModesLayout_section_scores_board">
                                            <h4 class="StudyModesLayout_h4_scores_board">${cards.size()} Câu hỏi</h4>
                                            <div role="list">
                                                <c:forEach items="${cards}" var="card">
                                                <div role="listitem" class="listitem" >
                                                    <div id="written-0" tabindex="-1" class="listitem_written">
                                                        <article class="listitem_written_article article" style="--article-3: 0; --article-13: 0.5rem">
                                                            <div class="listitem_article-definition" >
                                                                <div class="listitem_article-definition-sub">
                                                                    <div class="listitem_article-definition-sub-hr">
                                                                        <div class="listitem_article-definition-sub-st">
                                                                            <section class="listitem_article-definition-sub-sc" >
                                                                                Định nghĩa
                                                                            </section>
                                                                            <div class="listitem_article-definition-sub-div-btn">
                                                                                <button type="button" aria-label="sound" class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--tertiary AssemblyIconButton--circle AssemblyButtonBase--small AssemblyButtonBase--circle">
                                                                                    <div aria-label="sound" class="AssemblyIcon AssemblyIcon--small" role="img">
                                                                                        <i class="fa fa-volume-up" aria-hidden="true" style="font-size: 1.2em;"></i>
                                                                                    </div>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="question_text" data-testid="Question Text" style="--question_text-0: auto">
                                                                        <div class="question_text_1 qtZoom">
                                                                            <div aria-label="${card.meaning}" class="FormattedText notranslate FormattedTextWithImage-wrapper lang-en" style="font-size: 20px">
                                                                                    ${card.meaning}
                                                                                <div style="display: block">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="listitem_written_result" style="--listitem_written_result-1: 10rem">
                                                                <div class="listitem_written_result-sub">
                                                                    <section class="listitem_written_result-sub-sc">
                                                                        Đáp án của bạn
                                                                    </section>
                                                                </div>
                                                                <form name="form" class="myForm">
                                                                    <div>
                                                                        <label class="AssemblyInput">
                                                                            <input autocompconste="off" spellcheck="false" aria-label="Nhập đáp án"
                                                                                   class="AssemblyInput-input AssemblyInput-placeholder js-bound" placeholder="Nhập đáp án"
                                                                                   type="text" value="" required/>
                                                                        </label>
                                                                    </div>
                                                                    <div class="mySubmit">
                                                                        <button type="submit" aria-label="Tiếp" class="AssemblyButtonBase AssemblyPrimaryButton--colorRefresh AssemblyPrimaryButton--default AssemblyButtonBase--medium AssemblyButtonBase--padding">
                                                                            <span>Tiếp</span>
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="listitem_written_result_none">
                                                                <div class="div-none-1-1">1/${cards.size()}</div>
                                                            </div>
                                                        </article>
                                                    </div>
                                                </div>
                                                </c:forEach>
<%--                                                <div role="listitem" class="listitem">--%>
<%--                                                    <div id="written-1" tabindex="-1" class="listitem_written">--%>
<%--                                                        <article class="listitem_written_article article" style="--article-3:0; --article-13:0.5rem;">--%>
<%--                                                            <div class="listitem_article-definition">--%>
<%--                                                                <div class="listitem_article-definition-sub">--%>
<%--                                                                    <div class="listitem_article-definition-sub-hr">--%>
<%--                                                                        <div class="listitem_article-definition-sub-st">--%>
<%--                                                                            <section class="listitem_article-definition-sub-sc">Định nghĩa</section>--%>
<%--                                                                            <div class="listitem_article-definition-sub-div-btn">--%>
<%--                                                                                <button type="button" aria-label="sound" class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--tertiary AssemblyIconButton--circle AssemblyButtonBase--small AssemblyButtonBase--circle">--%>
<%--                                                                                    <div aria-label="sound" class="AssemblyIcon AssemblyIcon--small" role="img">--%>
<%--                                                                                        <i class="fa fa-volume-up" aria-hidden="true" style="font-size: 1em;"></i>--%>
<%--                                                                                    </div>--%>
<%--                                                                                </button>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div class="question_text" data-testid="Question Text" style="--question_text-0:auto;">--%>
<%--                                                                        <div class="question_text_1 qtZoom">--%>
<%--                                                                            <div aria-label="the process of acquiring new and relatively enduring information or behaviors" class="FormattedText notranslate FormattedTextWithImage-wrapper lang-en" style="font-size: 20px;">--%>
<%--                                                                                <div style="display: block;">away from learning</div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="FormattedTextWithImage-wrapper ftZoom">--%>
<%--                                                                                <div class="Image Zoom-Formatted">--%>
<%--                                                                                    <div class="ZoomableImage">--%>
<%--                                                                                        <img alt="" class="ZoomableImage-rawImage">--%>
<%--                                                                                    </div>--%>
<%--                                                                                    <div class="Image-image" style="background-image: url(./img/kid-computational-thinking-light.jpeg); background-position: center center; background-repeat: no-repeat; height: 104px; width: 104px; background-size: cover;"></div>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="listitem_written_result" style="--listitem_written_result-1:10rem;">--%>
<%--                                                                <div class="listitem_written_result-sub">--%>
<%--                                                                    <section class="listitem_written_result-sub-sc">Đáp án của bạn</section>--%>
<%--                                                                </div>--%>
<%--                                                                <form name="form" class="myForm">--%>
<%--                                                                    <div>--%>
<%--                                                                        <label class="AssemblyInput">--%>
<%--                                                                            <input autocompconste="off" spellcheck="false" aria-label="Nhập đáp án" class="AssemblyInput-input AssemblyInput-placeholder js-bound" placeholder="Nhập đáp án" type="text" value="">--%>
<%--                                                                        </label>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div class="mySubmit"></div>--%>
<%--                                                                </form>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="listitem_written_result_none">--%>
<%--                                                                <div class="div-none-1-1">2/2</div>--%>
<%--                                                            </div></article></div>--%>
<%--                                                </div>--%>
                                            </div>
                                        </section>
                                        <section class="cdm2lgu StudyModesLayout_section_scores_board">
                                            <button
                                                    type="button"
                                                    aria-label="Xem đáp án"
                                                    class="AssemblyButtonBase AssemblyPrimaryButton--colorRefresh AssemblyPrimaryButton--default AssemblyButtonBase--medium AssemblyButtonBase--padding AssemblyButtonBase--fullWidth"
                                                    id="testCTA"
                                                    onclick="openPopUp()"
                                            >
                                                <span>Xem đáp án</span>
                                            </button>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <div data-testid="screen-content" class="t49zntr" id="myResults" style="display: none;">
                                <div class="screen-content-div" style="--screen-content-div-5: auto">
                                    <nav class="screen-content-nav">
                                        <div class="screen-content-nav-div">
                                            <div aria-label="x" class="AssemblyIcon AssemblyIcon--small" role="img"
                                                 id="AssemblyIcon-result">
                                                <i class="fa fa-align-left" aria-hidden="true" style="font-size: 1.5em; margin-top: 24px;"></i>
                                            </div>
                                        </div>
                                        <div class="screen-content list_question"
                                             id="menu-list-question-result" style="--list_question-1: #3ccfcf; --list_question-6: 0; margin-left: 34px;">
                                            Danh sách câu hỏi
                                        </div>
                                        <ul class="head-list-result">
                                            <li class="list_question" style="--list_question-1: #3ccfcf; --list_question-6: 1rem">
                                                Tự luận
                                            </li>
                                            <li class="list_question" style="--list_question-1: #3ccfcf; --list_question-6: 0">
                                                1
                                            </li>
                                            <li class="list_question" style="--list_question-1: #3ccfcf; --list_question-6: 0">
                                                2
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <section class="StudyModesLayout_section_scores_board">
                                    <article class="cnnm8fr article" style="--article-3:0; --article-13:0.5rem; --cnnm8fr-2:52.5rem; --cnnm8fr-3:auto; --cnnm8fr-5:3rem; --cnnm8fr-9:3rem;">
                                        <h3 class="t1pp8hw6 h9lvpq">Bạn đang tiến bộ!</h3>
                                        <p class="s10f7d6k">Ngay cả khi bạn chưa biết tất cả các câu trả lời, kiểm tra bản thân là cách hiệu quả nhất để ghi nhớ. Tiếp tục phát huy nhé!</p>
                                        <div class="s1nk1180">
                                            <div class="s1iozbl1">
                                                <section class="shb807a">KẾT QUẢ</section>
                                                <section class="sjbbr3u">
                                                    <section class="so517vd">
                                                        <span>0/2</span>
                                                        <span class="p1bn4u3m">(0%)</span>
                                                    </section>
                                                </section>
                                                <section class="srm4bze" style="background-image: url(./img/grayLine.png)"></section>
                                            </div>
                                            <div class="s1iozbl1">
                                                <section class="shb807a">THỜI GIAN</section>
                                                <section class="sjbbr3u">1 phút</section>
                                                <section class="srm4bze" style="background-image: url(./img/straight-line-icon-7.jpg)">
                                                </section>
                                            </div>
                                        </div>
                                        <div class="b12ccik1" style="--b12ccik1-0:2rem;">
                                            <button type="button" aria-label="Hỏi lại các thuật ngữ sai" class="AssemblyButtonBase AssemblySecondaryButton AssemblyButtonBase--large AssemblyButtonBase--padding" onclick="closeResults()">
                                                <span>Hỏi lại các thuật ngữ sai</span>
                                            </button>
                                            <button type="button" aria-label="Bài kiểm tra mới" class="AssemblyButtonBase AssemblyPrimaryButton--colorRefresh AssemblyPrimaryButton--default AssemblyButtonBase--large AssemblyButtonBase--padding" onclick="openOption()">
                                                <span>Bài kiểm tra mới</span>
                                            </button>
                                        </div>
                                    </article>
                                </section>
                                <section class="StudyModesLayout_section_scores_board">
                                    <h4 class="StudyModesLayout_h4_scores_board">2 Câu hỏi tự luận</h4>
                                    <div role="list">
                                        <c:forEach items="${cards}" var="card">
                                        <div role="listitem" class="listitem">
                                            <div id="written-0" tabindex="-1" class="listitem_written">
                                                <article class="listitem_written_article article" style="--article-3:0; --article-13:0.5rem;">
                                                    <div class="listitem_article-definition">
                                                        <div class="listitem_article-definition-sub">
                                                            <div class="listitem_article-definition-sub-hr">
                                                                <div class="listitem_article-definition-sub-st">
                                                                    <section class="listitem_article-definition-sub-sc">Định nghĩa</section>
                                                                    <div class="listitem_article-definition-sub-div-btn">
                                                                        <button type="button" aria-label="sound" class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--tertiary AssemblyIconButton--circle AssemblyButtonBase--small AssemblyButtonBase--circle">
                                                                            <div aria-label="sound" class="AssemblyIcon AssemblyIcon--small" role="img">
                                                                                <i class="fa fa-volume-up" aria-hidden="true" style="font-size: 1em;"></i>
                                                                            </div>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="question_text" data-testid="Question Text" style="--question_text-0:auto;">
                                                                <div class="question_text_1 qtZoom">
                                                                    <div aria-label="the process of acquiring new and relatively enduring information or behaviors" class="FormattedText notranslate FormattedTextWithImage-wrapper lang-en" style="font-size: 20px;">
                                                                        <div style="display: block;">${card.meaning}</div>
                                                                    </div>
<%--                                                                    <div class="FormattedTextWithImage-wrapper ftZoom">--%>
<%--                                                                        <div class="Image Zoom-Formatted">--%>
<%--                                                                            <div class="ZoomableImage">--%>
<%--                                                                                <img alt="" class="ZoomableImage-rawImage"></div>--%>
<%--                                                                            <div class="Image-image" style="background-image: url(/img/kid-computational-thinking-light.jpeg); background-position: center center; background-repeat: no-repeat; height: 104px; width: 104px; background-size: cover;"></div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="listitem_written_result" style="--listitem_written_result-1:10rem;">
                                                        <div class="listitem_written_result_re_again">
                                                            <div class="listitem_written_result-sub">
                                                                <section aria-label="Thử lại câu hỏi này sau!" class="s1e3267a">Thử lại câu hỏi này sau!</section>
                                                            </div>
                                                            <section class="submit-answer-section wbkjose" tabindex="0">
                                                                <div>
                                                                    <div class="submit-answer">
                                                                        <div aria-label="x" class="AssemblyIcon AssemblyIcon--medium" role="img">
                                                                            <i class="fa fa-times" aria-hidden="true" style="font-size: 1.5em;"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <span data-testid="Submitted Answer">Đã bỏ qua</span>
                                                            </section>
                                                        </div>
                                                        <div class="listitem_written_result_parent">
                                                            <div class="listitem_written_result_re_again">
                                                                <div class="listitem_written_result-sub">
                                                                    <section class="listitem_written_result-sub-sc">Đáp án đúng</section>
                                                                </div>
                                                                <section class="answer wbkjose" tabindex="0">
                                                                    <div>
                                                                        <div class="submit-answer">
                                                                            <div aria-label="check" class="AssemblyIcon AssemblyIcon--medium" role="img">
                                                                                <i class="fa fa-check" aria-hidden="true" style="font-size: 1em;"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <span>
                                        <span data-testid="diff-text">${card.term}</span>
                                      </span>
                                                                </section>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="listitem_written_result_none">
                                                        <div class="div-none-1-1">1/2</div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        </c:forEach>
<%--                                        <div role="listitem" class="listitem">--%>
<%--                                            <div id="written-1" tabindex="-1" class="listitem_written">--%>
<%--                                                <article class="listitem_written_article article" style="--article-3:0; --article-13:0.5rem;">--%>
<%--                                                    <div class="listitem_article-definition">--%>
<%--                                                        <div class="listitem_article-definition-sub">--%>
<%--                                                            <div class="listitem_article-definition-sub-hr">--%>
<%--                                                                <div class="listitem_article-definition-sub-st">--%>
<%--                                                                    <section class="listitem_article-definition-sub-sc">Định nghĩa</section>--%>
<%--                                                                    <div class="listitem_article-definition-sub-div-btn">--%>
<%--                                                                        <button type="button" aria-label="sound" class="AssemblyButtonBase AssemblyIconButton AssemblyIconButton--tertiary AssemblyIconButton--circle AssemblyButtonBase--small AssemblyButtonBase--circle">--%>
<%--                                                                            <div aria-label="sound" class="AssemblyIcon AssemblyIcon--small" role="img">--%>
<%--                                                                                <i class="fa fa-volume-up" aria-hidden="true" style="font-size: 1em;"></i>--%>
<%--                                                                            </div>--%>
<%--                                                                        </button>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="question_text" data-testid="Question Text" style="--question_text-0:auto;">--%>
<%--                                                                <div class="question_text_1 qtZoom">--%>
<%--                                                                    <div aria-label="the process of acquiring new and relatively enduring information or behaviors" class="FormattedText notranslate FormattedTextWithImage-wrapper lang-en" style="font-size: 20px;">--%>
<%--                                                                        <div style="display: block;">the process of acquiring new and relatively enduring information or behaviors</div>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div class="FormattedTextWithImage-wrapper ftZoom">--%>
<%--                                                                        <div class="Image Zoom-Formatted">--%>
<%--                                                                            <div class="ZoomableImage">--%>
<%--                                                                                <img alt="" class="ZoomableImage-rawImage"></div>--%>
<%--                                                                            <div class="Image-image" style="background-image: url(./img/kids-learning-5684253.jpg); background-position: center center; background-repeat: no-repeat; height: 104px; width: 104px; background-size: cover;"></div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="listitem_written_result" style="--listitem_written_result-1:10rem;">--%>
<%--                                                        <div class="listitem_written_result_re_again">--%>
<%--                                                            <div class="listitem_written_result-sub">--%>
<%--                                                                <section aria-label="Thử lại câu hỏi này sau!" class="s1e3267a">Thử lại câu hỏi này sau!</section>--%>
<%--                                                            </div>--%>
<%--                                                            <section class="submit-answer-section wbkjose" tabindex="0">--%>
<%--                                                                <div>--%>
<%--                                                                    <div class="submit-answer">--%>
<%--                                                                        <div aria-label="x" class="AssemblyIcon AssemblyIcon--medium" role="img">--%>
<%--                                                                            <i class="fa fa-times" aria-hidden="true" style="font-size: 1.5em;"></i>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <span data-testid="Submitted Answer">Đã bỏ qua</span>--%>
<%--                                                            </section>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="listitem_written_result_parent">--%>
<%--                                                            <div class="listitem_written_result_re_again">--%>
<%--                                                                <div class="listitem_written_result-sub">--%>
<%--                                                                    <section class="listitem_written_result-sub-sc">Đáp án đúng</section>--%>
<%--                                                                </div>--%>
<%--                                                                <section class="answer wbkjose" tabindex="0">--%>
<%--                                                                    <div>--%>
<%--                                                                        <div class="submit-answer">--%>
<%--                                                                            <div aria-label="check" class="AssemblyIcon AssemblyIcon--medium" role="img">--%>
<%--                                                                                <i class="fa fa-check" aria-hidden="true" style="font-size: 1em;"></i>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                    <span>--%>
<%--                                                                        <span data-testid="diff-text">Learning</span>--%>
<%--                                                                    </span>--%>
<%--                                                                </section>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="listitem_written_result_none">--%>
<%--                                                        <div class="div-none-1-1">2/2</div>--%>
<%--                                                    </div>--%>
<%--                                                </article>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<div role="dialog" id="myOption" aria-modal="true" class="UIModal UIModal-container is-white is-open" style="display: none;">
    <div class="UIModal-box">
        <div class="UIModalHeader">
            <div class="UIModalHeader-wrapper">
              <span class="UIModalHeader-close">
                <div class="UIModalHeader-closeIconButton">
                  <span class="UIIconButton">
                    <button aria-label="Đóng cửa sổ" class="UIButton UIButton--inverted" type="button" onclick="closeOption()">
                      <span class="UIButton-wrapper">
                        <div aria-label="close" class="UIIcon UIIcon--x-thin" role="img">
                          <i class="fa fa-times-circle" aria-hidden="true" style="font-size: 1.9em; margin-top: -39px; margin-left: -1px; color: gray;"></i>
                        </div>
                      </span>
                    </button>
                  </span>
                </div>
              </span>
                <div class="UIModalHeader-childrenWrapper">
                    <h3 class="UIHeading UIHeading--three">Tùy chọn</h3>
                </div>
            </div>
        </div>
        <div class="UIModalBody">
            <div class="TestModeOptions" data-testid="TestModeOptions">
                <form  method="get">
                    <div class="UIRow">
                        <button aria-label="Tạo bài kiểm tra mới" class="UIButton UIButton--fill UIButton--hero" type="submit" style="background-color: #3ccfcf;
              color: white;">
                            <span class="UIButton-wrapper">Tạo bài kiểm tra mới</span>
                        </button>
                    </div>
                    <div class="UIRow">
                        <div class="UIColumn UIColumn--d6 UIColumn--m6">
                            <div class="UIFieldset notranslate">
                                <legend class="UIFieldset-legend">LOẠI CÂU HỎI</legend>
                                <div class="UIFieldset-fields">
                                    <ul>
                                        <li class="TestModeOptions-listOption">
                                            <label class="UICheckbox" >
                                                <input class="UICheckbox-input" name="1" type="checkbox" value="" checked="">
                                                <span class="UICheckbox-fauxInput"></span>
                                                <span class="UICheckbox-label">Tự luận</span>
                                            </label>
                                        </li>
                                        <li class="TestModeOptions-listOption">
                                            <label class="UICheckbox" >
                                                <input class="UICheckbox-input" name="2" type="checkbox" value="" checked="">
                                                <span class="UICheckbox-fauxInput"></span>
                                                <span class="UICheckbox-label">Ghép thẻ</span>
                                            </label>
                                        </li>
                                        <li class="TestModeOptions-listOption">
                                            <label class="UICheckbox" >
                                                <input class="UICheckbox-input" name="3" type="checkbox" value="" checked="">
                                                <span class="UICheckbox-fauxInput"></span>
                                                <span class="UICheckbox-label">Nhiều lựa chọn</span>
                                            </label>
                                        </li>
                                        <li class="TestModeOptions-listOption">
                                            <label class="UICheckbox" >
                                                <input class="UICheckbox-input" name="4" type="checkbox" value="" checked="">
                                                <span class="UICheckbox-fauxInput"></span>
                                                <span class="UICheckbox-label">Đúng/Sai</span>
                                            </label>
                                        </li>
                                        <li class="TestModeOptions-listOption">
                                            <label class="UICheckbox" >
                                                <input class="UICheckbox-input" name="multipleAnswers" type="checkbox" value="">
                                                <span class="UICheckbox-fauxInput"></span><span class="UICheckbox-label">Chỉ cần một đáp án</span>
                                            </label>
                                            <small class="UISmall">
                                                <div class="TestModeOptions-listOption-description">Đánh dấu câu trả lời là chính xác khi cung cấp ít nhất một đáp án đúng. Câu trả lời phải được phân tách bằng dấu gạch chéo ( / ), dấu phẩy ( , ) hoặc dấu chấm phẩy ( ; ).</div>
                                            </small>
                                        </li>
                                        <li class="TestModeOptions-listOption">
                                            <label class="UICheckbox" >
                                                <input class="UICheckbox-input" name="typoHelp" type="checkbox" value="" checked="">
                                                <span class="UICheckbox-fauxInput"></span><span class="UICheckbox-label">Hỗ trợ đánh máy</span>
                                            </label>
                                            <small class="UISmall">
                                                <div class="TestModeOptions-listOption-description">Bỏ qua lỗi đánh máy những khác biệt nhỏ về chính tả giữa câu trả lời của bạn và đáp án</div>
                                            </small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="UIColumn UIColumn--d6 UIColumn--m6">
                            <div class="UIFieldset notranslate">
                                <legend class="UIFieldset-legend">GIỚI HẠN CÂU HỎI</legend>
                                <div class="UIFieldset-fields">
                                    <div class="UIDiv">
                                        <div class="TestModeOptions-questionLimitInputLabel"></div>
                                        <div class="TestModeOptions-questionLimitInputWrapper">
                                            <label aria-invalid="false" class="UIInput">
                                                <div class="UIInput-content">
                                                    <input aria-label="Nhập số lượng câu hỏi" name="questionCount" size="3" class="UIInput-input" type="number" value="2">
                                                    <span class="UIInput-border"></span></div>
                                            </label>
                                        </div>
                                        <div class="TestModeOptions-questionLimitInputLabel">/ 2 câu hỏi</div>
                                    </div>
                                </div>
                            </div>
                            <div class="UIFieldset notranslate">
                                <legend class="UIFieldset-legend">ẢNH</legend>
                                <div class="UIFieldset-fields">
                                    <label class="UICheckbox">
                                        <input class="UICheckbox-input"  type="checkbox" value="" checked="">
                                        <span class="UICheckbox-fauxInput"></span>
                                        <span class="UICheckbox-label">Hiện ảnh</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="UIDiv UIModalBodySeparator">
                        <hr class="UIHorizontalRule"></div>
                    <div class="UIRow">
                        <div class="UIColumn UIColumn--d12 UIColumn--m6">
                            <div class="UIFieldset notranslate">
                                <legend class="UIFieldset-legend">Học thuật ngữ có gắn sao</legend>
                                <div class="UIFieldset-fields">
                                    <div aria-disabled="true" class="UIToggle">
                        <span class="UIToggle-option">
                          <input aria-label="false" class="UIToggle-optionInput" disabled="" name="selectedOnly" type="radio" value="false" checked="">
                          <span class="UIToggle-optionLabel">Tất cả</span>
                        </span>
                                        <span class="UIToggle-option">
                          <input aria-label="true" class="UIToggle-optionInput" disabled="" name="selectedOnly" type="radio" value="true">
                          <span class="UIToggle-optionLabel">Có gắn sao</span>
                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="UIFieldset notranslate">
                        <legend class="UIFieldset-legend">TRẢ LỜI BẰNG</legend>
                        <div class="UIFieldset-fields">
                            <div class="TestModeOptions-cols" data-testid="AnswerWith">
                                <div class="TestModeOptions-col">
                                    <label class="UICheckbox" >
                                        <input class="UICheckbox-input" name="word" type="checkbox" value="" checked="">
                                        <span class="UICheckbox-fauxInput"></span>
                                        <span class="UICheckbox-label">Thuật ngữ</span>
                                    </label>
                                    <label class="UICheckbox">
                                        <input class="UICheckbox-input" name="definition" type="checkbox" value="">
                                        <span class="UICheckbox-fauxInput"></span>
                                        <span class="UICheckbox-label">Định nghĩa</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="UIDiv TestModeOptions-settingMeta TestModeOptions-col">Bạn sẽ được yêu cầu nhớ lại thuật ngữ.</div>
                    <div class="TestModeOptions-toggle">
                        <div class="TestModeOptions-flexContainer">
                            <button class="UILink" type="button">Hiển thị tùy chọn nâng cao</button>
                        </div>
                    </div>
                    <div class="UIDiv UIModalBodySeparator">
                        <hr class="UIHorizontalRule">
                    </div>
                    <div class="UIRow">
                        <a class="UILink" data-testid="UILink-anchor">Chính sách quyền riêng tư</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="ReactModalPortal" id="myPopup" style="display: none;">
    <div class="ReactModal__Overlay ReactModal__Overlay--after-open rmp">
        <div class="ReactModal__Content ReactModal__Content--after-open mnlifen o126043d l1echgc4" role="dialog" aria-modal="true">
            <div aria-label="Đóng cửa sổ" class="c13e2cpr" style="--c13e2cpr-0:var(--gray-100-gray-700);">
                <div aria-label="x" class="AssemblyIcon AssemblyIcon--medium" role="img" onclick="closePopUp()">
                    <i class="fa fa-times-circle" aria-hidden="true" style="font-size: 2em; cursor: pointer;"></i>
                </div>
            </div>
            <div class="popup_check_question">
                <div class="popup_check_question_navbar" style="--popup_check_question_navbar-0:stretch; --popup_check_question_navbar-3:left;">
                    <header>
                        <h2 class="re-question">Có vẻ như bạn đã bỏ qua một số câu hỏi!</h2>
                        <div class="s1ltekmn">Bạn có muốn trả lời các câu đó trước khi kiểm tra không?</div>
                    </header>
                </div>
                <div class="my-pop-none"></div>
            </div>
            <div class="popup_check" style="--popup_check-0:0.0625rem solid var(--gray-300-gray-600); --popup_check-1:1rem; --popup_check-2:flex-end;">
                <button id="Assemble-button-icon"type="button" aria-label="Không, xem câu trả lời ngay" class="AssemblyButtonBase AssemblySecondaryButton AssemblyButtonBase--medium AssemblyButtonBase--padding">
                    <span>Không, xem câu trả lời ngay</span>
                </button>
                <button type="button" aria-label="Có" class="AssemblyButtonBase AssemblyPrimaryButton--colorRefresh AssemblyPrimaryButton--default AssemblyButtonBase--medium AssemblyButtonBase--padding" onclick="closePopUp()">
                    <span>Có</span>
                </button>
            </div>
        </div>
    </div>
</div>


<script src="./js/check.js"></script>
<script src="./js/menuListResult.js"></script>

</body>
</html>
