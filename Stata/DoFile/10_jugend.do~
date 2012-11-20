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
soepren wj6001 xj6001 yj6001 zj6001 baj6001, newstub(gebjahr_j) waves (23/27) // Eigentlich brauch man doch die Jahresinfo bei den unveränderlichen Sachen nicht, da es Querschnittsdaten sind
soepren wj6002 xj6002 yj6002 zj6002 baj6002, newstub(gebmoval_j) waves (23/27)
soepren wj61 xj61 yj61 zj61 baj61, newstub(germborn_j) waves (23/27)
soepren wj6201 xj62 yj62 zj62 baj62, newstub(corigin_j) waves (23/27)
soepren wj63 xj63 yj63 zj63 baj63, newstub(immiyear_j) waves (23/27)
soepren wj64 xj64 yj64 zj64 baj64, newstub(biimgrp_j) waves (23/27)
soepren wj65 xj65 yj65 zj65 baj65, newstub(nation_deu_j) waves (23/27) // Wie kann/soll mit der Nation-Info bei den Jugendlichen umgegangen werden?
soepren wj67 xj67 yj67 zj67 baj67, newstub(deu_seit_j) waves (23/27)
soepren wj6601 xj6601 yj6601 zj6601 baj6601, newstub(d_nation2_j) waves (23/27) // Wie Umgang mit zweiter SBS? Damit zusammenhängend grundsätzliche Frage, wie mit zeitveränderlicher Info umgegangen werden soll?
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



*** FAZIT: Infos sind im PPFAD bzw. in BIOIMMIG enthalten und können genutzt werden (teils Abweichungen, aber wir vertrauen einfach mal dem SOEP ...)


*** Das kann dann eigentlich gelöscht werden (ggf. noch benötigt bei der Bildung der NATION-Hilfsvariable???)
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

save ${AVZ}melanie_jugendliche_recoded, replace

*/














*** ELTERN --> Müßte in Extra-Do-File eingefügt werden (Resultat Besprechung am Freitag) ***


// Ausgangsdatensatz: $PAGE17; BIOPAREN; WJUGEND
// Enddatensatz: melanie_jugendliche_eltern.dta
// Variablen: corigin_f, corigin_m; germborn_f, germborn_m (Wenn PPFAD-Info Sysmis, dann nutze Info von Jugendlichen)

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

***********************************************************************************
***** 1.12 Aufbereitung Datensatz für Eltern von Jugendlichen Melanie *************
***********************************************************************************

*****************************************************************************************************************
*** 1. Bildung Masterdatensatz: Melanie_jugendliche_eltern.dta
*****************************************************************************************************************
**************************************************************************
*** PPFAD: Hintergrundinformationen zu den Eltern, wenn selbst im SOEP ***
**************************************************************************

use ${AVZ}ppfad_mig.dta, clear // bereits gebildeter PPFAD_mig Datensatz ausreichend
keep persnr germborn corigin migback
save ${AVZ}ppfad_mige.dta, replace // bereits gebildeter PPFAD_mig Datensatz ausreichend


********************************************************
*** BIOPAREN: Hintergrundinformationen zu den Eltern ***
********************************************************

use ${dir}bioparen.dta, clear // bereits gebildeter PPFAD_mig Datensatz ausreichend
keep vorigin morigin persnr
save ${AVZ}bioparen_mige.dta, replace // bereits gebildeter PPFAD_mig Datensatz ausreichend





*****************************************
* 2. Schritt: Bildung Masterdatensatz ***
*****************************************

*** Öffnen Zwischen-Masterdatensatz von Jugendlichen, damit Eltern von Jugendlichen idntifiziert werden können ***


use ${AVZ}Melanie_jugendliche_ma.dta, clear



***********************************************************
*** Ranspielen der Infos vom Jugendlichen zu den Eltern ***
***********************************************************

*** Ranspielen Infos vom Jugendlichen zu seinen Eltern aus dem Datensatz von Elisabeth (2006)
sort persnr
merge m:1 persnr using ${AVZ}wjugend.dta // WICHTIG: Der Datensatz von Elisabeth muss im AVZ liegen!
tab _merge
drop _merge

rename wj7901 germborn_f_j
rename wj7902 germborn_m_j



*** Ranspielen Infos vom Jugendlichen zu seinen Eltern aus Bioparen
sort persnr
merge m:1 persnr using ${AVZ}bioparen_mige.dta // WICHTIG: Der Datensatz von Elisabeth muss im AVZ liegen!
tab _merge
drop if _merge==2
drop _merge



******************************************************
*** Ranspielen der Infos fuer die MUTTER aus PPFAD ***
******************************************************

* Umbenennung der persnr
rename hhnr kindhhnr
rename persnr kindpersnr
rename bymnr persnr
sort persnr

* Ranspielen Infos fuer die Mutter aus ppfad_mig
*************************************************
merge m:1 persnr using ${AVZ}ppfad_mige.dta
tab _merge

rename hhnr hhnr_m
rename migback migback_m
rename germborn germborn_m
rename corigin corigin_m

drop if _merge==2
drop _merge



*****************************************************
*** Ranspielen der Infos fuer den VATER aus PPFAD ***
*****************************************************

* Umbenennung der persnr
rename persnr bymnr
rename byvnr persnr
sort persnr

* Ranspielen Infos fuer den Vater aus PPFAD
merge m:1 persnr using ${AVZ}ppfad_mige.dta

rename hhnr hhnr_f
rename migback migback_f
rename germborn germborn_f
rename corigin corigin_f

tab _merge
drop if _merge==2
drop _merge

rename persnr byvnr
rename kindpersnr persnr
rename kindhhnr hhnr



