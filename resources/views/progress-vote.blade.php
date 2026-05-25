<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Hasil Vote</title>
</head>

<body class="scroll-bar-none">
    @php
        $top_osis_periode = $kandidat_osis_periode->first();
        $top_mpk_periode = $kandidat_mpk_periode->first();
        $others_osis_periode = $kandidat_osis_periode->skip(1);
        $others_mpk_periode  = $kandidat_mpk_periode->skip(1);
        $total_osis = $kandidat_osis->sum('total_vote');
        $total_mpk = $kandidat_mpk->sum('total_vote');
        $colors_osis = ['#ef4444', '#f97316', '#eab308', '#22c55e', '#3b82f6'];
        $colors_mpk = ['#22c55e', '#10b981', '#84cc16', '#06b6d4', '#6366f1'];
        $circumference = 2 * 3.14159 * 38;
        $max_osis = $kandidat_osis->max('total_vote') ?: 1;
        $max_mpk = $kandidat_mpk->max('total_vote') ?: 1;
        $max_bar_height = 100;
    @endphp

    <main class="flex flex-col w-full gap-4">
        <div class="fixed backdrop-blur-sm rounded-xl w-full h-screen z-0 flex justify-center items-center">
            <img class="w-100 h-100" src="{{ asset('images/osismpk.png') }}" alt="" class="w-full h-full object-cover">
        </div>
        <div class="absolute backdrop-blur-sm bg-white/30 rounded-xl w-full h-[200vh] z-0"></div>

        <section class="hero flex flex-col h-screen gap-4 p-4">
            <div class="bg-white/30 backdrop-blur-sm rounded-xl text-center">
                <p class="text-xs font-bold text-gray-700 tracking-widest uppercase">Voting Periode {{ $kandidat_osis->first()->periode }} </p>
            </div>
            <div class="osis h-[100%] relative flex-1 flex backdrop-blur-sm rounded-xl gap-5 z-10"
                data-aos="fade-right">
                <div class="flex items-center bg-red-400/30 px-2 rounded-l-xl">
                    <span class="text-red-700 font-bold text-sm"
                        style="writing-mode: vertical-rl; text-orientation: mixed; letter-spacing: 4px;">
                        O S I S
                    </span>
                </div>
                <div class="card other flex-3 flex gap-3 bg-red-400/30 p-2 rounded-xl justify-center" id="cards-osis">
                    @foreach ($kandidat_osis as $osis)
                        <div class="backdrop-blur-sm rounded-lg w-[80%] flex flex-col items-center gap-1 p-1.5 relative">
                            <div class="circle absolute w-10 h-10 rounded-full bg-red-300 -left-4 -top-4 flex justify-center items-center font-bold text-xl ">
                                <p class="text-xs font-bold text-red-600">0{{ $osis->nomer_urut }}</p>
                            </div>
                            <div class="image-wrapper w-full h-42 overflow-hidden rounded-md border-1 border-black">
                                <img src="{{ $osis->foto ? asset('kandidat_images/' . $osis->foto) : asset('images/dummy2.png') }}"
                                    alt="" class="w-full h-full object-cover object-top">
                            </div>
                            <div class="text w-full">
                                <div class="nama bg-white rounded-md w-full px-1 py-0.5 text-red-600">
                                    <h1 class="text-xs text-center font-bold">{{ $osis->nama_ketua }}</h1>
                                    <h2 class="text-xs text-center">{{ $osis->nama_wakil }}</h2>
                                </div>
                                <div class="flex gap-2 mt-1">
                                    <div class="bg-white rounded-md flex-1 p-1 text-red-600">
                                        <p class="text-xs text-center font-bold" id="vote-osis-{{ $osis->id_kandidat }}">
                                            {{ $osis->total_vote }} votes</p>
                                    </div>
                                    <div class="bg-white rounded-md flex-1 p-1 text-red-600">
                                        <p class="text-xs text-center font-bold" id="pct-osis-{{ $osis->id_kandidat }}">
                                            {{ $osis->persentase }}%</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="statistika flex-1 flex flex-col gap-2 p-2">
                    <div class="bg-white/30 backdrop-blur-sm rounded-xl p-2 text-center">
                        <p class="text-xs font-bold text-gray-700 tracking-widest uppercase">Statistika OSIS</p>
                    </div>
                    <div
                        class="flex-1 bg-red-500/20 backdrop-blur-sm rounded-xl p-3 flex flex-col items-center justify-center gap-2">
                        <div class="relative w-32 h-32">
                            <svg id="donut-osis" viewBox="0 0 100 100" class="w-full h-full -rotate-90">
                                <circle cx="50" cy="50" r="38" fill="none" stroke="rgba(255,255,255,0.3)"
                                    stroke-width="12" />
                                @foreach($kandidat_osis as $idx => $o)
                                    @php
                                        $pct = $total_osis > 0 ? ($o->total_vote / $total_osis) * 100 : 0;
                                        $dash = ($pct / 100) * $circumference;
                                        $off = $circumference - ($kandidat_osis->take($idx)->sum(fn($x) => $total_osis > 0 ? ($x->total_vote / $total_osis) * $circumference : 0));
                                    @endphp
                                    <circle class="segment" cx="50" cy="50" r="38" fill="none"
                                        stroke="{{ $colors_osis[$idx % count($colors_osis)] }}" stroke-width="12"
                                        stroke-dasharray="{{ $dash }} {{ $circumference - $dash }}"
                                        stroke-dashoffset="{{ $off }}" data-id="{{ $o->id_kandidat }}" />
                                @endforeach
                            </svg>
                            <div class="absolute inset-0 flex flex-col items-center justify-center">
                                <p class="text-lg font-bold text-red-700" id="total-osis">{{ $total_osis }}</p>
                                <p class="text-xs text-red-500">suara</p>
                            </div>
                        </div>
                        <div id="legend-osis" class="w-full flex flex-col gap-1">
                            @foreach($kandidat_osis as $idx => $o)
                                <div class="flex items-center gap-1 w-full">
                                    <div class="w-2 h-2 rounded-full flex-shrink-0"
                                        style="background: {{ $colors_osis[$idx % count($colors_osis)] }}"></div>
                                    <p class="text-xs text-gray-700 truncate flex-1">{{ $o->nama_ketua }}</p>
                                    <p class="text-xs font-bold text-gray-700" id="leg-osis-{{ $o->id_kandidat }}">
                                        {{ $o->persentase }}%</p>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>

            <div class="mpk h-[100%] relative flex-1 flex backdrop-blur-sm rounded-xl gap-5 z-10" data-aos="fade-right">
                <div class="flex items-center bg-green-400/30 px-2 rounded-l-xl">
                    <span class="text-green-700 font-bold text-sm"
                        style="writing-mode: vertical-rl; text-orientation: mixed; letter-spacing: 4px;">
                        M P K
                    </span>
                </div>
                <div class="card other flex-3 flex gap-3 bg-green-400/30 p-2 rounded-xl justify-center" id="cards-mpk">
                    @foreach ($kandidat_mpk as $mpk)
                        <div class="backdrop-blur-sm rounded-lg w-[80%] flex flex-col items-center gap-1 p-1.5 relative">
                            <div class="image-wrapper w-full h-42 overflow-hidden rounded-md border-1 border-black">
                                <img src="{{ $mpk->foto ? asset('kandidat_images/' . $mpk->foto) : asset('images/dummy2.png') }}"
                                    alt="" class="w-full h-full object-cover object-top">
                            </div>
                            <div class="text w-full">
                                <div class="nama bg-white rounded-md w-full px-1 py-0.5 text-green-600">
                                    <h1 class="text-xs text-center font-bold">{{ $mpk->nama_ketua }}</h1>
                                    <h2 class="text-xs text-center">{{ $mpk->nama_wakil }}</h2>
                                </div>
                                <div class="flex gap-2 mt-1">
                                    <div class="bg-white rounded-md flex-1 p-1 text-green-600">
                                        <p class="text-xs text-center font-bold" id="vote-mpk-{{ $mpk->id_kandidat }}">
                                            {{ $mpk->total_vote }} votes</p>
                                    </div>
                                    <div class="bg-white rounded-md flex-1 p-1 text-green-600">
                                        <p class="text-xs text-center font-bold" id="pct-mpk-{{ $mpk->id_kandidat }}">
                                            {{ $mpk->persentase }}%</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="statistika flex-1 flex flex-col gap-2 p-2">
                    <div class="bg-white/30 backdrop-blur-sm rounded-xl p-2 text-center">
                        <p class="text-xs font-bold text-gray-700 tracking-widest uppercase">Statistika MPK</p>
                    </div>
                    <div
                        class="flex-1 bg-green-500/20 backdrop-blur-sm rounded-xl p-3 flex flex-col items-center justify-center gap-2">
                        <div class="relative w-32 h-32">
                            <svg id="donut-mpk" viewBox="0 0 100 100" class="w-full h-full -rotate-90">
                                <circle cx="50" cy="50" r="38" fill="none" stroke="rgba(255,255,255,0.3)"
                                    stroke-width="12" />
                                @foreach($kandidat_mpk as $idx => $m)
                                    @php
                                        $pct = $total_mpk > 0 ? ($m->total_vote / $total_mpk) * 100 : 0;
                                        $dash = ($pct / 100) * $circumference;
                                        $off = $circumference - ($kandidat_mpk->take($idx)->sum(fn($x) => $total_mpk > 0 ? ($x->total_vote / $total_mpk) * $circumference : 0));
                                    @endphp
                                    <circle class="segment" cx="50" cy="50" r="38" fill="none"
                                        stroke="{{ $colors_mpk[$idx % count($colors_mpk)] }}" stroke-width="12"
                                        stroke-dasharray="{{ $dash }} {{ $circumference - $dash }}"
                                        stroke-dashoffset="{{ $off }}" data-id="{{ $m->id_kandidat }}" />
                                @endforeach
                            </svg>
                            <div class="absolute inset-0 flex flex-col items-center justify-center">
                                <p class="text-lg font-bold text-green-700" id="total-mpk">{{ $total_mpk }}</p>
                                <p class="text-xs text-green-500">suara</p>
                            </div>
                        </div>
                        <div id="legend-mpk" class="w-full flex flex-col gap-1">
                            @foreach($kandidat_mpk as $idx => $m)
                                <div class="flex items-center gap-1 w-full">
                                    <div class="w-2 h-2 rounded-full flex-shrink-0"
                                        style="background: {{ $colors_mpk[$idx % count($colors_mpk)] }}"></div>
                                    <p class="text-xs text-gray-700 truncate flex-1">{{ $m->nama_ketua }}</p>
                                    <p class="text-xs font-bold text-gray-700" id="leg-mpk-{{ $m->id_kandidat }}">
                                        {{ $m->persentase }}%</p>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </section>

 <section class="kanditat-all-periode w-full h-screen flex flex-col gap-4 p-4 z-10">
    <div class="bg-white/30 backdrop-blur-sm rounded-xl p-2 text-center">
        <p class="text-xs font-bold text-gray-700 tracking-widest uppercase">Seluruh Voting Periode</p>
    </div>

