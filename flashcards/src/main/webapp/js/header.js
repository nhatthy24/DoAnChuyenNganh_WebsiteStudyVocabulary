function showAccountDialog() {
    const dialogAccount = document.getElementById('navbar__user-menu');
    if (dialogAccount.style.display === 'block') {
        dialogAccount.style.display = 'none';
    } else {
        dialogAccount.style.display = 'block';
    }
}

function showCreateButton() {
    const dialogCreate = document.getElementById('navbar__create-menu');
    if (dialogCreate.style.display === 'block') {
        dialogCreate.style.display = 'none';
    } else {
        dialogCreate.style.display = 'block';
    }
}

function showLibraryDialog() {
    const dialogLibrary = document.getElementById('navbar__library');
    if (dialogLibrary.style.display === 'block') {
        dialogLibrary.style.display = 'none';
    } else {
        dialogLibrary.style.display = 'block';
    }
}

function switchLibraryTab(btn) {
    const tabTermContent = document.getElementById('library-term');
    const tabFolderContent = document.getElementById('library-folder');
    const tabClassContent = document.getElementById('library-class');

    const text = btn.innerText;
    switch (text) {
        case 'Học phần':
            switchLibraryStyle(btn, tabTermContent);
            break;
        case 'Thư mục':
            switchLibraryStyle(btn, tabFolderContent);
            break;
        case 'Lớp học':
            switchLibraryStyle(btn, tabClassContent);
            break;
    }
}

function switchLibraryStyle(btn, content) {
    document.querySelector('.navbar__library-tab-item.active').classList.remove('active');
    document.querySelectorAll('.library__tab-content').forEach(item => {
        item.style.display = 'none';
    });
    btn.parentElement.classList.add('active');
    content.style.display = 'block';
}

const modal = document.getElementById('modal_create-folder-class');
const dialogCreateClass = document.getElementById('dialog-create-class');
const dialogCreateFolder = document.getElementById('dialog-create-folder');


function showDialogCreateFolder(){
    modal.style.display = 'block';
    dialogCreateFolder.style.display = 'block';
}

function showDialogCreateClass(){
    modal.style.display = 'block';
    dialogCreateClass.style.display = 'block';
}

function closeDialogCreateFolder(){
    modal.style.display = 'none';
    dialogCreateFolder.style.display='none';
}

function closeDialogCreateClass(){
    modal.style.display='none';
    dialogCreateClass.style.display = 'none';
}


window.onload = () => {
    const btnCreate = document.getElementById('navbar__menu-create-btn');
    const dialogCreate = document.getElementById('navbar__create-menu');
    const btnLibrary = document.getElementById('navbar__library-btn');
    const dialogLibrary = document.getElementById('navbar__library');
    // const btnAccount = document.getElementById('navbar__user-btn');
    // const dialogAccount = document.getElementById('navbar__user-menu');

    document.onclick = (e) => {
        if (e.target !== btnCreate && !dialogCreate.contains(e.target)) {
            dialogCreate.style.display = 'none';
        }
        if (e.target !== btnLibrary && !dialogLibrary.contains(e.target)) {
            dialogLibrary.style.display = 'none';
        }
        // if (e.target !== btnAccount && !dialogAccount.contains(e.target)) {
        //     dialogAccount.style.display = 'none';
        // }
    }
}
