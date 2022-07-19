<%--
  User: TRAN NHAT THY
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Tạo thẻ</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <h1 style="color:red" align="center">ADD CARD DETAIL</h1>
    <div align="center">
        <form action="created-card" method="post" enctype="multipart/form-data">
           <div>
               1
               <input type="text" name="word">
               <input type="text" name="mean">
               <input type="file" name="image">
           </div>
            <div>
                2
                <input type="text" name="word">
                <input type="text" name="mean">
                <input type="file" name="image">
            </div>
            <input type="submit" value="Create list card">
        </form>
    </div>
</body>
</html>
