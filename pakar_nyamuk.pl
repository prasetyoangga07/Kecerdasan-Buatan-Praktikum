% Gejala Penyakit Akibat Gigitan Nyamuk
:- dynamic gejala_pos/1.
:- dynamic gejala_neg/1.

% Penyakit yang Terhubung dengan Gigitan Nyamuk
penyakit(malaria).
penyakit(dbd).
penyakit(zika).
penyakit(filariasis).

% Gejala untuk Malaria
gejala(demam, "malaria").
gejala(nyeri_sendi, "malaria").
gejala(ruam_kulit, "malaria").

% Gejala untuk DBD
gejala(demam, "dbd").
gejala(pendarahan_gusi, "dbd").
gejala(kelelahan, "dbd").

% Gejala untuk Zika
gejala(demam, "zika").
gejala(ruam_kulit, "zika").
gejala(sakit_kepala, "zika").

% Gejala untuk Filariasis
gejala(nyeri_sendi, "filariasis").
gejala(kelelahan, "filariasis").
gejala(sakit_kepala, "filariasis").

% Pertanyaan kepada pengguna
pertanyaan(demam, Y) :- Y = "Apakah Anda mengalami demam?".
pertanyaan(nyeri_sendi, Y) :- Y = "Apakah Anda merasa nyeri pada sendi?".
pertanyaan(ruam_kulit, Y) :- Y = "Apakah Anda mengalami ruam kulit?".
pertanyaan(pendarahan_gusi, Y) :- Y = "Apakah Anda mengalami pendarahan gusi?".
pertanyaan(kelelahan, Y) :- Y = "Apakah Anda merasa sangat lelah?".
pertanyaan(sakit_kepala, Y) :- Y = "Apakah Anda merasa sakit kepala?".

% Fungsi Diagnosa
diagnosa(G) :- 
    pertanyaan(G, P), 
    write(P), writeln(" (y/t)"),
    read(Jawaban),
    (Jawaban == y -> assertz(gejala_pos(G)); assertz(gejala_neg(G))).

% Penyakit yang terdeteksi berdasarkan gejala
penyakit(malaria) :- 
    gejala(demam, "malaria"),
    gejala(nyeri_sendi, "malaria"),
    gejala(ruam_kulit, "malaria"),
    writeln("Anda terdeteksi terkena Malaria.").

penyakit(dbd) :- 
    gejala(demam, "dbd"),
    gejala(pendarahan_gusi, "dbd"),
    gejala(kelelahan, "dbd"),
    writeln("Anda terdeteksi terkena Demam Berdarah (DBD).").

penyakit(zika) :- 
    gejala(demam, "zika"),
    gejala(ruam_kulit, "zika"),
    gejala(sakit_kepala, "zika"),
    writeln("Anda terdeteksi terkena Zika Virus.").

penyakit(filariasis) :- 
    gejala(nyeri_sendi, "filariasis"),
    gejala(kelelahan, "filariasis"),
    gejala(sakit_kepala, "filariasis"),
    writeln("Anda terdeteksi terkena Filariasis.").

penyakit(_) :- 
    writeln("Tidak terdeteksi penyakit terkait gigitan nyamuk.").

% Fungsi utama untuk diagnosa
main :- 
    writeln("Sistem Pakar Diagnosa Penyakit Akibat Gigitan Nyamuk"),
    repeat, 
    diagnosa(_), 
    writeln("Apakah ingin mengulang? (y/t)"),
    read(Ulang),
    (Ulang == t -> ! ; true).

% Menjalankan main
:- main.
