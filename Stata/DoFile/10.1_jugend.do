// Ausgangsdatensatz: $PAGE17; PPFAD; BIOIMMIG - Was genau soll hier stehen?
// Enddatensatz: Melanie_jugendliche.dta und melanie_jugendliche_recoded.dta
// Variablen: Germborn; Corigin; immiyear; gebjahr; erste und zweite Nation zum Befragrungszeitpunkt (ab einschließlich 2006); Deu_seit; biresper; biimgrp

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
global dir= "L:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/" // Arbeitsverzeichnis der relginaldatensaetze
global AVZ= "L:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Mig/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="L:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Mig/" //Temporaerer Arbeitsspeicher
global LoFi="L:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Mig/" // Ordner fuer Log-Files
global DoFi="L:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Mig/" // Ordner fuer Do-Files


// Globals Joerg
global dir= "/home/Knut/Documents/UniGoettingen/SOEP2010/" // Arbeitsverzeichnis der Originaldatensaetze
global AVZ= "/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" //Temporaerer Arbeitsspeicher
global LoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" // Ordner fuer Log-Files
global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" // Ordner fuer Do-Files




*************************************************************
***** 1.11 Aufbereitung Jugenddatensatz Melanie *************
*************************************************************

*****************************************************************************************************************
*** 1. Bildung Masterdatensatz: Melanie_jugendliche.dta
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
soepren wj6001 xj6001 yj6001 zj6001 baj6001, newstub(gebjahr_j) waves (2006/2010) // Eigentlich brauch man doch die Jahresinfo bei den unveränderlichen Sachen nicht, da es Querschnittsdaten sind
soepren wj6002 xj6002 yj6002 zj6002 baj6002, newstub(gebmoval_j) waves (2006/2010)
soepren wj61 xj61 yj61 zj61 baj61, newstub(germborn_j) waves (2006/2010)
soepren wj6201 xj62 yj62 zj62 baj62, newstub(corigin_j) waves (2006/2010)
soepren wj63 xj63 yj63 zj63 baj63, newstub(immiyear_j) waves (2006/2010)
soepren wj64 xj64 yj64 zj64 baj64, newstub(biimgrp_j) waves (2006/2010)
soepren wj65 xj65 yj65 zj65 baj65, newstub(nation_deu_j) waves (2006/2010) // Wie kann/soll mit der Nation-Info bei den Jugendlichen umgegangen werden?
soepren wj67 xj67 yj67 zj67 baj67, newstub(deu_seit_j) waves (2006/2010)
soepren wj6601 xj6601 yj6601 zj6601 baj6601, newstub(d_nation2_j) waves (2006/2010) // Wie Umgang mit zweiter SBS? Damit zusammenhängend grundsätzliche Frage, wie mit zeitveränderlicher Info umgegangen werden soll?
soepren wj6602 xj6602 yj6602 zj6602 baj6602, newstub(nation2_j) waves (2006/2010)
soepren wj6801 xj68 yj68 zj68 baj68, newstub(nation_j) waves (2006/2010)
soepren wj69 xj69 yj69 zj69 baj69, newstub(biresper_j) waves (2006/2010)


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
*** BIOIMMIG: Infos für die Jahre 2000-2005 enthalten; danach im $PAGE17 ***
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


*soepren hhnr2000 hhnr2001 hhnr2002 hhnr2003 hhnr2004 hhnr2005 hhnr2006 hhnr2007 hhnr2008 hhnr2009 hhnr2010, newstub(hhnr) waves (17/27)
*soepren biresper2000 biresper2001 biresper2002 biresper2003 biresper2004 biresper2005 biresper2006 biresper2007 biresper2008 biresper2009 biresper2010, newstub(biresper) waves (17/27)
*soepren biimgrp2000 biimgrp2001 biimgrp2002 biimgrp2003 biimgrp2004 biimgrp2005 biimgrp2006 biimgrp2007 biimgrp2008 biimgrp2009 biimgrp2010, newstub(biimgrp) waves (17/27)

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
save ${AVZ}Melanie_jugendliche_ma.dta, replace


* Ranspielen Infos fuer Kind aus PAGE17
merge m:1 persnr using ${AVZ}page17_mig.dta // Merge 1:1, da Kinder nur einmal im Datensatz sein können, allerdings: funktioniert nicht!
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



