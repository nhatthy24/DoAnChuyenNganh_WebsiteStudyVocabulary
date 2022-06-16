

let labelUsername = document.getElementById('login-label-username');
let labelPassword = document.getElementById('login-label-password');

let inputUsername = document.getElementById('login-form-input-username');
let inputPassword = document.getElementById('login-form-input-password');

let isValidUsername = false;
let isValidPassword = false;

function checkUsername() {
    const username = inputUsername.value.trim();
    if (username.length === 0) {
        labelUsername.innerHTML = 'KHÔNG THỂ ĐỂ TRỐNG TÊN NGƯỜI DÙNG';
        labelUsername.classList.add('login-form-label--error');
        inputUsername.classList.add('login-form-input--error');
        isValidUsername = false;
    } else {
        if (username.length < 3) {
            labelUsername.innerHTML = 'TÊN NGƯỜI DÙNG QUÁ NGẮN';
            labelUsername.classList.add('login-form-label--error');
            inputUsername.classList.add('login-form-input--error');
            isValidUsername = false;
        } else {
            labelUsername.innerHTML = 'TÊN NGƯỜI DÙNG';
            labelUsername.classList.remove('login-form-label--error');
            inputUsername.classList.remove('login-form-input--error');
            isValidUsername = true;
        }
    }
}

function checkPassword() {
    const password = inputPassword.value.trim();
    if (password.length === 0) {
        labelPassword.innerHTML = 'KHÔNG THỂ ĐỂ TRỐNG MẬT KHẨU';
        labelPassword.classList.add('login-form-label--error');
        inputPassword.classList.add('login-form-input--error');
        isValidPassword = false;
    } else {
        if (password.length < 8) {
            labelPassword.innerHTML = 'MẬT KHẨU QUÁ NGẮN';
            labelPassword.classList.add('login-form-label--error');
            inputPassword.classList.add('login-form-input--error');
            isValidPassword = false;
        } else {
            labelPassword.innerHTML = 'MẬT KHẨU';
            labelPassword.classList.remove('login-form-label--error');
            inputPassword.classList.remove('login-form-input--error');
            isValidPassword = true;
        }
    }
}

function checkValidForm() {
    checkUsername();
    checkPassword();
    return (isValidUsername && isValidPassword);

}