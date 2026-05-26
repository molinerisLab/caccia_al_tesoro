#!/bin/bash

# ================================================================
# CACCIA AL TESORO — Navigazione del Filesystem in Bash
# Tema: compartimenti cellulari e sub-cellulari
# ================================================================

# Il path base viene calcolato al momento dell'esecuzione.
# Modifica questa riga se vuoi generare l'albero altrove:
BASE="$(pwd)/cellula"

echo "================================================================"
echo " CACCIA AL TESORO — Setup"
echo " L'albero verrà generato in:"
echo " $BASE"
echo "================================================================"
echo ""

# Controlla se esiste già
if [ -d "$BASE" ]; then
  echo "ATTENZIONE: la directory '$BASE' esiste già."
  read -p "Vuoi sovrascriverla? [s/N] " risposta
  if [[ "$risposta" != "s" && "$risposta" != "S" ]]; then
    echo "Operazione annullata."
    exit 0
  fi
  rm -rf "$BASE"
fi

# ================================================================
# CREAZIONE DELL'ALBERO DI DIRECTORY
# ================================================================

mkdir -p \
  "$BASE" \
  \
  "$BASE/membrana_plasmatica" \
  "$BASE/membrana_plasmatica/canali_ionici" \
  "$BASE/membrana_plasmatica/lipid_rafts" \
  "$BASE/membrana_plasmatica/recettori" \
  "$BASE/membrana_plasmatica/recettori/gpcr" \
  "$BASE/membrana_plasmatica/recettori/tirosina_chinasi" \
  "$BASE/membrana_plasmatica/esocitosi" \
  \
  "$BASE/citoplasma" \
  "$BASE/citoplasma/inclusioni" \
  "$BASE/citoplasma/vescicole_secretorie" \
  "$BASE/citoplasma/citoscheletro" \
  "$BASE/citoplasma/citoscheletro/actina" \
  "$BASE/citoplasma/citoscheletro/microtubuli" \
  "$BASE/citoplasma/citoscheletro/filamenti_intermedi" \
  "$BASE/citoplasma/ribosomi" \
  "$BASE/citoplasma/ribosomi/liberi" \
  "$BASE/citoplasma/ribosomi/legati" \
  "$BASE/citoplasma/mitocondrio" \
  "$BASE/citoplasma/mitocondrio/membrana_esterna" \
  "$BASE/citoplasma/mitocondrio/spazio_intermembrana" \
  "$BASE/citoplasma/mitocondrio/membrana_interna" \
  "$BASE/citoplasma/mitocondrio/membrana_interna/creste" \
  "$BASE/citoplasma/mitocondrio/matrice" \
  "$BASE/citoplasma/mitocondrio/matrice/dna_mitocondriale" \
  "$BASE/citoplasma/reticolo_endoplasmatico" \
  "$BASE/citoplasma/reticolo_endoplasmatico/rugoso" \
  "$BASE/citoplasma/reticolo_endoplasmatico/rugoso/cisterne" \
  "$BASE/citoplasma/reticolo_endoplasmatico/liscio" \
  "$BASE/citoplasma/reticolo_endoplasmatico/liscio/tubuli" \
  "$BASE/citoplasma/apparato_golgi" \
  "$BASE/citoplasma/apparato_golgi/cis" \
  "$BASE/citoplasma/apparato_golgi/cis/rete_cis" \
  "$BASE/citoplasma/apparato_golgi/mediale" \
  "$BASE/citoplasma/apparato_golgi/trans" \
  "$BASE/citoplasma/apparato_golgi/trans/rete_trans" \
  "$BASE/citoplasma/lisosomi" \
  "$BASE/citoplasma/lisosomi/primari" \
  "$BASE/citoplasma/lisosomi/secondari" \
  "$BASE/citoplasma/perossisomi" \
  "$BASE/citoplasma/vacuoli" \
  "$BASE/citoplasma/centrosoma" \
  "$BASE/citoplasma/centrosoma/centriolo_madre" \
  "$BASE/citoplasma/centrosoma/centriolo_figlio" \
  \
  "$BASE/nucleo" \
  "$BASE/nucleo/membrana_nucleare" \
  "$BASE/nucleo/membrana_nucleare/pori_nucleari" \
  "$BASE/nucleo/membrana_nucleare/lamina" \
  "$BASE/nucleo/nucleolo" \
  "$BASE/nucleo/nucleolo/regione_fibrillare" \
  "$BASE/nucleo/nucleolo/regione_granulare" \
  "$BASE/nucleo/cromatina" \
  "$BASE/nucleo/cromatina/eterocromatina" \
  "$BASE/nucleo/cromatina/eucromatina"

