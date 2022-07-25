<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"/>
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link rel="stylesheet" href="./css/home.css">

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="home__container">

    <div class="dashboard__main">
        <div class="list__card">
            <c:forEach items="${courses}" var="course">
                <a href="detail-term?course_id=${course.id}" class="home__card-link">
                    <div class="folder__card">
                        <div class="folder__card-header">
                            <p class="folder__card-title">
                                    ${course.courseName}
                            </p>
                            <p class="folder__card-count">
                                    ${course.cards.size()} thuật ngữ
                            </p>
                        </div>
                        <div class="folder__card-footer">
                            <div class="folder__card-footer-author">
                                <div class="folder__card-footer-author-icon">
                                    <img class="navbar__term-author-img"
                                         src="${course.getAvatarCreator()}" alt="">
                                </div>
                                <div class="folder__card-footer-author-name">
                                        ${course.creatorName}
                                </div>
                            </div>

                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="dashboard__adz">
    </div>

</div>
<script src="./js/header.js"></script>
</body>
</html>
