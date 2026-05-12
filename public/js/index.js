    const password = document.getElementById("password");
    const togglePassword = document.getElementById("togglePassword");

    togglePassword.addEventListener("click", function () {
        const type = password.getAttribute("type") === "password"
            ? "text"
            : "password";

        password.setAttribute("type", type);

        this.classList.toggle("fa-eye");
        this.classList.toggle("fa-eye-slash");
    });