echo "✓ Directory create."

# ================================================================
# README INIZIALE — MISSIONE
# ================================================================

cat > "$BASE/README" << 'EOF'
╔══════════════════════════════════════════════════════════════════╗
║                      ⚠ ALLARME CELLULARE ⚠                     ║
╚══════════════════════════════════════════════════════════════════╝

Segnale extracellulare rilevato: EGF — Epidermal Growth Factor.

L'ambiente esterno comunica che è necessario attivare rapidamente
una risposta di crescita e riparazione. Una molecola di EGF si è
legata a un recettore tirosin-chinasico sulla membrana plasmatica.

Il recettore è stato attivato.
La cascata di segnalazione è iniziata.

Se il segnale raggiungerà il nucleo, verrà trascritto un gene per
una proteina di risposta. L'mRNA dovrà uscire dal nucleo, essere
tradotto sui ribosomi legati al reticolo endoplasmatico rugoso,
modificato nel Golgi e infine secreto all'esterno della cellula.

La tua missione:
seguire il percorso del segnale e completare la via secretoria.

Comandi utili:
  ls   → esplora le directory
  cd   → spostati nel filesystem
  pwd  → scopri dove ti trovi
  cat  → leggi i README

Prima tappa:
vai al recettore tirosin-chinasico nella membrana plasmatica.
EOF

# ================================================================
# VICOLI CIECHI
# ================================================================

vicolo_cieco() {
  local dir="$1"
  cat > "$BASE/$dir/README" << 'EOF'
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   Sei in un vicolo cieco.                                 ║
║                                                           ║
║   Se sei qui, qualcosa è andato storto.                   ║
║   Non scoraggiarti — fai così:                            ║
║                                                           ║
║     1. Digita 'pwd' per capire dove ti trovi              ║
║     2. Torna indietro con 'cd ..'                         ║
║     3. Rileggi il README dell'ultima tappa corretta       ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
}

vicolo_cieco "membrana_plasmatica"
vicolo_cieco "membrana_plasmatica/canali_ionici"
vicolo_cieco "membrana_plasmatica/lipid_rafts"

# ── TAPPA 1 — membrana_plasmatica/recettori/tirosina_chinasi/ ──
cat > "$BASE/membrana_plasmatica/recettori/tirosina_chinasi/README" << 'EOF'
[ TAPPA 1 — Recettore tirosin-chinasico ]

Hai raggiunto EGFR, il recettore per EGF.

EGF — Epidermal Growth Factor — si è legato al dominio extracellulare
del recettore. EGFR si è attivato e ha avviato una cascata di
trasduzione del segnale verso il nucleo.

Obiettivo biologico:
attivare la trascrizione di un gene di risposta, produrre la proteina
corrispondente e secernerla all'esterno della cellula.

La prossima tappa è dove avviene la trascrizione: la eucromatina nel nucleo.
Vai in nucleo/cromatina/eucromatina/.
EOF

# ── TAPPA 2 — nucleo/cromatina/eucromatina/ ────────────────────
cat > "$BASE/nucleo/cromatina/eucromatina/README" << 'EOF'
[ TAPPA 2 — Eucromatina ]

Sei nella eucromatina: qui il gene viene trascritto in mRNA!

