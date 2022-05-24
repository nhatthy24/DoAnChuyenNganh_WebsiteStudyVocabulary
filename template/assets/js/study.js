
var listItems = [];
var listStudyCard = document.querySelectorAll('.study__body-list-item');

const footerControl = document.getElementById('study__footer-control');
var msIncorrect = ['Đừng lo, bạn vẫn đang học mà!', 'Chưa đúng, hãy cố gắng nhé!', 'Đừng nản chí, học là một quá trình!'];
var msCorrect = ['Làm tốt lắm', 'Tuyệt vời!', 'Xuất sắc!', 'Bạn sẽ làm được!', 'Bạn đang làm rất tuyệt!'];
var progressBar = document.getElementById('study__progress-bar');
const itemChampion = document.getElementById('study__body-list-item-champion');
const resultMultipleChoice = document.getElementById('result__multiple-choice-successful');
const btnLearnAgain = document.getElementById('item__learn-again-btn');
const modal = document.getElementById('modal');
const btnOption = document.getElementById('study__header-control-option-btn');
const btnCloseOption = document.getElementById('modal__header-close-btn');
const btnFilterAll = document.getElementById('filter__learn-all');
const btnFilterStar = document.getElementById('filter__learn-star');
const btnAnswerLangVi = document.getElementById('language__answer-vi');
const btnAnswerLangEn = document.getElementById('language__answer-en');
const btnOpenSpeak = document.getElementById('open__speech-word');
const btnCloseSpeak = document.getElementById('close__speech-word');
const headerMenu = document.getElementById('study__header-list-items');
const btnHeaderMenu = document.getElementById('study__header-menu-btn');

let isMultipleChoiceAnswer = true;
let isSkipCard = false;
let isSpeech = false;
let isViLanguageAnswer = true;

let currentItem = 0;
var listAnswer = [];


function assignItem() {
    listItems = [];
    for (let i = 0; i < listStudyCard.length; i++) {
        listItems.push(listStudyCard[i]);
    }
}

function filterAllItems() {
    btnFilterAll.onclick = () => {
        if (!btnFilterAll.classList.contains('modal__body-content-item-btn--active')) {
            btnFilterAll.classList.add('modal__body-content-item-btn--active');
            btnFilterStar.classList.remove('modal__body-content-item-btn--active');
            listStudyCard = document.querySelectorAll('.study__body-list-item');
            assignItem();
            currentItem = 0;
            setProgressBar(currentItem, listItems.length);
            switchItem();
        }
    }
}

function filterStarItems() {
    btnFilterStar.onclick = () => {
        if (!btnFilterStar.classList.contains('modal__body-content-item-btn--active')) {
            btnFilterStar.classList.add('modal__body-content-item-btn--active');
            btnFilterAll.classList.remove('modal__body-content-item-btn--active');
            listStudyCard = document.querySelectorAll('.study__body-list-item--star');
            assignItem();
            currentItem = 0;
            setProgressBar(currentItem, listItems.length);
            switchItem();
        }
    }
}


function getAllListAnswer() {
    listAnswer = [];
    var list;
    if (isViLanguageAnswer) {
        list = document.querySelectorAll('.study__item-question-content-definition');
    } else {
        list = document.querySelectorAll('.study__item-question-content-word');
    }
    for (let i = 0; i < list.length; i++) {
        listAnswer.push(list[i].innerHTML.trim());
    }
    return listAnswer;
}



function setMultipleChoiceAnswer() {
    let currentDefinition = getCurrentAnswer();
    var arrayAnswer = listAnswer;
    var listBtnAnswer = listItems[currentItem].querySelector('.study__item-answer-content');
    let listMixAnswer = [];
    if (arrayAnswer.length <= 4) {
        let temporaryArray = randomArray(arrayAnswer);
        for (let i = 0; i < temporaryArray.length; i++) {
            listMixAnswer.push(temporaryArray[i]);
        }
    } else {
        listMixAnswer.push(currentDefinition);
        let temporaryArray = randomArray(arrayAnswer);
        for (let i = 0; i < temporaryArray.length; i++) {
            if (temporaryArray[i] !== listMixAnswer[0]) {
                listMixAnswer.push(temporaryArray[i]);
            }
            if (listMixAnswer.length >= 4) {
                break;
            }
        }
        listMixAnswer = randomArray(listMixAnswer);
    }

    listBtnAnswer.innerHTML = '';
    for (let i = 0; i < listMixAnswer.length; i++) {
        var btn = `<button class="study__item-answer-content-btn">
                        <span class="study__item-answer-content-btn-index">
                        ${i + 1}
                        </span>
                        <span class="study__item-answer-content-btn-text">
                            ${listMixAnswer[i]}
                        </span>
                    </button>`;

        listBtnAnswer.innerHTML += btn;
    }

}

