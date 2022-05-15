

function scrollHeader() {
    const headerCreate = document.getElementById("create__header");

    window.onscroll = () => {
        if (window.pageYOffset > 5) {
            headerCreate.style.top = 0;
            headerCreate.style.boxShadow = "0px 1px 23px 1px rgba(0,0,0,0.37)";
        } else {
            headerCreate.style.top = '88px';
            headerCreate.style.boxShadow = "none";

        }
    }
}

const modalPermission = document.getElementById("modal__permission");

function openDialogPermissionView() {
    const btnView = document.getElementById("term__permission-btn-view");
    btnView.onclick = () => {
        modalPermission.style.display = "block";
    }
}


function openDialogPermissionEdit() {
    const btnEdit = document.getElementById("term__permission-btn-edit");
    btnEdit.onclick = () => {
        modalPermission.style.display = "block";

    }

}

function closeDialogPermission() {
    const closeBtn = document.getElementById("permission__dialog-close-btn");
    closeBtn.onclick = () => {
        modalPermission.style.display = "none";
    }
}


function addTagItem() {
    const btnAddTag = document.getElementById("add__tab-btn");
    const listTag = document.getElementById("create__term-tag-list");

    btnAddTag.onclick = () => {
        const newTab = listTag.lastElementChild;
        listTag.appendChild(newTab.cloneNode(true));
        setIndexToTag();
        preventDeleteItem();
    }


}


function setIndexToTag() {
    const listTag = document.getElementById("create__term-tag-list");
    const tags = listTag.children;
    const countItem = document.querySelectorAll('.tab__count');

    let index = 1;
    for (let i = 0; i < tags.length; i++) {
        countItem[i].innerText = index;
        index++;
    }

}

function deleteTag(btn) {
    const listTag = document.getElementById("create__term-tag-list");
    const tags = listTag.children;
    for (let i = 0; i < tags.length; i++) {
        if (tags[i].contains(btn)) {

            listTag.removeChild(tags[i]);
        }
    }
    setIndexToTag();
    preventDeleteItem();
}


function preventDeleteItem() {
    const listTag = document.getElementById("create__term-tag-list");
    const tags = listTag.children;
    const btnDeleteTag = document.querySelectorAll('.tab__item-toolbar-btn-delete');

    if (tags.length < 3) {
        btnDeleteTag.forEach(btn => {
            btn.disabled = true;
            Object.assign(btn.style, {
                opacity: 0.5,
                cursor: 'not-allowed'
            })
        })
    } else {
        btnDeleteTag.forEach(btn => {
            btn.disabled = false;
            Object.assign(btn.style, {
                opacity: 1,
                cursor: 'pointer'
            })
        })
    }

}


function changePermissionView() {
    var permissionView = document.getElementById("permission__dialog-view").value;
    const permissionClass = document.getElementById("permission__dialog-view-class");
    const permissionPassword = document.getElementById("permission__dialog-view-password");
    let permissionEdit = document.getElementById("permission__dialog-edit");

    let permissionViewTitle = document.getElementById("term__permission-view-title");

    let descriptionView = document.getElementById("permission__dialog-item-view-description");

    switch (permissionView) {
        case '0':
            descriptionView.innerHTML = "Mọi người dùng Quizlet có thể sử dụng học phần này";
            permissionViewTitle.innerHTML = "Hiển thị với mọi người";
            permissionClass.style.display = "none";
            permissionPassword.style.display = "none";
            permissionEdit.innerHTML =
                `<option value="1">Một số lớp học</option>
            <option value="2">Người có mật khẩu</option>
            <option value="3" selected="selected">Chỉ tôi</option>`
            break;
        case '1':
            descriptionView.innerText = "Chỉ thành viên trong lớp sau mới có thể sử dụng học phần này";
            permissionViewTitle.innerHTML = "Hiển thị với một số lớp học";
            permissionClass.style.display = "block";
            permissionPassword.style.display = "none";
            permissionEdit.innerHTML =
                `<option value="1">Một số lớp học</option>
            <option value="2">Người có mật khẩu</option>
            <option value="3" selected="selected">Chỉ tôi</option>`;
            break;
        case '2':
            descriptionView.innerText = "Chỉ những người có mật khẩu mới có thể sử dụng học phần này";
            permissionViewTitle.innerHTML = "Hiển thị nếu có mật khẩu";
            permissionPassword.style.display = "block";
            permissionClass.style.display = "none";
            permissionEdit.innerHTML =
                `<option value="2">Người có mật khẩu</option>
            <option value="3" selected="selected">Chỉ tôi</option>`;
            break;
        case '3':
            descriptionView.innerText = "Chỉ bạn mình có thể sử dụng học phần này";
            permissionViewTitle.innerHTML = "Hiển thị với mình tôi";
            permissionClass.style.display = "none";
            permissionPassword.style.display = "none";
            permissionEdit.innerHTML =
                `<option value="3" selected="selected">Chỉ tôi</option>`
            break;
    }
    changePermissionEdit();
    // isEnterPasswordView();
    // isSelectedClassView();
    preventClickButton()

}

