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
    <link rel="stylesheet" href="./css/create_term.css">
    <link rel="stylesheet" href="./css/library_folder.css">
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
    <c:forEach items="${courses}" var="course">
    <div class="folder__card">
        <div class="folder__card-header">
            <a href="detail-term?course_id=${course.id}" class="folder__card-title">
                ${course.courseName}
            </a>
            <p class="folder__card-count">
            ${course.cards.size()}thuật ngữ
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
                <a href="" class="folder__card-footer-delete-btn">
                    <i class="bi bi-trash"></i>
                </a>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
<script src="./js/create_term.js"></script>
<script src="./js/library_folder.js"></script>
<script src="./js/header.js"></script>
</body>
</html>