* Pruefen, ob Infos aus PAGE17-Daten in PPFAD und BIOIMMIG (noch nicht geprüft wurde, inwieweit Infos zur Staatsangehörigkeit in P bzw. PGEN enthalten sind)
************************************************************************************************************************************************************

* Pruefen, ob Geburtslandinfos aus $PAGE in der PPFAD-Info enthalten ist

tab germborn, m
tab germborn germborn_j2006
tab germborn germborn_j2007
tab germborn germborn_j2008
tab germborn germborn_j2009
tab germborn germborn_j2010

*** Ja, Infos sind in PPFAD-Daten enthalten
* wobei Abweichungen (in 25 (1 x J: Ausland; PPFAD: Deutschland))

tab corigin_j2008 germborn_j2008 // 1 x Deutschland!!!!!!!!!!!
tab corigin if corigin_j2008==1 // der deutsche Fall hat dann bei CORIGIN Schweiz

tab corigin_j2008 germborn_j2008 if germborn_j2008==3 & germborn==1 // in J und PPFAD abweichender Fall hat aber Ex-Jugoslawien bei corigin!
tab corigin if germborn_j2008==3 & germborn==1 // in PPFAD dann aber Deutschland



* wobei Abweichungen (in 26 (1 x J: Ausland; PPFAD: -1) 1 x (J: Ausland; PPFAD: Deutschland))
tab corigin_j2009 germborn_j2009
tab corigin if germborn_j2009==3 & germborn==-1 
tab corigin_j2009 if germborn_j2009==3 & germborn==-1 // J hat Holland angegeben

tab corigin if germborn_j2009==3 & germborn==1


* wobei Abweichungen (in 27 (1 x J: -1 und PPFAD: 1)) 
tab corigin_j2010 germborn_j2010
tab corigin if germborn_j2010==-1 & germborn==1




**********************************************************************
* Pruefen, ob corigin-Infos aus $PAGE in PPFAD-corigin enthalten sind

tab corigin, m
tab corigin corigin_j2006
tab corigin corigin_j2007
tab corigin corigin_j2008
tab corigin corigin_j2009
tab corigin corigin_j2010

*** Ja, Infos sind enthalten, wobei Abweichungen --> Warum?
*** --> corigin aus PPFAD kann grundsaetzlich genutzt werden




**************************************************************
* Pruefen, ob immiyearinfos aus $PAGE auch bei PPFAD enthalten
tab immiyear, m
tab immiyear immiyear_j2006
tab immiyear immiyear_j2007
tab immiyear immiyear_j2008
tab immiyear immiyear_j2009
tab immiyear immiyear_j2010

*** Ja, Info ist enthalten, wobei teilweise Abweichungen (23; 24; 25; 26) --> Warum?
*** --> immiyear aus PPFAD kann grundsaetzlich genutzt werden



***************************************************************************************
* Prüfen, ob biimgrp-Info aus PAGE auch in BIOIMMIG enthalten ist --> Ja, ist enthalten
tab biimgrp2000
tab biimgrp2000 if germborn==2
tab biimgrp2000 if germborn==1

tab biimgrp2001
tab biimgrp2001 if germborn==2, m
tab biimgrp2001 if germborn==1

tab biimgrp2002
tab biimgrp2002 if germborn==2, m

tab biimgrp2003
tab biimgrp2003 if germborn==2, m

tab biimgrp2004
tab biimgrp2004 if germborn==2, m

tab biimgrp2005
tab biimgrp2005 if germborn==2, m


tab biimgrp2006 biimgrp_j2006
tab biimgrp_j2006, m

tab biimgrp2007 biimgrp_j2007
tab biimgrp_j2007, m

tab biimgrp2008 biimgrp_j2008
tab biimgrp_j2008, m

tab biimgrp2009 biimgrp_j2009
tab biimgrp_j2009, m

tab biimgrp2010 biimgrp_j2010
tab biimgrp_j2010, m




*****************************************************************************************
* Pruefen, ob biresper-Info aus PAGE auch in BIOIMMIG enthalten ist --> Ja, ist enthalten

tab biresper2000
tab biresper2000 if germborn==2

tab biresper2001
tab biresper2001 if germborn==2

tab biresper2002
tab biresper2002 if germborn==2

tab biresper2003
tab biresper2003 if germborn==2

tab biresper2004
tab biresper2004 if germborn==2

tab biresper2005
tab biresper2005 if germborn==2


