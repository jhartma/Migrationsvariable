******************************
***** Grundeinstellungen *****
******************************


display "$S_DATE $S_TIME"
clear all			// Arbeitsspeicher reinigen
macro drop _all 		// alle Makros löschen
version 10 			// Version einlesen
capture log close 		// falls Log-Files offen sind schließen, ansonsten Fehlermeldung unterdrücken
set more off, perm 		// Ergebnisse ohne Unterbrechung am Seitenende durchlaufen lassen
set scrollbufsize 500000 	// Rückschau erweitern
set memory 500m, perm 		// Arbeitsspeicher erweitern
set dp comma 			// Bei Dezimalzahlen Kommas anstelle von Punkten verwenden
numlabel, add 			// Kategoriennr. anzeigen
capture net install st0085_1.pkg
capture ssc install soepren


***********************************
***** Verzeichnisse festlegen *****
***********************************
// Globals Caro


// Globals Jörg
global dir= "/home/laodizea/Documents/UniGoettingen/SOEP/" 					// Arbeitsverzeichnis der Originaldatensaetze 
global AVZ= "/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/"		// Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" 	//Temporärer Arbeitsspeicher
global LoFi="/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" 	// Ordner für Log-Files
global DoFi="/home/laodizea/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" 	// Ordner für Do-Files 

***Log-File erstellen***
log using "${LoFi}migback.log", replace


**********************
***** Gliederung *****
**********************


/*	
	1. 	Zusammenfuehrung der benoetigten Datensaetze
		
		1.1 	ppfad.dta - Output: ppfad_mig.dta 
		1.2 	$pgen.dta - Output: pgen_mig.dta 
		1.3 	$kind.dta - Output: kind_mig.dta 
		1.4 	hbrutt$.dta - Output: hbrutt_mig.dta 
		1.5 	$p.dta - Output: p_mig.dta 
		1.6 	bioimmig.dta - Output: bioimmig_mig.dta 
		1.7 	bioparen.dta - Output: bioparen_mig.dta 
		1.8 	Elternzeiger (von Sabine Keller) - Output: elternzeiger.dta 
		1.9 	Mergen aller Datensätze - Output: migra.dta	

	2. 	Bildung von Hilfsvariablen 
		
		2.1 	Hilfsvariablen fuer die Eltern
		2.2	Hilfsvariablen fuer die Großeltern	
*/


***********************************************************
***** 1. Zusammenfuehrung der benoetigten Datensaetze *****
***********************************************************


*************************************************
***** 1.1 ppfad.dta - Output: ppfad_mig.dta *****
*************************************************


use ${dir}ppfad.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr persnr sex gebjahr ?hhnr immiyear todjahr todinfo germborn corigin loc1989 migback

***Zahlen als Missings kodieren***
mvdecode hhnr persnr sex gebjahr ?hhnr todjahr todinfo immiyear germborn corigin loc1989 migback, mv (-1 -2 -3)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}ppfad_mig.dta, replace


************************************************
***** 1.2 $pgen.dta - Output: pgen_mig.dta *****
************************************************


cd ${dir}
use apgen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep persnr ?hhnr nation* partz* partnr*
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
foreach file in bpgen.dta cpgen.dta dpgen.dta epgen.dta fpgen.dta gpgen.dta hpgen.dta ipgen.dta jpgen.dta kpgen.dta lpgen.dta mpgen.dta npgen.dta opgen.dta ppgen.dta qpgen.dta rpgen.dta spgen.dta tpgen.dta upgen.dta vpgen.dta wpgen.dta xpgen.dta ypgen.dta zpgen.dta{
	merge persnr using "`file'", sort keep (?hhnr nation* partz* partnr*)
  	drop _merge
	quietly: compress
}

***Umbennenung ausgewaehlter Variablen***
soepren nation84 nation85 nation86 nation87 nation88 nation89 nation90 nation91 nation92 nation93 nation94 nation95 nation96 nation97 nation98 nation99 nation00 nation01 nation02 nation03 nation04 nation05 nation06 nation07 nation08 nation09, newstub(nation) waves (1/26)  
soepren partz84 partz85 partz86 partz87 partz88 partz89 partz90 partz91 partz92 partz93 partz94 partz95 partz96 partz97 partz98 partz99 partz00 partz01 partz02 partz03 partz04 partz05 partz06 partz07 partz08 partz09, newstub(partnerzeig) waves (1/26)  
soepren partnr84 partnr85 partnr86 partnr87 partnr88 partnr89 partnr90 partnr91 partnr92 partnr93 partnr94 partnr95 partnr96 partnr97 partnr98 partnr99 partnr00 partnr01 partnr02 partnr03 partnr04 partnr05 partnr06 partnr07 partnr08 partnr09, newstub(partnernr) waves (1/26)  

***Zahlen als Missings kodieren***
mvdecode ?hhnr nation* partnerzeig* partnernr*, mv (-1 -2 -3)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}pgen_mig.dta, replace


************************************************
***** 1.3 $kind.dta - Output: kind_mig.dta *****
************************************************


