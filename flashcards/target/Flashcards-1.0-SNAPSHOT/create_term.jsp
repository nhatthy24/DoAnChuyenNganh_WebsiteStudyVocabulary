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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"/>
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/create_term.css">
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
    <div class="create__term-content">
    <div class="create__header" id="create__header">
        <div class="create__header-title">
            <h1>Tạo học phần mới</h1>
        </div>
        <div class="create__header-action">
            <button class="create__header-action-btn" type="submit">
                Tạo
            </button>
        </div>
    </div>

    <div class="create__term-body">
        <form action="created-term" method="POST" accept-charset="UTF-8">
        <div class="create__term-infor">
            <div class="create__term-infor-title">
                <input class="create__term-infor-input" type="text" name="title" placeholder="Nhập tiêu đề">
                <label class="create__term-infor-label">TIÊU ĐỀ</label>
            </div>
            <div class="create__term-infor-description">
                <input class="create__term-infor-input" type="text" name="description" placeholder="Thêm mô tả">
                <label class="create__term-infor-label">MÔ TẢ</label>
            </div>
        </div>

        <div class="create__term-permission">
            <div class="create__term-permission-left">
                <button class="create__term-add-word create__term-permission-btn">
                    + Nhập từ Word, Excel, Google Docs,v.v.
                </button>
            </div>
            <div class="create__term-permission-right">
                <div class="create__term-permission-view">
                    <p class="create__term-permission-title">Hiển thị với mọi người</p>
                    <button class="create__term-permission-btn">Thay đổi</button>
                </div>
                <div class="create__term-permission-edit">
                    <p class="create__term-permission-title">Chỉ tôi có quyền sửa đổi</p>
                    <button class="create__term-permission-btn">Thay đổi</button>
                </div>
                <button class="create__term-permission-wrap create__term-permission-btn">
                    <i class="fas fa-exchange-alt"></i>
                </button>

                <div class="term__permission-dialog" id="term__permission-dialog" style="display: none">
                    <div class="permission__dialog-header">
                        <h3 class="permission__dialog-title">
                            Tuỳ chọn
                        </h3>
                        <button class="permission__dialog-close-btn">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div class="permission__dialog-body">
                        <div class="permission__dialog-row">
                            <div class="permission__dialog-item">
                                <p class="permission__dialog-item-title">
                                    HIỂN THỊ VỚI
                                </p>
                                <select class="permission__dialog-options">
                                    <option value="0">Mọi người</option>
                                    <option value="1">Một số lớp học</option>
                                    <option value="2">Người có mật khẩu</option>
                                    <option value="3">Chỉ tôi</option>
                                </select>
                                <p class="permission__dialog-item-description">
                                    Mọi người dùng Quizlet có thể sử dụng học phần này
                                </p>

                            </div>
                            <div class="permission__dialog-item">
                                <p class="permission__dialog-item-title">
                                    AI CÓ THỂ SỬA
                                </p>
                                <select class="permission__dialog-options">
                                    <option value="0">Mọi người</option>
                                    <option value="1">Một số lớp học</option>
                                    <option value="2">Người có mật khẩu</option>
                                    <option value="3">Chỉ tôi</option>
                                </select>

                                <p class="permission__dialog-item-description">
                                    Mọi người dùng Quizlet có thể sử dụng học phần này
                                </p>
                            </div>
                        </div>

                        <button class="permission__dialog-save-btn">Lưu</button>

                    </div>
                </div>

            </div>
        </div>
        <div class="create__term-upload">
            <button class="create__term-upload-btn">
                <h4 class="create__term-upload-title">Thêm hồ sơ và gắn nhãn</h4>
                <p class="create__term-upload-descr">
                    Kéo và thả ảnh bất kỳ hoặc
                    <span>chọn một hình ảnh</span>
                </p>
            </button>
        </div>

        <div class="create__term-definition">
            <div class="create__term-tag-list">
                <div class="tag__item">
                    <div class="tag__item-header">
                        <div class="tab__item-counter">
                            <p class="tab__count"></p>
                        </div>
                        <div class="tab__item-toolbar">
                            <button class="tab__item-toolbar-btn">
                                <i class="fas fa-grip-lines"></i>
                            </button>
                            <button class="tab__item-toolbar-btn">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </div>
                    <div class="tab__item-content">
                        <div class="tab__content-side-word">
                            <input class="tab__content-side-word-input" type="text" name="word">
                            <div class="tab__below-input">
                                <label class="tab__content-side-label">THUẬT NGỮ</label>
                                <button class="tab__language-side">TIẾNG ANH</button>
                            </div>
                        </div>
                        <div class="tab__content-side-definition">
                            <div class="tab__side-definition-editor">
                                <input class="tab__content-side-editor-input" type="text" name="mean">
                                <div class="tab__below-input">
                                    <label class="tab__content-side-label" >ĐỊNH NGHĨA</label>
                                    <button class="tab__language-side">TIẾNG VIỆT</button>
                                </div>
                            </div>
                            <div class="tab__side-img">
                                <i class="far fa-image"></i>
                                <p class="tab__side-img-text">HÌNH ẢNH</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tag__item">
                    <div class="tag__item-header">
                        <div class="tab__item-counter">
                            <p class="tab__count"></p>
                        </div>
                        <div class="tab__item-toolbar">
                            <button class="tab__item-toolbar-btn">
                                <i class="fas fa-grip-lines"></i>
                            </button>
                            <button class="tab__item-toolbar-btn">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </div>
                    <div class="tab__item-content">
                        <div class="tab__content-side-word">
                            <input class="tab__content-side-word-input" type="text" name="word">
                            <div class="tab__below-input">
                                <label class="tab__content-side-label" >THUẬT NGỮ</label>
                                <button class="tab__language-side">TIẾNG ANH</button>
                            </div>
                        </div>
                        <div class="tab__content-side-definition">
                            <div class="tab__side-definition-editor">
                                <input class="tab__content-side-editor-input" type="text" name="mean">
                                <div class="tab__below-input">
                                    <label class="tab__content-side-label" >ĐỊNH NGHĨA</label>
                                    <button class="tab__language-side">TIẾNG VIỆT</button>
                                </div>
                            </div>
                            <div class="tab__side-img">
                                <i class="far fa-image"></i>
                                <p class="tab__side-img-text">HÌNH ẢNH</p>
                            </div>
                        </div>
                        <span class="TermContent-counter"></span>
                    </div>
                </div>
            </div>
            <div class="create__term-add-tag">
                <button class="add__tab-btn">
                    <span>+ THÊM THẺ</span>
                </button>
            </div>

            <div class="create__term-add-btn">
                <button class="create__term-btn" type="submit">Tạo</button>
            </div>
        </div>
        </form>
    </div>

