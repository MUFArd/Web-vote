<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <title>Login Vote</title>
</head>

<body class="min-h-screen overflow-hidden">
    <main class="grid grid-cols-2 w-full h-screen bg-cover bg-center bg-no-repeat"
        style="background-image: url('{{ asset('images/depanschool.png') }}');">
        <div class="absolute backdrop-blur-sm bg-white/30 p-10 rounded-xl w-full h-screen z-0"></div>
        <div class="flex flex-col items-center justify-center gap-5">
            <div class="logo z-10 absolute flex top-0 left-0 m-5 gap-3">
                <img src="{{ asset('images/bpmosis.png') }}" alt="Logo" class="w-17 h-17 z-1" data-aos="fade-up"
                    data-aos-delay="100">
                <img src="{{ asset('images/osismpk.png') }}" alt="Logo" class="w-16 h-16 z-1" data-aos="fade-up"
                    data-aos-delay="100">
            </div>
            <div class="design ">
                <div data-aos="zoom-in" data-aos-delay="200"
                    class="bg-red-800 rounded-full w-[120vw] h-[120vw] absolute top-[-20%] left-[-60%] z-0"></div>
            </div>
            <h1 class="text-6xl text-white font-bold z-1 leading-20 " data-aos="fade-up" data-aos-delay="100">Pemilihan
                <br> Ketua & Wakil <br> OSIS/MPK</h1>
            <hr class="z-1 relative left-12 w-full border-white bg-white" data-aos="fade-up" data-aos-delay="100">
            <p class=" relative left-12  text-md text-white z-1" data-aos="fade-up" data-aos-delay="100">Selamat datang
                di aplikasi pemilihan ketua OSIS & MPK
                SMK Bina Putra Mandiri. <br> Silahkan login untuk memilih calon ketua OSIS & MPK favoritmu!</p>
        </div>
        <div class="w-full form flex flex-col items-center justify-center gap-10 z-10 ">
            <div class="wrapper border-1 border-white p-4 rounded-xl bg-white/90 flex flex-col items-center w-1/2" data-aos="fade-up" data-aos-delay="100">
                <h1 class="text-4xl text-black font-bold mb-4" data-aos="fade-up">Login</h1>
                <form action="{{ url('/login') }}" method="post" autocomplete="off" class="w-full gap-5 flex flex-col ">
                    @csrf
                    <div class="input-group relative" data-aos="fade-up" data-aos-delay="50">
                        <i class="fas fa-user absolute right-3.5 top-3 text-red-600"></i>
                        <input class="w-full h-10 border-1 p-4 border-red-600 rounded-xl outline-0" readonly
                            onfocus="this.removeAttribute('readonly');" type="text" id="NIPD" name="username" value="{{ old('username') }}"
                            placeholder="Masukkan NIPD/NIP">
                    </div>
                    <div class="input-group relative" data-aos="fade-up" data-aos-delay="100">
                        <i id="togglePassword"
                            class="fas fa-eye absolute right-3.5 top-3.5 z-50 cursor-pointer text-red-600"></i>
                        <input class="w-full h-10 border-1 p-4  border-red-600 rounded-xl outline-0" type="password"
                            id="password" name="password" autocomplete="off" placeholder="Masukkan password">
                    </div>
                    <button class="bg-red-800 text-white py-2 px-4 rounded-xl hover:bg-red-700" type="submit"
                        data-aos="fade-up" data-aos-delay="150">Login</button>
                </form>
            </div>
        </div>
    </main>
</body>
<script src="{{ asset('js/index.js') }}"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true
    });
</script>

@if(session('info'))
<script>
    
        Swal.fire({
        title: '{{ session('info') }}',
        text: "Anda Sudah Vote Semua Kandidat, Terimakasih Sudah Voting!",
        icon: 'info',
        confirmButtonText: 'OK',
        confirmButtonColor: '#3085d6'
    });
   
</script>
@endif

@if(session('error'))
<script>
     Swal.fire({
        title: '{{ session('error') }}',
        text: "NIPD/NPWP atau password salah. Silahkan coba lagi.",
        icon: 'info',
        confirmButtonText: 'OK',
        confirmButtonColor: '#3085d6'
    });
</script>
@endif

</html>