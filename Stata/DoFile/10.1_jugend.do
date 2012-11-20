// 1. Ausgangsdatensatz (?): BIOAGE17; $PAGE17; PPFAD; BIOIMMIG; Bioimmig
// 2. Ausgangsdatensatz (?): BIOAGE17; $PAGE17; P und PGEN
// Enddatensatz: Melanie_jugendliche.dta; Melanie_jugendliche_recoded.dta (Fälle ab einschließlich 2006; Querschnittsdatensatz)
// Variablen (Melanie_jugendliche recoded):  nation*; deu_seit*; nation2_j*; nation_j*

******************************
***** Grundeinstellungen *****
******************************

display "$S_DATE $S_TIME"
clear all //Arbeitsspeicher reinigen
macro drop _all // alle Makros loeschen
version 10.1 // Version einlesen
capture log close // falls Log-Files offen sind schliessen, ansonsten Fehlermeldung unterdruecken
set more off, perm // Ergebnisse ohne Unterbrechung am Seitenende durchlaufen lassen
set scrollbufsize 500000 // Rueckschau erweitern
set memory 500m, perm // Arbeitsspeicher erweitern
set dp comma // Bei Dezimalzahlen Kommas anstelle von Punkten verwenden
numlabel, add // Kategoriennr. anzeigen
capture net install st0085_1.pkg
capture ssc install soepren

***********************************
***** Verzeichnisse festlegen *****
***********************************
// Globals Melanie
global dir= "L:/_Arbeit/_Diss/_Diss_Daten/SOEP/SOEP27/" // Arbeitsverzeichnis der relginaldatensaetze
global AVZ= "L:/_Arbeit/_Diss/_Diss_Daten/SOEP/SOEP27/Datensätze_Mig/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="L:/_Arbeit/_Diss/_Diss_Daten/SOEP/SOEP27/Datensätze_Mig/" //Temporaerer Arbeitsspeicher
global LoFi="L:/_Arbeit/_Diss/_Diss_Daten/SOEP/SOEP27/Datensätze_Mig/" // Ordner fuer Log-Files
global DoFi="L:/_Arbeit/_Diss/_Diss_Daten/SOEP/SOEP27/Datensätze_Mig/" // Ordner fuer Do-Files

// Globals Joerg
global dir= "/home/Knut/Documents/UniGoettingen/SOEP2010/" // Arbeitsverzeichnis der Originaldatensaetze
global AVZ= "/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" //Temporaerer Arbeitsspeicher
global LoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" // Ordner fuer Log-Files
global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/DoFile/" // Ordner fuer Do-Files




*************************************************************
***** 1.11 Aufbereitung Jugenddatensatz Melanie *************
*************************************************************

*****************************************************************************************************************
*** 1. Prüfen, ob Mig-Infos auch in PPFAD und BIOIMMIG enthalten sind - Masterdatensatz: Melanie_jugendliche.dta
*****************************************************************************************************************

*****************************************************************************************
*** $PAGE17: Informationen zur Bestimmung Generationenstatus Jugendlicher (seit 2006) ***
*****************************************************************************************

cd ${dir}
use ${dir}wpage17.dta, clear

* Beibehaltung ausgewaehlter Variablen***
keep wj6001 wj6002 wj61 wj6201 wj63 wj64 wj65 wj67 wj6601 wj6602 wj6801 wj69 persnr hhnr
sort persnr

* Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen*** /// 2010er jetzt auch enthalten
cd ${dir}
foreach file in xpage17.dta ypage17.dta zpage17.dta bapage17.dta{
merge 1:1 persnr using "`file'", keepusing (hhnr *j6001 *j6002 *j61 *j62 *j63 *j64 *j65 *j67 *j6601 *j6602 *j68 *j69)
drop _merge
quietly: compress
}


