# Projekt iz predmeta 'Slučajni procesi u sustavima'

Članovi projektnog tima: Marko Čavužić, Ivan Sinković, Josip Preglej, Dino Cindrić


## Ime projekta

Prepoznavanje i brojanje objekata iz satelitskih snimaka

## Tema i kratki opis projekta

Naš projekt se bavi obradom satelitskih snimaka u svrhu detekcije i brojanja objekata
određenog oblika. Takve snimke često imaju šum koji nastaje kod formiranja slike i predstavlja
problem za daljnje kvalitetno procesiranje te ekstrakciju određenih značajki slike. Kao slučajni
proces promatrat ćemo šum koji nastaje kod formiranja slike, probleme zamućenja i neželjenih
artefakata koji će se ukloniti filtriranjem. Zatim slijedi pretvorba slike u crno bijeli format (gray
scale conversion) i izoštravanje slike tehnikom unsharp masking. Nakon toga je potrebno sliku
podijeliti na segmente koristeći se tehnikom Gaussovskih mješavina te na temelju rezultata
segmentacije provesti brojanje objekata kružnom Hughovom transformacijom.

## Razrada projekta u zadatke

1. Otklanjanje šuma i nepravilnosti na slici
2. Pretvorba u crno-bijeli format i izoštravanje
3. Segmentacija slike
4. Brojanje objekata
5. Analiza rezultata i pisanje izvještaja
6. Izrada prezentacije

## Podjela poslova po članovima tima

| Član tima     | Zadatak |
| ------------- |:-------------:|
| Marko Čavužić      | Segmentacija slike     |
| Ivan Sinković     | Brojanje objekata    |
| Josip Preglej      | Pretvorba u crno-bijeli format i izoštravanje, Pisanje izvještaja, Izrada prezentacije     |
| Dino Cindrić     | Otklanjanje šuma i nepravilnosti na slici, Pretvorba u crno-bijeli format i izoštravanje     |


## Ishod projekta

Glavni cilj projekta jest implementacija funkcionalne metode za prepoznavanje i brojanje
objekata iz satelitskih snimaka


## Reference

* [1] A. Khan, U. Khan, M. Waleed, A. Khan, T. Kamal, S.N. Khan Marwat, M. Maqsood, F. Aadil: "Remote Sensing: An Automated Methodology for Olive Tree Detection and Counting in Satellite Images", 2018. IEEE Access, https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8558485 
