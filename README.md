Oppgave for Kidsa Koder
=======================

Av Tallak Tveide

*Dette er et arbeid under oppføring, ikke klart til bruk*

Dette er et kursopplegg for barn som ønsker å lære litt om web, html og Ruby.
Målet for kurset er å lage sin egen web side hvor man kan poste innlegg. 
Det er også mulig å dele innlegg med de andre barna sine web sider.

Kurset er fordelt over fem kvelder med følgende fokus:

1. Grunnleggende programmering i Ruby
2. Vi skriver til og leser fra filer
3. HTML og skjemaer, enkle dynamiske hjemmesider
4. Dynamiske hjemmesider, redirect
5. Fullføre prosjektet


Presentasjonen ligger under katalogen `presentasjon` og kode under katalogen `kode`


## Installere ruby

1. Installere ruby på ditt system
2. `gem install sinatra`
3. `gem install rerun`

## Kjøre en ruby fil fra irb

    $ irb
    >> load './filename.rb'

## Sinatra auto refresh

Bruk `restart` på Windows eller `rerun` på OSX eller Linux.

## Dette må vi kunne

### Dag 1

  - strenger, symboler, enkle og doble anførselstegn
  - streng interpolering
  - kalle metoder på et objekt, også uten parenteser
  - konstanter
  - nil / true / false
  - if/else
  - array, lage tomme, etc
  - each
  - legge til elementer til en array
  - hente ut deler av en array med [..]
  - hash, lage tomme, etc
  - starte IRB of laste inn en fil for testing

Vi har installert Ruby på alle maskinene og laget litt basic kode.

### Dag 2

  - definere og bruke funksjoner
  - require og require_relative
  - File.exist?
  - Åpne en fil for skriving
  - Åpne en fil for lesing
  - bruke load_file for å laste inn en fil

  - konvertere yaml tekst til objekter med YAML.load
  - bruke .to_yaml for å konvertere en datastruktur til yaml


Vi er mer fortrolige med Ruby og har laget en biblioteksfil som vi kan bruke senere (for å lagre innlegg)

### Dag 3

- HTML, struktur, <head>, <title>, <body>, <link>, <a>, <p>, <img>, <h1>, <h2>, <h3>
- CSS
- HTML forms: <form>, <textarea>, <input/text>, <input/submit>
- sinatra
- forskjellen på å lese fra fil og web server
- forskjellen på å ha html i public katalogen og views/
- blande html og kode i ERB fil

Etter denne dagen har vi en side med CSS og statiske innlegg. Vi har også laget noen forms for pålogging og skriving av innlegg som ikke har noen funksjoner.

### Dag 4

- skille layout fra kjerneområdet i sinatra, yield
- skrive og lese til cookies
- svare på en POST
- login funksjonen
- innlegg funksjonen

Vi har en fungerende kidsbook

### Dag 5

- Vi skriver en yaml GET funksjon
- Funksjonen som lager liste over hva som skjer
- Oppdaterer hjemmesiden med siste skrik

Vi har en distribuert applikasjon.