* Umbennenung ausgewaehlter Variablen***
soepren wj6001 xj6001 yj6001 zj6001 baj6001, newstub(gebjahr_j) waves (23/27) // Eigentlich brauch man doch die Jahresinfo bei den unverÃ¤nderlichen Sachen nicht, da es Querschnittsdaten sind
soepren wj6002 xj6002 yj6002 zj6002 baj6002, newstub(gebmoval_j) waves (23/27)
soepren wj61 xj61 yj61 zj61 baj61, newstub(germborn_j) waves (23/27)
soepren wj6201 xj62 yj62 zj62 baj62, newstub(corigin_j) waves (23/27)
soepren wj63 xj63 yj63 zj63 baj63, newstub(immiyear_j) waves (23/27)
soepren wj64 xj64 yj64 zj64 baj64, newstub(biimgrp_j) waves (23/27)
soepren wj65 xj65 yj65 zj65 baj65, newstub(nation_deu_j) waves (23/27) // Wie kann/soll mit der Nation-Info bei den Jugendlichen umgegangen werden?
soepren wj67 xj67 yj67 zj67 baj67, newstub(deu_seit_j) waves (23/27)
soepren wj6601 xj6601 yj6601 zj6601 baj6601, newstub(d_nation2_j) waves (23/27) // Wie Umgang mit zweiter SBS? Damit zusammenhÃ¤ngend grundsÃ¤tzliche Frage, wie mit zeitverÃ¤nderlicher Info umgegangen werden soll?
soepren wj6602 xj6602 yj6602 zj6602 baj6602, newstub(nation2_j) waves (23/27)
soepren wj6801 xj68 yj68 zj68 baj68, newstub(nation_j) waves (23/27)
soepren wj69 xj69 yj69 zj69 baj69, newstub(biresper_j) waves (23/27)


* Reduzierten Datensatz speichern
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}page17_mig.dta, replace


***********************************************************************************
*** PPFAD: Hintergrundinformationen zum Jugendlichen (bis einschliesslich 2005) ***
***********************************************************************************

use ${dir}ppfad.dta, clear

* Beibehaltung ausgewaehlter Variablen***
keep hhnr persnr sex gebmoval gebjahr immiyear germborn corigin

* Reduzierten Datensatz speichern
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}ppfad_mig_j.dta, replace




****************************************************************************
*** BIOIMMIG: Infos fÃ¼r die Jahre 2000-2005 enthalten; danach im $PAGE17 ***
****************************************************************************

use ${dir}bioimmig.dta, clear


***Beibehaltung ausgewaehlter Variablen***
keep biimgrp biresper persnr hhnr erhebj

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v) // deprecated 14.12.11

***Formataenderung (vom Long-Format ins Wide-Format); Dieser Schritt ist fuer die nachfolgenden Analysen wichtig***
reshape wide biimgrp biresper hhnr, i(persnr) j(erhebj)
isid persnr // Ueberpruefung, persnr ist jetzt die eindeutige Identifikationsvariable

drop hhnr1984 hhnr1985 hhnr1986 hhnr1987 hhnr1988 hhnr1989 hhnr1990 hhnr1991 hhnr1992 hhnr1993 hhnr1994 hhnr1995 hhnr1996 hhnr1997 hhnr1998 hhnr1999 biresper1984 ///
biresper1985 biresper1986 biresper1987 biresper1988 biresper1989 biresper1990 biresper1991 biresper1992 biresper1993 biresper1994 biresper1995 biresper1996 biresper1997 ///
biresper1998 biresper1999 biimgrp1984 biimgrp1985 biimgrp1986 biimgrp1987 biimgrp1988 biimgrp1989 biimgrp1990 biimgrp1991 biimgrp1992 biimgrp1993 biimgrp1994 biimgrp1995 ///
biimgrp1996 biimgrp1997 biimgrp1998 biimgrp1999


soepren hhnr2000 hhnr2001 hhnr2002 hhnr2003 hhnr2004 hhnr2005 hhnr2006 hhnr2007 hhnr2008 hhnr2009 hhnr2010, newstub(hhnr) waves (17/27)
soepren biresper2000 biresper2001 biresper2002 biresper2003 biresper2004 biresper2005 biresper2006 biresper2007 biresper2008 biresper2009 biresper2010, newstub(biresper) waves (17/27)
soepren biimgrp2000 biimgrp2001 biimgrp2002 biimgrp2003 biimgrp2004 biimgrp2005 biimgrp2006 biimgrp2007 biimgrp2008 biimgrp2009 biimgrp2010, newstub(biimgrp) waves (17/27)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}bioimmig_mig_j.dta, replace



