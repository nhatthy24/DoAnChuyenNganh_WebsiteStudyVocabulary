

function scrollHeader() {
    const page = document.getElementById("container");
    const headerCreate = document.getElementById("create__header");

    window.onscroll = () => {
        if (window.pageYOffset > 5) {
            headerCreate.style.top = 0;
            headerCreate.style.boxShadow = "0px 1px 23px 1px rgba(0,0,0,0.37)";
        }else{
            headerCreate.style.top ='88px';
            headerCreate.style.boxShadow = "none";

        }
    }
}

scrollHeader();

$(".add__tab-btn").click(function () {
    $(".create__term-tag-list").append(
        "<div class=\"tag__item\">\n" +
        "                    <div class=\"tag__item-header\">\n" +
        "                        <div class=\"tab__item-counter\">\n" +
        "                            <p class=\"tab__count\"></p>\n" +
        "                        </div>\n" +
        "                        <div class=\"tab__item-toolbar\">\n" +
        "                            <button class=\"tab__item-toolbar-btn\">\n" +
        "                                <i class=\"fas fa-grip-lines\"></i>\n" +
        "                            </button>\n" +
        "                            <button class=\"tab__item-toolbar-btn\">\n" +
        "                                <i class=\"fas fa-trash-alt\"></i>\n" +
        "                            </button>\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                    <div class=\"tab__item-content\">\n" +
        "                        <div class=\"tab__content-side-word\">\n" +
        "                            <input class=\"tab__content-side-word-input\" type=\"text\" name=\"word\">\n" +
        "                            <div class=\"tab__below-input\">\n" +
        "                                <label class=\"tab__content-side-label\">THUẬT NGỮ</label>\n" +
        "                                <button class=\"tab__language-side\">TIẾNG ANH</button>\n" +
        "                            </div>\n" +
        "                        </div>\n" +
        "                        <div class=\"tab__content-side-definition\">\n" +
        "                            <div class=\"tab__side-definition-editor\">\n" +
        "                                <input class=\"tab__content-side-editor-input\" type=\"text\" name=\"word\">\n" +
        "                                <div class=\"tab__below-input\">\n" +
        "                                    <label class=\"tab__content-side-label\" >ĐỊNH NGHĨA</label>\n" +
        "                                    <button class=\"tab__language-side\">TIẾNG VIỆT</button>\n" +
        "                                </div>\n" +
        "                            </div>\n" +
        "                            <div class=\"tab__side-img\">\n" +
        "                                <i class=\"far fa-image\"></i>\n" +
        "                                <p class=\"tab__side-img-text\">HÌNH ẢNH</p>\n" +
        "                            </div>\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                </div>"
    );
});