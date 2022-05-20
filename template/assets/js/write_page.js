

var progressBarRest = document.getElementById('control__main-progress-bar-fill--rest');
var progressCountRest = document.getElementById('control__main-progress-text-number--rest');
var progressBarIncorrect = document.getElementById('control__main-progress-bar-fill--incorrect');
var progressCountIncorrect = document.getElementById('control__main-progress-text-number--incorrect');
var progressBarCorrect = document.getElementById('control__main-progress-bar-fill--correct');
var progressCountCorrect = document.getElementById('control__main-progress-text-number--correct');
var btnOpenOption = document.getElementById('control__main-action-option');
var modalDialog = document.getElementById('modal');


var listItems = document.querySelectorAll('.write__card-item');
let currentItem = 0;
let incorrectAnswerCount = 0;


function checkAnswer() {
    let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
    let btnEnter = listItems[currentItem].querySelector('.write__card-item-answer-btn');
    document.onkeyup = (e) => {
        if (e.keyCode == 13) {
            btnEnter.onclick();
        }
    }
    btnEnter.onclick = () => {
        if (isEqualString(inputAnswer.value.trim(), getCurrentAnswer())) {
            btnEnter.innerHTML = "Đúng"
            btnEnter.style.backgroundColor = 'var(--green-color-dark)';
            setTimeout(() => {
                currentItem++;
                setProgressBarRest(listItems.length - currentItem, listItems.length);
                setProgressBarCorrect(currentItem, listItems.length);
                switchItem();
            },500)
        } else {
            inputAnswer.value = '';
            inputAnswer.focus();
            displayFeaturesWhenIncorrect(listItems[currentItem]);
            checkWriteRepeat();
        }
    }
}

function unknownEvent(){
    let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
    let btnUnknown = listItems[currentItem].querySelector('.write__card-item-unknown-btn');
    btnUnknown.onclick = () => {
        inputAnswer.value = '';
        inputAnswer.focus();
        displayFeaturesWhenIncorrect(listItems[currentItem]);
        checkWriteRepeat();
    }
}

function checkWriteRepeat() {
    let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
    inputAnswer.onkeyup = () => {
        if (isEqualString(inputAnswer.value.trim(), getCurrentAnswer())) {
            inputAnswer.disabled = true;
            setTimeout(() => {
                inputAnswer.disabled = false;
                inputAnswer.value = '';
                incorrectAnswerCount++;
                setProgressBarIncorrect(incorrectAnswerCount, listItems.length);
                setProgressBarRest(listItems.length - currentItem - incorrectAnswerCount, listItems.length);
                currentItem++;
                switchItem();
            }, 500);
        }
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
    }

    if (currentItem < listItems.length) {
        listItems[currentItem].style.display = 'block';
        let inputAnswer = listItems[currentItem].querySelector('.write__card-item-answer-input');
        inputAnswer.focus();
        checkAnswer();
    }
}


function displayFeaturesWhenIncorrect(item) {
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

function hiddenFeaturesWhenIncorrect(item) {
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


// switchItem();
// checkAnswer();
// unknownEvent();
// setProgressBarRest(listItems.length, listItems.length);
