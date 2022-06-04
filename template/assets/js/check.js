const myOption = document.getElementById("myOption");
const myPopup = document.getElementById("myPopup");
const myResults = document.getElementById("myResults");
const myQuestions = document.getElementById("myQuestions");
const container = document.getElementById("container");
const output = document.getElementById("output");
const fill = document.getElementById("fill");
const click = document.getElementById("Assemble-button-icon");
var counter = document.getElementById("counter");

function openOption() {
  myOption.style.display = "block";
}

function closeOption() {
  myOption.style.display = "none";
}

function openPopUp() {
  myPopup.style.display = "block";
}

function closePopUp() {
  myPopup.style.display = "none";
}

function openResults() {
  myPopup.style.display = "none";
  myResults.style.display = "block";
  myQuestions.style.display = "none";
}

function closeResults() {
  myPopup.style.display = "none";
  myResults.style.display = "none";
  myQuestions.style.display = "block";
  output.style.display = "none";
}

function myPrint(myPrint) {
  var printData = document.getElementById(myPrint);
  newWin = window.open("");
  newWin.document.write(printData.outerHTML);
  newWin.print();
  newWin.close();
}

// window.onload = function(){
// 	setTimeout(function(){
// 	var loader = document.getElementsByClassName("loader")[0];
// 	loader.className="loader fadeout" ;//loading page
// 	setTimeout(function(){loader.style.display="none"},1000)
// 	},1000)
// }//loading page 1s

click.addEventListener("click", () => {
  var a = 0;
  var run = setInterval(frames, 50);

  function frames() {
    a = a + 1;
    if (a == 101) {
      clearInterval(run);
      container.style.display = "none";
      output.style.display = "block";
      openResults();
    } else {
      container.style.display = "block";
      myPopup.style.display = "none";
      myResults.style.display = "none";
      myQuestions.style.display = "none";
      counter.textContent = a + "%";
      fill.style.width = a + "%";
    }
  }
});

const list = document.getElementById("menu-list-question");
list.addEventListener(
  "click",
  function () {
    if ($(".anim-menu-rotate").length === 0) {
      list.innerHTML = "Danh sách câu hỏi";
      $(".head-list").addClass("anim-menu-rotate");
      $(".head-list").css("animation-name", "rotate-out");
    } else {
      list.innerHTML = "Ẩn danh sách câu hỏi";
      $(".anim-menu-rotate").css("animation-name", "rotate-in");
      setTimeout(function () {
        $(".head-list").removeClass("anim-menu-rotate");
      }, 1000);
    }
    /*setTimeout(function(){
      $('.head-list').removeClass( "anim-menu-rotate" );
      $('.head-list').css('display', 'none');
    }, 1000)*/
  }
  /*
    $('.head-list').delay( 1000 ).fadeIn( 400 );
  ;*/
);


