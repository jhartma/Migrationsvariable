// Ausgangsdatensatz: bioimmig.dta
// Enddatensatz:      bioimmig_mig.dta, Wide-Format
// Variablen:         persnr, hhnr1984 bis hhnr2010, 
//                    biresper1984 bis biresper2010,
//                    biimgrp1984 bis biimgrp2010        

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
use ${dir}/bioimmig.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep biimgrp biresper persnr hhnr erhebj

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)  // deprecated 14.12.11

***Formataenderung (vom Long-Format ins Wide-Format); Dieser Schritt ist fuer die nachfolgenden Analysen wichtig***
reshape wide biimgrp biresper hhnr, i(persnr) j(erhebj)
isid persnr // Ueberpruefung, persnr ist jetzt die eindeutige Identifikationsvariable

*soepren hhnr1984 hhnr1985 hhnr1986 hhnr1987 hhnr1988 hhnr1989 hhnr1990 hhnr1991 hhnr1992 hhnr1993 hhnr1994 hhnr1995 hhnr1996 hhnr1997 hhnr1998 hhnr1999 hhnr2000 hhnr2001 hhnr2002 hhnr2003 hhnr2004 hhnr2005 hhnr2006 hhnr2007 hhnr2008 hhnr2009 hhnr2010, newstub(hhnr) waves (1984/2010)   
*soepren biresper1984 biresper1985 biresper1986 biresper1987 biresper1988 biresper1989 biresper1990 biresper1991 biresper1992 biresper1993 biresper1994 biresper1995 biresper1996 biresper1997 biresper1998 biresper1999 biresper2000 biresper2001 biresper2002 biresper2003 biresper2004 biresper2005 biresper2006 biresper2007 biresper2008 biresper2009 biresper2010, newstub(biresper) waves (1984/2010)  
*soepren biimgrp1984 biimgrp1985 biimgrp1986 biimgrp1987 biimgrp1988 biimgrp1989 biimgrp1990 biimgrp1991 biimgrp1992 biimgrp1993 biimgrp1994 biimgrp1995 biimgrp1996 biimgrp1997 biimgrp1998 biimgrp1999 biimgrp2000 biimgrp2001 biimgrp2002 biimgrp2003 biimgrp2004 biimgrp2005 biimgrp2006 biimgrp2007 biimgrp2008 biimgrp2009 biimgrp2010, newstub(biimgrp) waves (1984/2010)  

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr

***Rekodiere Missings***
mvdecode hhnr* biresper* biimgrp*,mv(-3 -2 -1)

save ${AVZ}bioimmig_mig.dta, replace