*******************************************
*** BILDUNG MASTERDATENSATZ Jugendliche ***
*******************************************

* Oeffnen des Masterdatensatzes
use ${dir}bioage17.dta, clear
keep hhnr hhnrakt persnr bymnr byvnr erhebj

save ${AVZ}Melanie_jugendliche_ma.dta, replace // kurzer DS wird für die Infos von Jugengendlichen zu ihren Eltern benötigt


* Ranspielen Infos fuer Kind aus PAGE17
merge m:1 persnr using ${AVZ}page17_mig.dta 
tab _merge
drop _merge

* Ranspielen Infos fuer Kind aus PPFAD
sort persnr
merge m:1 persnr using ${AVZ}ppfad_mig_j.dta
tab _merge
drop if _merge==2
drop _merge

* Ranspielen Infos fuer Kind aus BIOIMMIG
sort persnr
merge m:1 persnr using ${AVZ}bioimmig_mig_j.dta


tab _merge
drop if _merge==2
drop _merge


save ${AVZ}Melanie_jugendliche.dta, replace


**********************************************************
* Pruefen, ob Infos aus PAGE17-Daten in PPFAD und BIOIMMIG
**********************************************************

* Pruefen, ob Geburtslandinfos aus $PAGE in der PPFAD-Info enthalten ist

tab germborn, m
tab germborn germborn_j23
tab germborn germborn_j24
tab germborn germborn_j25
tab germborn germborn_j26
tab germborn germborn_j27

*** Ja, Infos sind in PPFAD-Daten enthalten
* wobei Abweichungen (in 25 (1 x J: Ausland; PPFAD: Deutschland))

tab corigin_j25 germborn_j25 // 1 x Deutschland!!!!!!!!!!!
tab corigin if corigin_j25==1 // der deutsche Fall hat dann bei CORIGIN Schweiz

tab corigin_j25 germborn_j25 if germborn_j25==3 & germborn==1 // in J und PPFAD abweichender Fall hat aber Ex-Jugoslawien bei corigin!
tab corigin if germborn_j25==3 & germborn==1 // in PPFAD dann aber Deutschland



* wobei Abweichungen (in 26 (1 x J: Ausland; PPFAD: -1) 1 x (J: Ausland; PPFAD: Deutschland))
tab corigin_j26 germborn_j26
tab corigin if germborn_j26==3 & germborn==-1 
tab corigin_j26 if germborn_j26==3 & germborn==-1 // J hat Holland angegeben

tab corigin if germborn_j26==3 & germborn==1


* wobei Abweichungen (in 27 (1 x J: -1 und PPFAD: 1)) 
tab corigin_j27 germborn_j27
tab corigin if germborn_j27==-1 & germborn==1




**********************************************************************
* Pruefen, ob corigin-Infos aus $PAGE in PPFAD-corigin enthalten sind

tab corigin, m
tab corigin corigin_j23
tab corigin corigin_j24
tab corigin corigin_j25
tab corigin corigin_j26
tab corigin corigin_j27

*** Ja, Infos sind enthalten, wobei Abweichungen --> Warum?
*** --> corigin aus PPFAD kann grundsaetzlich genutzt werden




**************************************************************
* Pruefen, ob immiyearinfos aus $PAGE auch bei PPFAD enthalten

tab immiyear, m
tab immiyear immiyear_j23
tab immiyear immiyear_j24
tab immiyear immiyear_j25
tab immiyear immiyear_j26
tab immiyear immiyear_j27

*** Ja, Info ist enthalten, wobei teilweise Abweichungen (23; 24; 25; 26) --> Warum?
*** --> immiyear aus PPFAD kann grundsaetzlich genutzt werden



***************************************************************************************
* Prüfen, ob biimgrp-Info aus PAGE auch in BIOIMMIG enthalten ist --> Ja, ist enthalten