function switchItem() {
    for (let i = 0; i < listItems.length; i++) {
        listItems[i].classList.add('study__body-list-item--hidden');
        if (listItems[i].classList.contains('study__body-list-item--show')) {
            listItems[i].classList.remove('study__body-list-item--show');
        }
    }

    if (currentItem < listItems.length) {
        listItems[currentItem].classList.remove('study__body-list-item--hidden');
        listItems[currentItem].classList.add('study__body-list-item--show');
        setMessageCorrect('Chọn định nghĩa đúng');
        setMultipleChoiceAnswer();
        answerEvents();
        listenEventWriteAnswer();
        skipWriteAnswerEvents();
        if (isSpeech && isViLanguageAnswer) {
            setTimeout(() => {
                speech(getCurrentWord());
            }, 200)
        }

    } else {
        if (isMultipleChoiceAnswer) {
            setResultMultipleChoice();
            resultMultipleChoice.style.display = 'block';
            footerControl.style.display = 'flex';
        } else {
            itemChampion.style.display = 'block';
            initConfetti();
            render();
        }
    }
}


function answerEvents() {
    let listBtnAnswer = listItems[currentItem].querySelectorAll('.study__item-answer-content-btn');
    document.onkeyup = (e) => {
        if (e.keyCode === 49) {
            listBtnAnswer[0].onclick();
        }
        if (e.keyCode === 50) {
            listBtnAnswer[1].onclick();
        }
        if (e.keyCode === 51) {
            listBtnAnswer[2].onclick();
        }
        if (e.keyCode === 52) {
            listBtnAnswer[3].onclick();
        }
        // console.log(e.keyCode);
    }
    for (let i = 0; i < listBtnAnswer.length; i++) {
        listBtnAnswer[i].onclick = () => {
            if (listBtnAnswer[i].querySelector('.study__item-answer-content-btn-text').innerHTML.trim() == getCurrentAnswer()) {
                setBtnCorrect(listBtnAnswer[i]);
                setMessageCorrect(null);
                for (let j = 0; j < listBtnAnswer.length; j++) {
                    if (listBtnAnswer[j] != listBtnAnswer[i]) {
                        listBtnAnswer[j].disabled = true;
                    }
                }
                currentItem++;
                setTimeout(() => {
                    setProgressBar(currentItem, listItems.length);
                    switchItem();
                }, 2000);
            } else {
                setBtnIncorrect(listBtnAnswer[i]);
                setMessageIncorrect(null);
                footerControl.style.display = 'flex';
                for (let j = 0; j < listBtnAnswer.length; j++) {
                    if (listBtnAnswer[j].querySelector('.study__item-answer-content-btn-text').innerHTML.trim() == getCurrentAnswer()) {
                        setBtnCorrect(listBtnAnswer[j]);
                        for (let z = 0; z < listBtnAnswer.length; z++) {
                            if ((listBtnAnswer[i] != listBtnAnswer[z]) && (listBtnAnswer[z] != listBtnAnswer[j])) {
                                listBtnAnswer[z].disabled = true;
                            }
                        }
                    }
                }
            }
        }
    }
}

function listenEventWriteAnswer() {
    const btnEnter = listItems[currentItem].querySelector('.answer__write-btn--enter');

    if (!isMultipleChoiceAnswer) {
        document.onkeyup = (e) => {
            if (e.keyCode == 13) {
                btnEnter.onclick();
            }
        }
    }

    btnEnter.onclick = () => {
        writeAnswerEvents();
    }
}

function skipWriteAnswerEvents() {
    const btnCancel = listItems[currentItem].querySelector('.answer__write-btn--cancel');
    let inputAnswer = listItems[currentItem].querySelector('.answer__write-input');
    let currentDefinition = getCurrentAnswer();
    btnCancel.onclick = () => {
        inputAnswer.value = '';
        hiddenEnterInputArea(listItems[currentItem]);
        showBlockSkipWriteAnswer(listItems[currentItem]);
        showBlockCorrectWriteAnswer(listItems[currentItem], 'Đáp án đúng', currentDefinition);
        footerControl.style.display = 'flex';
        isSkipCard = true;
    }
    // showWriteAnswer();
}


