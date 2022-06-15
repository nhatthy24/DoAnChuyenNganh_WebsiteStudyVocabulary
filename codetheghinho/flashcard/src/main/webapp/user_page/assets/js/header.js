

function showAccountDialog() {
    const btnAccount = document.getElementById('navbar__user-btn');
    const dialogAccount = document.getElementById('navbar__user-menu');

    btnAccount.onclick = () => {
        if (dialogAccount.style.display === 'block') {
            dialogAccount.style.display = 'none';
        } else {
            dialogAccount.style.display = 'block';
        }

    }
}


function showCreateButton() {
    const btnCreate = document.getElementById('navbar__menu-create-btn');
    const dialogCreate = document.getElementById('navbar__create-menu');
    btnCreate.onclick = () => {
        if (dialogCreate.style.display === 'block') {
            dialogCreate.style.display = 'none';
        }
        else {
            dialogCreate.style.display = 'block';
        }
    }
}

function showLibraryDialog() {
    const btnLibrary = document.getElementById('navbar__library-btn');
    const dialogLibrary = document.getElementById('navbar__library');
    btnLibrary.onclick = (e) => {
        if (dialogLibrary.style.display === 'block') {
            dialogLibrary.style.display = 'none';
        }
        else {
            dialogLibrary.style.display = 'block';
        }
    }
}

function switchLibraryTab() {
    const tabTerm = document.getElementById('library__tab-term');
    const tabFolder = document.getElementById('library__tab-folder');
    const tabClass = document.getElementById('library__tab-class');
    const tabTermContent = document.getElementById('library-term');
    const tabFolderContent = document.getElementById('library-folder');
    const tabClassContent = document.getElementById('library-class');

    tabTerm.onclick = () => {
        document.querySelector('.navbar__library-tab-item.active').classList.remove('active');
        document.querySelectorAll('.library__tab-content').forEach(item => {
            item.style.display = 'none';
        });
        tabTerm.parentElement.classList.add('active');
        tabTermContent.style.display = 'block';
    }
    tabFolder.onclick = () => {
        document.querySelector('.navbar__library-tab-item.active').classList.remove('active');
        document.querySelectorAll('.library__tab-content').forEach(item => {
            item.style.display = 'none';
        });
        tabFolder.parentElement.classList.add('active');
        tabFolderContent.style.display = 'block';
    }
    tabClass.onclick = () => {
        document.querySelector('.navbar__library-tab-item.active').classList.remove('active');
        document.querySelectorAll('.library__tab-content').forEach(item => {
            item.style.display = 'none';
        });
        tabClass.parentElement.classList.add('active');
        tabClassContent.style.display = 'block';
    }

}



window.onload = () => {
    const btnAccount = document.getElementById('navbar__user-btn');
    const dialogAccount = document.getElementById('navbar__user-menu');
    const btnCreate = document.getElementById('navbar__menu-create-btn');
    const dialogCreate = document.getElementById('navbar__create-menu');
    const btnLibrary = document.getElementById('navbar__library-btn');
    const dialogLibrary = document.getElementById('navbar__library');

    document.onclick = (e) => {
        if (e.target != btnAccount && !dialogAccount.contains(e.target)) {
            dialogAccount.style.display = 'none';
        }

        if (e.target != btnCreate && !dialogCreate.contains(e.target)) {
            dialogCreate.style.display = 'none';
        }

        if (e.target != btnLibrary && !dialogLibrary.contains(e.target)) {
            dialogLibrary.style.display = 'none';
        }
    }

}

showAccountDialog();
showCreateButton();
showLibraryDialog();
switchLibraryTab();