tab biimgrp17
tab biimgrp17 if germborn==2
tab biimgrp17 if germborn==1

tab biimgrp18
tab biimgrp18 if germborn==2, m
tab biimgrp18 if germborn==1

tab biimgrp19
tab biimgrp19 if germborn==2, m

tab biimgrp20
tab biimgrp20 if germborn==2, m

tab biimgrp21
tab biimgrp21 if germborn==2, m

tab biimgrp22
tab biimgrp22 if germborn==2, m


tab biimgrp23 biimgrp_j23
tab biimgrp_j23, m

tab biimgrp24 biimgrp_j24
tab biimgrp_j24, m

tab biimgrp25 biimgrp_j25
tab biimgrp_j25, m

tab biimgrp26 biimgrp_j26
tab biimgrp_j26, m

tab biimgrp27 biimgrp_j27
tab biimgrp_j27, m




*****************************************************************************************
* Prüfen, ob biresper-Info aus PAGE auch in BIOIMMIG enthalten ist --> Ja, ist enthalten

tab biresper17
tab biresper17 if germborn==2

tab biresper18
tab biresper18 if germborn==2

tab biresper19
tab biresper19 if germborn==2

tab biresper20
tab biresper20 if germborn==2

tab biresper21
tab biresper21 if germborn==2

tab biresper22
tab biresper22 if germborn==2


tab biresper23 biresper_j23
tab biresper_j23, m

tab biresper24 biresper_j24, m
tab biresper_j24, m

tab biresper25 biresper_j25, m
tab biresper_j25, m

tab biresper26 biresper_j26, m
tab biresper_j26, m

tab biresper27 biresper_j27, m
tab biresper_j27, m


******************************************************************************************************************************************************
*** FAZIT: Infos sind im PPFAD bzw. in BIOIMMIG enthalten und kÃ¶nnen genutzt werden (teils Abweichungen, aber wir vertrauen einfach mal dem SOEP ...)
******************************************************************************************************************************************************










**************************************************************************************************
*** 2. Pruefen, wie Nation-Infos verteilt sind - gekuerzter Masterdatensatz: Melanie_jugendliche.dta
**************************************************************************************************


* 1. Schritt: Reduzierung Datensatz
***********************************

keep persnr erhebj nation_deu_j* deu_seit_j* d_nation2_j* nation2_j* nation_j*
save ${AVZ}melanie_jugendliche.dta, replace



* 2. Schritt: Infos aus PGEN hinzuspielen
*****************************************

cd ${dir}
use qpgen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep persnr nation* 
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
foreach file in rpgen.dta spgen.dta tpgen.dta upgen.dta vpgen.dta wpgen.dta xpgen.dta ypgen.dta zpgen.dta bapgen.dta {
  merge persnr using "`file'", sort keep (nation*)
  	drop _merge
	quietly: compress
}

***Umbennenung ausgewaehlter Variablen***
soepren nation00 nation01 nation02 nation03 nation04 nation05 nation06 nation07 nation08 nation09 nation10, newstub(nation) waves (2000/2010)  

*** Rekodiere Missings***
mvdecode nation*, mv(-3 -2 -1)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}pgen_mig_j.dta, replace


*** Mergen des Datensatzes
cd ${AVZ}
use melanie_jugendliche.dta, clear

merge m:1 persnr using ${AVZ}pgen_mig_j.dta // fuer 5 Faelle keine Infos im Using 
tab erhebj _merge // Diese 5 Faelle verteilen sich auf das Erhebungsjahr 2004 und 2005 --> Wie ist das moeglich?
drop if _merge==2
drop _merge
save ${AVZ}melanie_jugendliche.dta, replace




* 3. Schritt: Infos aus P hinzuspielen
***************************************

* Seit wann dt. Staatsangehörigkeit?
	
cd ${dir}
use sp.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep persnr sp116
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
merge persnr using ${dir}tp.dta, sort keep (persnr tp124)
drop _merge

merge persnr using ${dir}up.dta, sort keep (persnr up128)
drop _merge

merge persnr using ${dir}vp.dta, sort keep (persnr vp137)
drop _merge