function changePermissionEdit() {
    var permissionEdit = document.getElementById("permission__dialog-edit").value;
    const permissionClass = document.getElementById("permission__dialog-edit-class");
    const permissionPassword = document.getElementById("permission__dialog-edit-password");
    let descriptionEdit = document.getElementById("permission__dialog-item-edit-description");
    let permissionEditTitle = document.getElementById("term__permission-edit-title");
    switch (permissionEdit) {
        case '1':
            descriptionEdit.innerHTML = "Chỉ thành viên trong lớp sau có thể chỉnh sửa học phần này";
            permissionEditTitle.innerHTML = "Một số lớp mới có thể chỉnh sửa"
            permissionClass.style.display = "block";
            permissionPassword.style.display = "none";
            break;
        case '2':
            descriptionEdit.innerHTML = "Chỉ những người có mật khẩu mới có thể chỉnh sửa học phần này";
            permissionEditTitle.innerHTML = "Có thể chỉnh sửa bởi người có mật khẩu"
            permissionClass.style.display = "none";
            permissionPassword.style.display = "block";
            isEnterPasswordEdit();
            break;
        case '3':
            descriptionEdit.innerHTML = " Chỉ có bạn mới chỉnh sửa được học phần này";
            permissionEditTitle.innerHTML = "Chỉ tôi có quyền sửa"
            permissionClass.style.display = "none";
            permissionPassword.style.display = "none";
            break;
    }
    // isEnterPasswordEdit();
    preventClickButton();
}

function checkPasswordPermission() {
    let passwordView = document.getElementById("permission__password-view");
    let passwordEdit = document.getElementById("permission__password-edit");
    passwordView.onkeyup = function () {
        preventClickButton();
    }

    passwordEdit.onkeyup = function () {
        preventClickButton();
    }
}

function isEnterPasswordView() {
    var permissionView = document.getElementById("permission__dialog-view").value;
    let passwordView = document.getElementById("permission__password-view");

    if (passwordView.value < 1 && permissionView === '2') {
        return false;
    }else{
        return true;
    }
}


function isEnterPasswordEdit() {
    var permissionEdit = document.getElementById("permission__dialog-edit").value;
    let passwordEdit = document.getElementById("permission__password-edit");

    if (passwordEdit.value < 1 && permissionEdit === '2') {
        return false;
    }else{
        return true;
    }
}



function isSelectedClassView() {
    var permissionView = document.getElementById("permission__dialog-view").value;
    let classSelect = document.querySelectorAll("#permission__dialog-view-class input[type=checkbox]:checked");
    if (classSelect.length < 1 && permissionView === '1') {
        return false;
    }else{
        return true;
    }
}

function onChangeClassView() {
    let classItem = document.querySelectorAll('.permission__dialog-view-class-input');
    for (let i = 0; i < classItem.length; i++) {
        classItem[i].onchange = function () {
            preventClickButton();
        }
    }
}

function isSelectClassEdit(){
    var permissionEdit = document.getElementById("permission__dialog-edit").value;
    let classSelect = document.querySelectorAll("#permission__dialog-edit-class input[type=checkbox]:checked");
    if (classSelect.length < 1 && permissionEdit === '1') {
        return false;
    }else{
        return true;
    }
}

function onChangeClassEdit(){
    let classItem = document.querySelectorAll('.permission__dialog-edit-class-input');
    for (let i = 0; i < classItem.length; i++) {
        classItem[i].onchange = function () {
            preventClickButton();
        }
    }
}

function preventClickButton() {
    if (isEnterPasswordView() && isEnterPasswordEdit() && isSelectedClassView() && isSelectClassEdit()) {
        unDisabledButtonPermission();
    } else {
        disabledButtonPermission();
    }
}

function disabledButtonPermission() {
    let btnClose = document.getElementById("permission__dialog-close-btn");
    let btnSubmit = document.getElementById("permission__dialog-submit-btn");

    btnSubmit.disabled = true;
    btnClose.disabled = true;
    btnClose.style.cursor = "not-allowed";
    btnSubmit.style.cursor = "not-allowed";

}

function unDisabledButtonPermission() {
    let btnClose = document.getElementById("permission__dialog-close-btn");
    let btnSubmit = document.getElementById("permission__dialog-submit-btn");

    btnSubmit.disabled = false;
    btnClose.disabled = false;
    btnClose.style.cursor = "pointer";
    btnSubmit.style.cursor = "pointer";
}


scrollHeader();
openDialogPermissionView();
openDialogPermissionEdit();
closeDialogPermission();
addTagItem();
setIndexToTag();
preventDeleteItem();
changePermissionView();
changePermissionEdit();
preventClickButton();
checkPasswordPermission();
onChangeClassView();
onChangeClassEdit();