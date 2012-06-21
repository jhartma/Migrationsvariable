// Ausgangsdatensatz: bioparen.dta
// Enddatensatz:      bioparen_mig.dta, Wide-Format
// Variablen:         vnat, mnat, vgebj, mgebj, vaortakt, maortakt, vaortup, maortup, living1 bis living7, persnr, hhnr 
      

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
***** 06_bioimmig.do ****************************
*************************************************
* mnat und vnat umbenennen in nation_* und gebj auchn!

use ${dir}/bioparen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep vnat mnat vgebj mgebj vaortakt maortakt vaortup maortup living* persnr hhnr 

mvdecode *, mv(-3 -2 -1)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}bioparen_mig.dta, replace