merge persnr using ${dir}wp.dta, sort keep (persnr wp129)
drop _merge

merge persnr using ${dir}xp.dta, sort keep (persnr xp141)
drop _merge

merge persnr using ${dir}yp.dta, sort keep (persnr yp139)
drop _merge

merge persnr using ${dir}zp.dta, sort keep (persnr zp139)
drop _merge

merge persnr using ${dir}bap.dta, sort keep (persnr bap137)
drop _merge

***Umbennenung ausgewaehlter Variablen***
soepren sp116 tp124 up128 vp137 wp129 xp141 yp139 zp139 bap137, newstub(deu_seit) waves (2002/2010)  

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v) // deprecated 14.12.11

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}p_mig_j.dta, replace


*** Mergen des Datensatzes
cd ${AVZ}
use melanie_jugendliche.dta, clear

merge m:1 persnr using ${AVZ}p_mig_j.dta // für 451 Fälle keine Infos aus dem Using-DS; 3228 Matches
tab erhebj _merge // 451 Fälle verteilen sich auf alle Ehrebungsjahre mit Ausnahme von 2002 und 2003
drop if _merge==2
drop _merge
save ${AVZ}melanie_jugendliche.dta, replace




* 4. Abgleich
*************
* Ist die Nation-Info aus PAGE17 in den PGEN-Daten enthalten (und wenn ja, stimmt sie mit den Angaben im Jugendfragebogen überein?)
***********************************************************************************************************************************

tab nation2000 // Insgesamt 495 Angaben, aber nur 232 Jugendliche im Jahr 2000 befragt --> Wie ist das möglich?
tab nation2000 if erhebj==2000, m // Für alle 232 Fälle Angabe
tab erhebj

tab nation2001 // Wie können hier 825 Fälle sein, obwohl es nur 618 Befragte 2001 gab? Sind die aus 2000 auch dabei? --> Ja!
tab nation2001 if erhebj==2001, m // 6 Sysmis bei den 2001-Befragten
tab nation2001 if erhebj==2000 | erhebj==2001, m // 25 Sysmis (19 davon MÜSSEN 2000-Befragte sein)
tab erhebj

tab nation2002 // 1064 Fälle; 352 Jugendliche in 2002 befragt
tab nation2002 if erhebj==2002, m //6 Sysmis
tab nation2002 if erhebj==2000 | erhebj==2001 | erhebj==2002, m // 138 Sysmis
tab erhebj

tab nation2003 // 1310 Fälle; 365 Jugendliche in 2003 befragt
tab nation2003 if erhebj==2003, m //2 Sysmis
tab nation2003 if erhebj==2000 | erhebj==2001 | erhebj==2002 | erhebj==2003, m // 257 Sysmis
tab erhebj

tab nation2004 // 1561 Fälle; 373 Jugendliche 2004 befragt
tab nation2004 if erhebj==2004, m //7 Sysmis
tab nation2004 if erhebj==2000 | erhebj==2001 | erhebj==2002 | erhebj==2003 | erhebj==2004, m // 380 Sysmis
tab erhebj

tab nation2005 // 1788 Fälle; 368 Jugendliche 2005 befragt
tab nation2005 if erhebj==2005, m //2 Sysmis
tab nation2005 if erhebj==2000 | erhebj==2001 | erhebj==2002 | erhebj==2003 | erhebj==2004 | erhebj==2005, m // 520 Sysmis
tab erhebj

tab nation2006 // 1890 Fälle; 307 Jugendliche 2006 befragt
tab nation2006 if erhebj==2006, m // 1 Sysmis
tab nation2006 if erhebj==2000 | erhebj==2001 | erhebj==2002 | erhebj==2003 | erhebj==2004 | erhebj==2005 | erhebj==2006, m // 725 Sysmis
tab erhebj
* Stimmen Codes aus den PAGE-Daten mit denen in PGEN überein? --> Ja
tab nation2006 nation_j23 if erhebj==2006, m 


