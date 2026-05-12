<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>OSIS & MPK</title>
</head>

<body class="overflow-hidden">
    <main class="flex flex-col justify-center w-full gap-4" style="background-image: url('{{ asset('images/depanschool.png') }}'); background-size: cover; background-position: center; background-repeat: no-repeat; height: 100vh;">
        <div class="absolute backdrop-blur-sm bg-white/30 p-10 rounded-xl w-full h-screen z-0"></div>
        <div class="logo flex justify-center w-full mb-2 gap-5">
            <img src="{{ asset('images/osis.png') }}" alt="Logo" class="w-18 h-18 z-1" data-aos="fade-up" data-aos-delay="100">
            <img src="{{ asset('images/mpk.png') }}" alt="Logo" class="w-18 h-18 z-1" data-aos="fade-up" data-aos-delay="100">
        </div>
        <div class="text">
            <h1 class="w-full text-center text-3xl" data-aos="fade-up" data-aos-delay="100">
                Sistem Informasi Pemilihan OSIS & MPK
            </h1>
            <p class="w-full text-center text-mds" data-aos="fade-up" data-aos-delay="100">
                Selamat datang di aplikasi pemilihan ketua OSIS & MPK
            </p>
        </div>
        <div class="flex gap-20 justify-center items-center mt-5">

            <div class="card-wrapper w-54 h-68 [perspective:1000px]" data-aos="fade-up" data-aos-delay="100">
                <div id="flipCardOsis" class="{{ $sudahVoteOsis ? 'grayscale pointer-events-none' : '' }} relative w-full h-full duration-700 [transform-style:preserve-3d] cursor-pointer hover:scale-105 transition duration-300 ease-in-out">
                    <div class="absolute inset-0 shadow-lg flex flex-col justify-center items-center gap-2 p-3 rounded-xl bg-gradient-to-b from-red-500 via-red-200 to-white [backface-visibility:hidden]">
                        <img src="{{ asset('images/osis.png') }}" alt="Logo" class="w-28 h-28">
                        <h1 class="text-xl">OSIS</h1>
                        <p class="text-center text-sm">
                            Pemilihan Ketua & Wakil Ketua
                        </p>
                        <button onclick="window.location.href='{{ url('/osis-vote') }}'" class="mt-2 bg-red-400 hover:bg-red-600 text-white font-bold w-12 h-12 rounded-full transition duration-300 ease-in-out z-50">
                            <i class="fa-solid fa-arrow-right-long"></i>
                        </button>
                    </div>
                    <div class="absolute inset-0 shadow-lg flex flex-col justify-center items-center p-4 text-center rounded-xl bg-white [transform:rotateY(180deg)] [backface-visibility:hidden]">
                        <h2 class="font-bold text-lg mb-2">Tentang OSIS</h2>
                        <p class="text-sm">
                            Organisasi Siswa Intra Sekolah yang membantu kegiatan sekolah,
                            menyalurkan aspirasi siswa, dan melatih kepemimpinan.
                        </p>
                    </div>
                </div>
            </div>
            <div class="card-wrapper w-54 h-68 [perspective:1000px]" data-aos="fade-up" data-aos-delay="200">
                <div id="flipCardMpk" class="{{ $sudahVoteMpk ? 'grayscale pointer-events-none' : '' }} relative w-full h-full duration-700 [transform-style:preserve-3d] cursor-pointer hover:scale-105 transition duration-300 ease-in-out">
                    <div
                        class="absolute inset-0 shadow-lg flex flex-col justify-center gap-1 items-center p-2 rounded-xl bg-gradient-to-b from-green-600 via-green-100 to-white [backface-visibility:hidden]">
                        <img src="{{ asset('images/mpk.png') }}" alt="Logo" class="w-28 h-28">
                        <h1 class="text-xl">MPK</h1>
                        <p class="text-center text-sm">
                            Pemilihan Ketua & Wakil
                        </p>
                        <button onclick="window.location.href='{{ url('/mpk-vote') }}'"
                            class="mt-2 bg-green-500 hover:bg-green-600 text-white font-bold w-12 h-12 rounded-full transition duration-300 ease-in-out">
                            <i class="fa-solid fa-arrow-right-long"></i>
                        </button>
                    </div>
                    <div
                        class="absolute inset-0 shadow-lg flex flex-col justify-center items-center p-4 text-center rounded-xl bg-white [transform:rotateY(180deg)] [backface-visibility:hidden]">
                        <h2 class="font-bold text-lg mb-2">Tentang MPK</h2>
                        <p class="text-sm">
                            Majelis Perwakilan Kelas yang berfungsi mengawasi kinerja OSIS,
                            menampung aspirasi siswa, dan membantu lingkungan sekolah yang baik.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <form action="{{ url('/logout') }}" method="GET" class="absolute top-5 right-5">
                <button id="Logout" type="submit"
                    class="border-1 border-black text-black py-1 px-6 rounded-xl transition duration-300 ease-in-out cursor-pointer"
                    data-aos="fade-left" data-aos-delay="100" >
                    Log out
                </button>
            </form>
    </main>
    <footer class="w-full absolute bottom-0 left-0 py-2 text-center text-xs text-gray-700 cursor-pointer">
        © 2026 Muhammad Farel Andriani
    </footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<script src="{{ asset('js/osismpk.js') }}"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    AOS.init({
        duration: 1000,
        once: true
    });
</script>

</html>