*******************************************************************************************************************
*** Überprüfung der Angaben und Identifizierung von Fällen, bei denen Jugendlichen-Infos genutzen werden müssen ***
*******************************************************************************************************************


* Kongruente Infos aus PPFAD bei Germborn und Corigin?
tab corigin_f germborn_f, m
* 503 x Sysmis bei beiden

tab corigin_m germborn_m, m
* 74 x Sysmis bei beiden Variablen




***********************************
*** Abgleich BIOPAREN und PPFAD ***
***********************************
* FRAGE: Ist es möglich, dass durch den Elternzeiger von Sabine Eltern identifiziert werden und folglich Väter im SOEP identifiziert werden?


*************
*** VATER ***
*************

* Germborn 
**********

* N Jugendliche=3.679 
tab vorigin germborn_f, m // 503 Sysmis bei germborn_f, aber Wert in vorigin (und sei es -1, -2, etc)
tab vorigin germborn_f if erhebj==2006, m


* Wenn germborn_f==., nimm den Wert aus Vorigin
gen germborn_fr=.
replace germborn_fr=1 if germborn_f==. & vorigin==1 // Väter aus Deutschland werden zugewiesen
replace germborn_fr=2 if germborn_f==. & (vorigin>=2 & vorigin<=166)
replace germborn_fr=-1 if germborn_f==. & (vorigin==-1)
replace germborn_fr=-2 if germborn_f==. & (vorigin==-2)
replace germborn_fr=-3 if germborn_f==. & (vorigin==-3)
tab germborn_fr

*** WICHTIG: Abweichungen zwischen VORIGIN und GERMBORN (Auspärgung 1 und 2) sind jetzt unberücksichtigt (N=66/3139)



* Corigin
*********
* N Jugendliche=3.679 
tab vorigin corigin_f, m
tab vorigin corigin_f if erhebj==2006, m


* Wenn corigin_f==., nimm Wert aus Vorigin
gen corigin_fr=.
replace corigin_fr=vorigin if corigin_f==.
tab corigin_fr





**************
*** MUTTER ***
**************

* Germborn 
**********

* N Jugendliche=3.679 
tab morigin germborn_m, m // 73 Sysmis bei germborn_m, aber Wert in vorigin (und sei es -1, -2, etc)
tab morigin germborn_m if erhebj==2006, m


* Wenn germborn_m==., nimm den Wert aus Morigin
gen germborn_mr=.
replace germborn_mr=1 if germborn_m==. & morigin==1 // Väter aus Deutschland werden zugewiesen
replace germborn_mr=2 if germborn_m==. & (morigin>=2 & morigin<=166)
replace germborn_mr=-1 if germborn_m==. & (morigin==-1)
replace germborn_mr=-2 if germborn_m==. & (morigin==-2)
replace germborn_mr=-3 if germborn_m==. & (morigin==-3)
tab germborn_mr

*** WICHTIG: Abweichungen zwischen MORIGIN und GERMBORN (Auspärgung 1 und 2) sind jetzt unberücksichtigt (N=1/3600)



* Corigin
*********
* N Jugendliche=3.679 
tab morigin corigin_m, m
tab morigin corigin_m if erhebj==2006, m


* Wenn corigin_m==., nimm Wert aus Morigin
gen corigin_mr=.
replace corigin_mr=morigin if corigin_m==.
tab corigin_mr







********************************************************************************************************************************
* WJUGEND: Benoetigt man die Dummy-Info von den Jugendlichen zu dem Geburtsland ihrer Eltern aus dem DS von Elisabeth fuer 2006?
********************************************************************************************************************************


*************
*** VATER ***
*************
tab germborn_f_j
tab germborn_f germborn_f_j if erhebj==2006, m
* 39 "." bei germborn_f; Wenn Nutzung Info von Elisabeth fuer 2006, dann koennten 35 Faelle deutsch und 3 Faelle den Immigranten zugeordnet werden
* Folglich: Diese Faelle wuerde ich noch zuordnen + Vermerk in Hilfsvariable, dass diese Info vom Jugendlichen kommt
tab germborn_f_j germborn_fr

* Ist die Info bei vorigin enthalten?
tab vorigin germborn_f_j if erhebj==2006, m //--> Nein; hier -1


* Zuweisung der 39 Fälle zu germborn_fr
tab germborn_fr
replace germborn_fr=germborn_f_j if germborn_fr==-1 & germborn_f_j!=.
tab germborn_fr



**************
*** MUTTER ***
**************
tab germborn_m germborn_m_j if erhebj==2006, m
* 6 Sysmis bei germborn_m; bei der Info von Elisabeth 4x Deutschland und 2x-2
tab germborn_m_j germborn_mr


* Ist die Info bei morigin enthalten?
tab morigin germborn_m_j if erhebj==2006, m //--> Nein; hier -1

* Zuweisung der 6 Fälle zu germborn_mr
tab germborn_mr
replace germborn_mr=germborn_m_j if germborn_mr==-1 & germborn_m_j!=.
tab germborn_mr, m




*** Beibehaltung derjenigen Fälle, die im PPFAD Sysmis haben und denen ein Wert aus BIOPAREN bzw. WJUGEND zugeordnet werden konnte
**********************************************************************************************************************************

keep if germborn_mr!=. | germborn_fr!=.


*** Beibehaltung relevanter Variablen
*************************************

keep persnr corigin_mr corigin_fr germborn_mr germborn_fr // FRAGE: kann die Eltern-ID und die HH-ID auch gelöscht werden?


*** Angleichung an Masterdatensatz der Variablennamen
*****************************************************

rename corigin_mr corigin_m
rename corigin_fr corigin_f
rename germborn_fr germborn_f
rename germborn_mr germborn_m


*** Abspeichern des Datensatzes
*******************************

save ${AVZ}melanie_jugendliche_eltern, replace
