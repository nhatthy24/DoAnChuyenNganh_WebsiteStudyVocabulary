const modal_folder = document.getElementById('modal');
const modal_title = document.getElementById('modal_title');

const addTermElement = document.getElementById('dialog__add-term');
const learnElement = document.getElementById('dialog__learn-folder');
const confirmDeleteElement = document.getElementById('dialog__confirm-delete');

const contentModalWithoutEdit = document.getElementById('modal__without-edit');
const editElement = document.getElementById('modal__with-edit');

function openDialogAddTerm() {
    modal_folder.style.display = 'block';
    contentModalWithoutEdit.style.display = 'block';
    editElement.style.display = 'none';
    modal_title.innerText = "Thêm học phần";
    addTermElement.style.display = 'block';
    learnElement.style.display = 'none';
    confirmDeleteElement.style.display = 'none';
}

function openDialogLearn() {
    modal_folder.style.display = 'block';
    contentModalWithoutEdit.style.display = 'block';
    editElement.style.display = 'none';
    modal_title.innerText = "Học thư mục này";
    learnElement.style.display = 'block';
    addTermElement.style.display = 'none';
    confirmDeleteElement.style.display = 'none';
}

function openDialogConfirmDelete() {
    modal_folder.style.display = 'block';
    contentModalWithoutEdit.style.display = 'block';
    editElement.style.display = 'none';
    modal_title.innerText = "Xóa thư mục";
    learnElement.style.display = 'none';
    addTermElement.style.display = 'none';
    confirmDeleteElement.style.display = 'block';
}

function openDialogEdit(){
    modal_folder.style.display = 'block';
    contentModalWithoutEdit.style.display = 'none';
    editElement.style.display = 'block';
}

function closeModalLibraryFolder() {
    modal_folder.style.display = 'none';
}