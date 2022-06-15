

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