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
  \
  "$BASE/citoplasma" \
  "$BASE/citoplasma/inclusioni" \
  "$BASE/citoplasma/citoscheletro" \
  "$BASE/citoplasma/citoscheletro/actina" \
  "$BASE/citoplasma/citoscheletro/microtubuli" \
  "$BASE/citoplasma/citoscheletro/filamenti_intermedi" \
  "$BASE/citoplasma/ribosomi" \
  "$BASE/citoplasma/ribosomi/liberi" \
  "$BASE/citoplasma/ribosomi/legati" \
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
  "$BASE/nucleo/cromatina/eucromatina" \
  \
  "$BASE/mitocondrio" \
  "$BASE/mitocondrio/membrana_esterna" \
  "$BASE/mitocondrio/spazio_intermembrana" \
  "$BASE/mitocondrio/membrana_interna" \
  "$BASE/mitocondrio/membrana_interna/creste" \
  "$BASE/mitocondrio/matrice" \
  "$BASE/mitocondrio/matrice/dna_mitocondriale" \
  \
  "$BASE/reticolo_endoplasmatico" \
  "$BASE/reticolo_endoplasmatico/rugoso" \
  "$BASE/reticolo_endoplasmatico/rugoso/cisterne" \
  "$BASE/reticolo_endoplasmatico/liscio" \
  "$BASE/reticolo_endoplasmatico/liscio/tubuli" \
  \
  "$BASE/apparato_golgi" \
  "$BASE/apparato_golgi/cis" \
  "$BASE/apparato_golgi/cis/rete_cis" \
  "$BASE/apparato_golgi/mediale" \
  "$BASE/apparato_golgi/trans" \
  "$BASE/apparato_golgi/trans/rete_trans" \
  \
  "$BASE/lisosomi" \
  "$BASE/lisosomi/primari" \
  "$BASE/lisosomi/secondari" \
  "$BASE/perossisomi" \
  "$BASE/vacuoli" \
  "$BASE/centrosoma" \
  "$BASE/centrosoma/centriolo_madre" \
  "$BASE/centrosoma/centriolo_figlio"

echo "✓ Directory create."

# ================================================================
# VICOLI CIECHI
# Tutte le directory che non sono tappe del percorso corretto
# ricevono un README di "vicolo cieco".
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
vicolo_cieco "membrana_plasmatica/recettori/gpcr"

vicolo_cieco "citoplasma"
vicolo_cieco "citoplasma/inclusioni"
vicolo_cieco "citoplasma/citoscheletro"
vicolo_cieco "citoplasma/citoscheletro/actina"
vicolo_cieco "citoplasma/citoscheletro/microtubuli"
vicolo_cieco "citoplasma/citoscheletro/filamenti_intermedi"
vicolo_cieco "citoplasma/ribosomi"
vicolo_cieco "citoplasma/ribosomi/legati"

vicolo_cieco "nucleo"
vicolo_cieco "nucleo/nucleolo"
vicolo_cieco "nucleo/nucleolo/regione_fibrillare"
vicolo_cieco "nucleo/nucleolo/regione_granulare"
vicolo_cieco "nucleo/cromatina"
vicolo_cieco "nucleo/cromatina/eterocromatina"
vicolo_cieco "nucleo/membrana_nucleare"
vicolo_cieco "nucleo/membrana_nucleare/lamina"

vicolo_cieco "mitocondrio"
vicolo_cieco "mitocondrio/membrana_esterna"
vicolo_cieco "mitocondrio/spazio_intermembrana"
vicolo_cieco "mitocondrio/membrana_interna"
vicolo_cieco "mitocondrio/matrice"
vicolo_cieco "mitocondrio/matrice/dna_mitocondriale"

vicolo_cieco "reticolo_endoplasmatico"
vicolo_cieco "reticolo_endoplasmatico/rugoso"
vicolo_cieco "reticolo_endoplasmatico/liscio"
vicolo_cieco "reticolo_endoplasmatico/liscio/tubuli"

vicolo_cieco "apparato_golgi"
vicolo_cieco "apparato_golgi/mediale"
vicolo_cieco "apparato_golgi/cis"
vicolo_cieco "apparato_golgi/trans"

vicolo_cieco "lisosomi"
vicolo_cieco "lisosomi/primari"
vicolo_cieco "perossisomi"
vicolo_cieco "vacuoli"
vicolo_cieco "centrosoma"
vicolo_cieco "centrosoma/centriolo_madre"
vicolo_cieco "centrosoma/centriolo_figlio"

echo "✓ Vicoli ciechi scritti."

# ================================================================
# TAPPE DEL PERCORSO CORRETTO
# (scritte dopo i vicoli ciechi, così sovrascrivono eventuali
#  conflitti e non ci sono sorprese)
# ================================================================

