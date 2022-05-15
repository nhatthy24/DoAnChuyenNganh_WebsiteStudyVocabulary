

const currentElement = document.getElementById('current-slide');
const totalElement = document.getElementById('total-slide');
const confirmDeleteDialog = document.getElementById('confirm__delete-term');


let currentSlide = parseInt(currentElement.innerHTML);
let totalSlide = parseInt(totalElement.innerHTML);
const slides = document.querySelectorAll('.term__card-item');
const preBtn = document.querySelector('.card__control-prev-btn');
const nextBtn = document.querySelector('.card__control-next-btn');

const modal = document.getElementById("modal");
const modalInner = document.getElementById("modal__inner");

$(document).ready(function () {
    switchCard(currentSlide);
    setTotalSlides();
    openShareDialog();
    closeShareDialog();
    openAddClassFolderDialog();
    closeAddClassFolderDialog();
    switchToAddClassFolderContent();
})

function flipWordToDefinition(btn) {
    const parentElement = btn.parentElement;
    parentElement.classList.add('term__card-item--rotate');


}
function flipDefinitionToWord(btn) {
    const parentElement = btn.parentElement;
    parentElement.classList.remove('term__card-item--rotate');

}


function checkButtonAbility() {

    if (currentSlide === slides.length) {
        nextBtn.disabled = true;
    } else {
        nextBtn.disabled = false;
    }

    if (currentSlide === 1) {
        preBtn.disabled = true;
    } else {
        preBtn.disabled = false;
    }

}

function setTotalSlides() {
    totalElement.innerHTML = slides.length;
}


preBtn.onclick = () => {
    currentSlide -= 1;
    if (currentSlide < 1) {
        currentSlide = 1;
    }
    currentElement.innerHTML = currentSlide;
    checkButtonAbility();

    switchCard(currentSlide);
    slides[currentSlide - 1].classList.add('term__card-item--slide-prev')
}

nextBtn.onclick = () => {
    currentSlide += 1;
    if (currentSlide > slides.length) {
        currentSlide = slides.length;
    }
    currentElement.innerHTML = currentSlide;
    checkButtonAbility();

    switchCard(currentSlide);
    slides[currentSlide - 1].classList.add('term__card-item--slide-next')

}



function switchCard(currentSlide) {
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = 'none';
    }
    slides[currentSlide - 1].style.display = 'block';
}


function openShareDialog() {
    const btnOpen = document.getElementById("term__information-tool-share");
    const shareDialog = document.getElementById("share__dialog");

    btnOpen.onclick = () => {
        modalInner.appendChild(shareDialog);
        shareDialog.style.display = 'block';
        modal.style.display = 'block';
    }
}

function closeShareDialog() {
    const btnClose = document.getElementById("share__dialog-close-btn");
    const shareDialog = document.getElementById("share__dialog");

    btnClose.onclick = () => {
        modalInner.removeChild(shareDialog);
        shareDialog.style.display = 'none';
        modal.style.display = 'none';
    }
}

function openAddClassFolderDialog() {
    const btnOpen = document.getElementById("add__term-to-folder-class-btn");
    const addClassFolderDialog = document.getElementById("add__term-to-folder-class");
    
    btnOpen.onclick = () => {
        modalInner.appendChild(addClassFolderDialog);
        addClassFolderDialog.style.display = 'block';
        modal.style.display = 'block';
    }
}

function closeAddClassFolderDialog() {
    const btnClose = document.getElementById("add__term-to-folder-class-close-btn");
    const addClassFolderDialog = document.getElementById("add__term-to-folder-class");


    btnClose.onclick = () => {
        modalInner.removeChild(addClassFolderDialog);
        addClassFolderDialog.style.display = 'none';
        modal.style.display = 'none';
    }
}

function switchToAddClassFolderContent() {
    const btnClassContent = document.getElementById('add__term-switch-btn-class');
    const btnFolderContent = document.getElementById('add__term-switch-btn-folder');

    const classContent = document.getElementById('add__term-to-class');
    const folderContent = document.getElementById('add__term-to-folder');

    btnClassContent.onclick = () => {
        btnFolderContent.classList.remove('add__term-switch-btn-item--active');
        btnClassContent.classList.add('add__term-switch-btn-item--active');
        classContent.style.display = 'block';
        folderContent.style.display = 'none';
    }
    btnFolderContent.onclick = () => {
        btnClassContent.classList.remove('add__term-switch-btn-item--active');
        btnFolderContent.classList.add('add__term-switch-btn-item--active');
        classContent.style.display = 'none';
        folderContent.style.display = 'block';
    }
}


function editWord(btn) {
    const wordItem = btn.parentElement.parentElement;
    const wordInput = wordItem.querySelectorAll('.term__detail-item-input');
    if (!btn.classList.contains('term__detail-item-control-btn--active')) {
        for (let i = 0; i < wordInput.length; i++) {
            wordInput[i].classList.add('term__detail-item-input--active');
            wordInput[i].readOnly = false;
        }

        btn.classList.add('term__detail-item-control-btn--active');
    } else {
        for (let i = 0; i < wordInput.length; i++) {
            wordInput[i].classList.remove('term__detail-item-input--active');
            wordInput[i].readOnly = true;
        }
        btn.classList.remove('term__detail-item-control-btn--active');
    }
}

function deleteTerm() {

    modalInner.appendChild(confirmDeleteDialog);
    confirmDeleteDialog.style.display = 'block';
    modal.style.display = 'block';
}

function closeDeleteDialog() {

    modalInner.removeChild(confirmDeleteDialog);
    confirmDeleteDialog.style.display = 'none';
    modal.style.display = 'none';
}

function speechWord(btn) {
    const wordItem = btn.parentElement.parentElement;
    const word = wordItem.querySelector('.term__detail-item-word-text').value;

    speech(word);
}


function tickStar(btn){
    if(btn.classList.contains('term__detail-item-control-btn--active')){
        btn.classList.remove('term__detail-item-control-btn--active');
    }else{
        btn.classList.add('term__detail-item-control-btn--active');
    }
}








