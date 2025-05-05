% GEJALA PENYAKIT AKIBAT GIGITAN NYAMUK
% DATABASE
:- dynamic gejala_pos/1.
:- dynamic gejala_neg/1.

% FAKTA & ATURAN
penyakit("malaria").
penyakit("dbd").
penyakit("zika").
penyakit("filariasis").

gejala(demam, "malaria").
gejala(nyeri_sendi, "malaria").
gejala(ruam_kulit, "malaria").
gejala(demam, "dbd").
gejala(pendarahan_gusi, "dbd").
gejala(kelelahan, "dbd").
gejala(demam, "zika").
gejala(ruam_kulit, "zika").
gejala(sakit_kepala, "zika").
gejala(nyeri_sendi, "filariasis").
gejala(kelelahan, "filariasis").
gejala(sakit_kepala, "filariasis").

pertanyaan(demam, Y) :- 
    Y = "Apakah Anda mengalami demam?".
pertanyaan(nyeri_sendi, Y) :- 
    Y = "Apakah Anda merasa nyeri pada sendi?".
pertanyaan(ruam_kulit, Y) :- 
    Y = "Apakah Anda mengalami ruam kulit?".
pertanyaan(pendarahan_gusi, Y) :- 
    Y = "Apakah Anda mengalami pendarahan gusi?".
pertanyaan(kelelahan, Y) :- 
    Y = "Apakah Anda merasa sangat lelah?".
pertanyaan(sakit_kepala, Y) :- 
    Y = "Apakah Anda merasa sakit kepala?".
