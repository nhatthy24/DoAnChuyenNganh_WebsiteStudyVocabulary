

const modal = document.getElementById("modal");
const modalInner = document.getElementById("modal__inner");
const editWordDialog = document.getElementById("edit__word-dialog");
const settingDialog = document.getElementById('setting__learning-dialog');
const btnOpenSpeaker = document.getElementById('setting__open-speaker');
const btnCloseSpeaker = document.getElementById('setting__close-speaker');

let inputWord = document.getElementById('edit__word-dialog-item-input-word');
let inputDefinition = document.getElementById('edit__word-dialog-item-input-definition');

var actionFlip = null;
var actionExchange = null;
var isSpeech = false;



const cards = document.querySelectorAll('.card__item');
const btnPreCard = document.querySelector('.card__toolbar-nav-left');
const btnNextCard = document.querySelector('.card__toolbar-nav-right');
const btnStart = document.getElementById('control__main-action-start');
const toolBar = document.getElementById('card__toolbar');
const repeatCardBtn = document.getElementById('card__item-repeat-btn');

let currentCard = 1;
const totalIndex = cards.length;
var wordLearnedElement = document.getElementById('counter__word-learned');
wordLearnedElement.innerHTML = `${totalIndex-1} thuật ngữ`


function preCard() {
    btnPreCard.onclick = () => {
        currentCard -= 1;
        if (currentCard < 1) {
            currentCard = 1;
        }
        switchCard(currentCard, 'previous');
    }
}

function nextCard() {
    btnNextCard.onclick = () => {
        currentCard += 1;
        if (currentCard > totalIndex) {
            currentCard = totalIndex;
        }
        switchCard(currentCard, 'next');
    }

}



function exchangeWordToDefinition() {
    for (let i = 0; i < cards.length; i++) {
        if (cards[i].style.display == 'block') {
            if (!cards[i].classList.contains('card__item-special')) {
                const flipBtn = cards[i].querySelector('.card__item-word');
                const btnEdit = flipBtn.querySelector('.card__item-control-edit-btn');
                const btnSpeech = flipBtn.querySelector('.card__item-control-speech-btn');
                const word = cards[i].querySelector('.card__item-side-word').innerHTML.trim();
                const definition = cards[i].querySelector('.card__item-side-definition').innerHTML.trim();
                flipBtn.onclick = (e) => {
                    if (e.target === btnEdit) {
                        openEditWordDialog(word, definition);
                    } else if (e.target === btnSpeech) {
                        speech(word);
                    } else {
                        addRotateCard(flipBtn.parentElement);
                    }
                }
            } 
        }
    }
}


function exchangeDefinitionToWord() {
    for (let i = 0; i < cards.length; i++) {
        if (cards[i].style.display == 'block') {
            const flipBtn = cards[i].querySelector('.card__item-definition');
            const btnEdit = flipBtn.querySelector('.card__item-control-edit-btn');
            const word = cards[i].querySelector('.card__item-side-word').innerHTML.trim();
            const definition = cards[i].querySelector('.card__item-side-definition').innerHTML.trim();
            flipBtn.onclick = (e) => {
                if (e.target === btnEdit) {
                    openEditWordDialog(word, definition);
                } else {
                    removeRotateCard(flipBtn.parentElement);
                }
            }
        }
    }
}

function checkButtonAbility() {
    if (currentCard === cards.length) {
        btnNextCard.disabled = true;
        btnNextCard.classList.add('card__toolbar-btn-disabled');
    } else {
        btnNextCard.disabled = false;
        btnNextCard.classList.remove('card__toolbar-btn-disabled');
    }

    if (currentCard === 1) {
        btnPreCard.disabled = true;
        btnPreCard.classList.add('card__toolbar-btn-disabled');
    } else {
        btnPreCard.disabled = false;
        btnPreCard.classList.remove('card__toolbar-btn-disabled');
    }
}



function addRotateCard(card) {
    card.classList.add('term__card-item--rotate');
}

function removeRotateCard(card) {
    if (card.classList.contains('term__card-item--rotate')) {
        card.classList.remove('term__card-item--rotate');
    }
}


function exchangeCard() {
    for (let i = 0; i < cards.length; i++) {
        if (cards[i].style.display == 'block') {
            const btnExchange = document.getElementById('card__toolbar-reverse-btn');

            btnExchange.onclick = () => {
                if (cards[i].classList.contains('term__card-item--rotate')) {
                    cards[i].classList.remove('term__card-item--rotate');
                } else {
                    cards[i].classList.add('term__card-item--rotate');
                }
            }
        }
    }
}