function writeAnswerEvents() {

    let inputAnswer = listItems[currentItem].querySelector('.answer__write-input');
    let currentDefinition = getCurrentAnswer();

    let valueInput = inputAnswer.value.trim();
    hiddenEnterInputArea(listItems[currentItem]);
    if (valueInput.length > 0) {
        if (isEqualString(valueInput, currentDefinition)) {
            showBlockCorrectWriteAnswer(listItems[currentItem], getRandomElementArray(msCorrect), valueInput);
            inputAnswer.value = '';
            currentItem++;
            setTimeout(() => {
                setProgressBar(currentItem, listItems.length);
                switchItem();
            }, 2000);
        } else {
            inputAnswer.value = '';
            showBlockIncorrectWriteAnswer(listItems[currentItem], getRandomElementArray(msIncorrect), valueInput);
            setTimeout(() => {
                showBlockCorrectWriteAnswer(listItems[currentItem], 'Đáp án đúng', currentDefinition)
            }, 300);
            footerControl.style.display = 'flex';
            isSkipCard = false;
        }
    } else {
        inputAnswer.value = '';
        showBlockSkipWriteAnswer(listItems[currentItem]);
        showBlockCorrectWriteAnswer(listItems[currentItem], 'Đáp án đúng', currentDefinition);
        footerControl.style.display = 'flex';
        isSkipCard = true;
    }
}



function showBlockCorrectWriteAnswer(element, title, rightValue) {
    let titleE = element.querySelector('.answer__write-title-correct');
    let valueE = element.querySelector('.answer__write-correct-answer-text-text');
    titleE.innerHTML = title;
    valueE.innerHTML = rightValue;
    let blockE = element.querySelector('.answer__write-correct-answer');
    blockE.style.display = 'block';
}

function showBlockIncorrectWriteAnswer(element, title, enterValue) {
    let titleE = element.querySelector('.answer__write-title-incorrect');
    let valueE = element.querySelector('.answer__write-incorrect-answer-text');
    titleE.innerHTML = title;
    valueE.innerHTML = enterValue;
    let blockE = element.querySelector('.answer__write-incorrect-answer');
    blockE.style.display = 'block';
}

function showBlockSkipWriteAnswer(element) {
    let blockE = element.querySelector('.answer__write-skip-answer');
    blockE.style.display = 'block';
}

function showEnterInputArea(element) {
    let blockE = element.querySelector('.answer__write-enter-area');
    blockE.style.display = 'block';
}

function hiddenBlockCorrectWriteAnswer(element) {
    let blockE = element.querySelector('.answer__write-correct-answer');
    blockE.style.display = 'none';
}

function hiddenBlockIncorrectWriteAnswer(element) {
    let blockE = element.querySelector('.answer__write-incorrect-answer');
    blockE.style.display = 'none';
}

function hiddenBlockSkipWriteAnswer(element) {
    let blockE = element.querySelector('.answer__write-skip-answer');
    blockE.style.display = 'none';
}

function hiddenEnterInputArea(element) {
    let blockE = element.querySelector('.answer__write-enter-area');
    blockE.style.display = 'none';
}


function isEqualString(a, b) {
    return a.toLowerCase() == b.toLowerCase();
}

function setMessageCorrect(ms) {
    let msItem = listItems[currentItem].querySelector('.study__item-answer-title-text');
    if (ms === null) {
        msItem.innerHTML = getRandomElementArray(msCorrect);
        msItem.classList.add('study__item-answer-title-text--correct');
    } else {
        msItem.innerHTML = ms;
        msItem.classList.remove('study__item-answer-title-text--correct');
    }
}

function setMessageIncorrect(ms) {
    let msItem = listItems[currentItem].querySelector('.study__item-answer-title-text');
    if (ms === null) {
        msItem.innerHTML = getRandomElementArray(msIncorrect);
        msItem.classList.add('study__item-answer-title-text--incorrect');
    } else {
        msItem.innerHTML = ms;
        msItem.classList.remove('study__item-answer-title-text--incorrect');
    }
}


function setBtnIncorrect(btn) {
    btn.classList.add('study__item-answer-content-btn--incorrect');
    let icon = btn.querySelector('.study__item-answer-content-btn-index');
    icon.innerHTML = '<i class="bi bi-x"></i>';
}

function setBtnCorrect(btn) {
    btn.classList.add('study__item-answer-content-btn--correctly');
    let icon = btn.querySelector('.study__item-answer-content-btn-index');
    icon.innerHTML = '<i class="bi bi-check"></i>';
}


