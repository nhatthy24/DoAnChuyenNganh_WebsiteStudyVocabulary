

function switchTab(){
    const btnTerm = document.getElementById('class__tab-term-btn');
    const btnMember = document.getElementById('class__tab-member-btn');
    const termElement = document.getElementById('class__content-terms');
    const memberElement = document.getElementById('class__content-member');

    btnTerm.onclick = () => {
        if(!btnTerm.classList.contains('class__header-tab-item--active')){
            btnTerm.classList.add('class__header-tab-item--active');
            termElement.style.display = 'block';
            memberElement.style.display= 'none';
            btnMember.classList.remove('class__header-tab-item--active');
        }
    }

    btnMember.onclick = () => {
        if(!btnMember.classList.contains('class__header-tab-item--active')){
            btnMember.classList.add('class__header-tab-item--active');
            memberElement.style.display= 'block';
            termElement.style.display = 'none';
            btnTerm.classList.remove('class__header-tab-item--active');
        }
    }
}

switchTab();