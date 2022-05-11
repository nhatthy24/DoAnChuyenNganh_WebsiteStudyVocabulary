

const modal = document.getElementById("modal");
const modalInner = document.getElementById("modal__inner");
const editWordDialog = document.getElementById("edit__word-dialog");
let inputWord = document.getElementById('edit__word-dialog-item-input-word');
let inputDefinition = document.getElementById('edit__word-dialog-item-input-definition');

const cards = document.querySelectorAll('.card__item');
const btnPreCard = document.querySelector('.card__toolbar-nav-left');
const btnNextCard = document.querySelector('.card__toolbar-nav-right');

let currentCard = 1;
const totalIndex = cards.length;



function preCard() {
    btnPreCard.onclick = () => {
        currentCard -= 1;
        if (currentCard < 1) {
            currentCard = 1;
        }
        switchCard(currentCard);
        cards[currentCard -1 ].classList.add('term__card-item--slide-prev')
    }
}

function nextCard() {
    btnNextCard.onclick = () => {
        currentCard += 1;
        if (currentCard > totalIndex) {
            currentCard = totalIndex;
        }
        switchCard(currentCard);
        cards[currentCard -1 ].classList.add('term__card-item--slide-next')
    }

}




function exchangeWordToDefinition() {
    for (let i = 0; i < cards.length; i++) {
        if (cards[i].style.display == 'block') {
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



function switchCard(currentCard) {
    for (let i = 0; i < cards.length; i++) {
        cards[i].style.display = 'none';
        removeRotateCard(cards[i]);
    }
    cards[currentCard - 1].style.display = 'block';
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
    progressTotal.innerHTML = cards.length;
    progressBar.style.width = (currentCard / cards.length) * 100 + '%';
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


switchCard(currentCard);
exchangeCard();
exchangeWordToDefinition();
exchangeDefinitionToWord();
checkButtonAbility();
preCard();
nextCard();
progressControl();