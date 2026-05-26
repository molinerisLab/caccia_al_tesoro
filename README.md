# 🧬 Caccia al Tesoro Cellulare

> *Un mini-corso su come navigare il filesystem mascherato da videogioco anni '90 per biologhe/i.*

## Di cosa si tratta

Uno script bash che genera un albero di directory modellato su una cellula eucariotica. Gli studenti navigano tra compartimenti sub-cellulari usando `cd`, `ls`, `pwd` e `cat`, seguendo il percorso di un segnale EGF dalla membrana plasmatica fino all'esocitosi.


## Struttura della cellula (semplificata)

```
cellula/
├── membrana_plasmatica/      ← punto di partenza e di arrivo
├── nucleo/                   ← sede della trascrizione
└── citoplasma/               ← dove vivono tutti gli altri organelli
    ├── ribosomi/legati        ← traduzione per la via secretoria
    ├── reticolo_endoplasmatico/rugoso/
    ├── apparato_golgi/       ← con polarità cis → trans rispettata
    ├── mitocondrio/          ← sì, dentro citoplasma...
    └── lisosomi/
        ├── primari/          ← vicolo cieco
        └── secondari/        ← tesoro
```

## Il percorso corretto

```
EGFR (membrana) → eucromatina (nucleo) → pori nucleari
→ ribosomi legati → RER cisterne → Golgi cis → Golgi trans
→ vescicole secretorie → esocitosi ← tesoro
```

Tutto il resto è un vicolo cieco con un messaggio incoraggiante.

## Cosa imparano gli studenti

| Comando | Quando lo usano |
|---------|-----------------|
| `ls`    | per scegliere tra organelli alternativi |
| `pwd`   | per capire dove si sono persi |
| `cd ../..` | per uscire da compartimenti annidati |
| `cd /path/assoluto` | per saltare tra organelli lontani |
| `cat README` | ad ogni tappa, per leggere il prossimo indizio |

Il tasto TAB viene introdotto a metà percorso, quando i path assoluti
cominciano a diventare scomodi. Come nella vita vera.

## Prerequisiti

- `bash`
- Nessuno. È solo `mkdir` e `cat`. Non installerete nulla, non romperete nulla.

## Utilizzo

```bash
# Posizionarsi dove si vuole generare l'albero
cd /home/studenti/esercitazione_01

# Lanciare lo script
bash setup_caccia_al_tesoro.sh

# Far partire gli studenti
cd cellula
cat README
```

Se la directory `cellula/` esiste già, lo script chiede conferma prima di sovrascriverla. Non si fida di voi. Ha ragione.

## Resettare tra una sessione e l'altra

```bash
bash setup_caccia_al_tesoro.sh
# → "Vuoi sovrascriverla? [s/N]" → s
```

L'albero viene rigenerato da zero con i path aggiornati alla directory corrente.

## Nota didattica

I biglietti delle tappe spiegano il ragionamento ma non danno mai il comando completo. Gli studenti che si bloccano devono chiedere — al docente, a un compagno, o all'assistente. Questo è intenzionale: la frustrazione produttiva è parte del metodo.

---

*Realizzato per un corso di biologia. Nessuna proteina è stata maltrattata durante la produzione di questo script.*
