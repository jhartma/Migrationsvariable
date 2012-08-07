******************************
***** Grundeinstellungen *****
******************************


display "$S_DATE $S_TIME"

clear all // Arbeitsspeicher reinigen
macro drop _all // alle Makros löschen
version 10.1 // Version einlesen
capture log close // falls Log-Files offen sind schließen, ansonsten Fehlermeldung unterdrücken
set more off, perm // Ergebnisse ohne Unterbrechung am Seitenende durchlaufen lassen
set scrollbufsize 500000 // Rückschau erweitern
set memory 500m, perm // Arbeitsspeicher erweitern
set dp comma // Bei Dezimalzahlen Kommas anstelle von Punkten verwenden
numlabel, add // Kategoriennr. anzeigen
capture net install st0085_1.pkg
capture ssc install soepren


***********************************
***** Verzeichnisse festlegen *****
***********************************


global dir="/home/laodizea/Documents/UniGoettingen/SOEP/" // Arbeitsverzeichnis der Originaldatensaetze 
global AVZ= "/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" //Temporärer Arbeitsspeicher
global LoFi="/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" //Ordner für Log-Files
global DoFi="/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/DoFile/" // Ordner für Do-Files 

***Log-File erstellen***
log using "${LoFi}migback.log", replace


**********************
***** chart4.png *****
**********************


/*
	Was ich gemacht habe:
	
	Ermittlung der Fallzahlen, der bereits bestehenden Variablen.
	Enthaelt noch keine Merge-Prozesse, um andere Fallzahlen zu ermitteln!
	
	Ueberpruefung der Variablenrichtigkeit 
	bspw. ob es in den Datensaetzen $kind wirklich nur die Variablen akind und ekind gibt, um die Nationalitaet des HH-Vorstand herauszubekommen.

*/

	
*****************************************
***** Geburtsland (GERMBORN, PPFAD) *****
*****************************************

use ${dir}ppfad.dta, clear
tab germborn





****************************
****************************

****************************
***** 1. Block: German *****
****************************
// Variable germborn: born in Germany or immigr.<1949 (1)


// Elternzeiger Sabine 


****************************************
****************************************

****************************************
***** 2. Block: MigStatus ElseBorn *****
****************************************
// Variable germborn: immigr. > 1948 (2)

cd ${dir}


*************************************
***** Nationalitaet - $pgen.dta *****
*************************************


foreach x in a b c d e f g h i j k l m n o p q r s t u v w x y { 
	use `x'pgen.dta, clear
	tab nation
}

***Ermittlung der Nationalitaet des Haushaltsvorstands durch das Kind - $kind.dta***
foreach x in a b c d e f g h i j k l m n o p q r s t u v w x y { 
	use `x'kind.dta, clear
	lookfor Nation
	lookfor staats
}

use akind.dta, clear
tab ak07a

use ekind.dta, clear
tab ek03a


***Ermittlung der Nationalitaet des Haushaltsvorstand durch den Interviewer - $hbrutto.dta***
foreach x in 00 02 06 84 98 { 
	use hbrutt`x'.dta, clear
	lookfor nath	
}

foreach x in 98 00 { 
	use hbrutt`x'.dta, clear
	tab nathv
}


**************************************************************************
***** Deutsche Staatsbuergerschaft seit Geburt oder spaeter - $p.dta *****
**************************************************************************
	

foreach x in a b c d e f g h i j k l m n o p q r s t u v w x y { 
	use `x'p.dta, clear
	lookfor staatsangeh
}

use ${dir}sp.dta, clear
tab sp116

use ${dir}tp.dta, clear
tab tp124

use ${dir}up.dta, clear
tab up128

use ${dir}vp.dta, clear
tab vp137

use ${dir}wp.dta, clear
tab wp129

use ${dir}xp.dta, clear
tab xp141

use ${dir}yp.dta, clear
tab yp139

**************************
***** Einreisestatus *****
**************************


use ${dir}bioimmig.dta, clear
tab biimgrp


*************************
***** Einreisealter *****
*************************


use ${dir}ppfad.dta, clear
tab immiyear
tab gebjahr


**********************************
***** Vater / Mutter im SOEP *****
**********************************
// Hier muss der Elternzeiger verwendet werden!





***************************************
***************************************

***************************************
***** 3. Block: MigStatus: NoSOEP *****
***************************************
//Variable germborn: nicht valide (-3), trifft nicht zu (-2), keine Angabe (-1)


cd ${dir}


*************************************
***** Nationalitaet - $pgen.dta *****
*************************************


foreach x in a b c d e f g h i j k l m n o p q r s t u v w x y { 
	use `x'pgen.dta, clear
	tab nation
}

***Ermittlung der Nationalitaet des Haushaltsvorstands durch das Kind - $kind.dta***
foreach x in a b c d e f g h i j k l m n o p q r s t u v w x y { 
	use `x'kind.dta, clear
	lookfor Nation
	lookfor staats
}

use akind.dta, clear
tab ak07a

use ekind.dta, clear
tab ek03a


***Ermittlung der Nationalitaet des Haushaltsvorstand durch den Interviewer - $hbrutto.dta***
foreach x in 00 02 06 84 98 { 
	use hbrutt`x'.dta, clear
	lookfor nath	
}

foreach x in 98 00 { 
	use hbrutt`x'.dta, clear
	tab nathv
}


**************************************************************************
***** Deutsche Staatsbuergerschaft seit Geburt oder spaeter - $p.dta *****
**************************************************************************
	

foreach x in a b c d e f g h i j k l m n o p q r s t u v w x y { 
	use `x'p.dta, clear
	lookfor staatsangeh
}

use ${dir}sp.dta, clear
tab sp116

use ${dir}tp.dta, clear
tab tp124

use ${dir}up.dta, clear
tab up128

use ${dir}vp.dta, clear
tab vp137

use ${dir}wp.dta, clear
tab wp129

use ${dir}xp.dta, clear
tab xp141

use ${dir}yp.dta, clear
tab yp139



**************************
***** Einreisestatus *****
**************************


use ${dir}bioimmig.dta, clear
tab biimgrp


*************************
***** Einreisealter *****
*************************


use ${dir}ppfad.dta, clear
tab immiyear
tab gebjahr


**********************************
***** Vater / Mutter im SOEP *****
**********************************
// Hier muss der Elternzeiger verwendet werden!

***Log-File schließen***
log close 


* ------------------------ *
* ------- E N D E -------- *
* ------------------------ *



