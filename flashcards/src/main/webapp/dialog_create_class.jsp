<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/18/2022
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="./css/dialog_create_class.css">

<div class="dialog__create-class">
    <button onclick="closeDialogCreateClass()" class="dialog__create-class-btn-close">
        <i class="fas fa-times"></i>
    </button>
    <div class="dialog__create-class-content">
        <h1 class="dialog__create-class-title">Tạo lớp mới</h1>
        <form method="post" action="create-class">
        <div class="dialog__create-class-form">
            <input type="text" class="dialog__create-class-input" placeholder="Nhập tên lớp" name="cname">
            <label class="dialog__create-class-label">TÊN LỚP</label>
        </div>
        <div class="dialog__create-class-form">
            <textarea class="dialog__create-class-input"
                      placeholder="Nhập mô tả (tuỳ chọn)" name="cdescription"></textarea>
            <label class="dialog__create-class-label">MÔ TẢ</label>
        </div>
        <div class="dialog__create-class-form">
            <input type="text" class="dialog__create-class-input" placeholder="Nhập tên trường" name="schoolname">
            <label class="dialog__create-class-label">TRƯỜNG</label>
        </div>

        <button class="dialog__create-class-btn" type="submit">
            Tạo lớp
        </button>
        </form>
    </div>
</div>