# ── PARTENZA ────────────────────────────────────────────────────
cat > "$BASE/README" << EOF
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║            BENVENUTO NELLA CELLULA!                              ║
║                                                                  ║
║   La tua missione: naviga tra i compartimenti cellulari          ║
║   e trova il tesoro nascosto.                                    ║
║                                                                  ║
║   Strumenti a disposizione:                                      ║
║     ls        — elenca cosa c'è nella directory corrente         ║
║     cd <path> — spostati in un'altra directory                   ║
║     cat README — leggi il biglietto della tappa                  ║
║     pwd       — mostra il path assoluto di dove ti trovi         ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝

Sei appena entrato nella cellula.
Guarda cosa c'è intorno a te:

  ls

Vedrai tutti i compartimenti disponibili. Molti sono vicoli
ciechi — solo il percorso giusto porta al tesoro.

La prima tappa si trova nella membrana plasmatica,
tra i recettori. Ma la membrana ha più zone:
entra prima in membrana_plasmatica/recettori/ e usa 'ls'
per capire quale porta prendere.
EOF

# ── TAPPA 1 — membrana_plasmatica/recettori/ ────────────────────
cat > "$BASE/membrana_plasmatica/recettori/README" << 'EOF'
[ TAPPA 1 — Recettori di membrana ]

Bene! Sei tra i recettori della membrana plasmatica.
Usa 'ls' per vedere le famiglie disponibili.

Hai due opzioni:

  gpcr/              → recettori accoppiati a proteine G
                       trasmettono il segnale via secondi messaggeri

  tirosina_chinasi/  → recettori con attività enzimatica diretta
                       fosforilano le tirosine dei substrati intracellulari

La prossima tappa è nel recettore che agisce
tramite fosforilazione diretta della tirosina.
EOF

# ── TAPPA 2 — membrana_plasmatica/recettori/tirosina_chinasi/ ───
cat > "$BASE/membrana_plasmatica/recettori/tirosina_chinasi/README" << EOF
[ TAPPA 2 — Recettori tirosin-chinasici ]

Ottimo! Il recettore è stato attivato dal ligando.

Prima di muoverti, usa 'pwd' e leggi l'output con attenzione.
Dovresti vedere qualcosa come:
  $BASE/membrana_plasmatica/recettori/tirosina_chinasi

Conta i livelli che ti separano dalla radice "cellula/":
  un '..'    → recettori/
  due '..'   → membrana_plasmatica/
  tre '..'   → cellula/  ← la radice

Il segnale si propaga nel citoplasma. La risposta cellulare
richiede sintesi proteica: vai ai ribosomi LIBERI nel citoplasma
(non quelli legati al reticolo endoplasmatico!).

Devi risalire di TRE livelli, poi scendere in citoplasma/ribosomi/liberi/.
Prova a costruire il path relativo con i '..'.
EOF

# ── TAPPA 3 — citoplasma/ribosomi/liberi/ ───────────────────────
cat > "$BASE/citoplasma/ribosomi/liberi/README" << EOF
[ TAPPA 3 — Ribosomi liberi ]

Perfetto! I ribosomi liberi sintetizzano proteine
destinate al citosol e al nucleo.

Esegui adesso:

  pwd

Osserva l'output. Quella stringa è il path ASSOLUTO
della directory in cui ti trovi. La parte che termina
con "cellula" è la tua BASE — scrivitela:

  $BASE

Userai questo path nelle tappe successive per i comandi assoluti.

La prossima tappa è nel nucleo: devi raggiungere la cromatina.
Ma la cromatina ha due forme molto diverse:

  eterocromatina  — condensata, silenziata, inaccessibile
  eucromatina     — aperta, attiva, trascritta

Vai con un path ASSOLUTO direttamente alla forma
trascrizionalmente attiva, dentro nucleo/cromatina/.
EOF

# ── TAPPA 4 — nucleo/cromatina/eucromatina/ ─────────────────────
cat > "$BASE/nucleo/cromatina/eucromatina/README" << EOF
[ TAPPA 4 — Eucromatina ]

Sei nel nucleo, nella cromatina attiva.
La trascrizione sta avvenendo esattamente qui.

Verifica con 'pwd':
  $BASE/nucleo/cromatina/eucromatina

L'mRNA appena trascritto deve uscire dal nucleo.
Il passaggio avviene attraverso i pori nucleari,
che si trovano nella membrana_nucleare.

membrana_nucleare è una subdirectory di nucleo,
proprio come cromatina — sono "sorelle".

Devi risalire DUE livelli e poi scendere in membrana_nucleare/pori_nucleari/.
Fallo in un unico comando relativo.
EOF