tab nation2007 // 2042 Fälle; 346 Jugendliche 2007 befragt
tab nation2007 if erhebj==2007, m // kein Sysmis
tab nation2007 if erhebj==2001 | erhebj==2000 | erhebj==2002 | erhebj==2003 | erhebj==2004 | erhebj==2005 | erhebj==2006 | erhebj==2007, m // 919 Sysmis
tab erhebj
* Stimmen Codes aus den PAGE-Daten mit denen in PGEN überein? --> Ja
tab nation2007 nation_j24 if erhebj==2007, m 


tab nation2008 // 2054 Fälle; 261 Jugendliche 2008 befragt
tab nation2008 if erhebj==2008, m // kein Sysmis
tab nation2008 if erhebj==2001 | erhebj==2000 | erhebj==2002 | erhebj==2003 | erhebj==2004 | erhebj==2005 | erhebj==2006 | erhebj==2007 | erhebj==2008, m // 1168 Sysmis
tab erhebj
* Stimmen Codes aus den PAGE-Daten mit denen in PGEN überein? --> NUR TEILWEISE
tab nation2008 nation_j25 if erhebj==2008, m // 1 x: PGEN: Russland und in PAGE17 "Ex-Jugoslawien" // 1 x PGEN: Irak und PAGE17: Spanien // 1 x PGEN: Bosnien/Herzegowina und PAGE17: Benelux


tab nation2009 // 2060 Fälle; 243 Jugendliche 2009 befragt
tab nation2009 if erhebj==2009, m // kein Sysmis
tab nation2009 if erhebj==2001 | erhebj==2000 | erhebj==2002 | erhebj==2003 | erhebj==2004 | erhebj==2005 | erhebj==2006 | erhebj==2007 | erhebj==2008 | erhebj==2009, m // 1405 Sysmis
tab erhebj
* Stimmen Codes aus den PAGE-Daten mit denen in PGEN überein? --> Ja
tab nation2009 nation_j26 if erhebj==2009, m 


tab nation2010, m // 1982 Fälle; 1697 Missings; 214 Jugendliche 2010 befragt
tab nation2010 if erhebj==2010, m // kein Sysmis
tab erhebj
* Stimmen Codes aus den PAGE-Daten mit denen in PGEN überein? --> Ja
tab nation2010 nation_j27 if erhebj==2010, m 



*** FAZIT 1: Staatsbürgerschaft-Infos zu den Jugendlichen sind in den PGEN-Daten enthalten (seit 2000)!
*** FAZIT 2: Angaben zur zweiten SBS ABER NICHT (seit 2006 in den PAGE17-Daten)
* HINWEIS: Wie erfolgt die Abfrage der SBS im Jugend-FB: 
*** Haben Sie heute die deutsche SBS? --> Ja --> Haben Sie neben der deutschen eine zweite SBS --> Ja --> Welche --> Deutsche SBS seit Geburt oder später?
*** Haben Sie heute die deutsche SBS? --> Ja --> Haben Sie neben der deutschen eine zweite SBS --> Nein --> Deutsche SBS seit Geburt oder später?
*** Haben Sie heute die deutsche SBS? --> Nein --> Welche SBS haben Sie? --> Frage zur Aufenthaltserlaubnis
* Folgende Vars werden gekeept:  d_nation2_j* und  nation2_j*



* Ist die Info zum Einbürgerungsjahr in den P-Daten enthalten?
**************************************************************
tab erhebj
tab deu_seit_j23
tab deu_seit_j24 
tab deu_seit_j25 
tab deu_seit_j26 
tab deu_seit_j27

tab deu_seit2002 // N=1064
tab erhebj deu_seit2002, m 

tab deu_seit2003 // N=1310 
tab erhebj deu_seit2003, m 

tab deu_seit2004 // N=1561
tab erhebj deu_seit2004, m 

tab deu_seit2005 // N=1788
tab erhebj deu_seit2005, m 


tab deu_seit2006 // N=1584 --> N stimmt nicht mit N bei Nation aus PGEN überein
tab deu_seit2006  deu_seit_j23 if erhebj==2006, m // no observations
tab erhebj deu_seit2006, m // für das Jahr keine Infos enthalten


