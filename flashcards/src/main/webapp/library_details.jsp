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
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * {
            font-weight: 600;
        }

        .background-custom {
            background-color: #F8F9FA;
            font-size: 16px;
            min-height: calc(100vh - 63px);
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="pb-5 background-custom">
    <div class="container-lg">
        <div class="row">
            <div class="col-3 d-flex  align-items-center mt-4">
                <img width="64" height="64" class="rounded-pill me-3"
                     src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"
                     alt="">
                <div>
                    <h3 class="mb-0">${sessionScope.user.username}</h3>
                    <%--                    <h5 class="text-secondary">Khanh Du</h5>--%>
                </div>
            </div>

            <div class="mt-5">
                <ul class="nav nav-tabs ">
                    <li class="nav-item fw-bolder">
                        <a class="nav-link active" data-bs-toggle="tab" href="#hoc_phan">H???c ph???n</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#thu_muc">Th?? m???c</a>
                    </li>
                    <c:if test="${sessionScope.user.role=='1'}">
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#lop_hoc">L???p h???c</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>

        <div class="tab-content">
            <div id="hoc_phan" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-md-12 col-lg-10 mt-5">
                        <div class="row">
                            <div class="d-flex justify-content-between">
                                <%--                                <div class="dropdown col-2">--%>
                                <%--                                    <button class="btn btn-outline-secondary dropdown-toggle bg-white text-dark"--%>
                                <%--                                            data-bs-toggle="dropdown">G???n ????y--%>
                                <%--                                    </button>--%>
                                <%--                                    <div class="dropdown-menu">--%>
                                <%--                                        <a href="#" class="dropdown-item">???? t???o</a>--%>
                                <%--                                        <a href="#" class="dropdown-item active">G???n ????y</a>--%>
                                <%--                                        <a href="#" class="dropdown-item">???? h???c</a>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="col-6">--%>
                                <%--                                    <div class="input-group">--%>
                                <%--                                        <input type="text" class="form-control" placeholder="T??m ki???m h???c ph???n">--%>
                                <%--                                        <span class="input-group-text">--%>
                                <%--                                                <i class="fas fa-search"></i>--%>
                                <%--                                            </span>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>

                            </div>
                        </div>

                        <div>
                            <%--                            <div class="mt-4">--%>
                            <%--                                <div class="row">--%>
                            <%--                                    <div class="divider d-flex align-items-center">--%>
                            <%--                                        <p class="font-weight-light col-auto m-0 "><small>??T PH??T TR?????C</small></p>--%>
                            <%--                                        <hr style="width: 100%" class="ms-2">--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <c:forEach items="${courses}" var="course">
                                <div class="mt-2">
                                    <div class="shadow-sm p-3 bg-white rounded">
                                        <div>
                                            <div class="row" style="font-size: 13px;">
                                                <span class="col-auto col-sm-auto">${course.cards.size()} thu???t ng???</span>
                                                <div class="col-auto col-sm-auto border-start">
                                                    <div class="d-flex align-items-center">
                                                        <img width="20" height="20" class="rounded-pill"
                                                             src="${sessionScope.user.avatar}">
                                                        <span class="ps-2 text-info">${sessionScope.user.username}</span>
                                                    </div>
                                                </div>
                                                    <%--                                            <span class="col-auto col-sm-auto border-start text-secondary">L???p--%>
                                                    <%--                                                    DH18DTB</span>--%>
                                            </div>
                                            <div class="mt-2">
                                                <a href="detail-term?course_id=${course.id}"
                                                   style="text-decoration: none">
                                                    <h3 class="mb-0" style="color: #000;">${course.courseName}</h3>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <div id="thu_muc" class="tab-pane fade">
                <div class="row">
                    <div class="col-md-12 col-lg-10 mt-5">
                        <%--                        <div class="row">--%>
                        <%--                            <div class="dropdown">--%>
                        <%--                                <button class="btn btn-outline-secondary dropdown-toggle bg-white text-dark"--%>
                        <%--                                        data-bs-toggle="dropdown">G???n ????y--%>
                        <%--                                </button>--%>
                        <%--                                <div class="dropdown-menu">--%>
                        <%--                                    <a href="#" class="dropdown-item">???? ????nh d???u</a>--%>
                        <%--                                    <a href="#" class="dropdown-item">???? t???o</a>--%>
                        <%--                                    <a href="#" class="dropdown-item active">G???n ????y</a>--%>
                        <%--                                    <a href="#" class="dropdown-item">???? h???c</a>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <div class="mt-4">
                            <c:forEach items="${folders}" var="f">
                                <div class="row mb-2 g-0">
                                    <div class="shadow-sm p-3 bg-white rounded">
                                        <div>
                                            <span>${f.courseList.size()} h???c ph???n</span>
                                            <div class="mt-2 d-flex align-items-center">
                                                <i class="far fa-folder text-secondary" style="font-size: 1.5rem;"></i>
                                                <a href="library-folder?folder_id=${f.folderId}"
                                                   style="text-decoration: none"><h3 class="mb-0 ms-2"
                                                                                     style="color: #0a092d">${f.title}</h3>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.user.role=='1'}">
                <div id="lop_hoc" class="tab-pane fade">
                    <div class="row">
                        <div class="col-md-12 col-lg-10 mt-5">
                            <div>
                                <c:forEach items="${classrooms}" var="cr">
                                    <div class="row mb-2 g-0">
                                        <div class="shadow-sm p-3 bg-white rounded">
                                            <div style="font-size: 13px;">
                                                <div class="row">
                                                        <%--                                            <span class="col-auto col-sm-auto">2 thu???t ng???</span>--%>
                                                    <span class="col-auto col-sm-auto border-start">${cr.members.size()} th??nh vi??n</span>
                                                    <span class="col-auto col-sm-auto border-start text-secondary">
                                                            ${cr.school}
                                                    </span>
                                                </div>
                                                <div class="mt-2 d-flex align-items-center">
                                                    <i class="fas fa-user-friends" style="font-size: 18px;"></i>
                                                    <a href="library-class?class_id=${cr.classID}"
                                                       style="text-decoration: none;"><h3 class="mb-0 ms-2"
                                                                                          style="color: #0a092d">${cr.title}</h3>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>


                        </div>
                    </div>
                </div>
            </c:if>
        </div>


    </div>
</div>
<script src="./js/header.js"></script>
</body>
</html>
