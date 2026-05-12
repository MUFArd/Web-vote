document.addEventListener("DOMContentLoaded", function () {

    const buttons = document.querySelectorAll("#lihatDetail");
    const tutupDetail = document.getElementById("tutupDetail");
    const infoLengkap = document.getElementById("infoLengkap");

    const informasiKandidat = document.querySelector(".informasi-kandidat");
    const visiMisi = document.querySelector(".visi-misi");
    const buttonGroup = document.querySelector(".button");

    const detailNamaKetua = document.getElementById("detailNamaKetua");
    const detailNamaWakil = document.getElementById("detailNamaWakil");
    const detailVisi = document.getElementById("detailVisi");
    const detailMisi = document.getElementById("detailMisi");
    const detailFoto = document.getElementById("detailFoto");

    buttons.forEach(button => {
        button.addEventListener("click", function () {

            const ketua = this.dataset.ketua || "-";
            const wakil = this.dataset.wakil || "-";
            const visi = this.dataset.visi || "-";
            const misi = this.dataset.misi || "-";
            const foto = this.dataset.foto || "/images/dummy2.png";

            detailNamaKetua.innerText = ketua;
            detailNamaWakil.innerText = wakil;
            detailVisi.innerText = visi;
            detailMisi.innerHTML = `<li>${misi}</li>`;
            detailFoto.src = foto;

            infoLengkap.classList.remove("scale-0", "opacity-0", "pointer-events-none");
            infoLengkap.classList.add("scale-100", "opacity-100");

            setTimeout(() => {
                informasiKandidat.classList.remove("translate-y-10", "opacity-0");
                visiMisi.classList.remove("translate-y-10", "opacity-0");
                buttonGroup.classList.remove("translate-y-10", "opacity-0");
            }, 100);
        });
    });

    tutupDetail.addEventListener("click", function () {

        informasiKandidat.classList.add("translate-y-10", "opacity-0");
        visiMisi.classList.add("translate-y-10", "opacity-0");
        buttonGroup.classList.add("translate-y-10", "opacity-0");

        setTimeout(() => {
            infoLengkap.classList.remove("scale-100", "opacity-100");
            infoLengkap.classList.add("scale-0", "opacity-0", "pointer-events-none");
        }, 200);
    });

});
let selectedForm = null;

document.addEventListener("DOMContentLoaded", function () {
    const modal = document.getElementById("voteModal");
    const btnYakin = document.getElementById("btnYakin");
    const btnTidak = document.getElementById("btnTidak");

    document.querySelectorAll(".open-modal").forEach(btn => {
        btn.addEventListener("click", function () {
            selectedForm = this.closest("form");
            modal.classList.remove("hidden");
            modal.classList.add("flex");
        });
    });

    btnYakin.addEventListener("click", function () {
        if (selectedForm) {
            selectedForm.submit();
        }
    });

    btnTidak.addEventListener("click", function () {
        modal.classList.add("hidden");
        modal.classList.remove("flex");
        selectedForm = null;
    });

    modal.addEventListener("click", function (e) {
        if (e.target === modal) {
            modal.classList.add("hidden");
            modal.classList.remove("flex");
            selectedForm = null;
        }
    });
});