L'mRNA deve uscire dal nucleo per essere tradotto.
La prossima tappa è nei pori nucleari: nucleo/membrana_nucleare/pori_nucleari/.
EOF

# ── TAPPA 3 — nucleo/membrana_nucleare/pori_nucleari/ ──────────
cat > "$BASE/nucleo/membrana_nucleare/pori_nucleari/README" << 'EOF'
[ TAPPA 3 — Pori nucleari ]

L'mRNA attraversa i pori nucleari e arriva nel citoplasma.

Ora deve essere tradotto, ma non da ribosomi liberi!
Per la via secretoria, la traduzione avviene su ribosomi LEGATI al RER.
Vai in citoplasma/ribosomi/legati/.
EOF

# ── TAPPA 4 — citoplasma/ribosomi/legati/ ──────────────────────
cat > "$BASE/citoplasma/ribosomi/legati/README" << 'EOF'
[ TAPPA 4 — Ribosomi legati ]

Qui i ribosomi legati al RER traducono l'mRNA e iniziano a far entrare la proteina nascente nel lume del reticolo endoplasmatico rugoso.

La prossima tappa è nelle cisterne del RER: citoplasma/reticolo_endoplasmatico/rugoso/cisterne/.
EOF

# ── TAPPA 5 — citoplasma/reticolo_endoplasmatico/rugoso/cisterne/ ─
cat > "$BASE/citoplasma/reticolo_endoplasmatico/rugoso/cisterne/README" << 'EOF'
[ TAPPA 5 — Cisterne del RER ]

La proteina viene ripiegata e modificata (glicosilazione iniziale).

Ora deve essere spedita all'apparato di Golgi, lato cis!
Vai in citoplasma/apparato_golgi/cis/rete_cis/.
EOF

# ── TAPPA 6 — citoplasma/apparato_golgi/cis/rete_cis/ ──────────
cat > "$BASE/citoplasma/apparato_golgi/cis/rete_cis/README" << 'EOF'
[ TAPPA 6 — Rete cis del Golgi ]

La proteina entra nel Golgi dal lato cis, dove subisce ulteriori modifiche.

Ora attraversa il Golgi fino al lato trans, punto di smistamento finale.
Vai in citoplasma/apparato_golgi/trans/rete_trans/.
EOF

# ── TAPPA 7 — citoplasma/apparato_golgi/trans/rete_trans/ ──────
cat > "$BASE/citoplasma/apparato_golgi/trans/rete_trans/README" << 'EOF'
[ TAPPA 7 — Rete trans del Golgi ]

La proteina è pronta per essere confezionata in una vescicola secretoria!

Vai in citoplasma/vescicole_secretorie/.
EOF

# ── TAPPA 8 — citoplasma/vescicole_secretorie/ ────────────────
cat > "$BASE/citoplasma/vescicole_secretorie/README" << 'EOF'
[ TAPPA 8 — Vescicola secretoria ]

La vescicola si dirige verso la membrana plasmatica per fondersi e rilasciare il contenuto all'esterno.

Ultima tappa: esocitosi!
Vai in membrana_plasmatica/esocitosi/.
EOF

# ── TAPPA 9 — membrana_plasmatica/esocitosi/ (TESORO) ─────────
cat > "$BASE/membrana_plasmatica/esocitosi/TESORO.txt" << 'EOF'
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║                    *** HAI TROVATO IL TESORO! ***                ║
║                                                                  ║
║   Segnale iniziale: EGF — Epidermal Growth Factor                ║
║   Recettore attivato: EGFR, un recettore tirosin-chinasico       ║
║                                                                  ║
║   Hai seguito il segnale dalla membrana al nucleo,               ║
║   hai prodotto l'mRNA, hai tradotto la proteina sul RER,         ║
║   l'hai modificata nel Golgi e l'hai secreta per esocitosi.      ║
║                                                                  ║
║   La risposta cellulare è completata.                            ║
║   La cellula è salva.                                            ║
║                                                                  ║
║   Competenze sbloccate:                                          ║
║     ✓ ls   → esplorazione                                        ║
║     ✓ cd   → navigazione                                         ║
║     ✓ pwd  → orientamento                                        ║
║     ✓ cat  → lettura degli indizi                                ║
║                                                                  ║
║           [ EXPLORER LEVEL UNLOCKED ]                            ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
EOF