</div>

    <div class="modal" id="modal__permission" style="display: none">
        <div class="modal__overlay">

        </div>

        <div class="modal__body">
            <div class="modal__inner" id="modal__inner">
                <div class="term__permission-dialog">
                    <div class="permission__dialog-header">
                        <h3 class="permission__dialog-title">
                            Tuỳ chọn
                        </h3>
                        <button class="permission__dialog-close-btn" id="permission__dialog-close-btn">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div class="permission__dialog-body">
                        <div class="permission__dialog-row">
                            <div class="permission__dialog-item">
                                <p class="permission__dialog-item-title">
                                    HIỂN THỊ VỚI
                                </p>
                                <select class="permission__dialog-options" id="permission__dialog-view"
                                        onchange="changePermissionView()">
                                    <option value="0">Mọi người</option>
                                    <option value="1">Một số lớp học</option>
                                    <option value="2">Người có mật khẩu</option>
                                    <option value="3">Chỉ tôi</option>
                                </select>

                                <div class="permission__dialog-view-details">
                                    <div class="permission__dialog-view-details-item">
                                        <p class="permission__dialog-item-description"
                                           id="permission__dialog-item-view-description">
                                            Mọi người dùng Quizlet có thể sử dụng học phần này
                                        </p>

                                        <div class="permission__dialog-view" id="permission__dialog-view-class">
                                            <div class="permission__dialog-view-item">
                                                <label class="permission__dialog-label-class">
                                                    <input type="checkbox" name="class-permission" class="permission__dialog-view-class-input" value="1">
                                                    <span>DH18DTB</span>
                                                </label>
                                                <label class="permission__dialog-label-class">
                                                    <input type="checkbox" name="class-permission" class="permission__dialog-view-class-input" value="2">
                                                    <span>DH18DTA</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="permission__dialog-view" id="permission__dialog-view-password">
                                            <div class="permission__dialog-view-item">
                                                <input type="password" placeholder="Tạo mật khẩu"
                                                       id="permission__password-view">
                                                <label class="permission__dialog-label-password">MẬT KHẨU</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="permission__dialog-item">
                                <p class="permission__dialog-item-title">
                                    AI CÓ THỂ SỬA
                                </p>
                                <select class="permission__dialog-options"
                                        id="permission__dialog-edit" onchange="changePermissionEdit()">
                                    <option value="1">Một số lớp học</option>
                                    <option value="2">Người có mật khẩu</option>
                                    <option value="3">Chỉ tôi</option>
                                </select>

                                <div class="permission__dialog-view-details">
                                    <div class="permission__dialog-view-details-item">
                                        <p class="permission__dialog-item-description"
                                           id="permission__dialog-item-edit-description">
                                            Chỉ có bạn mới chỉnh sửa được học phần này
                                        </p>

                                        <div class="permission__dialog-view" id="permission__dialog-edit-class">
                                            <div class="permission__dialog-view-item">
                                                <label class="permission__dialog-label-class">
                                                    <input type="checkbox" name="class"  class="permission__dialog-edit-class-input" value="1">
                                                    <span>DH18DTB</span>
                                                </label>
                                                <label class="permission__dialog-label-class">
                                                    <input type="checkbox" name="class" class="permission__dialog-edit-class-input" value="2">
                                                    <span>DH18DTA</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="permission__dialog-view" id="permission__dialog-edit-password">
                                            <div class="permission__dialog-view-item">
                                                <input type="password" placeholder="Tạo mật khẩu" id="permission__password-edit">
                                                <label class="permission__dialog-label-password">MẬT KHẨU</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button class="permission__dialog-save-btn" id="permission__dialog-submit-btn">Lưu</button>

                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

    <script src="./js/header.js"></script>
    <script src="./js/create_term.js"></script>

</body>
</html>
