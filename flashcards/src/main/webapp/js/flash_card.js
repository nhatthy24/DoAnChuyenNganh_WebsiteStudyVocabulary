

const modal = document.getElementById("modal");
const modalInner = document.getElementById("modal__inner");
const editWordDialog = document.getElementById("edit__word-dialog");
const settingDialog = document.getElementById('setting__learning-dialog');
const btnOpenSpeaker = document.getElementById('setting__open-speaker');
const btnCloseSpeaker = document.getElementById('setting__close-speaker');
const selectChangeAnswerLanguage = document.getElementById('change__answer-language');
const btnMix = document.getElementById('control__main-action-mix');
const btnLearnCardStar = document.getElementById('setting__list-card-star-btn');
const bntLearnCardAll = document.getElementById('setting__list-card-all-btn');

let inputWord = document.getElementById('edit__word-dialog-item-input-word');
let inputDefinition = document.getElementById('edit__word-dialog-item-input-definition');
let inputCard_id = document.getElementById('edit__word-dialog-item-input-card-id');
let inputCourse_id = document.getElementById('edit__word-dialog-item-input-course-id');

var actionFlip = null;
var actionFlip2 = null;
var actionExchange = null;
var isSpeech = false;
var answerLanguage = 'vi';
var isStartLearning = false;
var isLearnStarCard = false;



var cards = document.querySelectorAll('.card__item');
const btnPreCard = document.querySelector('.card__toolbar-nav-left');
const btnNextCard = document.querySelector('.card__toolbar-nav-right');
const btnStart = document.getElementById('control__main-action-start');
const toolBar = document.getElementById('card__toolbar');
const repeatCardBtn = document.getElementById('card__item-repeat-btn');

let currentCard = 1;
var wordLearnedElement = document.getElementById('counter__word-learned');