# ── TAPPA 3 — citoplasma/ribosomi/liberi/ ───────────────────────
cat > "$BASE/citoplasma/ribosomi/liberi/README" << EOF
[ TAPPA 3 — Ribosomi liberi ]

Perfetto! I ribosomi liberi sintetizzano proteine
destinate al citosol e al nucleo.

Esegui 'pwd' e osserva l'output con attenzione.
Quella stringa è il path assoluto di dove ti trovi.
La parte che termina con "cellula" è la tua BASE — scrivitela
da qualche parte: ti servirà per costruire i path assoluti.

La prossima tappa è nel nucleo: devi raggiungere la cromatina.
Ma la cromatina ha due forme molto diverse:

  eterocromatina  — condensata, silenziata, inaccessibile
  eucromatina     — aperta, attiva, trascritta

Vai con un path ASSOLUTO direttamente alla forma
trascrizionalmente attiva, dentro nucleo/cromatina/.
EOF

# ── TAPPA 4 — nucleo/cromatina/eucromatina/ ─────────────────────
cat > "$BASE/nucleo/cromatina/eucromatina/README" << 'EOF'
[ TAPPA 4 — Eucromatina ]

Sei nel nucleo, nella cromatina attiva.
La trascrizione sta avvenendo esattamente qui.

Usa 'pwd' per orientarti.

L'mRNA appena trascritto deve uscire dal nucleo.
Il passaggio avviene attraverso i pori nucleari,
che si trovano nella membrana_nucleare.

membrana_nucleare è una subdirectory di nucleo,
proprio come cromatina — sono "sorelle".

Devi risalire DUE livelli e poi scendere
in membrana_nucleare/pori_nucleari/.
Fallo in un unico comando relativo.
EOF

# ── TAPPA 5 — nucleo/membrana_nucleare/pori_nucleari/ ───────────
cat > "$BASE/nucleo/membrana_nucleare/pori_nucleari/README" << 'EOF'
[ TAPPA 5 — Pori nucleari ]

L'mRNA ha attraversato il poro nucleare ed è nel citoplasma.
Sei a metà strada.

Usa 'pwd' per orientarti.

La cellula ha bisogno di energia per proseguire.
Dove viene prodotta l'ATP per la fosforilazione ossidativa?

Nel mitocondrio — ma non in tutta la struttura.
La catena di trasporto degli elettroni si trova sulla
membrana interna, nelle sue invaginazioni: le CRESTE.

Attenzione: il mitocondrio non è più al primo livello
della cellula. Rifletti su dove si trova prima di
costruire il path assoluto.
EOF

# ── TAPPA 6 — citoplasma/mitocondrio/membrana_interna/creste/ ───
cat > "$BASE/citoplasma/mitocondrio/membrana_interna/creste/README" << 'EOF'
[ TAPPA 6 — Creste mitocondriali ]

Eccellente! Sei sulle creste mitocondriali,
sede della fosforilazione ossidativa e della sintesi di ATP.

Usa 'pwd' per orientarti.

Ora la proteina deve essere ripiegata e glicosilata.
Il primo compartimento della via secretoria è il
reticolo endoplasmatico RUGOSO (non quello liscio!).

Sei a TRE livelli di profondità nel mitocondrio.
Rifletti su dove ti trovi rispetto al citoplasma,
poi costruisci un path relativo che scenda
fino alle cisterne del rugoso.
EOF

# ── TAPPA 7 — citoplasma/reticolo_endoplasmatico/rugoso/cisterne/
cat > "$BASE/citoplasma/reticolo_endoplasmatico/rugoso/cisterne/README" << 'EOF'
[ TAPPA 7 — Cisterne del RER ]