tab biresper2006 biresper_j2006
tab biresper_j2006, m

tab biresper2007 biresper_j2007, m
tab biresper_j2007, m

tab biresper2008 biresper_j2008, m
tab biresper_j2008, m

tab biresper2009 biresper_j2009, m
tab biresper_j2009, m

tab biresper2010 biresper_j2010, m
tab biresper_j2010, m



*** FAZIT: Infos sind im PPFAD bzw. in BIOIMMIG enthalten und koennen genutzt werden (teils Abweichungen, aber wir vertrauen einfach mal dem SOEP ...)


*** Das kann dann eigentlich gelaescht werden (ggf. noch benoetigt bei der Bildung der NATION-Hilfsvariable???)
/*
******************************************************************************
*** REKODIERUNG ZENTRALER INFOS UND ANGLEICHUNG AN ANDERE VARS ***************
******************************************************************************


use ${AVZ}Melanie_jugendliche.dta, clear


*** FRAGE: Muss hier noch berücksichtigt werden, dass es die Origin-Var und Origin_j gleichzeitig im DS gibt? Also eine gemeinsame bspw. origin gebildet werden?
*** ENTSCHEIDUNG NOCH NOTWENDIG: Entweder Origin-Info oder Origin aus PAGE-Daten


* biimgrp umkodieren und umbenennen zur Anpassung 
recode biimgrp_j2* (1 = 1) (2 = 3) (3 = 4) (4 = 6) (5 = 7)   
soepren biimgrp_j23 biimgrp_j24 biimgrp_j25 biimgrp_j26 biimgrp_j27, newstub(biimgrp) waves (23/27)  

* nation_j 'Nationality code' -> nation, Laendercodes stimmen ueberein
soepren nation_j23 nation_j24 nation_j25 nation_j26 nation_j27, newstub(nation) waves(23/27)

* corigin -> corigin, nichts zu tun

* germborn_j -> germborn
recode germborn_j2* (1 2 = 1)(3 = 2)
soepren germborn_j23 germborn_j24 germborn_j25 germborn_j26 germborn_j27, newstub(germborn) waves (23/27)

* immiyear_j -> immiyear
soepren immiyear_j23 immiyear_j24 immiyear_j25 immiyear_j26 immiyear_j27, newstub(immiyear) waves(23/27)

* gebjahr_j -> gebjahr
soepren gebjahr_j23 gebjahr_j24 gebjahr_j25 gebjahr_j26 gebjahr_j27, newstub(gebjahr) waves(23/27)

// Wo ist der Unterschied zwischen germnatbirth und staatsang? Beide aus SP116!
* deu_seit_j -> germnatbirth (SP116, German nationality since: birth, later)
soepren deu_seit_j23 deu_seit_j24 deu_seit_j25 deu_seit_j26 deu_seit_j27, newstub(germnatbirth) waves(23/27)

* deu_seit_j -> staatsang (SP116 seit wann dt. staatsangehoerigkeit: geburt, erworben)
* soepren deu_seit_j23 deu_seit_j24 deu_seit_j25 deu_seit_j26 deu_seit_j27, newstub(staatsang) waves(23/27)

keep persnr hhnr biimgrp* nation* corigin germborn immiyear gebjahr germnatbirth*
aorder
order persnr 
sort persnr

* Select one answer from many years
recode biimgrp* (-2 -1 = .)
recode nation*  (-2 -1 = .)
recode germnatbirth* (-2 -1 = .)

egen bii_count = anymatch(biimgrp*), values(1 2 3 4 5 6 7)  // Pruefe, ob Personen Angaben zu mehreren Jahren haben
tab bii_count
egen na_count = anymatch(nation*), values(2 3 4 5 6 12 13 21 75 118 119 165)
tab na_count
egen ger_count = anymatch(germnatbirth*), values(1 2)
tab ger_count

egen biimgrp = rowmax(biimgrp*)
egen nation  = rowmax(nation*)
egen germnatbirth = rowmax(germnatbirth*)

keep persnr hhnr biimgrp nation corigin germborn immiyear gebjahr germnatbirth
*/

recode biimgrp_j* (1 = 2) (2 = 3) (3 = 4) (4 = 6) (5 = 7)
label value biimgrp_j* biimgrp

recode germborn_j* (1 2 = 1) (3 = 2)
label value germborn_j* germborn

sort persnr

save ${AVZ}melanie_jugendliche_recoded, replace