tab deu_seit2007 // N=1696 --> N stimmt nicht mit N bei Nation aus PGEN überein
tab deu_seit2007  deu_seit_j24 if erhebj==2007, m // no observations
tab erhebj deu_seit2007, m // für das Jahr keine Infos enthalten, aber dafür für das Jahr 2006?
tab deu_seit2007  deu_seit_j23 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!


tab deu_seit2008 // N=1793 --> N stimmt nicht mit N bei Nation aus PGEN überein
tab deu_seit2008  deu_seit_j25 if erhebj==2008, m // no observations
tab erhebj deu_seit2008, m // für die Jahre 2008 keine Infos enthalten, aber dafür für das Jahr 2007
tab deu_seit2008  deu_seit_j24 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!


tab deu_seit2009 // N=1817 --> N stimmt nicht mit N bei Nation aus PGEN überein
tab deu_seit2009  deu_seit_j26 if erhebj==2009, m // no observations
tab erhebj deu_seit2009, m // für die Jahre 2009 keine Infos enthalten, aber für das Vorjahr ...
tab deu_seit2009  deu_seit_j25 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!


tab deu_seit2010 // N=1768 --> N stimmt nicht mit N bei Nation aus PGEN überein
tab deu_seit2010  deu_seit_j27 if erhebj==2010, m // no observations
tab erhebj deu_seit2010 // für die Jahre 2010 keine Infos enthalten, aber fürs Vorjahr ...
tab deu_seit2010  deu_seit_j26 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!



