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

DIRS=(
  "$BASE"
  "$BASE/membrana_plasmatica"
  "$BASE/membrana_plasmatica/canali_ionici"
  "$BASE/membrana_plasmatica/lipid_rafts"
  "$BASE/membrana_plasmatica/recettori"
  "$BASE/membrana_plasmatica/recettori/gpcr"
  "$BASE/membrana_plasmatica/recettori/tirosina_chinasi"
  "$BASE/membrana_plasmatica/esocitosi"
  "$BASE/citoplasma"
  "$BASE/citoplasma/inclusioni"
  "$BASE/citoplasma/vescicole_secretorie"
  "$BASE/citoplasma/citoscheletro"
  "$BASE/citoplasma/citoscheletro/actina"
  "$BASE/citoplasma/citoscheletro/microtubuli"
  "$BASE/citoplasma/citoscheletro/filamenti_intermedi"
  "$BASE/citoplasma/ribosomi"
  "$BASE/citoplasma/ribosomi/liberi"
  "$BASE/citoplasma/ribosomi/legati"
  "$BASE/citoplasma/mitocondrio"
  "$BASE/citoplasma/mitocondrio/membrana_esterna"
  "$BASE/citoplasma/mitocondrio/spazio_intermembrana"
  "$BASE/citoplasma/mitocondrio/membrana_interna"
  "$BASE/citoplasma/mitocondrio/membrana_interna/creste"
  "$BASE/citoplasma/mitocondrio/matrice"
  "$BASE/citoplasma/mitocondrio/matrice/dna_mitocondriale"
  "$BASE/citoplasma/reticolo_endoplasmatico"
  "$BASE/citoplasma/reticolo_endoplasmatico/rugoso"
  "$BASE/citoplasma/reticolo_endoplasmatico/rugoso/cisterne"
  "$BASE/citoplasma/reticolo_endoplasmatico/liscio"
  "$BASE/citoplasma/reticolo_endoplasmatico/liscio/tubuli"
  "$BASE/citoplasma/apparato_golgi"
  "$BASE/citoplasma/apparato_golgi/cis"
  "$BASE/citoplasma/apparato_golgi/cis/rete_cis"
  "$BASE/citoplasma/apparato_golgi/mediale"
  "$BASE/citoplasma/apparato_golgi/trans"
  "$BASE/citoplasma/apparato_golgi/trans/rete_trans"
  "$BASE/citoplasma/lisosomi"
  "$BASE/citoplasma/lisosomi/primari"
  "$BASE/citoplasma/lisosomi/secondari"
  "$BASE/citoplasma/perossisomi"
  "$BASE/citoplasma/vacuoli"
  "$BASE/citoplasma/centrosoma"
  "$BASE/citoplasma/centrosoma/centriolo_madre"
  "$BASE/citoplasma/centrosoma/centriolo_figlio"
  "$BASE/nucleo"
  "$BASE/nucleo/membrana_nucleare"
  "$BASE/nucleo/membrana_nucleare/pori_nucleari"
  "$BASE/nucleo/membrana_nucleare/lamina"
  "$BASE/nucleo/nucleolo"
  "$BASE/nucleo/nucleolo/regione_fibrillare"
  "$BASE/nucleo/nucleolo/regione_granulare"
  "$BASE/nucleo/cromatina"
  "$BASE/nucleo/cromatina/eterocromatina"
  "$BASE/nucleo/cromatina/eucromatina"
)

mkdir -p "${DIRS[@]}"

echo "✓ Directory create."

# ================================================================
# VICOLI CIECHI
# ================================================================

vicolo_cieco() {
  local dir="$1"
  cat > "$dir/README" << 'EOF'
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   Non sei nel posto giusto!                               ║
║                                                           ║
║   Se sei qui, e non sei di passaggio                      ║
║   qualcosa è andato storto.                               ║
║   Non scoraggiarti — fai così:                            ║
║                                                           ║
║     1. Digita 'pwd' per capire dove ti trovi              ║
║     2. Torna indietro con 'cd ..'                         ║
║     3. Rileggi il README dell'ultima tappa corretta       ║
║     4. Se proprio ti senti persa ricomincia da            ║
║         $BASE                                             ║
║                                                           ║
║  Spero che tu riesca a completare la missione in tempo!   ║ 
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
}

for D in "${DIRS[@]}"; do
  vicolo_cieco $D
done

# ================================================================
# README INIZIALE — MISSIONE
# ================================================================

cat > "$BASE/README" << 'EOF'
╔══════════════════════════════════════════════════════════════════╗
║                      ⚠ ALLARME CELLULARE ⚠                       ║
╚══════════════════════════════════════════════════════════════════╝

Segnale extracellulare rilevato: EGF — Epidermal Growth Factor.

L'ambiente esterno comunica che è necessario attivare rapidamente
una risposta di crescita e riparazione. Una molecola di EGF si è
legata a un recettore tirosin-chinasico sulla membrana plasmatica.

Il recettore è stato attivato.
La cascata di segnalazione è iniziata.

Se il segnale raggiungerà il nucleo, verrà trascritto un gene per
una proteina di risposta. 
Si tratta di secernere IL-8, chiamata anche CXCL8, una chemochina
che aiuta a richiamare cellule immunitarie nella zona danneggiata.