cd ${dir}
use akind.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr ?hhnr persnr ak07a akhv akhvp akmutti akmup
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
merge persnr using ekind.dta, sort keep (hhnr ?hhnr persnr ek03a ekhv ekhvp ekmutti ekmup)
drop _merge

***Zahlen als Missings kodieren***
mvdecode hhnr ?hhnr persnr ek03a ak07a ?khv ?khvp ?kmutti ?kmup, mv (-1 -2 -3)

***Umbennenung ausgewaehlter Variablen***
soepren ak07a ek03a, newstub(nationkind) waves (1, 5)  

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}kind_mig.dta, replace


****************************************************
***** 1.4 hbrutt$.dta - Output: hbrutt_mig.dta *****
****************************************************


cd ${dir}
use hbrutt98.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr ?hhnr nathv sexhv
rename nathv nathv15
rename sexhv sexhv15

isid hhnr // hhnr ist eindeutige Identifikationsvariable
sort hhnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
merge hhnr using hbrutt00.dta, sort keep (hhnr ?hhnr nathv sexhv)
drop _merge
rename nathv nathv17
rename sexhv sexhv17

***Zahlen als Missings kodieren***
mvdecode hhnr ?hhnr nathv* sexhv*, mv (-1 -2 -3)

***Reduzierten Datensatz speichern***
save ${AVZ}hbrutt_mig.dta, replace


******************************************
***** 1.5 $p.dta - Output: p_mig.dta *****
******************************************

	
cd ${dir}
use sp.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr persnr ?hhnr sp116
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
merge persnr using ${dir}tp.dta, sort keep (hhnr persnr ?hhnr tp124)
drop _merge

merge persnr using ${dir}up.dta, sort keep (hhnr persnr ?hhnr up128)
drop _merge

merge persnr using ${dir}vp.dta, sort keep (hhnr persnr ?hhnr vp137)
drop _merge

merge persnr using ${dir}wp.dta, sort keep (hhnr persnr ?hhnr wp129)
drop _merge

merge persnr using ${dir}xp.dta, sort keep (hhnr persnr ?hhnr xp141)
drop _merge

merge persnr using ${dir}yp.dta, sort keep (hhnr persnr ?hhnr yp139)
drop _merge

merge persnr using ${dir}zp.dta, sort keep (hhnr persnr ?hhnr zp139)
drop _merge

***Umbennenung ausgewaehlter Variablen***
soepren sp116 tp124 up128 vp137 wp129 xp141 yp139 zp139, newstub(staatsang) waves (19/26)  

***Zahlen als Missings kodieren***
mvdecode hhnr persnr ?hhnr staatsang*, mv (-1 -2 -3)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}p_mig.dta, replace


*******************************************************
***** 1.6 bioimmig.dta - Output: bioimmig_mig.dta *****
*******************************************************


use ${dir}/bioimmig.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep biimgrp persnr hhnr

***Zahlen als Missings kodieren***
mvdecode biimgrp persnr hhnr, mv (-1 -2 -3)

***Reduzierten Datensatz speichern***
// Es gibt keine eindeutige Identifikationsvariable
save ${AVZ}bioimmig_mig.dta, replace


*******************************************************
***** 1.7 bioparen.dta - Output: bioparen_mig.dta *****
*******************************************************

use ${dir}/bioparen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep vnat mnat persnr hhnr hhnr*

***Zahlen als Missings kodieren***
mvdecode vnat mnat persnr hhnr hhnr*, mv (-1 -2 -3)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}bioparen_mig.dta, replace


***************************************************************************
***** 1.8 Elternzeiger (von Sabine Keller) - Output: elternzeiger.dta *****
***************************************************************************

****Elterninformationen aus dem Jugendbiographiedatensatz (BIOAGE17) holen***
use ${dir}bioage17, clear // Elterndaten ueber Jugendfragebogen ranspielen -> Lebenslauf-Fragebogen hat keine Infos ueber Eltern
keep persnr bymnr byvnr // Personennr. der Eltern behalten
sort persnr // fuers Mergen vorsortieren 
save ${AVZ}Eltern, replace // im AVZ im temporaeren Ordner Sortierung und Reduzierung speichern


***Elterninformationen aus dem Kinderdatensaetzen ($Kind) holen***
cd ${dir}
use akind, clear
merge persnr using bkind ckind dkind ekind fkind gkind hkind ikind jkind kkind lkind mkind nkind okind pkind qkind rkind skind tkind ukind vkind wkind xkind ykind zkind, sort
drop _merge*
compress
sort persnr
save ${AVZ}kind.dta, replace

cd ${AVZ}
use kind, clear // Kinderdatensatz in dem schon alle Wellen aneinandergespielt sind
keep persnr *kmutti *kmup // nur die Elterninfos beibehalten
sort persnr 		

merge persnr using ${AVZ}Eltern, sort // kind-Datensatz mit Elterndatensatz mergen
drop _merge
sort persnr
save ${AVZ}Eltern, replace


