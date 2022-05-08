

const currentElement = document.getElementById('current-slide');
const totalElement = document.getElementById('total-slide');

let currentSlide = parseInt(currentElement.innerHTML);
let totalSlide = parseInt(totalElement.innerHTML);
const slides = document.querySelectorAll('.term__card-item');
const preBtn = document.querySelector('.card__control-prev-btn');
const nextBtn = document.querySelector('.card__control-next-btn');



$(document).ready(function () {
    switchCard(currentSlide);
    setTotalSlides();
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

  