L'mRNA dovrà uscire dal nucleo, essere tradotto sui ribosomi 
legati al reticolo endoplasmatico rugoso, la proteina dovrà 
essere modificata nel Golgi e infine secreta all'esterno della
cellula.

La tua missione:
seguire il percorso del segnale e completare la via secretoria.

Comandi utili:
  ls   → esplora le directory
  cd   → spostati nel filesystem
  pwd  → scopri dove ti trovi
  cat  → leggi i README

Sei appena entrato nella cellula.
Guarda cosa c'è intorno a te:

  ls

Vedrai tutti i compartimenti disponibili. Molti sono vicoli
ciechi — solo il percorso giusto porta al tesoro.

La prima tappa si trova nella membrana plasmatica,
tra i recettori. Ma la membrana ha più zone:
entra prima in membrana_plasmatica/recettori/ e usa 'ls'
per capire quale porta prendere. Ricorda che EGFR è un recettore
tirosin-chinasico!

Quanto pensi di essere nel posto giusto dai il comando:

  cat README

per leggere il biglietto della tappa, che ti darà indizi su dove andare dopo.
EOF


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

Prova a raggiungerla utilizzanto un path assoluto.
Ti ricordo che il path assoluto è quello completo, a partire dalla radice del
filesystem e che la cellula si trova in 
  $BASE
EOF

# ── TAPPA 2 — nucleo/cromatina/eucromatina/ ────────────────────
cat > "$BASE/nucleo/cromatina/eucromatina/README" << 'EOF'
[ TAPPA 2 — Eucromatina ]

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
Fallo in un unico comando con path relativo.
EOF

# ── TAPPA 3 — nucleo/membrana_nucleare/pori_nucleari/ ──────────
cat > "$BASE/nucleo/membrana_nucleare/pori_nucleari/README" << 'EOF'
[ TAPPA 3 — Pori nucleari ]

L'mRNA attraversa i pori nucleari e arriva nel citoplasma.

Ora deve essere tradotto, ma non da ribosomi liberi!
Per la via secretoria, la traduzione avviene su ribosomi LEGATI al
rerticolo endoplasmatico.
EOF

# ── TAPPA 4 — citoplasma/ribosomi/legati/ ──────────────────────
cat > "$BASE/citoplasma/ribosomi/legati/README" << 'EOF'
[ TAPPA 4 — Ribosomi legati ]

Qui i ribosomi legati al RER traducono l'mRNA e iniziano a far entrare
la proteina nascente nel lume del reticolo endoplasmatico rugoso.

Sei quasi a metà strada!

La prossima tappa è nelle cisterne del reticolo endoplasmatico rugoso.
Prova a raggiungerle con un path assoluto, partendo da 
$BASE.

Il tato TAB è tuo amico!
Se inizi a scrivere il path e poi premi TAB, vedrai le opzioni disponibili
e potrai completare più velocemente. Prova a scrivere:

  cd $BASE/citoplasma/
e poi premi TAB due volte per vedere le opzioni.
Comincia quindi a scrivere dove vuoi andare, ad esempio:

  cd $BASE/citoplasma/rib
e poi premi TAB per completare "ribosomi", e così via.

Usa spesso TAB per esplorare le opzioni e velocizzare la digitazione.
Farai anche meno errori di battitura!
EOF

# ── TAPPA 5 — citoplasma/reticolo_endoplasmatico/rugoso/cisterne/ ─
cat > "$BASE/citoplasma/reticolo_endoplasmatico/rugoso/cisterne/README" << 'EOF'
[ TAPPA 5 — Cisterne del RER ]

La proteina viene ripiegata e modificata (glicosilazione iniziale).

Ora deve essere spedita all'apparato di Golgi, rete cis!
EOF

# ── TAPPA 6 — citoplasma/apparato_golgi/cis/rete_cis/ ──────────
cat > "$BASE/citoplasma/apparato_golgi/cis/rete_cis/README" << 'EOF'
[ TAPPA 6 — Rete cis del Golgi ]

La proteina entra nel Golgi dal lato cis, dove subisce ulteriori modifiche.

Ora attraversa il Golgi fino al lato trans, punto di smistamento finale.
rete_cis e rete_trans sono "sorelle" — si trovano alla stessa profondità
nell'apparato_golgi.
Cos'è più comodo per spostarsi da una all'altra? Un path relativo o
un path assoluto?

EOF

# ── TAPPA 7 — citoplasma/apparato_golgi/trans/rete_trans/ ──────
cat > "$BASE/citoplasma/apparato_golgi/trans/rete_trans/README" << 'EOF'
[ TAPPA 7 — Rete trans del Golgi ]

La proteina è pronta per essere confezionata in una vescicola secretoria!

La trovi nella directori 'citoplasma'.
EOF

# ── TAPPA 8 — citoplasma/vescicole_secretorie/ ────────────────
cat > "$BASE/citoplasma/vescicole_secretorie/README" << 'EOF'
[ TAPPA 8 — Vescicola secretoria ]

La vescicola si dirige verso la membrana plasmatica per fondersi e rilasciare il contenuto all'esterno.

Ultima tappa: esocitosi!
EOF

# ── TAPPA 9 — membrana_plasmatica/esocitosi/ (TESORO) ─────────
cat > "$BASE/membrana_plasmatica/esocitosi/README" << 'EOF'
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║          *** HAI TROVATO IL TESORO! ***                          ║
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
║     ✓ cat  → lettura dei file.                                   ║
║                                                                  ║
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
