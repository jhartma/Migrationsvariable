// Ausgangsdatensatz: ppfad_mig.dta, pgen_mig.dta, germ_sbs.dta, kind_mig.dta,
//                    bioparen_mig.dta, elternzeiger2.dta, melanie_jugendliche_recoded.dta, bioimmig_mig.dta, hbrutt98_mig.dta, hbrutt00_mig.dta
// Enddatensatz:      miggen_merged.dta
// Variablen:         persnr, sex, biimgrp, corigin, deu_seit, gebjahr, gebmoval, germ_since, 
//                    immiyear, germborn, germnatbirth, gm_m, gm_v, gv_m, gv_v, hhnr, m_persnr, m_quelle, maortakt, maortup, mgebj, migback, mnat
//                    nathv1998, nathv2000, nation, nationkind1984, nationkind1989, v_persnr, vaortakt, vaortup, vgebj, vnat
//                    biimgrp1984 - biimgrp2010,
//                    biresper1984 - biresper2010,
//                    living1 - living7,
//                    nation1984 - nation2000,

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



***Merge-Prozess mit denjenigen Datensaetzen, deren eindeutige Identifikationsvariable 'persnr' ist***
cd ${AVZ}
use ppfad_mig.dta, clear

sort persnr
merge persnr using pgen_mig.dta
drop _merge

sort persnr
merge persnr using germ_sbs.dta
drop _merge

sort persnr
merge persnr using kind_mig.dta
drop _merge

sort persnr
merge persnr using p_mig.dta
drop _merge

sort persnr 
merge persnr using bioparen_mig.dta
drop _merge

sort persnr
merge persnr using elternzeiger2.dta
drop _merge

sort persnr
merge persnr using melanie_jugendliche_recoded.dta 
drop _merge

sort persnr
merge persnr using melanie_jugendliche_eltern.dta 
drop _merge

sort persnr 
merge persnr using bioimmig_mig.dta
drop _merge


***Merge-Prozess von Personen- und Haushaltsdaten; Analyseeinheit: Personen***
sort hhnr hhnr1998 
merge hhnr hhnr1998 using hbrutt98_mig.dta
drop _merge

sort hhnr hhnr2000
merge hhnr hhnr2000 using hbrutt00_mig.dta
drop _merge

***Speicherung des Datensatzes unter migra.dta***
sort persnr 
save ${AVZ}miggen_merged.dta, replace
