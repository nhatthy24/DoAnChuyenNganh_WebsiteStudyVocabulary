const listResult = document.getElementById("menu-list-question-result");
listResult.addEventListener("click", function () {
    if ($(".anim-menu-rotate").length === 0) {
      listResult.innerHTML = "Danh sách câu hỏi";
      $(".head-list-result").addClass("anim-menu-rotate");
      $(".head-list-result").css("animation-name", "rotate-out");
    } else {
      listResult.innerHTML = "Ẩn danh sách câu hỏi";
      $(".anim-menu-rotate").css("animation-name", "rotate-in");
      setTimeout(function () {
        $(".head-list-result").removeClass("anim-menu-rotate");
      }, 1000);
    }
  }
);