Ottimo! Sei nelle cisterne del reticolo endoplasmatico rugoso.
Qui la proteina viene ripiegata e inizia la glicosilazione.

Usa 'pwd' per orientarti.

Il prossimo stop è l'apparato di Golgi.
Il Golgi ha una polarità ben precisa:
  lato cis   → riceve le vescicole dal RER (ingresso)
  mediale    → processing intermedio
  lato trans → smistamento finale (uscita)

Le vescicole arrivano dal RER al lato cis,
ma tu vai direttamente al punto di smistamento finale:
la rete_trans, dentro trans/.

Costruisci il path ASSOLUTO.
EOF

# ── TAPPA 8 — citoplasma/apparato_golgi/trans/rete_trans/ ───────
cat > "$BASE/citoplasma/apparato_golgi/trans/rete_trans/README" << 'EOF'
[ TAPPA 8 — Rete trans del Golgi ]

Sei alla rete trans (TGN), il centro di smistamento del Golgi.
Da qui le proteine vengono inviate a destinazioni diverse.

Usa 'pwd' per orientarti.

Ora fai il percorso inverso: vai alla rete cis,
il punto di ingresso del Golgi.

rete_cis si trova dentro cis/,
che è alla stessa profondità di trans/ nell'apparato_golgi.
Sono "sorelle" — stessa struttura, lati opposti.

Risali DUE livelli, poi scendi nell'altra direzione.
Fallo in un unico path relativo.
EOF

# ── TAPPA 9 — citoplasma/apparato_golgi/cis/rete_cis/ ───────────
cat > "$BASE/citoplasma/apparato_golgi/cis/rete_cis/README" << 'EOF'
[ TAPPA 9 — Rete cis del Golgi ]

Perfetto! Hai attraversato il Golgi dalla rete trans alla rete cis
usando un solo path relativo con doppio '..'.

Usa 'pwd' per orientarti.

Ultima tappa! Le proteine e i materiali da degradare
vengono inviati ai lisosomi.
Ma non a quelli primari (ancora inattivi) —
ai lisosomi SECONDARI, dove avviene la digestione vera.

Costruisci il path ASSOLUTO per l'ultima tappa.
EOF

# ── TAPPA 10 — citoplasma/lisosomi/secondari/ (TESORO) ──────────
cat > "$BASE/citoplasma/lisosomi/secondari/TESORO.txt" << 'EOF'
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║                    *** HAI TROVATO IL TESORO! ***                ║
║                                                                  ║
║   Segnale iniziale: EGF — Epidermal Growth Factor                ║
║   Recettore attivato: EGFR, un recettore tirosin-chinasico       ║
║                                                                  ║
║   Hai seguito una cascata di segnalazione cellulare:             ║
║                                                                  ║
║   membrana plasmatica → recettore → nucleo → mRNA                ║
║   → ribosomi → RER → Golgi → destinazione finale                 ║
║                                                                  ║
║   Hai usato:                                                     ║
║     ✓ ls    per esplorare le opzioni                            ║
║     ✓ pwd   per orientarti nel filesystem                        ║
║     ✓ cd    con path relativi e assoluti                         ║
║     ✓ cat   per leggere ogni indizio                             ║
║                                                                  ║
║   La risposta cellulare è completata.                            ║
║   La cellula è salva.                                            ║
║                                                                  ║
║           [ EXPLORER LEVEL UNLOCKED ]                            ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
EOF

echo "✓ Biglietti delle tappe scritti."
echo ""
echo "================================================================"
echo " Setup completato!"
echo ""
echo " Per far partire gli studenti:"
echo ""
echo "   cd $BASE"
echo "   cat README"
echo "   cd membrana_plasmatica/recettori/tirosina_chinasi"
echo "   cat README"
echo ""
echo " Per resettare e rigenerare da zero:"
echo "   bash $(realpath "$0")"
echo "================================================================"