@foreach ($kandidat_osis_periode as $periode_id => $osis_group)

@php
    $osis_group = collect($osis_group);
    $mpk_group = collect($kandidat_mpk_periode->get($periode_id) ?? []);

    $top_osis_periode = $osis_group->first();
    $others_osis_periode = $osis_group->skip(1);

    $top_mpk_periode = $mpk_group->first();
    $others_mpk_periode = $mpk_group->skip(1);
@endphp

<div class="periode-wrapper w-full flex gap-2">

    <div class="osis flex-2 flex">
        <div class="other w-full">
            <div class="card flex justify-between items-end p-0.5 h-full">

                @foreach ($others_osis_periode as $osis)
                    <div class="backdrop-blur-sm rounded-lg w-[30%] h-36 bg-red-400/60 flex flex-col items-center gap-1 p-1.5 relative">
                        <div class="image-wrapper w-full overflow-hidden rounded-md border-1 border-black">
                            <img src="{{ $osis->foto ? asset('kandidat_images/' . $osis->foto) : asset('images/dummy2.png') }}" class="w-full h-full object-cover object-top">
                        </div>
                        <div class="text w-full">
                            <div class="nama bg-white rounded-md w-full px-1 py-0.5 text-red-600">
                                <h1 class="text-[0.5rem] text-center font-bold">{{ $osis->nama_ketua }}</h1>
                                <h2 class="text-[0.5rem] text-center">{{ $osis->nama_wakil }}</h2>
                            </div>
                            <div class="flex gap-2 mt-1">
                                <div class="bg-white rounded-md flex-1 p-1 text-red-600">
                                    <p class="text-[0.6rem] text-center font-bold">{{ $osis->total_vote }} votes</p>
                                </div>
                                <div class="bg-white rounded-md flex-1 p-1 text-red-600">
                                    <p class="text-[0.6rem] text-center font-bold">{{ $osis->persentase }}%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

                @if($top_osis_periode)
                    <div class="card bg-red-600 backdrop-blur-sm rounded-xl w-[35%] h-40 flex flex-col items-center gap-1 p-1.5 relative">
                        <div class="image-wrapper w-full h-42 overflow-hidden rounded-lg border-1 border-black">
                            <img src="{{ $top_osis_periode->foto ? asset('kandidat_images/' . $top_osis_periode->foto) : asset('images/dummy2.png') }}" class="w-full h-full object-cover object-top">
                        </div>
                        <div class="text w-full">
                            <div class="nama shadow-lg bg-white rounded-lg w-full px-1 py-0.5 text-red-600">
                                <h1 class="text-[0.5rem] text-center w-full font-bold">{{ $top_osis_periode->nama_ketua }}</h1>
                                <h2 class="text-[0.6rem] text-center w-full">{{ $top_osis_periode->nama_wakil }}</h2>
                            </div>
                            <div class="flex gap-2 mt-1">
                                <div class="shadow-lg flex-1 bg-white rounded-lg p-1 text-red-600">
                                    <p class="text-[0.6rem] text-center w-full font-bold">{{ $top_osis_periode->total_vote }} Votes</p>
                                </div>
                                <div class="shadow-lg flex-1 bg-white rounded-lg p-1 text-red-600">
                                    <p class="text-[0.6rem] text-center w-full font-bold">{{ $top_osis_periode->persentase }}%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif

            </div>
        </div>
    </div>

    <div class="statistika flex-1 flex flex-col gap-2 p-2 bg-white/20 backdrop-blur-sm rounded-xl">
        <h1 class="text-center text-xs font-bold text-gray-700 uppercase tracking-widest">
            Periode {{ $osis_group->first()->tahun_ajar }}
        </h1>
    <div class="flex gap-2 flex-1">

        <div class="flex-1 flex flex-col">
            <p class="text-[0.5rem] font-bold text-red-700 uppercase tracking-widest mb-1 text-center">OSIS</p>

            <div class="flex items-end justify-around gap-1 flex-1">
                    @foreach ($osis_group->sortBy('total_vote') as $osis)                    
                    @php
                        $barH = round(($osis->total_vote / ($osis_group->max('total_vote') ?: 1)) * 80);
                    @endphp

                    <div class="flex flex-col items-center gap-0.5 flex-1">
                        <p class="text-red-500 text-[0.45rem] font-bold">{{ $osis->persentase }}%</p>

                        <div class="bg-red-400 w-full rounded-t-sm flex items-start justify-center pt-0.5"
                             style="height: {{ $barH }}px;">
                            <span class="text-white text-[0.4rem] font-bold">
                                {{ $osis->total_vote }}
                            </span>
                        </div>

                        <p class="text-[0.4rem] text-gray-700 text-center">
                            {{ $osis->nama_ketua }}
                        </p>
                    </div>
                @endforeach
            </div>
        </div>

        <div class="flex-1 flex flex-col">
            <p class="text-[0.5rem] font-bold text-green-700 uppercase tracking-widest mb-1 text-center">MPK</p>

            <div class="flex items-end justify-around gap-1 flex-1">
                @foreach ($mpk_group->sortByDesc('total_vote') as $mpk)
                    @php
                        $barH = round(($mpk->total_vote / ($mpk_group->max('total_vote') ?: 1)) * 80);
                    @endphp

                    <div class="flex flex-col items-center gap-0.5 flex-1">
                        <p class="text-green-500 text-[0.45rem] font-bold">{{ $mpk->persentase }}%</p>

                        <div class="bg-green-400 w-full rounded-t-sm flex items-start justify-center pt-0.5"
                             style="height: {{ $barH }}px;">
                            <span class="text-white text-[0.4rem] font-bold">
                                {{ $mpk->total_vote }}
                            </span>
                        </div>

                        <p class="text-[0.4rem] text-gray-700 text-center">
                            {{ $mpk->nama_ketua }}
                        </p>
                    </div>
                @endforeach
            </div>
        </div>

    </div>
