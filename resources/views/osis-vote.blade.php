<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
     @vite(['resources/css/app.css', 'resources/js/app.js'])

    <title>Vote OSIS</title>
</head>

<body class="overflow-hidden">
    <main class="flex flex-col w-full gap-4">
        <div class="absolute backdrop-blur-sm  rounded-xl w-full h-screen z-0 flex justify-center items-center z-5">
        </div>
        <div
            class="absolute backdrop-blur-sm bg-red-400/30  rounded-xl w-full h-screen z-0 flex justify-center items-center">
            <img class="w-100 h-100" src="{{ asset('images/osis.png') }}" alt="" class="w-full h-full object-cover">
        </div>
        <header class="border-l-3 border-red-500 pl-4 py-5 mt-7 ml-8 z-10 relative bg-white w-fit p-2 rounded-xl "
            data-aos="fade-up" data-aos-delay="100">
            <p class="text-sm text-red-500">Voting OSIS <i class="fas fa-vote-yea"></i></p>
            <h1 class="text-2xl font-bold">Pilih Pasangan Calon</h1>
            <h2 class="text-sm text-gray-600">
                Pilih satu pasangan calon ketua & wakil ketua OSIS
            </h2>
        </header>
        <div class="kandidat flex justify-evenly items-center gap-4 z-10 relative mt-10">
            @foreach ($kandidat as $i)
                <div class="kandidat-1 w-60 h-84 border-1 bg-gradient-to-b from-red-500 via-red-200 to-red-100 border-black rounded-xl flex flex-col items-center gap-2 p-2 relative"
                    data-aos="fade-up">
                    <div
                        class="circle absolute w-10 h-10 rounded-full bg-red-300 -left-4 -top-4 flex justify-center items-center font-bold text-xl ">
                        0{{ $i->nomer_urut }} </div>
                    <div class="image-wrapper w-50 h-52 overflow-hidden rounded-lg border-1 border-black mt-2">
                        <img src="{{ $i->foto ? asset('kandidat_images/' . $i->foto) : asset('images/dummy2.png') }}" alt=""
                            class="w-full h-full object-cover object-top">
                    </div>
                    <div class="nama">
                        <h1 class="text-md text-center w-full font-bold">{{ $i->nama_ketua }}</h1>
                        <h2 class="text-sm text-center w-full font-bold">{{ $i->nama_wakil }}</h2>
                    </div>
                    <div class="button_card flex flex-col w-60 gap-3 px-4 mt-3 justify-evenly">
                        <form action="{{ url('voteosis') }}" class="vote-form flex-1" method="POST">
                            @csrf
                            <input type="hidden" name="id_kandidat" value="{{ $i->id_kandidat }}">

                            <button type="button"
                                class="open-modal bg-red-500 text-white w-full py-2 px-1 rounded-lg hover:bg-red-600 transition duration-600 cursor-pointer">
                                Konfirmasi Pilihan
                            </button>
                        </form>
                        <button id="lihatDetail"
                            class="  border-1 border-red-600 text-red-600 flex-2 py-1 rounded-lg hover:bg-green-600/10 transition duration-600 cursor-pointer"
                            data-id='{{ $i->id_kandidat }}' data-ketua='{{ $i->nama_ketua }}'
                            data-wakil='{{ $i->nama_wakil }}' data-visi='{{ $i->visi ?? "Belum ada visi" }}'
                            data-misi='{{ $i->misi ?? "Belum ada misi" }}'
                            data-foto="{{ $i->foto ? asset('images/' . $i->foto) : asset('images/dummy2.png') }}">
                            Liat Detail
                        </button>
                    </div>
                </div>
            @endforeach

        </div>


        <section id="infoLengkap"
            class="absolute top-0 left-0 w-full h-screen z-20 bg-white/90 flex items-center p-4 gap-5 scale-0 opacity-0 transition-all duration-500 origin-center">
            <div
                class="informasi-kandidat  ml-10 w-1/3 h-3/4 border border-black rounded-xl p-4 flex flex-col items-center gap-4 translate-y-10 opacity-0 transition-all duration-700 delay-200">
                <div class="image-wrapper w-64 h-80 overflow-hidden rounded-lg bg-white border border-black">
                    <img src="{{ asset('images/dummy2.png') }}" id="detailFoto"
                        class="w-full h-full object-cover object-top" alt="">
                </div>
                <div class="nama_kandidat flex flex-col items-left">
                    <p class="text-sm relative top-2">Ketua Osis :</p>
                    <h1 id="detailNamaKetua" class="text-xl font-bold"></h1>
                    <p class="mt-2 text-sm relative top-2">Wakil Ketua Osis :</p>
                    <h2 id="detailNamaWakil" class="text-lg font-bold"></h2>
                </div>
            </div>
            <div
                class="visi-misi flex flex-col mt-4 gap-8 translate-y-10 opacity-0 transition-all duration-700 delay-300">
                <div class="visi border-l-3 border-red-500 pl-4 py-3 bg-white rounded-xl">
                    <h2 class="text-xl font-bold mb-2">Visi</h2>
                    <p id="detailVisi" class="text-lg"></p>
                </div>
                <div class="misi border-l-3 border-red-500 pl-4 py-3 bg-white rounded-xl">
                    <h2 class="text-xl font-bold mb-2">Misi</h2>
                    <ul id="detailMisi" class="list-disc list-inside text-lg"></ul>
                </div>
                <div class="button flex gap-4 translate-y-10 opacity-0 transition-all duration-700 delay-500">
                    <form action="{{ url('voteosis') }}" class="vote-form flex-1" method="POST">
                        @csrf
                        <input type="hidden" name="id_kandidat" value="{{ $i->id_kandidat }}">

                        <button type="button"
                            class="open-modal bg-red-500 text-white w-full py-2 px-1 rounded-lg hover:bg-red-600 transition duration-600 cursor-pointer">
                            Konfirmasi Pilihan
                        </button>
                    </form>
                    <button id="tutupDetail" class="bg-gray-500 text-white py-2 px-4 rounded-lg hover:bg-gray-700">
                        Tutup
                    </button>
                    
                </div>
            </div>
        </section>
        <div class="button absolute top-4 right-4 flex gap-4 z-50">
            <button id="Kembali"
                class=" border-1 bg-red-500 text-white py-1 px-6 rounded-xl transition duration-300 ease-in-out cursor-pointer"
                data-aos="fade-left" data-aos-delay="100" onclick="window.location.href='{{ url('/osismpk') }}'">
                Kembali
            </button>
            <form action="{{ url('/logout') }}" method="GET">
                <button id="Logout" type="submit"
                    class="border-1 border-black text-black py-1 px-6 rounded-xl transition duration-300 ease-in-out cursor-pointer"
                    data-aos="fade-left" data-aos-delay="100">
                    Log out
                </button>
            </form>
        </div>
        <div id="voteModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">

            <div class="bg-white w-96 rounded-xl p-6 flex flex-col gap-4 text-center">
                <h1 class="text-xl font-bold">Konfirmasi Pilihan</h1>
                <p class="text-gray-600">Apakah kamu yakin ingin memilih kandidat ini?</p>

                <div class="flex gap-4 justify-center mt-4">
                    <button id="btnYakin" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
                        Yakin
                    </button>
                    <button id="btnTidak" class="bg-gray-400 text-white px-4 py-2 rounded-lg hover:bg-gray-500">
                        Belum Yakin
                    </button>

                    
                </div>
            </div>
        </div>
        <footer class="w-full absolute bottom-0 left-0 py-2 text-center text-xs text-gray-700 cursor-pointer">
            © 2026 Muhammad Farel Andriani
        </footer>

</body>

<script src="{{ asset('js/vote.js') }}"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    AOS.init({
        duration: 1000,
        once: true
    });
</script>

</html>