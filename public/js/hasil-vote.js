
const circumference = 2 * Math.PI * 38;

function updateDonut(svgId, data, totalId) {
    const svg = document.getElementById(svgId);
    if (!svg) return;
    const segments = svg.querySelectorAll('circle.segment');
    const total = data.reduce((s, x) => s + x.total_vote, 0);
    let usedDash = 0;
    segments.forEach((circle, i) => {
        const item = data[i];
        if (!item) return;
        const pct = total > 0 ? (item.total_vote / total) * 100 : 0;
        const dash = (pct / 100) * circumference;
        const offset = circumference - usedDash;
        circle.setAttribute('stroke-dasharray', `${dash} ${circumference - dash}`);
        circle.setAttribute('stroke-dashoffset', offset);
        usedDash += dash;
    });
    const totalEl = document.getElementById(totalId);
    if (totalEl) totalEl.textContent = total;
}

function updateAngka(data) {
    data.osis.forEach(o => {
        const vEl = document.getElementById(`vote-osis-${o.id_kandidat}`);
        const pEl = document.getElementById(`pct-osis-${o.id_kandidat}`);
        const lEl = document.getElementById(`leg-osis-${o.id_kandidat}`);
        if (vEl) vEl.textContent = vEl.textContent.startsWith('Votes') ? `Votes : ${o.total_vote}` : `${o.total_vote} votes`;
        if (pEl) pEl.textContent = `${o.persentase}%`;
        if (lEl) lEl.textContent = `${o.persentase}%`;
    });
    updateDonut('donut-osis', data.osis, 'total-osis');

    data.mpk.forEach(m => {
        const vEl = document.getElementById(`vote-mpk-${m.id_kandidat}`);
        const pEl = document.getElementById(`pct-mpk-${m.id_kandidat}`);
        const lEl = document.getElementById(`leg-mpk-${m.id_kandidat}`);
        if (vEl) vEl.textContent = vEl.textContent.startsWith('Votes') ? `Votes : ${m.total_vote}` : `${m.total_vote} votes`;
        if (pEl) pEl.textContent = `${m.persentase}%`;
        if (lEl) lEl.textContent = `${m.persentase}%`;
    });
    updateDonut('donut-mpk', data.mpk, 'total-mpk');
}

function updateUrutan(data) {
    renderSection(
        data.osis,
        'osis',
        'red',
        ['#ef4444', '#f97316', '#eab308', '#22c55e', '#3b82f6']
    );
    renderSection(
        data.mpk,
        'mpk',
        'green',
        ['#22c55e', '#10b981', '#84cc16', '#06b6d4', '#6366f1']
    );
}

function renderSection(kandidat, type, color, colors) {
    const container = document.getElementById(`cards-${type}`);
    if (!container) return;

    // Urutkan dari terbanyak
    const sorted = [...kandidat].sort((a, b) => b.total_vote - a.total_vote);
    const top    = sorted[0];
    const others = sorted.slice(1);

    let html = '';

    // Others
    others.forEach(k => {
        html += `
        <div class="backdrop-blur-sm rounded-lg w-[80%] flex flex-col items-center gap-1 p-1.5 relative">
            <div class="image-wrapper w-full h-42 overflow-hidden rounded-md border-1 border-black">
                <img src="${k.foto ? '/kandidat_images/' + k.foto : '/images/dummy2.png'}"
                    class="w-full h-full object-cover object-top">
            </div>
            <div class="text w-full">
                <div class="nama bg-white rounded-md w-full px-1 py-0.5 text-${color}-600">
                    <h1 class="text-xs text-center font-bold">${k.nama_ketua}</h1>
                    <h2 class="text-xs text-center">${k.nama_wakil}</h2>
                </div>
                <div class="flex gap-2 mt-1">
                    <div class="bg-white rounded-md flex-1 p-1 text-${color}-600">
                        <p class="text-xs text-center font-bold" id="vote-${type}-${k.id_kandidat}">${k.total_vote} votes</p>
                    </div>
                    <div class="bg-white rounded-md flex-1 p-1 text-${color}-600">
                        <p class="text-xs text-center font-bold" id="pct-${type}-${k.id_kandidat}">${k.persentase}%</p>
                    </div>
                </div>
            </div>
        </div>`;
    });

    // Top
    if (top) {
        html += `
        <div class="card bg-${color}-600 backdrop-blur-sm rounded-xl w-[80%] flex flex-col items-center gap-1 p-1.5 relative">
            <div class="image-wrapper w-full h-42 overflow-hidden rounded-lg border-1 border-black">
                <img src="${top.foto ? '/kandidat_images/' + top.foto : '/images/dummy2.png'}"
                    class="w-full h-full object-cover object-top">
            </div>
            <div class="text w-full">
                <div class="nama shadow-lg bg-white rounded-lg w-full px-1 py-0.5 text-${color}-600">
                    <h1 class="text-xs text-center w-full font-bold">${top.nama_ketua}</h1>
                    <h2 class="text-xs text-center w-full">${top.nama_wakil}</h2>
                </div>
                <div class="flex gap-2 mt-1">
                    <div class="shadow-lg flex-1 bg-white rounded-lg p-1 text-${color}-600">
                        <p class="text-xs text-center w-full font-bold" id="vote-${type}-${top.id_kandidat}">Votes : ${top.total_vote}</p>
                    </div>
                    <div class="shadow-lg flex-1 bg-white rounded-lg p-1 text-${color}-600">
                        <p class="text-xs text-center w-full font-bold" id="pct-${type}-${top.id_kandidat}">${top.persentase}%</p>
                    </div>
                </div>
            </div>
        </div>`;
    }

    container.innerHTML = html;

    // Update legend donut
    const legend = document.getElementById(`legend-${type}`);
    if (legend) {
        legend.innerHTML = sorted.map((k, i) => `
            <div class="flex items-center gap-1 w-full">
                <div class="w-2 h-2 rounded-full flex-shrink-0" style="background: ${colors[i % colors.length]}"></div>
                <p class="text-xs text-gray-700 truncate flex-1">${k.nama_ketua}</p>
                <p class="text-xs font-bold text-gray-700" id="leg-${type}-${k.id_kandidat}">${k.persentase}%</p>
            </div>
        `).join('');
    }
}

// Fetch data
function fetchData(callback) {
    fetch('/vote-data')
        .then(r => r.json())
        .then(data => callback(data))
        .catch(err => console.error('Fetch error:', err));
}

setInterval(() => fetchData(updateAngka), 1000);

setInterval(() => fetchData(updateUrutan), 3000);

// Countdown display
let sisa = 5;
const countdownEl = document.getElementById('countdown');
setInterval(() => {
    sisa--;
    if (sisa < 0) sisa = 5;
    if (countdownEl) countdownEl.textContent = sisa;
}, 1000);