function switchCard(currentCard, direction) {
    for (let i = 0; i < cards.length; i++) {
        cards[i].style.display = 'none';
        removeRotateCard(cards[i]);
    }
    cards[currentCard - 1].style.display = 'block';


    if (currentCard === cards.length) {
        toolBar.style.display = 'none';
    };

    if (isSpeech) {
        const word = cards[currentCard - 1].querySelector('.card__item-side-word').innerHTML.trim();
        speech(word);
    };

    if (direction != null) {
        if (direction === 'previous') {
            cards[currentCard - 1].classList.add('term__card-item--slide-prev');
        } else {
            cards[currentCard - 1].classList.add('term__card-item--slide-next');
        }
    }
    exchangeWordToDefinition();
    exchangeDefinitionToWord();
    checkButtonAbility();
    progressControl();
    exchangeCard();
}



function progressControl() {
    let progressCurrent = document.getElementById("progress__current");
    let progressTotal = document.getElementById("progress__total");
    const progressBar = document.getElementById("control__main-progress-bar-fill");
    progressCurrent.innerHTML = currentCard;
    progressTotal.innerHTML = cards.length - 1;
    progressBar.style.width = (currentCard / (cards.length - 1)) * 100 + '%';
}

function openEditWordDialog(word, definition) {

    modalInner.appendChild(editWordDialog);
    modal.style.display = 'block';
    editWordDialog.style.display = 'block'
    inputWord.value = word;
    inputDefinition.value = definition;
}

function closeEditWordDialog() {
    modalInner.removeChild(editWordDialog);
    modal.style.display = 'none';
    editWordDialog.style.display = 'none';
}


function startLearning() {
    if (currentCard === cards.length) {
        currentCard = 0;
        startLearning();
    } else {
        if (isSpeech) {
            const word = cards[currentCard - 1].querySelector('.card__item-side-word').innerHTML.trim();
            speech(word);
        };
        actionFlip = setTimeout(function () {
            addRotateCard(cards[currentCard - 1]);
        }, 2000);
        actionExchange = setInterval(function () {
            if (currentCard < cards.length) {
                setTimeout(() => {
                    if (currentCard !== cards.length) {
                        addRotateCard(cards[currentCard - 1]);
                    }
                }, 2000);
                currentCard += 1;
                switchCard(currentCard, 'next');
            }
        }, 4000);
    }

}

function stopLearning() {
    clearTimeout(actionFlip);
    clearInterval(actionExchange);
    actionFlip = null;
    actionExchange = null;
}


function startEvent() {
    btnStart.onclick = () => {
        if (!btnStart.classList.contains('control__main-action--active')) {
            btnStart.classList.add('control__main-action--active');
            startLearning();
        } else {
            btnStart.classList.remove('control__main-action--active');
            stopLearning();
        }

    }
}


function repeatCard() {
    repeatCardBtn.onclick = () => {
        if (!btnStart.classList.contains('control__main-action--active')) {
            currentCard = 1;
            toolbar.style.display = 'block';
            stopLearning();
            switchCard(currentCard);
        } else {
            currentCard = 0;
            stopLearning();
            startLearning();
        }
    }
}


function openSettingDialog() {
    const settingBtn = document.getElementById('control__main-action-option');

    settingBtn.onclick = () => {
        modalInner.appendChild(settingDialog);
        modal.style.display = 'block';
        settingDialog.style.display = 'block';
    }
}

function closeSettingDialog() {
    const closeBtn = document.getElementById('setting__learning-dialog-close-btn');
    closeBtn.onclick = () => {
        modalInner.removeChild(settingDialog);
        modal.style.display = 'none';
        settingDialog.style.display = 'none';
    }
}

function openSpeaker() {
    btnOpenSpeaker.onclick = () => {
        btnOpenSpeaker.classList.add('setting__dialog-body-btn--active');
        btnCloseSpeaker.classList.remove('setting__dialog-body-btn--active');
        isSpeech = true;
    }
}

function closeSpeaker() {
    btnCloseSpeaker.onclick = () => {
        btnCloseSpeaker.classList.add('setting__dialog-body-btn--active');
        btnOpenSpeaker.classList.remove('setting__dialog-body-btn--active');
        isSpeech = false;
    }
}



switchCard(currentCard);
exchangeCard();
exchangeWordToDefinition();
exchangeDefinitionToWord();
checkButtonAbility();
preCard();
nextCard();
progressControl();
startEvent();
repeatCard();
openSettingDialog();
closeSettingDialog();
openSpeaker();
closeSpeaker();