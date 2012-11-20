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

// Globals Joerg
global dir= "/home/Knut/Documents/UniGoettingen/SOEP2010/" // Arbeitsverzeichnis der Originaldatensaetze
global AVZ= "/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" //Temporaerer Arbeitsspeicher
global LoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" // Ordner fuer Log-Files
global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" // Ordner fuer Do-Files

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

*** Oeffnen Zwischen-Masterdatensatz von Jugendlichen, damit Eltern von Jugendlichen idntifiziert werden koennen ***


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
*******************************************

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
* tab vorigin corigin_f, m
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
* tab morigin germborn_m, m // 73 Sysmis bei germborn_m, aber Wert in vorigin (und sei es -1, -2, etc)
* tab morigin germborn_m if erhebj==2006, m


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
* tab morigin corigin_m, m
* tab morigin corigin_m if erhebj==2006, m


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
sort persnr
save ${AVZ}melanie_jugendliche_eltern, replace
