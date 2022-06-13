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
    <h1 style="color:red" align="center">ADD CARD DETAIL</h1>
    <div align="center">
        <form action="created-card" method="post" enctype="multipart/form-data">
            Select Image :
            <input type="text" name="word">
            <input type="text" name="mean">
            <input type="file" name="image">
            <input type="submit" value="Create Card">
        </form>
    </div>
</body>
</html>
