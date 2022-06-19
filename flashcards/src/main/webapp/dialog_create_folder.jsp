<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/18/2022
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="./css/dialog_create_folder.css">


<div class="dialog__create-folder">
    <button onclick="closeDialogCreateFolder()" class="dialog__create-folder-btn-close">
        <i class="fas fa-times"></i>
    </button>
    <div class="dialog__create-folder-content">
        <h1 class="dialog__create-folder-title">Tạo thư mục mới</h1>

        <div class="dialog__create-folder-input">
            <input type="text" class="dialog__create-folder-input-text" placeholder="Nhập tiêu đề">
        </div>

        <div class="dialog__create-folder-area">
            <textarea class="dialog__create-folder-area-text" placeholder="Nhập mô tả"></textarea>
        </div>

    </div>
    <div class="dialog__create-folder-separate"></div>

    <div class="dialog__create-folder-btn">
        <button class="dialog__create-folder-btn-create">Tạo thư mục</button>
    </div>
</div>