function getCurrentWord() {
    return listItems[currentItem].querySelector('.study__item-question-content-word').innerHTML.trim();
}

function getCurrentAnswer() {
    if (isViLanguageAnswer) {
        return listItems[currentItem].querySelector('.study__item-question-content-definition').innerHTML.trim();
    } else {
        return listItems[currentItem].querySelector('.study__item-question-content-word').innerHTML.trim();
    }
}


function continueLearning() {
    const btnContinue = document.getElementById('study__footer-continue-btn');
    btnContinue.onclick = () => {
        footerControl.style.display = 'none';
        if (isMultipleChoiceAnswer) {
            if (currentItem < listItems.length) {
                setMessageIncorrect('Chọn định nghĩa đúng');
                moveElementToEndArray(currentItem, listItems);

            } else {
                assignItem();
                showWriteAnswer();
                currentItem = 0;
                setProgressBar(currentItem, listItems.length);
                resultMultipleChoice.style.display = 'none';
            }
        } else {
            if (isSkipCard) {
                currentItem++;
                setProgressBar(currentItem, listItems.length);
            } else {
                moveElementToEndArray(currentItem, listItems);
            }
            showWriteAnswer();
        }
        switchItem();
    }
}

function setProgressBar(current, total) {
    progressBar.style.width = `${(current / total) * 100}%`;
}


function randomArray(array) {
    var currentIndex = array.length,
        temporaryValue, randomIndex;
    while (0 !== currentIndex) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }
    return array;
}

function getRandomElementArray(array) {
    let randomIndex = Math.floor(Math.random() * array.length);
    return array[randomIndex];
}

function moveElementToEndArray(index, array) {
    array.push(array.splice(index, 1)[0]);
}


function deleElementFromArray(index, array) {
    array.splice(index, 1);
}


function setResultMultipleChoice() {
    let progressCurrent = resultMultipleChoice.querySelector('.item__successful-header-progress-current');
    let progressTotal = resultMultipleChoice.querySelector('.item__successful-header-progress-total');

    progressCurrent.innerHTML = listItems.length;
    progressTotal.innerHTML = listItems.length;

    let listItemResult = resultMultipleChoice.querySelector('.item__successful-body-list');
    listItemResult.innerHTML = '';
    for (let i = 0; i < listItems.length; i++) {
        let word = listItems[i].querySelector('.study__item-question-content-word').innerHTML.trim();
        let definition = listItems[i].querySelector('.study__item-question-content-definition').innerHTML.trim();
        let isTickStar = listItems[i].classList.contains('study__body-list-item--star');
        let card = `<div class="item__successful-body-list-item">
            <div class="successful__list-item-word">
                <span class="successful__list-item-word-text">
                    ${word}
                </span>
            </div>
            <div class="successful__list-item-definition">
                <span class="successful__list-item-definition-text">
                    ${definition}
                </span>
            </div>
            <div class="successful__list-item-control">
                <button onclick="tickStar(this,${i})" class="successful__list-item-control-btn ${isTickStar ? 'successful__list-item-control-btn--active' : ''}">
                    <i class="bi bi-star-fill"></i>
                </button>
                <button onclick="speakWord(this)" class="successful__list-item-control-btn">
                    <i class="bi bi-volume-up"></i>
                </button>

            </div>
        </div>`
        listItemResult.innerHTML += card;
    }
}


function showMultipleChoice() {
    var multipleChoices = document.querySelectorAll('.study__item-answer-multiple-choice');
    var writeAnswers = document.querySelectorAll('.study__item-answer-write');
    multipleChoices.forEach(function (item) {
        item.style.display = 'block';
    });
    writeAnswers.forEach(function (item) {
        item.style.display = 'none';
    });
    isMultipleChoiceAnswer = true;
}

function showWriteAnswer() {
    var multipleChoices = document.querySelectorAll('.study__item-answer-multiple-choice');
    var writeAnswers = document.querySelectorAll('.study__item-answer-write');
    multipleChoices.forEach(function (item) {
        item.style.display = 'none';
    });
    writeAnswers.forEach(function (item) {
        item.querySelector('.answer__write-enter-area').style.display = 'block';
        item.querySelector('.answer__write-skip-answer').style.display = 'none';
        item.querySelector('.answer__write-correct-answer').style.display = 'none';
        item.querySelector('.answer__write-incorrect-answer').style.display = 'none';
        item.style.display = 'block';
    });
    isMultipleChoiceAnswer = false;
}

