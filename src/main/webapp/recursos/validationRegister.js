const password = document.querySelector("#password");
const email = document.querySelector("#email");
const usuario = document.querySelector("#usuario");
const formRegistro = document.querySelector("#formRegistro");

const er = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

//Booleanos
let user = false;
let mail = false;
let pass = false;

eventListeners();

function eventListeners() {

    //Verificar el password con los 8 caracteres validos
    password.addEventListener("keyup", validarCampos);
    email.addEventListener("keyup", validarCampos);
    usuario.addEventListener("keyup", validarCampos);

    //Verificamos el formulario
    formRegistro.addEventListener("submit", enviarFormulario);
}


function enviarFormulario(e) {
    e.preventDefault();

    if (user && mail && pass) {
        this.submit();
    } else if (!user) {
        alertError("addError", "El user-name debe contar con almenos 4 caracteres", usuario);
        user = false;

    } else if (!mail) {
        alertError("addError", "Email no valido: verificar los caracteres de @ y .com", email);
        mail = false;

    } else if (!pass) {
        alertError("addError", "El password debe tener un minimo de 8 caracteres", password);
        pass = false;
    }
}

function validarCampos(e) {
    if (e.target.type === "password") {
        if (password.value.length < 8) {
            alertError("addError", "El password debe tener un minimo de 8 caracteres", password);
            pass = false;

        } else {
            alertError("removeError", "", password);
            pass = true;

        }
    } else if (e.target.type === "email") {
        if (!(er.test(e.target.value))) {
            alertError("addError", "Email no valido: verificar los caracteres de @ y .com", e.target);
            mail = false;

        } else {
            alertError("removeError", "", e.target);
            mail = true;

        }
    } else if (e.target.type === "text") {
        if (e.target.value.length < 4) {
            alertError("addError", "El user-name debe contar con almenos 4 caracteres", e.target);
            user = false;

        } else {
            alertError("removeError", "", e.target);
            user = true;
        }
    }
}

function alertError(peticion, mensaje, type) {
    if (peticion === "addError") {
        type.classList.add("border", "border-danger");
        type.classList.remove("border", "border-success");

        const divError = document.createElement("div");
        const divInsert = formRegistro.querySelector(".divInsert");

        divError.textContent = mensaje;
        divError.classList.add("alert", "alert-warning");
        divError.setAttribute("role", "alert");

        divInsert.insertBefore(divError, divInsert.children[3]);

        //Comprobar si hay mas de uno 
        const divsErrors = document.querySelectorAll("div.alert");
        if (divsErrors.length > 1) {
            divError.remove();
        }
    } else if (peticion === "removeError") {
        const divsErrors = document.querySelector("div.alert");
        divsErrors.remove();

        type.classList.add("border", "border-success");
        type.classList.remove("border", "border-danger");
    }
}