*** FAZIT: Info, ob deutsche SBS seit Geburt vorliegt oder nicht, findet sich ebenfalls in den P-Daten, allerdings:
*** a. Es gibt Abweichungen zwischen den PAGE17-Angaben und den bei P enthaltenen Infos (2008)
*** b. Infos, die seit dem FB 2006 erhoben werden, sind immer nur für das Folgejahr in P zugespielt (heißt: PAGE 17 2006 --> P 2007)
*** KONSEQUENZEN: Abgleich noch notwendig, ob 2010er-Info zugespielt werden kann (Stimmen Angaben zur SBS (P) dann mit Infos, ob seit Geburt oder nicht (PAGE17) überein? Notwendig, da Abweichungen zwischen P und PAGE17 ...


/*
* HINWEIS: Darauf wird nun verzichtet! Es werden die Infos aus der Jugendbefragung zur SBS und ob diese seit Geburt vorliegt genommen (Fälle seit 2006)

* Vornehmen der Anpassung
*************************
tab deu_seit2007  deu_seit_j23 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!
replace deu_seit2006=deu_seit2007 if erhebj==2006 & deu_seit2006==.
tab deu_seit2006 deu_seit_j23
tab deu_seit2006 deu_seit_j23, m 

tab deu_seit2008  deu_seit_j24 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!
replace deu_seit2007=deu_seit2008 if erhebj==2007 & deu_seit2007==.
tab deu_seit2007 deu_seit_j24
tab deu_seit2007 deu_seit_j24, m

tab deu_seit2009  deu_seit_j25 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!
replace deu_seit2008=deu_seit2009 if erhebj==2008 & deu_seit2008==.
tab deu_seit2008 deu_seit_j25
tab deu_seit2008 deu_seit_j25, m

tab deu_seit2010  deu_seit_j26 // Tatsächlich!!! Die Infos sind immer für das Folgejahr enthalten, aber Abweichungen (mal wieder ...)!!!!!
replace deu_seit2009=deu_seit2010 if erhebj==2009 & deu_seit2009==.
tab deu_seit2009 deu_seit_j26
tab deu_seit2009 deu_seit_j26, m

tab deu_seit2010 if erhebj==2010
replace deu_seit2010=deu_seit_j27 if erhebj==2010 & deu_seit2010==.
*/


* Bildung des End-Datensatzes
*****************************
* Beibehaltung derjenigen Fälle, auf die das zutrifft
*****************************************************
keep if erhebj>=2006

* Beibehaltung der relevanten Variablen
***************************************

keep persnr ///
nation_deu_j23 nation_deu_j24 nation_deu_j25 nation_deu_j26 nation_deu_j27 ///
nation_j23 nation_j24 nation_j25 nation_j26 nation_j27 ///
deu_seit_j23 deu_seit_j24 deu_seit_j25 deu_seit_j26 deu_seit_j27 ///
d_nation2_j23 d_nation2_j24 d_nation2_j25 d_nation2_j26 d_nation2_j27 ///
nation2_j23 nation2_j24 nation2_j25 nation2_j26 nation2_j27

save ${AVZ}melanie_jugendliche, replace


**************************
* ABGLEICH und Rekodierung
**************************

****************************************
*** Abgleich nation_deu_j* und nation_j*
****************************************

tab nation_j23 nation_deu_j23
tab nation_j24 nation_deu_j24
tab nation_j25 nation_deu_j25
tab nation_j26 nation_deu_j26
tab nation_j27 nation_deu_j27


* Zuweisung deutsch zur Nationalitätenliste (es finde hier keine Überschreibungen statt!)
replace nation_j23=1 if nation_deu_j23==1 
replace nation_j24=1 if nation_deu_j24==1 
replace nation_j25=1 if nation_deu_j25==1 
replace nation_j26=1 if nation_deu_j26==1 
replace nation_j27=1 if nation_deu_j27==1 



****************************************
*** Abgleich d_nation2_j* und nation_2j*
****************************************

tab nation2_j23 d_nation2_j23, m
tab nation2_j24 d_nation2_j24, m
tab nation2_j25 d_nation2_j25, m
tab nation2_j26 d_nation2_j26, m
tab nation2_j27 d_nation2_j27, m

* --> Super, diejenigen, die angeben 2. SBS zu besitzen, machen auch Angabe welche --> Keine Rekodierung nötig




****************************************
*** Abgleich nation2_j* und nation_j*
****************************************

tab nation2_j23 nation_j23  // 7 Fälle deutsch + andere
tab nation2_j24 nation_j24 // 10 Fälle deutsch + andere
tab nation2_j25 nation_j25 // 10 Falle deutsch + andere
tab nation2_j26 nation_j26 // 9 Fälle deutsch + andere
tab nation2_j27 nation_j27 // 5 Fälle deutsch + andere

* Fazit: Keine Fälle, die zwei ausländische SBS haben


*** Generierung einer Variable, die bei doppelter SBS die deutsche durch ausländische ersetzt
clonevar nation_23=nation_j23
replace nation_23=nation2_j23 if nation_j23==1 & (nation2_j23!=. -1 -2 -3)
tab nation_23 nation_j23
tab nation_23 nation2_j23


clonevar nation_24=nation_j24
replace nation_24=nation2_j24 if nation_j24==1 & (nation2_j24!=. -1 -2 -3)
tab nation_24 nation_j24
tab nation_24 nation2_j24


clonevar nation_25=nation_j25
replace nation_25=nation2_j25 if nation_j25==1 & (nation2_j25!=. -1 -2 -3)
tab nation_25 nation_j25
tab nation_25 nation2_j25


clonevar nation_26=nation_j26
replace nation_26=nation2_j26 if nation_j26==1 & (nation2_j26!=. -1 -2 -3)
tab nation_26 nation_j26
tab nation_26 nation2_j26


clonevar nation_27=nation_j27
replace nation_27=nation2_j27 if nation_j27==1 & (nation2_j27!=. -1 -2 -3)
tab nation_27 nation_j27
tab nation_27 nation2_j27





******************************************************************************
*** REKODIERUNG ZENTRALER INFOS UND ANGLEICHUNG AN ANDERE VARS ***************
******************************************************************************

soepren deu_seit_j23 deu_seit_j24 deu_seit_j25 deu_seit_j26 deu_seit_j27, newstub(deu_seit) waves(2006/2010)
soepren nation_23 nation_24 nation_25 nation_26 nation_27, newstub(nation) waves(2006/2010)



keep persnr nation* deu_seit* nation_j* nation2_j* 
sort persnr

save ${AVZ}melanie_jugendliche_recoded, replace


