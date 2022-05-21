

var progressBarRest = document.getElementById('control__main-progress-bar-fill--rest');
var progressCountRest = document.getElementById('control__main-progress-text-number--rest');
var progressBarIncorrect = document.getElementById('control__main-progress-bar-fill--incorrect');
var progressCountIncorrect = document.getElementById('control__main-progress-text-number--incorrect');
var progressBarCorrect = document.getElementById('control__main-progress-bar-fill--correct');
var progressCountCorrect = document.getElementById('control__main-progress-text-number--correct');
var btnOpenOption = document.getElementById('control__main-action-option');
var modalDialog = document.getElementById('modal');
var blockIncorrectAnswer = document.getElementById('write__card-item-incorrect');
var btnContinueIncorrect = document.getElementById('write__card-item-incorrect-continue-btn');
var blockResult = document.getElementById('write__card-item-result');
var bntReStart = document.getElementById('write__card-result-restart-btn');
var listItems = document.querySelectorAll('.write__card-item');


let currentItem = 0;
let incorrectAnswerCount = 0;
let correctAnswerCount = 0;
let listIncorrectAnswer = [];
let isUnknown = false;


function checkAnswer() {
    let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
    let btnEnter = listItems[currentItem].querySelector('.write__card-item-answer-btn');
    document.onkeyup = (e) => {
        if (e.keyCode == 13) {
            btnEnter.onclick();
        }
    }
    btnEnter.onclick = () => {
        if (inputAnswer.value.trim().length > 0) {
            if (isEqualString(inputAnswer.value.trim(), getCurrentAnswer())) {
                btnEnter.innerHTML = "Đúng"
                btnEnter.style.backgroundColor = 'var(--green-color-dark)';
                setTimeout(() => {
                    currentItem++;
                    correctAnswerCount++;
                    setProgressBarRest(listItems.length - currentItem, listItems.length);
                    setProgressBarCorrect(correctAnswerCount, listItems.length);
                    switchItem();
                }, 500)
            } else {
                setBlockIncorrectAnswer(getCurrentWord(), getCurrentDefinition(), inputAnswer.value.trim());
                listItems[currentItem].style.display = 'none';
                listIncorrectAnswer.push(currentItem);
                continueWriteIncorrect();
            }
        } else {
            inputAnswer.value = '';
            inputAnswer.focus();
            displayFeaturesWhenUnknown(listItems[currentItem]);
            listIncorrectAnswer.push(currentItem);
            isUnknown = true;
            checkWriteRepeat();
        }
    }
}

function unknownEvent() {
    let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
    let btnUnknown = listItems[currentItem].querySelector('.write__card-item-unknown-btn');
    btnUnknown.onclick = () => {
        inputAnswer.value = '';
        inputAnswer.focus();
        displayFeaturesWhenUnknown(listItems[currentItem]);
        listIncorrectAnswer.push(currentItem);
        isUnknown = true;
        checkWriteRepeat();
    }
}

function checkWriteRepeat() {
    let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
    inputAnswer.onkeyup = () => {
        if (isUnknown) {
            if (isEqualString(inputAnswer.value.trim(), getCurrentAnswer())) {
                inputAnswer.disabled = true;
                setTimeout(() => {
                    inputAnswer.disabled = false;
                    inputAnswer.value = '';
                    incorrectAnswerCount++;
                    setProgressBarIncorrect(incorrectAnswerCount, listItems.length);
                    setProgressBarRest(listItems.length - correctAnswerCount - incorrectAnswerCount, listItems.length);
                    currentItem++;
                    switchItem();
                }, 500);
            }
        }
    }
}


function continueWriteIncorrect() {
    btnContinueIncorrect.onclick = () => {
        currentItem++;
        incorrectAnswerCount++;
        setProgressBarRest(listItems.length - currentItem, listItems.length);
        setProgressBarIncorrect(incorrectAnswerCount, listItems.length);
        switchItem();
    }
}

function isEqualString(a, b) {
    return a.toLowerCase() === b.toLowerCase();
}


function getCurrentAnswer() {
    return getCurrentDefinition();
}

function getCurrentWord() {
    return listItems[currentItem].querySelector('.write__card-item-question-word-text').innerHTML.trim();
}

function getCurrentDefinition() {
    return listItems[currentItem].querySelector('.write__card-item-question-definition-text').innerHTML.trim();
}

function switchItem() {
    for (let i = 0; i < listItems.length; i++) {
        listItems[i].style.display = 'none';
        hiddenFeaturesWhenUnknown(listItems[i]);
    }

    if (currentItem < listItems.length) {
        listItems[currentItem].style.display = 'block';
        let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
        inputAnswer.value = '';
        inputAnswer.focus();
        checkAnswer();
        blockIncorrectAnswer.style.display = 'none';
    } else {
        blockIncorrectAnswer.style.display = 'none';
        setBlockResult();
    }
    isUnknown = false;
    unknownEvent();
    checkWriteRepeat();
}


