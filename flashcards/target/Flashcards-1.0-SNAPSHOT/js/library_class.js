const btnTerm = document.getElementById('class__tab-term-btn');
const btnMember = document.getElementById('class__tab-member-btn');
const termElement = document.getElementById('class__content-terms');
const memberElement = document.getElementById('class__content-member');


const modal_class = document.getElementById('modal');
const modal_title = document.getElementById('modal_title');

const contentWithoutEditClass = document.getElementById('modal__without-edit-class');
const contentWithEditClass = document.getElementById('modal__with-edit-class');

const addTermElement = document.getElementById('dialog__add-term');
const confirmDeleteElement = document.getElementById('dialog__confirm-delete');
const addFolderElement = document.getElementById('dialog__add-folder');
const addMemberElement = document.getElementById('dialog__add-member');


function switchTermTab(btn) {
    if (!btn.classList.contains('class__header-tab-item--active')) {
        btn.classList.add('class__header-tab-item--active');
        termElement.style.display = 'block';
        memberElement.style.display = 'none';
        btnMember.classList.remove('class__header-tab-item--active');
    }
}

function switchMemberTab(btn) {
    if (!btn.classList.contains('class__header-tab-item--active')) {
        btn.classList.add('class__header-tab-item--active');
        memberElement.style.display = 'block';
        termElement.style.display = 'none';
        btnTerm.classList.remove('class__header-tab-item--active');
    }
}


function openDialogAddTermToClass() {
    modal_class.style.display = 'block';
    contentWithoutEditClass.style.display = 'block';
    contentWithEditClass.style.display = 'none';
    modal_title.innerText = "Thêm học phần";
    addTermElement.style.display = 'block';
    confirmDeleteElement.style.display = 'none';
    addFolderElement.style.display = 'none';
    addMemberElement.style.display = 'none';
}

function openDialogConfirmDeleteClass() {
    modal_class.style.display = 'block';
    contentWithoutEditClass.style.display = 'block';
    contentWithEditClass.style.display = 'none';
    modal_title.innerText = "Xóa lớp này";
    addTermElement.style.display = 'none';
    addFolderElement.style.display = 'none';
    confirmDeleteElement.style.display = 'block';
    addMemberElement.style.display = 'none';

}

function openDialogAddFolderToClass() {
    modal_class.style.display = 'block';
    contentWithoutEditClass.style.display = 'block';
    contentWithEditClass.style.display = 'none';
    modal_title.innerText = "Thêm thư mục";
    addTermElement.style.display = 'none';
    confirmDeleteElement.style.display = 'none';
    addFolderElement.style.display = 'block';
    addMemberElement.style.display = 'none';
}

function openDialogAddMember(){
    modal_class.style.display = 'block';
    contentWithoutEditClass.style.display = 'block';
    contentWithEditClass.style.display = 'none';
    modal_title.innerText = "Mời thành viên";
    addTermElement.style.display = 'none';
    confirmDeleteElement.style.display = 'none';
    addFolderElement.style.display = 'none';
    addMemberElement.style.display = 'block';
}

function openDialogEditClass(){
    modal_class.style.display = 'block';
    contentWithoutEditClass.style.display = 'none';
    contentWithEditClass.style.display = 'block';
}

function closeModalLibraryClass() {
    modal_class.style.display = 'none';
}