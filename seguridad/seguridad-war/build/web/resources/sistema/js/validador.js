function ValidaSoloNumeros(event) {
    var code = event.charCode || event.keyCode;
    if (code !== 8 && code !== 0 && (code < 48) || (code > 57)) {
        if (window.event) {
            event.returnValue = false;
        } else {
            event.preventDefault();
        }

    }
}
function bloqueaRegreso() {
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button" //chrome
    window.onhashchange = function () {
        window.location.hash = "no-back-button";
    };
}