function displayFeaturesWhenUnknown(item) {
    let titleItem = item.querySelector('.write__card-item-title');
    let titleWord = item.querySelector('.write__card-item-question-title');
    let btnSpeak = item.querySelector('.write__card-item-question-content-btn');
    let definitionBlock = item.querySelector('.write__card-item-question-definition');
    let btnUnknown = item.querySelector('.write__card-item-unknown-btn');
    let btnAnswer = item.querySelector('.write__card-item-answer-btn');
    let separatorOne = item.querySelector('.write__card-item-separator--one');

    titleItem.style.display = 'block';
    titleWord.style.display = 'block';
    btnSpeak.style.display = 'block';
    definitionBlock.style.display = 'block';
    separatorOne.style.display = 'block';
    btnUnknown.style.display = 'none';
    btnAnswer.style.display = 'none';
}

function hiddenFeaturesWhenUnknown(item) {
    let titleItem = item.querySelector('.write__card-item-title');
    let titleWord = item.querySelector('.write__card-item-question-title');
    let btnSpeak = item.querySelector('.write__card-item-question-content-btn');
    let definitionBlock = item.querySelector('.write__card-item-question-definition');
    let btnUnknown = item.querySelector('.write__card-item-unknown-btn');
    let btnAnswer = item.querySelector('.write__card-item-answer-btn');
    let separatorOne = item.querySelector('.write__card-item-separator--one');

    titleItem.style.display = 'none';
    titleWord.style.display = 'none';
    btnSpeak.style.display = 'none';
    definitionBlock.style.display = 'none';
    separatorOne.style.display = 'none';
    btnUnknown.style.display = 'block';
    btnAnswer.style.display = 'block';
}

function setBlockIncorrectAnswer(question, answer, wrongAnswer) {
    blockIncorrectAnswer.style.display = 'block';
    let wordElement = blockIncorrectAnswer.querySelector('.write__card-incorrect-text-word');
    let wrongElement = blockIncorrectAnswer.querySelector('.write__card-incorrect-text-wrong');
    let correctElement = blockIncorrectAnswer.querySelector('.write__card-incorrect-text-correct');
    wordElement.innerHTML = question;
    wrongElement.innerHTML = wrongAnswer;
    correctElement.innerHTML = answer;
}


function setBlockResult() {
    blockResult.style.display = 'block';
    let scoreElement = blockResult.querySelector('.write__card-result-header-title-scores');
    let listResult = blockResult.querySelector('.write__card-result-content-lists');

    scoreElement.innerHTML = `${correctAnswerCount}/${listItems.length} - ${Math.round(correctAnswerCount / listItems.length * 100)}%`;
    listResult.innerHTML = '';
    for (let i = 0; i < listItems.length; i++) {
        let wordCard = listItems[i].querySelector('.write__card-item-question-word-text').innerHTML.trim();
        let definitionCard = listItems[i].querySelector('.write__card-item-question-definition-text').innerHTML.trim();
        let isIncorrect = listIncorrectAnswer.includes(i);
        let card = `<div class="write__card-result-content-item ${isIncorrect ? 'write__card-result-content-item--incorrect' : 'write__card-result-content-item--correct'}">
                        <div class="write__card-result-content-item-definition">
                            <div class="write__card-result-content-item-definition-icon">
                                ${isIncorrect ? '<i class="fas fa-times"></i>' : '<i class="fas fa-check"></i>'}
                            </div>
                            <span class="write__card-result-content-item-definition-text">
                                ${definitionCard}
                            </span>
                        </div>
                        <div class="write__card-result-content-item-word">
                            <span class="write__card-result-content-item-word-text">
                                ${wordCard}
                            </span>
                        </div>
                    </div>`
        listResult.innerHTML += card;
    }
}

function reStartWrite() {
    bntReStart.onclick = () => {
        blockResult.style.display = 'none';
        currentItem = 0;
        correctAnswerCount = 0;
        incorrectAnswerCount = 0;
        listIncorrectAnswer = [];
        setProgressBarRest(listItems.length - currentItem, listItems.length);
        setProgressBarIncorrect(incorrectAnswerCount, listItems.length);
        setProgressBarCorrect(correctAnswerCount, listItems.length);
        switchItem();
    }
}





function setProgressBarRest(rest, total) {
    progressBarRest.style.width = rest / total * 100 + '%';
    progressCountRest.innerHTML = rest;
}

function setProgressBarIncorrect(incorrect, total) {
    progressBarIncorrect.style.width = incorrect / total * 100 + '%';
    progressCountIncorrect.innerHTML = incorrect;
}

function setProgressBarCorrect(correct, total) {
    progressBarCorrect.style.width = correct / total * 100 + '%';
    progressCountCorrect.innerHTML = correct;
}


switchItem();
checkAnswer();
unknownEvent();
reStartWrite();
setProgressBarRest(listItems.length, listItems.length);