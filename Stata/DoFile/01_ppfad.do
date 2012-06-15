// Ausgangsdatensatz: ppfad.dta
// Enddatensatz:      ppfad_mig.dta, Wide-Format
// Variablen:         persnr, corigin, gebjahr, gebmoval, germborn, immiyear, migback, sex, hhnr
//                    hhnr1984, hhnr1985, hhnr1986, hhnr1987, hhnr1988, hhnr1989, hhnr1990,     
//                    hhnr1991, hhnr1992, hhnr1993, hhnr1994, hhnr1995, hhnr1996, hhnr1997,
//                    hhnr1992, hhnr1993, hhnr1994, hhnr1995, hhnr1996, hhnr1997, hhnr1998,
//                    hhnr1999, hhnr2000, hhnr2001, hhnr2002, hhnr2003, hhnr2004, hhnr2005,
//                    hhnr2006, hhnr2007, hhnr2008, hhnr2009, hhnr2010

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
***** 01_ppfad.do *******************************
*************************************************
use ${dir}ppfad.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr persnr sex gebmoval gebjahr *hhnr immiyear germborn corigin migback

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v) // deprecated 14.12.11

soepren ahhnr bhhnr chhnr dhhnr ehhnr fhhnr ghhnr hhhnr ihhnr jhhnr khhnr lhhnr mhhnr nhhnr ohhnr phhnr qhhnr rhhnr shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr bahhnr, newstub(hhnr) waves (1984/2010)   

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}ppfad_mig.dta, replace
