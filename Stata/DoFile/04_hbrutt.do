// Ausgangsdatensatz: hbrutt98.dta, hbrutt00.dta
// Enddatensatz:      hbrutt98_mig.dta, hbrutt00_mig.dta, Wide-Format
// Variablen:         hhnr, hhnr1998, hhnr2000, sexhv1998, sexhv2000, nathv1998, nathv2000

******************************
***** Grundeinstellungen *****
******************************

display "$S_DATE $S_TIME"
clear all                                                                        //Arbeitsspeicher reinigen
macro drop _all                                                                  // alle Makros loeschen
version 10.1                                                                     // Version einlesen
capture log close                                                                // falls Log-Files offen sind schliessen, ansonsten Fehlermeldung unterdruecken
set more off, perm                                                               // Ergebnisse ohne Unterbrechung am Seitenende durchlaufen lassen
set scrollbufsize 500000                                                         // Rueckschau erweitern
set memory 500m, perm                                                            // Arbeitsspeicher erweitern
set dp comma                                                                     // Bei Dezimalzahlen Kommas anstelle von Punkten verwenden
numlabel, add                                                                    // Kategoriennr. anzeigen
capture net install st0085_1.pkg
capture ssc install soepren

***********************************
***** Verzeichnisse festlegen *****
***********************************
// Globals Melanie
	global dir= "L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/"                 // Arbeitsverzeichnis der relginaldatensaetze 
	global AVZ= "L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
	global temp="L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" //Temporaerer Arbeitsspeicher
	global LoFi="L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" // Ordner fuer Log-Files
	global DoFi="L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" // Ordner fuer Do-Files 

// Globals Joerg
	global dir= "/home/Knut/Documents/UniGoettingen/SOEP2010/"                               // Arbeitsverzeichnis der Originaldatensaetze 
	global AVZ= "/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/"      // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
	global temp="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" //Temporaerer Arbeitsspeicher
	global LoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" // Ordner fuer Log-Files
	global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" // Ordner fuer Do-Files 


*************************************************
***** 04_hbrutt.do ******************************
*************************************************
* bisher auch noch nicht verwendet!

// hbrutt98.dta und hbrutt00.dta koennen erst spaeter zusammengefuehrt werden, da es sich um Haushaltsdaten handelt, die keine 'persnr' besitzen


***hbrutt98.dta***
cd ${dir}
use hbrutt98.dta, clear

keep hhnr ?hhnr nathv sexhv
rename nathv nathv1998
rename sexhv sexhv1998
rename ohhnr hhnr1998 // Notwendig, aufgrund bioimmig (siehe 1.6)

* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)   // deprecated 14.12.11

isid hhnr hhnr1998 // hhnr und hhnr15 sind eindeutige Identifikationsvariable
sort hhnr hhnr1998

save ${AVZ}hbrutt98_mig.dta, replace



***hbrutt00.dta***
cd ${dir}
use hbrutt00.dta, clear

keep hhnr ?hhnr nathv sexhv
rename nathv nathv2000
rename sexhv sexhv2000
rename qhhnr hhnr2000 // Notwendig, aufgrund bioimmig (siehe 1.6)

* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)  // deprecated 14.12.11

isid hhnr hhnr2000 // hhnr und hhnr17 sind eindeutige Identifikationsvariable
sort hhnr hhnr2000

***Rekodiere Missings*
mvdecode hhnr2000 sexhv2000 nathv2000, mv(-3 -2 -1)

save ${AVZ}hbrutt00_mig.dta, replace
