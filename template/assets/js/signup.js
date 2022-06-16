
let labelBirthday = document.getElementById('signup-label-birthday');
let labelEmail = document.getElementById('signup-label-email');
let labelUsername = document.getElementById('signup-label-username');
let labelPassword = document.getElementById('signup-label-password');
let btnSignup = document.getElementById('signup__form-btn');

let isValidBirthday = false;
let isValidEmail = false;
let isValidUsername = false;
let isValidPassword = false;

function checkEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

function checkPassword(password) {
    return password.length >= 8;
}

function checkUsername(username) {
    return username.length >= 3;
}

function checkValidBirthday(e) {
    const birthday = e.value.trim();
    if (birthday.length == 0) {
        labelBirthday.innerHTML = "VUI LÒNG NHẬP NGÀY SINH";
        labelBirthday.classList.add('signup__form-item-label--error');
        e.classList.add('signup__form-item-input--error');
        isValidBirthday = false;
    } else {
        labelBirthday.innerHTML = "NGÀY SINH";
        labelBirthday.classList.remove('signup__form-item-label--error');
        e.classList.remove('signup__form-item-input--error');
        isValidBirthday = true;
    }
    checkValidForm();
}

function checkValidEmail(e) {
    const email = e.value.trim();
    if (!checkEmail(email)) {
        if (email.length >= 1) {
            labelEmail.innerHTML = "ĐỊA CHỈ EMAIL KHÔNG HỢP LỆ";
            labelEmail.classList.add('signup__form-item-label--error');
            e.classList.add('signup__form-item-input--error');
        }
        else {
            labelEmail.innerHTML = "EMAIL";
            labelEmail.classList.remove('signup__form-item-label--error');
            e.classList.remove('signup__form-item-input--error');
        }
        isValidEmail = false;
    } else {
        labelEmail.innerHTML = "EMAIL";
        labelEmail.classList.remove('signup__form-item-label--error');
        e.classList.remove('signup__form-item-input--error');
        isValidEmail = true;
    }
    checkValidForm();
}

function checkValidUsername(e) {
    const username = e.value.trim();
    if (!checkUsername(username)) {
        if (username.length >= 1) {
            labelUsername.innerHTML = "ĐỘ DÀI TỐI THIỂU LÀ 3 KÝ TỰ";
            labelUsername.classList.add('signup__form-item-label--error');
            e.classList.add('signup__form-item-input--error');
        } else {
            labelUsername.innerHTML = "TÊN NGƯỜI DÙNG";
            labelUsername.classList.remove('signup__form-item-label--error');
            e.classList.remove('signup__form-item-input--error');
        }
        isValidUsername = false;
    } else {
        labelUsername.innerHTML = "TÊN NGƯỜI DÙNG";
        labelUsername.classList.remove('signup__form-item-label--error');
        e.classList.remove('signup__form-item-input--error');
        isValidUsername = true;
    }
    checkValidForm();
}

function checkValidPassword(e) {
    const password = e.value.trim();
    if (!checkPassword(password)) {
        if (password.length >= 1) {
            labelPassword.innerHTML = "ĐỘ DÀI TỐI THIỂU LÀ 8 KÝ TỰ";
            labelPassword.classList.add('signup__form-item-label--error');
            e.classList.add('signup__form-item-input--error');
        }
        else {
            labelPassword.innerHTML = "MẬT KHẨU";
            labelPassword.classList.remove('signup__form-item-label--error');
            e.classList.remove('signup__form-item-input--error');
        }
        isValidPassword = false;
    } else {
        labelPassword.innerHTML = "MẬT KHẨU";
        labelPassword.classList.remove('signup__form-item-label--error');
        e.classList.remove('signup__form-item-input--error');
        isValidPassword = true;
    }
    checkValidForm();
}


function checkValidForm() {
    if (isValidBirthday && isValidEmail && isValidUsername && isValidPassword) {
        btnSignup.disabled = false;
        btnSignup.classList.add('signup__form-btn--active');
    } else {
        btnSignup.disabled = true;
        btnSignup.classList.remove('signup__form-btn--active');
    }
}