***Kinderinformationen aus dem Biobirth-Datensatz holen***  
use ${dir}biobirth, clear // Personennr der Mutter ueber den Geburtsbiographie-Datensatz 
keep persnr kidpnr*

foreach x of varlist persnr-kidpnr15 { 		// vor alle Mutter-Variablen m_ setzen - Abgrenzung von Vater und Frau selbst
	rename `x' m_`x' 
}

forvalues x=1/9 { 					// Nullen entfernen, weil sonst der reshape-Befehl nicht funktioniert
	rename m_kidpnr0`x' m_kidpnr`x'
}

reshape long m_kidpnr, i(m_persnr) j(m_kidnr) // Rangfolge ist egal - entscheidend ist die Personennr. des Elternteils
keep if m_kidpnr<. 
rename m_kidpnr persnr // zum Mergen muss Kindernr. in Personennr. umbenannt werden
rename m_persnr mb_persnr // damit erst im Elterndatensatz aneinandergespielt wird
keep persnr mb_persnr 

sort persnr 
save ${temp}biobirth, replace // im temproraeren Ordner des AVZ ablegen

***Vaternr. suchen*** 
use ${dir}biobrthm, clear // Personennr des Vaters ueber den Geburtsbiographie-Datensatz 
keep persnr kidpnr*

foreach x of varlist persnr-kidpnr15 { 		// vor alle Vater-Variablen v_ setzen - Abgrenzung von Mutter und Befragungsperson selbst
	rename `x' v_`x'
}

forvalues x=1/9 { 					// Nullen entfernen, weil sonst der reshape-Befehl nicht funktioniert
	rename v_kidpnr0`x' v_kidpnr`x'
}

reshape long v_kidpnr, i(v_persnr) j(v_kidnr) // Rangfolge ist egal - entscheidend ist die Personennr. des Elternteils
keep if v_kidpnr<. 
rename v_kidpnr persnr // zum Mergen muss Kindernr. in Personennr. umbenannt werden
rename v_persnr vb_persnr // damit erst im Elterndatensatz aneinandergespielt wird
keep persnr vb_persnr

sort persnr 
save ${temp}biobrthm, replace // im temproraeren Ordner des AVZ ablegen


***Eltern ranspielen***
cd ${AVZ}
use Eltern, clear 
merge persnr using ${temp}biobirth, keep (mb_persnr) // Zusammenspielen und nur die Personennr. der Mutter beibehalten
drop _merge 
sort persnr 
save ${AVZ}Eltern, replace 

merge persnr using ${temp}biobrthm, keep (vb_persnr)
drop _merge 
sort persnr
save ${AVZ}TM_Eltern, replace

gen v_persnr=. // Vaterpersnr anlegen
gen m_persnr=. // Mutterpersnr anlegen
label variable v_persnr "person number of father (child)"
label variable m_persnr "person number of mother (child)"

local vater byvnr vb_persnr akmup bkmup ckmup dkmup ekmup fkmup gkmup hkmup ikmup jkmup kkmup lkmup mkmup nkmup okmup pkmup qkmup rkmup skmup tkmup ukmup vkmup wkmup xkmup ykmup zkmup
local mutter bymnr mb_persnr akmutti bkmutti ckmutti dkmutti ekmutti fkmutti gkmutti hkmutti ikmutti jkmutti kkmutti lkmutti mkmutti nkmutti okmutti pkmutti qkmutti rkmutti skmutti tkmutti ukmutti vkmutti wkmutti xkmutti ykmutti zkmutti

foreach x of local vater {
		quietly replace v_persnr=`x' if v_persnr>=.&`x'<. // fuer BIOPAREN, BIOAGE und $KIND schauen, ob eine gueltige Vaterpersonennr vorhanden ist und diese draufspeichern
}
foreach x of local mutter {
		quietly replace m_persnr=`x' if m_persnr>=.&`x'<. // fuer BIOPAREN, BIOAGE und $KIND schauen, ob eine gueltige Mutterpersonennr vorhanden ist und diese draufspeichern
}

drop  bymnr byvnr *kmutti *kmup mb_persnr vb_persnr

quietly compress // reduces the size of your dataset by considering demoting
sort persnr
save ${AVZ}elternzeiger, replace


************************************************************
***** 1.9 Mergen aller Datensaetze - Output: migra.dta *****
************************************************************


cd ${AVZ}
use ppfad_mig.dta, clear

sort persnr
merge persnr using pgen_mig.dta
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
merge persnr using elternzeiger.dta
drop _merge

// sort ?
// merge ? using bioimmig.dta 


***Speicherung des Datensatzes unter migra.dta***
// sort persnr 
// isid persnr // persnr ist eindeutige Identifikationsvariable
// save "${AVZ}migra.dta", replace


*****************************************
***** 2. Bildung von Hilfsvariablen *****
*****************************************

**********************************************
***** 2.1 Hilfsvariablen fuer die Eltern *****
**********************************************

*************************************************
***** 2.2 Hilfsvariablen fuer die Großeltern *****
*************************************************
	

***Log-File schließen***
log close 

* ------------------------ *
* ------- E N D E -------- *
* ------------------------ *



