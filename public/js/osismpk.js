    const flipCardOsis = document.getElementById("flipCardOsis");
    const flipCardMpk = document.getElementById("flipCardMpk");

    flipCardOsis.addEventListener("click", function () {
        flipCardOsis.classList.toggle("[transform:rotateY(180deg)]");
    });

    flipCardMpk.addEventListener("click", function () {
        flipCardMpk.classList.toggle("[transform:rotateY(180deg)]");
    });