function setTotalProgress() {
    wordLearnedElement.innerHTML = `${cards.length - 1} thuật ngữ`
}


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
        if (currentCard > cards.length) {
            currentCard = cards.length;
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
                const btnStar = flipBtn.querySelector('.card__item-control-star-btn');
                const btnStars = cards[i].querySelectorAll('.card__item-control-star-btn');
                const word = cards[i].querySelector('.card__item-side-word').innerHTML.trim();
                const definition = cards[i].querySelector('.card__item-side-definition').innerHTML.trim();
                const card_id = cards[i].querySelector('.card__item-card-id').innerHTML.trim();
                const course_id = cards[i].querySelector('.card__item-course-id').innerHTML.trim();
                flipBtn.onclick = (e) => {
                    if (e.target === btnEdit) {
                        openEditWordDialog(word, definition,card_id,course_id);
                    } else if (e.target === btnSpeech) {
                        speech(word);
                    } else if (e.target === btnStar) {
                        tickStarCard(btnStar, btnStars, cards[i]);
                    } else {
                        rotateWordToDefinition(flipBtn.parentElement);
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
            const btnStar = flipBtn.querySelector('.card__item-control-star-btn');
            const btnStars = cards[i].querySelectorAll('.card__item-control-star-btn');
            const word = cards[i].querySelector('.card__item-side-word').innerHTML.trim();
            const definition = cards[i].querySelector('.card__item-side-definition').innerHTML.trim();
            flipBtn.onclick = (e) => {
                if (e.target === btnEdit) {
                    openEditWordDialog(word, definition);
                } else if (e.target === btnStar) {
                    tickStarCard(btnStar, btnStars, cards[i]);
                } else {
                    rotateDefinitionToWord(flipBtn.parentElement);
                    if (isSpeech) {
                        speech(word)
                    };
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
        cards[currentCard - 1].classList.remove('term__card-item--rotate');
    }
    cards[currentCard - 1].style.display = 'block';


    if (currentCard === cards.length) {
        toolBar.style.display = 'none';
    } else {
        toolBar.style.display = 'flex';
    };

    if (isSpeech) {
        var wordEn = cards[currentCard - 1].querySelector('.card__item-side-word').innerHTML.trim();
        if (isStartLearning) {
            speechWord(wordEn);
        } else {
            if (answerLanguage === 'vi') {
                speech(wordEn);
            }
        }
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

function openEditWordDialog(word, definition,card_id, course_id) {
    btnStart.classList.remove('control__main-action--active');
    stopLearning();
    modalInner.appendChild(editWordDialog);
    modal.style.display = 'block';
    editWordDialog.style.display = 'block'
    inputWord.value = word;
    inputDefinition.value = definition;
    inputCard_id.value=card_id;
    inputCourse_id.value=course_id;
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

        if (isSpeech && currentCard === 1) {
            var wordEn = cards[currentCard - 1].querySelector('.card__item-side-word').innerHTML.trim() || '';
            speechWord(wordEn);
        };

        actionFlip = setTimeout(function () {
            cards[currentCard - 1].classList.add('term__card-item--rotate');
        }, 2000);

        actionExchange = setInterval(function () {
            if (currentCard < cards.length) {

                currentCard += 1;
                switchCard(currentCard, 'next');
                actionFlip2 = setTimeout(function () {
                    if (currentCard !== cards.length) {
                        cards[currentCard - 1].classList.add('term__card-item--rotate');
                    }
                }, 2000);

            }
        }, 4000);
    }

}

function stopLearning() {
    clearTimeout(actionFlip);
    clearTimeout(actionFlip2);
    clearInterval(actionExchange);
    actionFlip = null;
    actionFlip2 = null;
    actionExchange = null;
    isStartLearning = false;
}


function startEvent() {
    btnStart.onclick = () => {
        if (!btnStart.classList.contains('control__main-action--active')) {
            btnStart.classList.add('control__main-action--active');
            startLearning();
            isStartLearning = true;
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
        btnStart.classList.remove('control__main-action--active');
        stopLearning();
        btnMix.classList.remove('control__main-action--active');
    }
}

function closeSettingDialog() {
    const closeBtn = document.getElementById('setting__learning-dialog-close-btn');
    closeBtn.onclick = () => {
        modalInner.removeChild(settingDialog);
        modal.style.display = 'none';
        settingDialog.style.display = 'none';
        switchCard(currentCard);
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


function changeAnswerLanguage() {
    selectChangeAnswerLanguage.onchange = () => {
        if (selectChangeAnswerLanguage.value === 'en') {
            answerLanguage = 'en';
        } else {
            answerLanguage = 'vi';
        }
        cards[currentCard - 1].classList.remove('term__card-item--rotate');
        setRotateInitialCards();
    }
}

function setRotateInitialCards() {
    var cardWords = document.querySelectorAll('.card__item-word');
    var cardDefinitions = document.querySelectorAll('.card__item-definition');
    if (answerLanguage === 'en') {
        for (let i = 0; i < cardWords.length; i++) {
            cardWords[i].classList.add('term__card-item--rotate');
            cardDefinitions[i].classList.remove('term__card-item--rotate');
        }
    } else {
        for (let i = 0; i < cardWords.length; i++) {
            cardWords[i].classList.remove('term__card-item--rotate');
            cardDefinitions[i].classList.add('term__card-item--rotate');

        }

    }
}

function rotateWordToDefinition(cardItem) {
    if (answerLanguage === 'vi') {
        addRotateCard(cardItem);
    } else {
        removeRotateCard(cardItem);
    }
}

function rotateDefinitionToWord(cardItem) {
    if (answerLanguage === 'vi') {
        removeRotateCard(cardItem);
    } else {
        addRotateCard(cardItem);
    }
}


function speechWord(wordEn) {
    if (answerLanguage === 'vi') {
        speech(wordEn);
    } else {
        setTimeout(() => {
            speech(wordEn);
        }, 2000);
    }
}


function mixCardsEvent() {
    btnMix.onclick = () => {
        var temListCards;
        if (isLearnStarCard) {
            temListCards = document.querySelectorAll('.card__item-tick-star, .card__item-special');
        } else {
            temListCards = document.querySelectorAll('.card__item');
        }
        btnStart.classList.remove('control__main-action--active');
        stopLearning();
        currentCard = 1;
        if (!btnMix.classList.contains('control__main-action--active')) {
            btnMix.classList.add('control__main-action--active');
            randomOrderCards(temListCards);
            switchCard(currentCard);
        } else {
            btnMix.classList.remove('control__main-action--active');
            cards = temListCards;
            switchCard(currentCard);
        }
    }
}

function randomOrderCards(listCard) {
    var temListCardsArray = Array.from(listCard);
    for (let i = temListCardsArray.length - 2; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        [temListCardsArray[i], temListCardsArray[j]] = [temListCardsArray[j], temListCardsArray[i]];
    }
    cards = temListCardsArray;
    switchCard(currentCard);
}

function tickStarCard(btnStar, btnStars, cardItem) {
    if (!btnStar.classList.contains('card__item-control-star-btn--active')) {
        btnStars.forEach(function (btn) {
            btn.classList.add('card__item-control-star-btn--active');
        })
        cardItem.classList.add('card__item-tick-star');
    } else {
        btnStars.forEach(function (btn) {
            btn.classList.remove('card__item-control-star-btn--active');
        })
        cardItem.classList.remove('card__item-tick-star');
    }
}

function learnCardStar() {
    btnLearnCardStar.onclick = () => {
        isLearnStarCard = true;
        if (!btnLearnCardStar.classList.contains('setting__dialog-body-btn--active')) {
            btnLearnCardStar.classList.add('setting__dialog-body-btn--active');

        };
        if (bntLearnCardAll.classList.contains('setting__dialog-body-btn--active')) {
            bntLearnCardAll.classList.remove('setting__dialog-body-btn--active');
        }
        cards = document.querySelectorAll('.card__item-tick-star, .card__item-special');
        currentCard = 1;
        setTotalProgress();
    }
}

function learnCardAll() {
    bntLearnCardAll.onclick = () => {
        isLearnStarCard = false;
        if (!bntLearnCardAll.classList.contains('setting__dialog-body-btn--active')) {
            bntLearnCardAll.classList.add('setting__dialog-body-btn--active');
        };
        if (btnLearnCardStar.classList.contains('setting__dialog-body-btn--active')) {
            btnLearnCardStar.classList.remove('setting__dialog-body-btn--active');
        }
        cards = document.querySelectorAll('.card__item');
        currentCard = 1;
        setTotalProgress();
    }
}

function updateFlashCard() {
    var inputWord = document.getElementById('edit__word-dialog-item-input-word').value;
    var inputDefinition = document.getElementById('edit__word-dialog-item-input-definition').value;
    var card_id = document.getElementById('edit__word-dialog-item-input-card-id').value;
    var course_id = document.getElementById('edit__word-dialog-item-input-course-id').value;
    var urlReplace='?type=edit&term='+inputWord+'&meaning='+inputDefinition+'&card_id='+card_id+'&course_id='+course_id;
    location.replace(urlReplace);
}
function updateStarCardState(user_id, card_id){
    var urlReplace='?type=insertstar&user_id='+user_id+'&card_id='+card_id;
    location.replace(urlReplace);
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
changeAnswerLanguage();
setRotateInitialCards();
mixCardsEvent();
setTotalProgress();
learnCardStar();
learnCardAll();