</div>

    <div class="mpk flex-2 flex">
        <div class="other w-full">
            <div class="card flex justify-between items-end p-0.5 h-full">

                @if($top_mpk_periode)
                    <div class="card bg-green-600 backdrop-blur-sm rounded-xl w-[35%] h-40 flex flex-col items-center gap-1 p-1.5 relative">
                        <div class="image-wrapper w-full h-42 overflow-hidden rounded-lg border-1 border-black">
                            <img src="{{ $top_mpk_periode->foto ? asset('kandidat_images/' . $top_mpk_periode->foto) : asset('images/dummy2.png') }}" class="w-full h-full object-cover object-top">
                        </div>
                        <div class="text w-full">
                            <div class="nama shadow-lg bg-white rounded-lg w-full px-1 py-0.5 text-green-600">
                                <h1 class="text-[0.6rem] text-center w-full font-bold">{{ $top_mpk_periode->nama_ketua }}</h1>
                                <h2 class="text-[0.6rem] text-center w-full">{{ $top_mpk_periode->nama_wakil }}</h2>
                            </div>
                            <div class="flex gap-2 mt-1">
                                <div class="shadow-lg flex-1 bg-white rounded-lg p-1 text-green-600">
                                    <p class="text-[0.6rem] text-center w-full font-bold">{{ $top_mpk_periode->total_vote }} Votes</p>
                                </div>
                                <div class="shadow-lg flex-1 bg-white rounded-lg p-1 text-green-600">
                                    <p class="text-[0.6rem] text-center w-full font-bold">{{ $top_mpk_periode->persentase }}%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif

                @foreach ($others_mpk_periode as $mpk)
                    <div class="backdrop-blur-sm rounded-lg w-[30%] h-36 bg-green-400/60 flex flex-col items-center gap-1 p-1.5 relative">
                        <div class="image-wrapper w-full overflow-hidden rounded-md border-1 border-black">
                            <img src="{{ $mpk->foto ? asset('kandidat_images/' . $mpk->foto) : asset('images/dummy2.png') }}" class="w-full h-full object-cover object-top">
                        </div>
                        <div class="text w-full">
                            <div class="nama bg-white rounded-md w-full px-1 py-0.5 text-green-600">
                                <h1 class="text-[0.5rem] text-center font-bold">{{ $mpk->nama_ketua }}</h1>
                                <h2 class="text-[0.5rem] text-center">{{ $mpk->nama_wakil }}</h2>
                            </div>
                            <div class="flex gap-2 mt-1">
                                <div class="bg-white rounded-md flex-1 p-1 text-green-600">
                                    <p class="text-[0.6rem] text-center font-bold">{{ $mpk->total_vote }} votes</p>
                                </div>
                                <div class="bg-white rounded-md flex-1 p-1 text-green-600">
                                    <p class="text-[0.6rem] text-center font-bold">{{ $mpk->persentase }}%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

            </div>
        </div>
    </div>

</div>

@endforeach

</section>
    </main>

    <footer class="w-full absolute bottom-0 left-0 py-2 text-center text-xs text-gray-700 cursor-pointer">
        © 2026 Muhammad Farel Andriani &nbsp;·&nbsp; Update posisi dalam <span id="countdown">5</span>s
    </footer>
    
    <script src="{{ asset('js/hasil-vote.js') }}"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 1000, once: true });
    </script>
</body>

</html>