# ── TAPPA 5 — nucleo/membrana_nucleare/pori_nucleari/ ───────────
cat > "$BASE/nucleo/membrana_nucleare/pori_nucleari/README" << EOF
[ TAPPA 5 — Pori nucleari ]

L'mRNA ha attraversato il poro nucleare ed è nel citoplasma.
Sei a metà strada.

La cellula ha bisogno di energia per proseguire.
Dove viene prodotta l'ATP per la fosforilazione ossidativa?

Nel mitocondrio — ma non in tutta la struttura.
La catena di trasporto degli elettroni si trova sulla
membrana interna, nelle sue invaginazioni: le CRESTE.

Costruisci il path ASSOLUTO per arrivarci.
Puoi farti aiutare da 'pwd' per capire dove sei ora.
EOF

# ── TAPPA 6 — mitocondrio/membrana_interna/creste/ ──────────────
cat > "$BASE/mitocondrio/membrana_interna/creste/README" << EOF
[ TAPPA 6 — Creste mitocondriali ]

Eccellente! Sei sulle creste mitocondriali,
sede della fosforilazione ossidativa e della sintesi di ATP.

Verifica con 'pwd':
  $BASE/mitocondrio/membrana_interna/creste

Ora la proteina deve essere riposata e glicosilata.
Il primo compartimento della via secretoria è il
reticolo endoplasmatico RUGOSO (non quello liscio!).

Sei a TRE livelli di profondità nel mitocondrio.
Costruisci un path relativo che risalga fino alla radice
e scenda fino alle cisterne del rugoso.
EOF

# ── TAPPA 7 — reticolo_endoplasmatico/rugoso/cisterne/ ──────────
cat > "$BASE/reticolo_endoplasmatico/rugoso/cisterne/README" << EOF
[ TAPPA 7 — Cisterne del RER ]

Ottimo! Sei nelle cisterne del reticolo endoplasmatico rugoso.
Qui la proteina viene ripiegata e inizia la glicosilazione.

Esegui 'pwd' per confermare:
  $BASE/reticolo_endoplasmatico/rugoso/cisterne

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

# ── TAPPA 8 — apparato_golgi/trans/rete_trans/ ──────────────────
cat > "$BASE/apparato_golgi/trans/rete_trans/README" << EOF
[ TAPPA 8 — Rete trans del Golgi ]

Sei alla rete trans (TGN), il centro di smistamento del Golgi.
Da qui le proteine vengono inviate a destinazioni diverse.

Usa 'pwd':
  $BASE/apparato_golgi/trans/rete_trans

Ora fai il percorso inverso: vai alla rete cis,
il punto di ingresso del Golgi.

rete_cis si trova dentro cis/,
che è alla stessa profondità di trans/ nell'apparato_golgi.
Sono "sorelle" — stessa struttura, lati opposti.

Risali DUE livelli, poi scendi nell'altra direzione.
Fallo in un unico path relativo.
EOF

# ── TAPPA 9 — apparato_golgi/cis/rete_cis/ ──────────────────────
cat > "$BASE/apparato_golgi/cis/rete_cis/README" << EOF
[ TAPPA 9 — Rete cis del Golgi ]

Perfetto! Hai attraversato il Golgi dalla rete trans alla rete cis
usando un solo path relativo con doppio '..'.

Verifica con 'pwd':
  $BASE/apparato_golgi/cis/rete_cis

Ultima tappa! Le proteine mal ripiegate e i materiali
da degradare vengono inviati ai lisosomi.
Ma non a quelli primari (ancora inattivi) —
ai lisosomi SECONDARI, dove avviene la digestione vera.

Costruisci il path ASSOLUTO per l'ultima tappa.
EOF

# ── TAPPA 10 — lisosomi/secondari/ (TESORO) ─────────────────────
cat > "$BASE/lisosomi/secondari/README" << 'EOF'
[ TAPPA 10 — Lisosomi secondari ]

╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║           *** HAI TROVATO IL TESORO! ***                         ║
║                                                                  ║
║   Hai navigato attraverso l'intera cellula:                      ║
║                                                                  ║
║   membrana plasmatica → recettori → ribosomi liberi              ║
║   → eucromatina → pori nucleari → creste mitocondriali           ║
║   → RER cisterne → Golgi trans → Golgi cis → lisosomi            ║
║                                                                  ║
║   Hai usato:                                                      ║
║     ✓  ls    per esplorare le opzioni                            ║
║     ✓  pwd   per orientarti nel filesystem                       ║
║     ✓  cd    con path relativi (anche con ../../..)              ║
║     ✓  cd    con path assoluti                                   ║
║     ✓  cat   per leggere ogni biglietto                          ║
║                                                                  ║
║           [ ... il premio arriva presto ... ]                    ║
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
echo ""
echo " Per resettare e rigenerare da zero:"
echo "   bash $(realpath "$0")"
echo "================================================================"