function learnAgain() {
    btnLearnAgain.onclick = () => {
        itemChampion.style.display = 'none';
        currentItem = 0;
        setProgressBar(currentItem, listItems.length);
        isMultipleChoiceAnswer = true;
        assignItem();
        showMultipleChoice();
        setMultipleChoiceAnswer();
        switchItem();
    }
}


function tickStar(btn, index) {
    btn.classList.toggle('successful__list-item-control-btn--active');
    listItems[index].classList.toggle('study__body-list-item--star');
}

function speakWord(btn) {
    let word = btn.parentNode.parentNode.querySelector('.successful__list-item-word-text').innerHTML.trim();
    speech(word);
}


function openOptionDialog() {
    btnOption.onclick = () => {
        modal.style.display = 'block';
    }
}

function closeOptionDialog() {
    btnCloseOption.onclick = () => {
        modal.style.display = 'none';
        switchItem();
    }
}

function openSpeak() {
    btnOpenSpeak.onclick = () => {
        if (!btnOpenSpeak.classList.contains('modal__body-content-item-btn--active')) {
            btnOpenSpeak.classList.add('modal__body-content-item-btn--active');
            btnCloseSpeak.classList.remove('modal__body-content-item-btn--active');
            isSpeech = true;
        }
    }
}

function closeSpeak() {
    btnCloseSpeak.onclick = () => {
        if (!btnCloseSpeak.classList.contains('modal__body-content-item-btn--active')) {
            btnCloseSpeak.classList.add('modal__body-content-item-btn--active');
            btnOpenSpeak.classList.remove('modal__body-content-item-btn--active');
            isSpeech = false;
        }
    }
}

function speakEventClick() {
    let btnSpeak = listItems[currentItem].querySelector('.study__item-question-title-btn');
    btnSpeak.onclick = () => {
        speech(getCurrentWord());
    }
}


function changeViLanguage() {
    btnAnswerLangVi.onclick = () => {
        if (!btnAnswerLangVi.classList.contains('modal__body-content-item-btn--active')) {
            btnAnswerLangVi.classList.add('modal__body-content-item-btn--active');
            btnAnswerLangEn.classList.remove('modal__body-content-item-btn--active');
            isViLanguageAnswer = true;
            getAllListAnswer();
            setupForViAnswer();
        }
    }
}

function changeEnLanguage() {
    btnAnswerLangEn.onclick = () => {
        if (!btnAnswerLangEn.classList.contains('modal__body-content-item-btn--active')) {
            btnAnswerLangEn.classList.add('modal__body-content-item-btn--active');
            btnAnswerLangVi.classList.remove('modal__body-content-item-btn--active');
            isViLanguageAnswer = false;
            getAllListAnswer();
            setupForEnAnswer();
        }
    }
}


function setupForViAnswer() {
    let titles = document.querySelectorAll('.study__item-question-title-text');
    let btnSpeaks = document.querySelectorAll('.study__item-question-title-btn');
    let words = document.querySelectorAll('.study__item-question-content-word');
    let definitions = document.querySelectorAll('.study__item-question-content-definition');
    for (let i = 0; i < titles.length; i++) {
        titles[i].innerHTML = "Thuật ngữ";
        btnSpeaks[i].style.display = 'block'
        words[i].style.display = 'block';
        definitions[i].style.display = 'none';
    }
}

function setupForEnAnswer() {
    let titles = document.querySelectorAll('.study__item-question-title-text');
    let btnSpeaks = document.querySelectorAll('.study__item-question-title-btn');
    let words = document.querySelectorAll('.study__item-question-content-word');
    let definitions = document.querySelectorAll('.study__item-question-content-definition');
    for (let i = 0; i < titles.length; i++) {
        titles[i].innerHTML = "Định nghĩa";
        btnSpeaks[i].style.display = 'none'
        words[i].style.display = 'none';
        definitions[i].style.display = 'block';
    }
}


function toggleHeaderMenu(){
    
    btnHeaderMenu.onclick = () => {
        headerMenu.classList.toggle('study__header-list-items--active');
    }
}



assignItem();
getAllListAnswer();
switchItem();
answerEvents();
continueLearning();
listenEventWriteAnswer()
skipWriteAnswerEvents();
showMultipleChoice();
learnAgain();
openOptionDialog();
closeOptionDialog();
filterAllItems();
filterStarItems();
openSpeak();
closeSpeak();
speakEventClick();
changeViLanguage();
changeEnLanguage();
toggleHeaderMenu();