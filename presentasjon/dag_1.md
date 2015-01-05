# Kidsbook
## Dag 1 - Ruby

av Tallak Tveide / @tallakt

---

## Hva er Ruby?

Ruby er et 20 år gammelt programmeringsspråk som ble laget av en japaner kalt Matz (Yukihiro Matsumoto).

![Matz](http://shareittips.com/images/Founder-Of-Ruby-Yukihiro-%E2%80%9CMatz%E2%80%9D.jpg)

Språket var fokusert på å gjøre utvikleren mest mulig lykkelig.

---

## Ruby script

Et Ruby script er en samling Ruby kommandoer i en tekstfil. Ruby er et interpretert språk, det betyr at den leser tekstfilen og utfører kommandoene fortløpende. 

For å kjøre et script i filen `hello.rb` kan man kjøre kommandoen:

    $ ruby hello.rb
    Hello World!

---

## Mitt første Ruby program

Vi skal forsøke å lage dette programmet. Start med å lage en tekstfil som inneholder teksten: 

```Ruby
puts " Hello World!"
```

Etter å ha lagret filen kan den kjøres

---

## Variable

Variable brukes til å lagre verdier

```Ruby
a = 1
b = a + 2
puts b     # Skriver ut 3
b = 10
puts b     # Skriver ut 10
```

Alt som kommer etter `#` tegner er kommentarer som Ruby ser bort fra.

Variable må begynne med liten bokstav, og ikke inneholde spesielle tegn (tegnet `_` er lov). Noen lovlige variabelnavn er `a`, `tallet`, `et_viktig_tall`. 

Unngå norske bokstaver i variabelnavn (selv om de strengt tatt er lovlige)

---

## Verdier

Verdier kan ha forskjellige typer, de vanligste er:

- `Fixnum` - Hele tall, f.eks, `1`, `-100`
- `Float` - Desimaltall, f.eks. `1.1`, `100.0`
- `String` - En tekstbit, f.eks. `"Ruby er topp!"``
- `Symbol` - En tekstbit som brukes internt i programmet, `:ruby`
- `true` eller `false` - noe som er sant eller usant
- `nil` - tomrom

---

## Strenger

Ruby er et veldig godt språk for å behandle tekst strenger (strenger), noen eksempler:

```Ruby
puts "Ruby"      # Skriver Ruby
puts 'Ruby'      # Skriver også ut Ruby
a = "Yukihiro"
b = "Matsumoto"
puts "#{a} #{b}" # Skriver Yukihiro Matsumoto
```

Den siste linjen bruker strenginterpolering. Dette er en god måte å sette sammen verdier til noe man skal skrive ut på skjermen. Men en annen (mindre elegant) metode ville vært:

```Ruby
a = "Yukihiro"
b = "Matsumoto"
puts a + " " + b # Skriver Yukihiro Matsumoto
```

---

## Symboler

Symboler brukes mye i Ruby fordi de er raske og enkle å bruke. Et symbol er som en streng, men er ikke godt egnet til å sette sammen eller endres på. Vi bruker de til å beskrive til i programmet som ikke endrer seg

```Ruby
valg = :ruby
puts "Hei Java" if valg == :java
puts "Hei Ruby" if valg == :ruby
```

Koden over vil skrive ut `Hei Ruby`

---

## Konstanter

Konstanter er som variable, men de skal skrives i store bokstaver.

Når man først har skrevet til en konstant er det ikke mulig å gi den en ny verdi senere.

```Ruby
VIKTIG_VERDI = 49
```

Konstanter brukes for å øke lesbarheten

---

## Konvertere verdier

Men hvis vi bruker `+` må vi passe på at begge verdiene vi skal sette sammen passer sammen.

```Ruby
puts 1 + "10"    # TypeError: String cant be coerced into Fixnum
```

Man kan gjøre en streng om til et heltall ved å bruke metoden `to_i`. Koden over skal skrives på en av disse måtene:

```Ruby
puts "#{1}10"       # Skriver ut 110
puts 1 + "10".to_i  # Skriver ut 11
```

Tilsvarende kan man bruke `to_f` for å konvertere en streng til et desimaltall:

```Ruby
puts 1 + "10.5".to_f  # Skriver ut 11.5
```


---

## Kommunisere med omverdenen

En enkel måte som vi har sett at Ruby scriptet kan kommunisere med omverdenen er å lese og skrive strenger til skjermen. Vi har sett bruk av `puts`, men det finnes også en `gets` som leser fra tastaturet.

```Ruby
puts "Skriv noe"
svar = gets
puts "Du skrev #{svar}"
```

---

## IRB

Et nyttig verktøy som følger med Ruby er `irb`. Her kan du prøve ut Ruby kode og få umiddelbare svar uten å lagre i tekstfil og så kjøre Ruby.

Jeg bruker å ha oppe et vindu med `irb` mens jeg programmerer Ruby og kjører ting der først hvis jeg er i tvil

    $ irb
    irb(main):001:0> r = "Ruby"
    => "Ruby"
    irb(main):002:0> r.upcase
    => "RUBY"
      
`irb` skriver ut svaret fra forrige linje etter `=>`

---

## Noen oppgaver

- Lag et script som spør om navnet og hilser tilbake (Hva heter du? Mats. Hei Matz!). Kall det `hilsing.rb`
- Lag et skript som spør om tre tall og regner ut gjennomsnittet av dem. Kall det `snitt.rb`

---

## Metoder

Alle verdiene i Ruby har metoder. For eksempel på har verdien `"Ruby"` en medode `length` som angir hvor mange tegn den har.

Vi kaller opp metoden ved å sette sammen verdier og metodenavn med et punktum `.`

```Ruby
tekst = "Ruby"
puts tekst.length    # Skriver ut 4
puts "Ruby".length   # ditto
```

En verdi vil ha forskjellige metoder utfra hvilken type verdi det er. For eksempel fil et heltall ha en metode `even?` som sier om det er et partall, mens en streng kan ha en `strip` metode som fjerner blanke tegn.

---

## Metoder med parametre

Noen metoder vil trenge ekstra parametre. Du kan da sette disse etter metodenavnet på denne måten:

```Ruby
tall = 16
tall.div(5)    # Divisjon med hele tall
=> 3
```

I Ruby er det ikke nødvendig å ha parenteser rundt parametrene. Så linjen over kunne like gjerne vært skrevet slik

```Ruby
tall.div 5
=> 3
```

Flere parametre listes opp adskilt av komma

```Ruby
tekst = "Ruby"
tekst.center(30, "_")
=> "_____________Ruby_____________"
```

---

## Betingelser

Vi bruker `if` til å kjøre en kode på en gitt betingelse

```Ruby
if 1 > 10
  puts "En er større en ti???!?"
end
```

Når vi har en `if` blokk rykker vi teksten inn med to mellomrom, så det blir lettere å se hva som passer under `if` setningen. Hvis vi må ha en plan B, kan vi bruke `if` og `else`:

```Ruby
if 1 > 10
  puts "En er større en ti???!?"
else
  puts "En er selvsagt ikke større en ti"
end
```

I Ruby er det bare `false` og `nil` som ikke slår til i en `if` setning.

---

![@tenderlove](http://jc00ke.com/speaking/cascadia-ruby-2012-maglev/lib/assets/tenderlove.jpg)

(Vi tar et avbrekk for en Ruby kjendis)

---

## Looping

For å gjenta en oppgave kan vi bruke looping. Noen eksempler på dette er:

```Ruby
10.times do
  puts "Dette skriver jeg ut ti ganger"
end
```

```Ruby
while 1 > 10 do
  puts "Dette skriver jeg ut til jeg går tom for strøm"
end
```

Den siste kan gjerne skrives slik

```Ruby
loop do
  puts "Dette skriver jeg ut til jeg går tom for strøm"
end


---

## Oppgave: Gjett det hemmelige tallet

- Skriv et program som lager et tilfeldig tall mellom 0 og 9. Spør brukeren hvilket tall det er helt til tallet er gjettet. Avslutt med en gratulasjon.

For å lage tilfeldige tall kan man bruke:

```Ruby
tilfeldig_tall = rand(10)
```


---

## Lister

```Ruby
liste = [1, 2, 3, 4]
dobbel = liste + liste
=> [1, 2, 3, 4, 1, 2, 3, 4]
liste.push(5)                # Obs! listen er forandret
=> [1, 2, 3, 4, 5]
liste
=> [1, 2, 3, 4, 5]
en_tom_liste = []
```

En liste inneholder en rekke verdier. Den første verdien har indeks 0. Du kan bruke indeksen til å hente ut en eller flere verdier

```Ruby
liste = [1, 2, 3, 4]
begynnelsen = liste[0]
=> 1
de_tre_forste = liste[0..2]
=> [1, 2, 3]
```


---

## Each

En grei måte å gjøre noe med alle verdiene i en liste er å bruke `each` metoden.

```Ruby
noen_tall = [4, 6, 8, 10]
sum = 0

noen_tall.each do |tall|
  sum = sum + tall
end

# Når vi kommer hit er sum lik 28
```

---

## Vi sorterer tall

Skriv inn denne (eller improviser litt underveis) og kjør


```Ruby
inntastet = nil
liste = []

while inntastet != -1
  puts "Skriv et positivt heltall og avslutt med -1"
  inntastet = gets.to_i
  if inntastet >= 0
    liste.push(inntastet)
  end
end

sortert = []
while liste.any?
  minste = liste.min
  liste.delete(minste)
  sortert.push(minste)
end

sortert.each do |tall|
  puts tall
end
```

Det fins selvsagt også en `sort` metode for lister `:)`

---

## Hash

I Ruby er en Hash en tabell hvor man slår opp en verdi utfra en nøkkel. Noen eksempler hvor man ville brukt en hash er:

- Slå opp et navn utfra et telefonnummer
- Slå opp et telefonnummer utfra et navn
- Representere noe med faste verdier, f.eks. en bok med tittel, forfatter og antall sider

Hvert oppslag i en Hash vil ha en nøkkel og en verdi. For hver nøkkel finnes bare en verdi (dvs i eksempel nummer to over kan et navn bare knyttes til et telefonnummer.

Nøklene er i Ruby verden ofte symboler.

---

## Hash - telefonlisten

La oss tenke at vi skal lage en søketjeneste som gir telefonnummeret til en person utfra oppgitt navn.

```Ruby
katalog = {}     # start med en tom hash
katalog["Matz"] = "555-555-5555"
katalog["Tenderlove"] = "888-888-8888"
```

Etter å ha bygd opp en litt mer omfattende katalog kan vi nå slå opp nummer

```Ruby
katalog["Matz"]
=> "555-555-5555"
katalog["Yukihiro Matsumoto"]  # finnes ikke
=> nil
```

---

## Hash - boka

Vi kan bygge boka opp slik

```Ruby
bok = {}     # start med en tom hash
bok[:tittel] = "Pride And Prejudice"
bok[:forfatter] = "Jane Austen"
bok[:sideantall] = 397
```

Og så kan vi bruke bok variabelen slik

```Ruby
beskrivelse =  "#{bok[:tittel]} av #{bok[:forfatter]}, #{bok[:sideantall]} sider"
=> "Pride And Prejudice av Jane Austen, 397 sider"
```

---

## Hash - litt andre skrivemåter

Siden hash blir mye brukt i Ruby, finnes noen forenklede varianter å skrive disse inn på. Bok eksempelet kan da gjøres slik

```Ruby
bok = {
  :tittel => "Pride And Prejudice",
  :forfatter => "Jane Austen",
  :sideantall => 397
}
```

Eller også 

```Ruby
bok = {
  tittel: "Pride And Prejudice",
  forfatter: "Jane Austen",
  sideantall: 397
}
```

Den siste varianten fungerer bare når nøklene er symboler.


Og så kan vi bruke bok variabelen slik

```Ruby
beskrivelse =  "#{bok[:tittel]} av #{bok[:forfatter]}, #{bok[:sideantall]} sider"
=> "Pride And Prejudice av Jane Austen, 397 sider"
```


## Flere oppgaver

- Lag en Yatzy som kaster fem terninger og sjekker for hus (tips: bruk `sort` på listen)
- Lag en Yatsy hvor tre spillere kan skrive inn navn og kaste sjanse. Avslutt med å skrive ut hva alle fikk (tips: legg navnene i en liste, og bruk navnet som nøkkel i en tabell med resultater)
- Lag en evig løkke som skriver ut "Matz" som en sinus (tips: Ctrl+C avbryter programmet, bruk koden under for kodebiter)
- Lag kortspillet 21. Spilleren satser en krone og får dobbelt tilbake ved seier. Først skal spilleren velge om han vil ha fler kort. Når han stopper, skal banken legge ut kort til han har fler poeng en spilleren, eller over 21 poeng. Hvis banken går over 21 har spilleren vunnet. For å gjøre det enkelt har kortstokken vår bare kort i en farge med verdier 1 til 10. Spiller fortsetter til spilleren har spilt bort pengene sine. (vanskelig). Bonus: Støtte for fler spillere. Etter at alle spillerene har trekt kort, trekker banken mot alle og stopper på 16 poeng.


```Ruby
s = Math.sin(0.3)   # Sinus til et tall

desimaltall = 55.5
heltall = desimaltall.to_i # runder av til et heltall

innrykk = 10 * " "
puts "#{innrykk}Matz"
```
