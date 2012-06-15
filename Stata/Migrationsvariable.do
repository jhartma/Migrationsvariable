*****************************************************************************************************
*****			ANMERKUNGEN - BITTE ZUERST LESEN					*****
*****												*****
***** 												*****
*****	*Bei elternzeiger.dta wurden nicht die Datensaetze $PBRUTTO rangespielt. 		*****
*****   Diesen Schritt wird Sabine noch machen. - hat sie gemacht?				*****
***** 												*****
*****	*Hilfsvariable deu_seit muss noch bearbeitet werden					*****
*****	*Hilfsvariable BIIMGRP richtig?								*****
*****	*Wenn die Hilfsvariablen generiert werden, dauert es sehr lange, bis alles		*****	
*****	durchgelaufen ist (quietly richtig anwenden!)						*****
*****												*****	
*****												*****
***** 												*****
*****************************************************************************************************

************************************************************ VERFASSER **********************************************************************
***** Reihenfolge i.O.?	(kann ehrlich gesagt nicht einschaetzen, wie aufwendig die Sachen teilweise waren; ggf. noch mal muendlich klaeren																						  	*****
***** Joerg Hartmann, Georg-August-Universitaet Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen *******
***** Melanie Olczyk, Otto-Friedrich-Universitaet Bamberg, Nationales Bildungspanel (NEPS), Wilhelmsplatz 3, Raum 127, 96047 Bamberg ********																						  	*****
***** Carolyn Stolberg, Georg-August-Universitaet Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen *****
***** Sabine Keller, Georg-August-Universitaet Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen  *******																													*****																						  
*********************************************************************************************************************************************

******************************
***** Grundeinstellungen *****
******************************

display "$S_DATE $S_TIME"
clear all  //Arbeitsspeicher reinigen
macro drop _all  // alle Makros loeschen
version 10.1  // Version einlesen
capture log close  // falls Log-Files offen sind schliessen, ansonsten Fehlermeldung unterdruecken
set more off, perm  // Ergebnisse ohne Unterbrechung am Seitenende durchlaufen lassen
set scrollbufsize 500000  // Rueckschau erweitern
set memory 500m, perm  // Arbeitsspeicher erweitern
set dp comma  // Bei Dezimalzahlen Kommas anstelle von Punkten verwenden
numlabel, add  // Kategoriennr. anzeigen
capture net install st0085_1.pkg
capture ssc install soepren

***********************************
***** Verzeichnisse festlegen *****
***********************************

/* Globals Carolyn
global dir="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\SOEP26/" // Arbeitsverzeichnis der Originaldatensaetze 
global AVZ="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\temp/" //Temporaerer Arbeitsspeicher
global LoFi="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\LogFile/" // Ordner fuer Log-Files
global DoFi="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\DoFile/" // Ordner fuer Do-Files 
*/
// Globals Melanie
	global dir= "L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/" // Arbeitsverzeichnis der relginaldatensaetze 
	global AVZ= "L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
	global temp="L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" //Temporaerer Arbeitsspeicher
	global LoFi="L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" // Ordner fuer Log-Files
	global DoFi="L:/_Arbeit/_Diss/_Datensaetze/SOEP/SOEP27/Datensaetze_Mig/" // Ordner fuer Do-Files 

// Globals Joerg
global dir= "/home/Knut/Documents/UniGoettingen/SOEP2010/" // Arbeitsverzeichnis der Originaldatensaetze 
global AVZ= "/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
global temp="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" //Temporaerer Arbeitsspeicher
global LoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/logs/" // Ordner fuer Log-Files
global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" // Ordner fuer Do-Files 



***Log-File erstellen***
log using "${LoFi}miggen.log", replace

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
		1.8		$page17.dta - Output: page17_mig.dta
		1.9 	Elternzeiger (von Sabine Keller) - Output: elternzeiger.dta 
				1.9.1 Eltern
				1.9.2 Grosseltern
				1.9.3 Zusammenf�ehrung von Eltern und Grosseltern 
		1.10 	Seit wann dt. SBS - Output: germ_sbs.dta
		1.11 	Aufbereitung Jugenddatensatz Melanie
		1.12	Mergen aller Datensaetze - Output: miggen.dta	
		2. 	Bildung von Hilfsvariablen
		2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation immiyear, BIIGRP, deu_seit, biimgrp, staatsang)			
		2.2 Weitere Hilfsvariablen 
		
		3.	Bildung Migrantenvariablen
		3.1	Generationenstatus
				3.1.1 Generationenstatus unter ausschliesslicher Nutzung Geburtsland-Informationen
					3.1.1.1 Hilfsvariablen: sum_germborn_gp, sum_germborn_gp_mis und sum_r_nation_gp und eltern
					3.1.1.2 mig_gen_c: Generationenstatus unter ausschliesslicher Nutzung der Geburtsland-Informationen
					3.1.1.3 mig_gen_c_hv: Hilfsvariable Missings
				3.1.2 Generationenstatus unter Nutzung weiterer Informationen (Staatsangehoerigkeit, etc.)
					3.1.2.1 mig_gen_cn: Generationenstatus unter Beruecksichtigung weiterer Informationen
				3.1.3 soep_info (bezogen auf die Zielperson)
	
		3.2 Origin-Variablen
				3.2.1 Hilfsvariablen: eltern_geb_hv und grosseltern_geb_hv
				3.2.2 Herkunftsland-Variable origin
					3.2.2.1 origin_long
					3.2.2.2 origin_short
					3.2.2.3 origin_hv: Hilfsvariable Herkunftsland
*/


***********************************************************
***** 1. Zusammenfuehrung der benoetigten Datensaetze *****
***********************************************************


*************************************************
***** 1.1 ppfad.dta - Output: ppfad_mig.dta ***** 
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


************************************************
***** 1.2 $pgen.dta - Output: pgen_mig.dta ***** 
************************************************
***** erzeugte Vars: hhnr, nation **************

cd ${dir}
use apgen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep persnr ?hhnr nation* 
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
foreach file in bpgen.dta cpgen.dta dpgen.dta epgen.dta fpgen.dta gpgen.dta hpgen.dta ipgen.dta jpgen.dta kpgen.dta lpgen.dta mpgen.dta npgen.dta opgen.dta ppgen.dta qpgen.dta rpgen.dta spgen.dta tpgen.dta upgen.dta vpgen.dta wpgen.dta xpgen.dta ypgen.dta zpgen.dta bapgen.dta {
	merge persnr using "`file'", sort keep (*hhnr nation*)
  	drop _merge
	quietly: compress
}

***Umbennenung ausgewaehlter Variablen***
soepren nation84 nation85 nation86 nation87 nation88 nation89 nation90 nation91 nation92 nation93 nation94 nation95 nation96 nation97 nation98 nation99 nation00 nation01 nation02 nation03 nation04 nation05 nation06 nation07 nation08 nation09 nation10, newstub(nation) waves (1984/2010)  

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v) // deprecated 14.12.11

soepren ahhnr bhhnr chhnr dhhnr ehhnr fhhnr ghhnr hhhnr ihhnr jhhnr khhnr lhhnr mhhnr nhhnr ohhnr phhnr qhhnr rhhnr shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr bahhnr, newstub(hhnr) waves (1984/2010)   

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}pgen_mig.dta, replace


************************************************
***** 1.3 $kind.dta - Output: kind_mig.dta ***** 
************************************************
* Nationalitaet Kind, nur in A und E, Angabe des HH-Vorstands
* bisher nicht verwendet

cd ${dir}
use ekind.dta, clear
sort persnr
save ${temp}ekind.dta, replace

use akind.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr ?hhnr persnr ak07a 
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
merge persnr using ${temp}ekind.dta, sort keep (hhnr *hhnr persnr ek03a)
drop _merge

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v) // deprecated 14.12.11

***Umbennenung ausgewaehlter Variablen***
soepren ak07a ek03a, newstub(nationkind) waves (1984, 1989)  
soepren ahhnr  ehhnr , newstub(hhnr) waves (1984,1989)   

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}kind_mig.dta, replace


****************************************************
***** 1.4 hbrutt$.dta - Output: hbrutt_mig.dta ***** 
****************************************************
* bisher auch noch nicht verwendet!

// hbrutt98.dta und hbrutt00.dta koennen erst spaeter zusammengefuehrt werden, da es sich um Haushaltsdaten handelt, die keine 'persnr' besitzen


***hbrutt98.dta***
cd ${dir}
use hbrutt98.dta, clear

keep hhnr ?hhnr nathv sexhv
rename nathv nathv15
rename sexhv sexhv15
rename ohhnr hhnr15 // Notwendig, aufgrund bioimmig (siehe 1.6)

* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)   // deprecated 14.12.11

isid hhnr hhnr15 // hhnr und hhnr15 sind eindeutige Identifikationsvariable
sort hhnr hhnr15

save ${AVZ}hbrutt98_mig.dta, replace



***hbrutt00.dta***
cd ${dir}
use hbrutt00.dta, clear

keep hhnr ?hhnr nathv sexhv
rename nathv nathv17
rename sexhv sexhv17
rename qhhnr hhnr17 // Notwendig, aufgrund bioimmig (siehe 1.6)

* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)  // deprecated 14.12.11

isid hhnr hhnr17 // hhnr und hhnr17 sind eindeutige Identifikationsvariable
sort hhnr hhnr17

save ${AVZ}hbrutt00_mig.dta, replace


******************************************
***** 1.5 $p.dta - Output: p_mig.dta ***** 
******************************************
* Seit wann dt. Staatsangeh�rigkeit?
	
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

merge persnr using ${dir}bap.dta, sort keep (hhnr persnr *hhnr bap137)
drop _merge

***Umbennenung ausgewaehlter Variablen***
soepren sp116 tp124 up128 vp137 wp129 xp141 yp139 zp139 bap137, newstub(deu_seit) waves (2002/2010)  
soepren shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr bahhnr, newstub(hhnr) waves (2002/2010)   

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v) // deprecated 14.12.11

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}p_mig.dta, replace


*******************************************************
***** 1.6 bioimmig.dta - Output: bioimmig_mig.dta ***** 
*******************************************************
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
save ${AVZ}bioimmig_mig.dta, replace


*******************************************************
***** 1.7 bioparen.dta - Output: bioparen_mig.dta ***** 
*******************************************************

use ${dir}/bioparen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep vnat mnat vgebj mgebj vaortakt maortakt vaortup maortup living* persnr hhnr 

***Zahlen als Missings kodieren***
* quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)   // deprecated 14.12.11

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}bioparen_mig.dta, replace


***************************************************************************************************
***** 1.9 Elternzeiger (von Sabine Keller) - Output: elternzeiger.dta (Stand: Mail vom 12.05) *****
***************************************************************************************************
************************
***** 1.9.1 Eltern *****
************************

****Elterninformationen aus dem $PBRUTTO holen (Stellung zum Haushaltsvorstand)***
use ${dir}apbrutto, clear
keep persnr *hhnr *stell
cd ${dir}
quietly: merge persnr using bpbrutto cpbrutto dpbrutto epbrutto fpbrutto gpbrutto hpbrutto ipbrutto jpbrutto kpbrutto lpbrutto mpbrutto npbrutto opbrutto ppbrutto qpbrutto rpbrutto spbrutto tpbrutto upbrutto vpbrutto wpbrutto xpbrutto ypbrutto zpbrutto bapbrutto, sort keep (*stell *hhnr)
drop _merge* hhnr

soepren astell bstell cstell dstell estell fstell gstell hstell istell jstell kstell lstell mstell nstell ostell pstell qstell rstell sstell tstell ustell vstell wstell xstell ystell zstell bastell, newstub(stell) wave(1/27)
soepren ahhnr bhhnr chhnr dhhnr ehhnr fhhnr ghhnr hhhnr ihhnr jhhnr khhnr lhhnr mhhnr nhhnr ohhnr phhnr qhhnr rhhnr shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr bahhnr, newstub(hhnr) wave(1/27)

merge persnr using ${dir}ppfad, sort keep (sex)
drop _merge

quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

reshape long stell hhnr, i(persnr) j(wave)

drop if hhnr>=.

order hhnr wave persnr
sort hhnr wave stell

capture gen mnr_br=.
label variable mnr_br "Mutternr. aus xPBRUTTO"
capture gen vnr_br=.
label variable vnr_br "Vaternr. aus xPBRUTTO"

capture gen sex_hhv=.
capture gen persnr_hhv=.
capture gen sex_p_hhv=.
capture gen persnr_p_hhv=.

replace sex_hhv=sex if stell==0 // Geschlecht des Haushaltsvorstandes ermitteln
replace persnr_hhv=persnr if stell==0 // persnr des Haushaltsvorstandes ermitteln
replace sex_p_hhv=sex if stell==1|stell==2 // Geschlecht des Partners des Haushaltsvorstandes ermitteln
replace persnr_p_hhv=persnr if stell==1|stell==2  // persnr des Partners des Haushaltsvorstandes ermitteln

replace sex_hhv=sex_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&stell!=0 // Geschlecht des HH-Vorstandes auf die restlichen HH-Mitglieder uebertragen
replace persnr_hhv=persnr_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&stell!=0 // persnr des HH-Vorstandes auf die restlichen HH-Mitglieder uebertragen
replace sex_p_hhv=sex_p_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&(stell!=1&stell!=2) // Geschlecht des Partners des HH-Vorstandes auf die restlichen HH-Mitglieder uebertragen
replace persnr_p_hhv=persnr_p_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&(stell!=1&stell!=2) // persnr des Partners des HH-Vorstandes auf die restlichen HH-Mitglieder uebertragen

keep if stell==3 // nur die Kinder des HH-Vorstandes beibehalten

replace mnr_br=persnr_p_hhv if sex_p_hhv==2 // Daten vom (Partner des) HH-Vorstandes auf Elternnr. schreiben ...
replace mnr_br=persnr_hhv if sex_hhv==2

replace vnr_br=persnr_p_hhv if sex_p_hhv==1
replace vnr_br=persnr_hhv if sex_hhv==1

drop sex_* persnr_*

collapse (firstnm) mnr_br vnr_br, by (persnr) // erste Angabe beibehalten -> kann ggf. auch auf die letzte oder die haeufigste Angabe angepasst werden 

quietly: compress
sort persnr
save ${temp}pbrutto, replace

****Elterninformationen aus dem Jugendbiographiedatensatz (BIOAGE17) holen***
use ${dir}bioage17, clear // Elterndaten ueber Jugendfragebogen ranspielen -> Lebenslauf-Fragebogen hat keine Infos ueber Eltern
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)
keep persnr bymnr byvnr // Personennr. der Eltern behalten
sort persnr // fuers Mergen vorsortieren 
save ${temp}Eltern, replace // im AVZ im TEMPoraeren Ordner Sortierung und Reduzierung speichern

***Elterninformationen aus dem Kinderdatensaetzen ($Kind) holen***
cd ${dir}
use akind, clear
sort persnr

foreach file in bkind.dta ckind.dta dkind.dta ekind.dta fkind.dta gkind.dta hkind.dta ikind.dta jkind.dta kkind.dta lkind.dta mkind.dta nkind.dta okind.dta pkind.dta qkind.dta rkind.dta skind.dta tkind.dta ukind.dta vkind.dta wkind.dta xkind.dta ykind.dta zkind.dta bakind.dta{
	merge 1:1 persnr using "`file'"
  	drop _merge
	quietly: compress
}


keep persnr *kmutti *kmup // nur die Elterninfos beibehalten
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)
compress
sort persnr
save ${temp}kind.dta, replace

merge persnr using ${temp}Eltern, sort // kind-Datensatz mit Elterndatensatz mergen
drop _merge
sort persnr
save ${temp}Eltern, replace

***Kinderinformationen aus dem Biobirth-Datensatz holen***  
use ${dir}biobirth, clear // Personennr der Mutter ueber den Geburtsbiographie-Datensatz 
keep persnr kidpnr*
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

foreach x of varlist persnr-kidpnr15 { 		// vor alle Mutter-Variablen m_ setzen - Abgrenzung von Vater und Frau selbst
	rename `x' m_`x' 
}

forvalues x=1/9 { 					// Nullen entfernen, weil sonst der reshape-Befehl nicht funktioniert
	rename m_kidpnr0`x' m_kidpnr`x'
}

reshape long m_kidpnr, i(m_persnr) j(m_kidnr) // Rangfolge ist egal - entscheidend ist die Personennr. des Elternteils
keep if m_kidpnr>0&m_kidpnr<.
rename m_kidpnr persnr // zum Mergen muss Kindernr. in Personennr. umbenannt werden
rename m_persnr mb_persnr // damit erst im Elterndatensatz aneinandergespielt wird
keep persnr mb_persnr 

sort persnr 
save ${temp}biobirth, replace // im TEMPoraeren Ordner des AVZ ablegen


***Vaternr. suchen*** 
use ${dir}biobrthm, clear // Personennr des Vaters ueber den Geburtsbiographie-Datensatz 
keep persnr kidpnr*
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

foreach x of varlist persnr-kidpnr15 { 		// vor alle Vater-Variablen v_ setzen - Abgrenzung von Mutter und Befragungsperson selbst
	rename `x' v_`x'
}

forvalues x=1/9 { 					// Nullen entfernen, weil sonst der reshape-Befehl nicht funktioniert
	rename v_kidpnr0`x' v_kidpnr`x'
}

reshape long v_kidpnr, i(v_persnr) j(v_kidnr) // Rangfolge ist egal - entscheidend ist die Personennr. des Elternteils
keep if v_kidpnr>0&v_kidpnr<.
rename v_kidpnr persnr // zum Mergen muss Kindernr. in Personennr. umbenannt werden
rename v_persnr vb_persnr // damit erst im Elterndatensatz aneinandergespielt wird
keep persnr vb_persnr

sort persnr 
save ${temp}biobrthm, replace // im TEMProraeren Ordner des AVZ ablegen


***Eltern ranspielen***
cd ${temp}
use Eltern, clear 
merge persnr using ${temp}biobirth, keep (mb_persnr) // Zusammenspielen und nur die Personennr. der Mutter beibehalten
drop _merge 
sort persnr 
save ${AVZ}Eltern, replace 

merge persnr using ${temp}biobrthm, keep (vb_persnr)
drop _merge 
sort persnr
save ${AVZ}TM_Eltern, replace

merge persnr using ${dir}bioparen, sort keep (mnr vnr)
drop _merge

merge persnr using ${temp}pbrutto, sort keep (mnr_br vnr_br)
drop _merge
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

local vater byvnr vnr vb_persnr akmup bkmup ckmup dkmup ekmup fkmup gkmup hkmup ikmup jkmup kkmup lkmup mkmup nkmup okmup pkmup qkmup rkmup skmup tkmup ukmup vkmup wkmup xkmup ykmup zkmup vnr_br
local mutter bymnr mnr mb_persnr akmutti bkmutti ckmutti dkmutti ekmutti fkmutti gkmutti hkmutti ikmutti jkmutti kkmutti lkmutti mkmutti nkmutti okmutti pkmutti qkmutti rkmutti skmutti tkmutti ukmutti vkmutti wkmutti xkmutti ykmutti zkmutti mnr_br 

mvdecode `vater' `mutter', mv (0=.)
* egen v_persnr=rowfirst (byvnr vnr vb_persnr akmup bkmup ckmup dkmup ekmup fkmup gkmup hkmup ikmup jkmup kkmup lkmup mkmup nkmup okmup pkmup qkmup rkmup skmup tkmup ukmup vkmup wkmup xkmup ykmup zkmup vnr_br) // Vaterpersnr anlegen
* egen m_persnr=rowfirst (bymnr mnr mb_persnr akmutti bkmutti ckmutti dkmutti ekmutti fkmutti gkmutti hkmutti ikmutti jkmutti kkmutti lkmutti mkmutti nkmutti okmutti pkmutti qkmutti rkmutti skmutti tkmutti ukmutti vkmutti wkmutti xkmutti ykmutti zkmutti mnr_br) // Mutterpersnr anlegen

capture gen v_persnr=. // Vaterpersnr anlegen
replace v_persnr=.
capture gen m_persnr=. // Mutterpersnr anlegen
replace m_persnr=.
foreach x of local vater {
		quietly replace v_persnr=`x' if (v_persnr>=.&`x'<.&`x'>0) // fuer BIOAGE17, BIOPAREN, BIOBIRTH/BIOBRTHM, $KIND, $PBRUTTO schauen, ob eine gueltige Vaterpersonennr vorhanden ist und diese draufspeichern
}
foreach x of local mutter {
		quietly replace m_persnr=`x' if (m_persnr>=.&`x'<.&`x'>0) // fuer BIOAGE17, BIOPAREN, BIOBIRTH/BIOBRTHM, $KIND, $PBRUTTO schauen, ob eine gueltige Vaterpersonennr vorhanden ist und diese draufspeichern
}

label variable v_persnr "person number of father (child)"
label variable m_persnr "person number of mother (child)"

foreach x in m v {
	capture gen `x'_quelle=.
	label variable `x'_quelle "Quelle des Elternzeigers (`x')"
	replace `x'_quelle=1 if `x'_persnr==by`x'nr&`x'_persnr<.
	replace `x'_quelle=2 if `x'_persnr==`x'nr&`x'_quelle>=.&`x'_persnr<.
	replace `x'_quelle=3 if `x'_persnr==`x'b_persnr&`x'_quelle>=.&`x'_persnr<.
	replace `x'_quelle=4 if `x'_persnr==`x'nr_br&`x'_quelle>=.&`x'_persnr<.
	replace `x'_quelle=5 if `x'_quelle>=.&`x'_persnr<.
}

label define quelle 1"[1]BIOAGE17" 2"[2]BIOPAREN" 3"[3]BIOBIRTH/BIOBRTHM" 4"[4]xPBRUTTO" 5"[5]xKIND", modify
label values *quelle quelle

drop  bymnr byvnr mnr vnr *kmutti *kmup mb_persnr vb_persnr ?nr_br

* quietly: mvencode _all, mv(.k=-1\.t=-2\.v=-3) // ggf. Missingkodierung rueckgaengig machen  // deprecated 14.12.11

quietly compress // reduces the size of your dataset by considering demoting
sort persnr
save ${AVZ}elternzeiger, replace


*****************************
***** 1.9.2 Grosseltern *****
*****************************


***Eltern vaeterlicherseits ***
use ${AVZ}elternzeiger, clear 
rename v_persnr gv_v
rename m_persnr gm_v
rename persnr v_persnr
save ${AVZ}elternzeiger_v, replace 

***Eltern muetterlicherseits***
use ${AVZ}elternzeiger, clear 
rename v_persnr gv_m
rename m_persnr gm_m
rename persnr m_persnr
save ${AVZ}elternzeiger_m, replace 


*************************************************************
***** 1.9.3 Zusammenfueehrung von Eltern und Grosseltern ****
*************************************************************
***Grosseltern an elternzeiger.dta mergen***
cd ${AVZ}
use elternzeiger, clear 
sort v_persnr
merge v_persnr using elternzeiger_v.dta
drop if _merge ==2
drop _merge

sort m_persnr 
merge m_persnr using elternzeiger_m.dta
drop if _merge ==2
drop _merge

***Sortierung und Speicherung des Datensatzes***
sort persnr
save ${AVZ}elternzeiger2, replace 


*************************************************************
***** 1.10 Seit wann dt. SBS - Output: germ_sbs.dta *********
*************************************************************
* 1.10.1 Dt. SBS seit Geburt ja/nein ************************
cd ${dir}
use sp.dta, clear
keep persnr sp116
sort persnr

merge persnr using tp.dta, sort keep(tp124)
drop _merge
merge persnr using up.dta, sort keep(up128)
drop _merge
merge persnr using vp.dta, sort keep(vp137)
drop _merge
merge persnr using wp.dta, sort keep(wp129)
drop _merge
merge persnr using xp.dta, sort keep(xp141)
drop _merge
merge persnr using yp.dta, sort keep(yp139)
drop _merge
merge persnr using zp.dta, sort keep(zp139)
drop _merge
merge persnr using bap.dta, sort keep(bap137)
drop _merge

gen check = 1 if (sp116 == tp124 | tp124 == . | sp116 == .) & (tp124 == up128 | tp124 == . | up128 == .) & (up128 == vp137 | up128 == . | vp137 == .) & (vp137 == wp129 | vp137 == . | wp129 == .) & (wp129 == xp141 | wp129 == . | xp141 == .) & (xp141 == yp139 | xp141 == . | yp139 == .) & (yp139 == zp139 | yp139 == . | zp139 == .) & (zp139 == bap137 | bap137 == . | zp139 == .)
list if check == . // es gibt Inkonsistenzen
gen deu_seit = 1 if check == 1 & (sp116 == 1 | tp124 == 1 | up128 == 1 | vp137 == 1 | wp129 == 1 | xp141 == 1 | yp139 == 1 | zp139 == 1 | bap137 == 1)
replace deu_seit = 0 if deu_seit == . // alle mit Inkonsistenzem werden als Nicht Mit Dt. SBS geboren gezaehlt
keep persnr deu_seit

save ${tmp}germnatbirth ,replace

* 1.10.2 Genaues Jahr der Einbuergerung **********************
cd ${dir}
use apgen.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep persnr nation* 
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
foreach file in bpgen.dta cpgen.dta dpgen.dta epgen.dta fpgen.dta gpgen.dta hpgen.dta ipgen.dta jpgen.dta kpgen.dta lpgen.dta mpgen.dta npgen.dta opgen.dta ppgen.dta qpgen.dta rpgen.dta spgen.dta tpgen.dta upgen.dta vpgen.dta wpgen.dta xpgen.dta ypgen.dta zpgen.dta bapgen.dta{
	merge persnr using "`file'", sort keep (persnr nation*)
  	drop _merge
	quietly: compress
}

***Umbennenung ausgewaehlter Variablen***
soepren nation84 nation85 nation86 nation87 nation88 nation89 nation90 nation91 nation92 nation93 nation94 nation95 nation96 nation97 nation98 nation99 nation00 nation01 nation02 nation03 nation04 nation05 nation06 nation07 nation08 nation09, newstub(nation) waves (1984/2010)  

merge persnr using ${dir}sp, sort keep(persnr sp118)
drop _merge

reshape long nation, i(persnr)
rename _j year

gen since = .
list persnr year nation if nation==1 & nation[_n-1]>1 & nation[_n-1]<200 & sp118 >0
list persnr year nation since sp118 if persnr == 5099902 						// test
bysort persnr: replace since = year+1983 if nation[_n-1] > 1 & nation[_n-1] < 200 & nation == 1
list persnr year nation since sp118 if persnr == 7214601 						// test
list persnr year nation since sp118 if persnr == 9803  						// test

save ${tmp}since, replace 
use ${tmp}since, clear

drop if (sp118 == . | sp118 == -1 | sp118 == -2) & since == .
bysort persnr: egen since2 = max(since)
replace since = since2
replace since = sp118 if since == . & sp118 > 0			// Die eigenen generierten Variablen aus xP haben Vorrang vor sp118!!!
rename since germ_since

drop nation year
duplicates drop
duplicates list persnr // check for duplicates
keep persnr germ_since

***Sortierung und Speicherung des Datensatzes***
sort persnr
save ${tmp}germ_since, replace

***Zusammenfuehren der Datensaetze**************
use ${tmp}germ_since.dta, clear
merge persnr using ${tmp}germnatbirth, sort
drop _merge 
sort persnr

save ${AVZ}germ_sbs, replace 

*************************************************************
***** 1.11 Aufbereitung Jugenddatensatz Melanie *************
*************************************************************

*************************************************************
***** 1.11 Aufbereitung Jugenddatensatz Melanie *************
*************************************************************


*****************************************************************************************************************
*** 1. Bildung Masterdatensatz: Melanie_jugendliche.dta
*****************************************************************************************************************

*****************************************************************************************
*** $PAGE17: Informationen zur Bestimmung Generationenstatus Jugendlicher (seit 2006) ***
*****************************************************************************************

* FRAGE: Muessen hier jetzt tatsaechlich wieder alle Datensaetze (BIOIMMIG, etc.) beruecksichtigt werden?
	

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
	soepren wj6001 xj6001 yj6001 zj6001 baj6001, newstub(gebjahr_j) waves (23/27)  
	soepren wj6002 xj6002 yj6002 zj6002 baj6002, newstub(gebmoval_j) waves (23/27)  
	soepren wj61 xj61 yj61 zj61 baj61, newstub(germborn_j) waves (23/27)  
	soepren wj6201 xj62 yj62 zj62 baj62, newstub(crelgin_j) waves (23/27)  
	soepren wj63 xj63 yj63 zj63 baj63, newstub(immiyear_j) waves (23/27)  
	soepren wj64 xj64 yj64 zj64 baj64, newstub(biimgrp_j) waves (23/27)  
	soepren wj65 xj65 yj65 zj65 baj65, newstub(nation_deu_j) waves (23/27)  
	soepren wj67 xj67 yj67 zj67 baj67, newstub(deu_seit_j) waves (23/27)  
	soepren wj6601 xj6601 yj6601 zj6601 baj6601, newstub(d_nation2_j) waves (23/27)  
	soepren wj6602 xj6602 yj6602 zj6602 baj6602, newstub(nation2_j) waves (23/27)  
	soepren wj6801 xj68 yj68 zj68 baj68, newstub(nation_j) waves (23/27)  
	soepren wj69 xj69 yj69 zj69 baj69, newstub(biresper_j) waves (23/27)  


* Reduzierten Datensatz speichern
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}page17_mig1.dta, replace



************************************************************************************************************
*** PPFAD: Weitere Hintergrundinformationen zum Jugendlichen (bis einschliesslich 2005) und dessen Eltern ***
************************************************************************************************************

	use ${dir}ppfad.dta, clear

* Beibehaltung ausgewaehlter Variablen*** 
	keep hhnr persnr sex gebmoval gebjahr immiyear germborn corigin 

* Reduzierten Datensatz speichern
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}ppfad_mig1.dta, replace


****************
*** BIOIMMIG ***
****************

* Erst einmal unberuecksichtigt


****************
*** BIOPAREN ***
****************

	use ${dir}/bioparen.dta, clear

* Beibehaltung ausgewaehlter Variablen***
	keep persnr hhnr vnr mnr vnat mnat vorigin morigin vgebj mgebj vaortakt maortakt vaortup maortup living* 

	*** FRAGE: Benoetigt man hier die vnr bzw. mnr? Ich habe jetzt die persnr des Jugendlichen zum mergen genommen ...

* Reduzierten Datensatz speichern***
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}bioparen_mig1.dta, replace

*******************************************
*** BILDUNG MASTERDATENSATZ Jugendliche ***
*******************************************

* Oeffnen des Masterdatensatzes 
	use ${dir}/bioage17.dta, clear

**************************************************
*** FRAGE:Wird das spaeter eh gemacht? Dann kann das hier weg


*** Ranspielen der Infos fuer die MUTTER
* Umbenennung der persnr
	rename hhnr kindhhnr
	rename persnr kindpersnr
	rename bymnr persnr
	sort persnr

* Ranspielen Infos fuer die Mutter aus ppfad_mig1
	merge m:1 persnr using ${AVZ}ppfad_mig1.dta
	tab _merge

	rename hhnr hhnr_m
	rename gebmoval gebmoval_m
	rename gebjahr gebjahr_m
	rename immiyear immiyear_m
	rename germborn germborn_m
	rename corigin corigin_m 
	rename sex sex_m

	drop if _merge==2
	drop _merge


***************************************************
*** Ranspielen der Infos fuer den VATER
* Umbenennung der persnr
	rename persnr bymnr
	rename byvnr persnr
	sort persnr

* Ranspielen Infos fuer den Vater aus PPFAD
	merge m:1 persnr using ${AVZ}ppfad_mig1.dta

	rename hhnr hhnr_f
	rename gebmoval gebmoval_f
	rename gebjahr gebjahr_f
	rename immiyear immiyear_f
	rename germborn germborn_f
	rename corigin corigin_f
	rename sex sex_f

	tab _merge
	drop if _merge==2
	drop _merge

************************************************************
*** Ranspielen der Infos fuer den befragten JUGENDLICHEN/KIND
* Umbenennung der persnr
	rename persnr byvnr
	rename kindpersnr persnr
	sort persnr

* Ranspielen Infos fuer Kind aus $PAGE17
	merge m:1 persnr using ${AVZ}page17_mig1.dta
	tab _merge
	drop _merge

* Ranspielen Infos fuer Kind aus dem Datensatz von Elisabeth
	sort persnr
	merge m:1 persnr using ${AVZ}wjugend.dta // WICHTIG: Der Datensatz von Elisabeth muss im AVZ liegen!
	tab _merge
	drop _merge

	rename wj7901 germborn_f_j
	rename wj7902 germborn_m_j

* Ranspielen Infos fuer Kind aus PPFAD
	sort persnr
	merge m:1 persnr using ${AVZ}ppfad_mig1.dta

	tab _merge
	drop if _merge==2
	drop _merge

* Ranspielen Infos fuer Kind aus BIOPAREN --> FRAGE: Hier gibt es eine mnr und vnr --> Sind das dieselben wie bymnr und byvnr? 
	sort persnr
	merge m:1 persnr using ${AVZ}bioparen_mig1.dta

	tab _merge
	drop if _merge==2
	drop _merge


drop hhnr
rename kindhhnr hhnr

save ${AVZ}Melanie_jugendliche.dta, replace



* Pruefen, ob Zusammenfassung verteilter Infos notwendig
*******************************************************

*** bei den JUGENDLICHEN (Moegliche Quellen - Jetzige Annahme: page17 (seit 2006); ppfad (bis 2005))

* Pruefen, ob Geburtslandinfos aus $PAGE in der PPFAD-Info enthalten ist

	tab germborn, m
	tab germborn germborn_j23
	tab germborn germborn_j24
	tab germborn germborn_j25
	tab germborn germborn_j26
	tab germborn germborn_j27

*** Ja, Infos sind in PPFAD-Daten enthalten, wobei Abweichungen (25; 26; 27) --> Warum?
*** --> Germborn kann grundsaetzlich fuer Jugendliche genutzt werden


* Pruefen, ob corigin-Infos aus $PAGE in PPFAD-corigin enthalten sind

	tab corigin, m
	tab corigin corigin_j23
	tab corigin corigin_j24
	tab corigin corigin_j25
	tab corigin corigin_j26
	tab corigin corigin_j27

*** Ja, Infos sind enthalten 
*** --> corigin aus PPFAD kann grundsaetzlich genutzt werden


* Pruefen, ob immiyearinfos aus $PAGE auch bei PPFAD enthalten
	tab immiyear, m
	tab immiyear immiyear_j23
	tab immiyear immiyear_j24
	tab immiyear immiyear_j25
	tab immiyear immiyear_j26
	tab immiyear immiyear_j27

*** Ja, Info ist enthalten, wobei teilweise Abweichungen (23; 24; 25; 26) --> Warum? -> Jugendliche nehmen
*** --> immiyear aus PPFAD kann grundsaetzlich genutzt werden 



*****************************************************************************************************************
*** bei den ELTERN (Moegliche Quellen: bioparen, ppfad, wjugend fuer 2006 von Elisabeth)

* Kongruente Infos aus PPFAD bei Germborn und Corigin?
	tab corigin_f germborn_f, m
* 503 x Sysmis bei beiden 

	tab corigin_m germborn_m, m
* 74 x Sysmis bei beiden Variablen 



*****************************************************************
* WJUGEND: Benoetigt man die Dummy-Info von den Jugendlichen zu dem Geburtsland ihrer Eltern aus dem DS von Elisabeth fuer 2006?

* VATER
	tab germborn_f_j
	tab germborn_f germborn_f_j if erhebj==2006, m
*** 39 "." bei germborn_f; Wenn Nutzung Info von Elisabeth fuer 2006, dann koennten 35 Faelle deutsch und 3 Faelle den Immigranten zugeordnet werden
*** Folglich: Diese Faelle wuerde ich noch zuordnen + Vermerk in Hilfsvariable, dass diese Info vom Jugendlichen kommt

* Ist die Info bei vorigin enthalten?
	tab vorigin germborn_f_j if erhebj==2006, m //--> Nein; hier -1


* MUTTER
	tab germborn_m germborn_m_j if erhebj==2006, m
*** 6 Sysmis bei germborn_m; bei der Info von Elisabeth 4x Deutschland und 2x-2

* Ist die Info bei morigin enthalten?
	tab morigin germborn_m_j if erhebj==2006, m //--> Nein; hier -1


*****************************************************************


* Vorigin und Morigin aus BIOPAREN (auch Infos von Jugendlichen zu den Eltern seit 2007 enthalten)
	tab vorigin, m
*** 2640 x keine Angabe (-1) - Was ist da los? Eventuell doch nicht zusaetzlich die Infos aus PPFAD zugespielt, sondern nur Angaben der Jugendlichen?
*** Dennoch FRAGE: Wie kann es sein, dass es hier weniger Infos gibt als bei den aus PPFAD zugespielten Infos???
*** Verstehe ich nicht ... Sind das andere Personen?  

	tab morigin, m
*** 2640 x keine Angabe (-1) - Was ist da los? Siehe Vater



* Sind bei den PPFAD-Infos zu den Eltern mehr Informationen enthalten als bei der VORIGIN und MORGIN aus Bioparen oder umgekehrt?
	tab vorigin germborn_f, m
*** vorigin -1=2261 Faelle; in germborn_f sind davon 1821 in Deutschland geboren, 418 migriert und 20 haben anderen Missing-Wert
*** + Eine Reihe von Faellen, hat in vorigin ein anderes Geburtsland und ist gemaess der germborn aber in D geboren --> Sehr suspekt, welche Info nun wahr ...
*** + 503 Faelle, die in germborn "." haben: sind in der vorigin: 103 x 1; 20 x 2; 1 x -3; 379 x -1

	tab morigin germborn_m, m
* 1 von den fehlenden 74 Faellen kann zugeordnet werden (Migrant)


*** HINWEIS: Wenn Verwendung der Informationen von vorigin und morigin, dann muss diese Info sowohl Origin als auch germborn zugespielt werden



* 2. Schritt: Zuspielen weiterer Infos zu den Eltern-Variablen
**************************************************************

* Fuer die ELTERN

* Aus wjugend
*** Zuspielen der Infos fuer VATER (zu der germborn_f)
	replace germborn_f=2 if germborn_f==. & germborn_f_j==2
	replace germborn_f=1 if germborn_f==. & germborn_f_j==1
	replace germborn_f=-2 if germborn_f==. & germborn_f_j==-2

	tab germborn_f, m


*** Zuspielen der Infos fuer MUTTER (zu der germborn_m)
	replace germborn_m=1 if germborn_m==. & germborn_m_j==1
	replace germborn_m=-2 if germborn_m==. & germborn_m_j==-2

	tab germborn_m, m


*************************************************************************

* Aus Bioparen
**************

* VATER

*** Zuspielen Infos aus vorigin/BIOPAREN zu germborn_f
	tab vorigin germborn_f, m
* 464 Sysmis koennten so eliminiert werden

* Was haben die aus Wjugend zugespielten Faelle bei Vorigin?
	tab corigin_f germborn_f_j if erhebj==2006, m
	tab vorigin germborn_f_j if erhebj==2006, m
* Die aus Wjugend der germborn_f zugespielten Faelle bekommen folglich -1

* Zuspielen
	replace germborn_f=2 if germborn_f==. & vorigin>=2
	replace germborn_f=1 if germborn_f==. & vorigin==1
	replace germborn_f=-1 if germborn_f==. & vorigin==-1
	replace germborn_f=-3 if germborn_f==. & vorigin==-3
	tab vorigin germborn_f, m


*** Zuspielen Infos aus vorigin/BIOPAREN zu corigin_f
	tab corigin_f vorigin, m

	replace corigin_f=vorigin if corigin_f==.
	tab corigin_f, m


* MUTTER

*** Zuspielen Infos aus morigin/BIOPAREN zu germborn_m
*******************************************************

	tab morigin germborn_m, m
* 68 Sysmis koennten so eliminiert werden, wobei 67 x -1

* Was haben aber die aus Wjugend zugespielten Faelle bei Morigin?
	tab corigin_m germborn_m_j if erhebj==2006, m
	tab morigin germborn_m_j if erhebj==2006, m
* Die aus Wjugend der germborn_m zugespielten Faelle bekommen folglich -1

* Zuspielen
	replace germborn_m=2 if germborn_m==. & morigin>=2
	replace germborn_m=-1 if germborn_m==. & morigin==-1
	tab germborn_m


*** Zuspielen Infos aus morigin/BIOPAREN zu corigin_m
	tab corigin_m morigin, m

	replace corigin_m=morigin if corigin_m==.
	tab corigin_m, m



**************************************************************************

* Vermerk zugewiesener Faelle in einer Hilfsvariable (sind hoechstwahrscheinlich Infos von den Jugendlichen zu ihren Eltern).

*** Vermerk in Hilfsvariable "quelle_germborn_f"
	gen quelle_germborn_f=.
	replace quelle_germborn_f=0 if germborn_f!=. & erhebj==2006 // Bezug auf Wjugend haette man sich sparen koennen. Naja ...
	replace quelle_germborn_f=1 if germborn_f==. & (germborn_f_j==2 | germborn_f_j==1 | germborn_f_j==-2) & erhebj==2006

	replace quelle_germborn_f=0 if corigin_f!=. 
	replace quelle_germborn_f=1 if corigin_f==. 


	tab quelle_germborn_f, m
	tab quelle_germborn_f germborn_f_j if erhebj==2006, m


*** Vermerk in Hilfsvariable "quelle_rgermborn_m"
	gen quelle_germborn_m=.
	replace quelle_germborn_m=0 if germborn_m!=. & erhebj==2006 
	replace quelle_germborn_m=1 if germborn_m==. & (germborn_m_j==2 | germborn_m_j==1 | germborn_m_j==-2) & erhebj==2006

	replace quelle_germborn_m=0 if corigin_m!=. 
	replace quelle_germborn_m=1 if corigin_m==. 

	tab quelle_germborn_m, m
	tab quelle_germborn_m germborn_m_j if erhebj==2006, m


*** Bildung Summenscore: Anzahl Faelle bei denen Elterninfo von den Jugendlichen

	egen sum_quelle_gp = anycount(quelle_germborn_m quelle_germborn_f), values(1)
	tab sum_quelle_gp



*** HIER UNBEDINGT NOCH MAL PRUEFEN --> EVENTUELL AUCH GLEICH DIE ELTERN-INFOS beibehalten (unberuecksichtigt sind dann aber die NATION-Sachen)?????????
* Nehme nur die Variablen fuer die Jugendlichen, nicht die aus ppfad
* deu_seit_j25 -> deu_seit
* staatsang`x', biimgrp`x', nation`x', corigin[_n-`x'], germborn[_n-`x'], immiyear[_n-`x'], gebjahr[_n-`x'], germnatbirth[_n-`x']

use ${AVZ}melanie_jugendliche.dta, clear

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




*************************************************************
***** 1.11 Mergen aller Datensaetze - Output: miggen.dta ****
*************************************************************


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
merge persnr using bioimmig_mig.dta
drop _merge


***Merge-Prozess von Personen- und Haushaltsdaten; Analyseeinheit: Personen***
sort hhnr hhnr15 
merge hhnr hhnr15 using hbrutt98_mig.dta
drop _merge

sort hhnr hhnr17 
merge hhnr hhnr17 using hbrutt00_mig.dta
drop _merge

***Speicherung des Datensatzes unter migra.dta***
sort persnr 
save ${AVZ}miggen_merged.dta, replace


*****************************************
***** 2. Bildung von Hilfsvariablen *****
*****************************************
***** von Joerg *************************

cd ${AVZ}
use miggen_merged.dta, clear

***************************************************************************************************************************
***** 2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation, immiyear, BIIGRP, deu_seit, biimgrp, staatsang) *****
***************************************************************************************************************************


***Vorbereitungen***
generate staatsang = .
forvalues x=19/27 {
	replace staatsang = staatsang`x' if staatsang`x'!=.
}

*generate biimgrp =.
forvalues x=1/27 {
	replace biimgrp = biimgrp`x' if biimgrp`x'!=.
}

*generate nation =.
forvalues x=1/27 {
	replace nation = nation`x' if nation`x'!=.
}


***Generierung der Hilfsvariablen***
sort hhnr persnr
forvalues x=1/36 {
	capture gen corigin_m=.								// corigin_m
	replace corigin_m=corigin[_n-`x'] if m_persnr==persnr[_n-`x']
	replace corigin_m=corigin[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen corigin_f=.								// corigin_f
	replace corigin_f=corigin[_n-`x'] if v_persnr==persnr[_n-`x']
	replace corigin_f=corigin[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen corigin_f_f=.							// corigin_f_f
	replace corigin_f_f=corigin[_n-`x'] if gv_v==persnr[_n-`x']
	replace corigin_f_f=corigin[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen corigin_m_f=.							// corigin_m_f
	replace corigin_m_f=corigin[_n-`x'] if gm_v==persnr[_n-`x']
	replace corigin_m_f=corigin[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen corigin_f_m=.							// corigin_f_m
	replace corigin_f_m=corigin[_n-`x'] if gv_m==persnr[_n-`x']
	replace corigin_f_m=corigin[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen corigin_m_m=.							// corigin_m_m
	replace corigin_m_m=corigin[_n-`x'] if gm_m==persnr[_n-`x']
	replace corigin_m_m=corigin[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen germborn_m=.							// germborn_m
	replace germborn_m=germborn[_n-`x'] if m_persnr==persnr[_n-`x']
	replace germborn_m=germborn[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen germborn_f=.							// germborn_f
	replace germborn_f=germborn[_n-`x'] if v_persnr==persnr[_n-`x']
	replace germborn_f=germborn[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen germborn_f_f=.							// germborn_f_f
	replace germborn_f_f=germborn[_n-`x'] if gv_v==persnr[_n-`x']
	replace germborn_f_f=germborn[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen germborn_m_f=.							// germborn_m_f
	replace germborn_m_f=germborn[_n-`x'] if gm_v==persnr[_n-`x']
	replace germborn_m_f=germborn[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen germborn_f_m=.							// germborn_f_m
	replace germborn_f_m=germborn[_n-`x'] if gv_m==persnr[_n-`x']
	replace germborn_f_m=germborn[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen germborn_m_m=.							// germborn_m_m
	replace germborn_m_m=germborn[_n-`x'] if gm_m==persnr[_n-`x']
	replace germborn_m_m=germborn[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen immiyear_m=.							// immiyear_m
	replace immiyear_m=immiyear[_n-`x'] if m_persnr==persnr[_n-`x']
	replace immiyear_m=immiyear[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen immiyear_f=.							// immiyear_f
	replace immiyear_f=immiyear[_n-`x'] if v_persnr==persnr[_n-`x']
	replace immiyear_f=immiyear[_n+`x'] if v_persnr==persnr[_n+`x']	
	capture gen immiyear_f_f=.							// immiyear_f_f
	replace immiyear_f_f=immiyear[_n-`x'] if gv_v==persnr[_n-`x']
	replace immiyear_f_f=immiyear[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen immiyear_m_f=.							// immiyear_m_f
	replace immiyear_m_f=immiyear[_n-`x'] if gv_m==persnr[_n-`x']
	replace immiyear_m_f=immiyear[_n+`x'] if gv_m==persnr[_n+`x']	
	capture gen immiyear_f_m=.							// immiyear_f_m
	replace immiyear_f_m=immiyear[_n-`x'] if gm_v==persnr[_n-`x']
	replace immiyear_f_m=immiyear[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen immiyear_m_m=.							// immiyear_m_m
	replace immiyear_m_m=immiyear[_n-`x'] if gm_m==persnr[_n-`x']
	replace immiyear_m_m=immiyear[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen gebjahr_m=.								// gebjahr_m
	replace gebjahr_m=gebjahr[_n-`x'] if m_persnr==persnr[_n-`x']
	replace gebjahr_m=gebjahr[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen gebjahr_f=.								// gebjahr_f
	replace gebjahr_f=gebjahr[_n-`x'] if v_persnr==persnr[_n-`x']
	replace gebjahr_f=gebjahr[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen gebjahr_f_f=.							// gebjahr_f_f
	replace gebjahr_f_f=gebjahr[_n-`x'] if gv_v==persnr[_n-`x']
	replace gebjahr_f_f=gebjahr[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen gebjahr_m_f=.							// gebjahr_m_f
	replace gebjahr_m_f=gebjahr[_n-`x'] if gv_m==persnr[_n-`x']
	replace gebjahr_m_f=gebjahr[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen gebjahr_f_m=.							// gebjahr_f_m
	replace gebjahr_f_m=gebjahr[_n-`x'] if gm_v==persnr[_n-`x']
	replace gebjahr_f_m=gebjahr[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen gebjahr_m_m=.							// gebjahr_m_m
	replace gebjahr_m_m=gebjahr[_n-`x'] if gm_m==persnr[_n-`x']
	replace gebjahr_m_m=gebjahr[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen biimgrp_m=.								// biimgrp_m
	replace biimgrp_m=biimgrp[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace biimgrp_m=biimgrp[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen biimgrp_v=.								// biimgrp_v
	replace biimgrp_v=biimgrp[_n-`x'] if v_persnr==persnr[_n-`x']
	replace biimgrp_v=biimgrp[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen biimgrp_gv_v=.							// biimgrp_gv_v
	replace biimgrp_gv_v=biimgrp[_n-`x'] if gv_v==persnr[_n-`x']
	replace biimgrp_gv_v=biimgrp[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen biimgrp_gv_m=.							// biimgrp_gv_m
	replace biimgrp_gv_m=biimgrp[_n-`x'] if gv_m==persnr[_n-`x']
	replace biimgrp_gv_m=biimgrp[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen biimgrp_gm_v=.							// biimgrp_gm_v
	replace biimgrp_gm_v=biimgrp[_n-`x'] if gm_v==persnr[_n-`x']
	replace biimgrp_gm_v=biimgrp[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen biimgrp_gm_m=.							// biimgrp_gm_m
	replace biimgrp_gm_m=biimgrp[_n-`x'] if gm_m==persnr[_n-`x']
	replace biimgrp_gm_m=biimgrp[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen staatsang_m=.							// staatsang_m
	replace staatsang_m=staatsang[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace staatsang_m=staatsang[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen staatsang_v=.							// staatsang_v
	replace staatsang_v=staatsang[_n-`x'] if v_persnr==persnr[_n-`x']
	replace staatsang_v=staatsang[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen staatsang_gv_v=.							// staatsang__gv_v
	replace staatsang_gv_v=staatsang[_n-`x'] if gv_v==persnr[_n-`x']
	replace staatsang_gv_v=staatsang[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen staatsang_gv_m=.							// staatsang_gv_m
	replace staatsang_gv_m=staatsang[_n-`x'] if gv_m==persnr[_n-`x']
	replace staatsang_gv_m=staatsang[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen staatsang_gm_v=.							// staatsang_gm_v
	replace staatsang_gm_v=staatsang[_n-`x'] if gm_v==persnr[_n-`x']
	replace staatsang_gm_v=staatsang[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen staatsang_gm_m=.							// staatsang_gm_m
	replace staatsang_gm_m=staatsang[_n-`x'] if gm_m==persnr[_n-`x']	
	replace staatsang_gm_m=staatsang[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen nation_m=.								// nation_m
	replace nation_m=nation[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace nation_m=nation[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen nation_f=.								// nation_f
	replace nation_f=nation[_n-`x'] if v_persnr==persnr[_n-`x']
	replace nation_f=nation[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen nation_f_f=.							// nation_f_f
	replace nation_f_f=nation[_n-`x'] if gv_v==persnr[_n-`x']
	replace nation_f_f=nation[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen nation_m_f=.							// nation_m_f
	replace nation_m_f=nation[_n-`x'] if gv_m==persnr[_n-`x']
	replace nation_m_f=nation[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen nation_f_m=.							// nation_f_m
	replace nation_f_m=nation[_n-`x'] if gm_v==persnr[_n-`x']
	replace nation_f_m=nation[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen nation_m_m=.							// nation_m_m
	replace nation_m_m=nation[_n-`x'] if gm_m==persnr[_n-`x']
	replace nation_m_m=nation[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen BIIMGRP_m=.								// biimgrp_m
	replace BIIMGRP_m=biimgrp[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace BIIMGRP_m=biimgrp[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen BIIMGRP_f=.								// biimgrp_f
	replace BIIMGRP_f=biimgrp[_n-`x'] if v_persnr==persnr[_n-`x']
	replace BIIMGRP_f=biimgrp[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen BIIMGRP_f_f=.							// biimgrp_f_f
	replace BIIMGRP_f_f=biimgrp[_n-`x'] if gv_v==persnr[_n-`x']
	replace BIIMGRP_f_f=biimgrp[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen BIIMGRP_m_f=.							// biimgrp_m_f
	replace BIIMGRP_m_f=biimgrp[_n-`x'] if gv_m==persnr[_n-`x']
	replace BIIMGRP_m_f=biimgrp[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen BIIMGRP_f_m=.							// biimgrp_f_m
	replace BIIMGRP_f_m=biimgrp[_n-`x'] if gm_v==persnr[_n-`x']
	replace BIIMGRP_f_m=biimgrp[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen BIIMGRP_m_m=.							// biimgrp_m_m
	replace BIIMGRP_m_m=biimgrp[_n-`x'] if gm_m==persnr[_n-`x']
	replace BIIMGRP_m_m=biimgrp[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen deu_seit_m=.							// deu_seit_m
	replace deu_seit_m=germnatbirth[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace deu_seit_m=germnatbirth[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen deu_seit_f=.							// deu_seit_f
	replace deu_seit_f=germnatbirth[_n-`x'] if v_persnr==persnr[_n-`x']
	replace deu_seit_f=germnatbirth[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen deu_seit_f_f=.							// deu_seit_f_f
	replace deu_seit_f_f=germnatbirth[_n-`x'] if gv_v==persnr[_n-`x']
	replace deu_seit_f_f=germnatbirth[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen deu_seit_m_f=.							// deu_seit_m_f
	replace deu_seit_m_f=germnatbirth[_n-`x'] if gv_m==persnr[_n-`x']
	replace deu_seit_m_f=germnatbirth[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen deu_seit_f_m=.							// deu_seit_f_m
	replace deu_seit_f_m=germnatbirth[_n-`x'] if gm_v==persnr[_n-`x']
	replace deu_seit_f_m=germnatbirth[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen deu_seit_m_m=.							// deu_seit_m_m
	replace deu_seit_m_m=germnatbirth[_n-`x'] if gm_m==persnr[_n-`x']
	replace deu_seit_m_m=germnatbirth[_n+`x'] if gm_m==persnr[_n+`x']
}

gen deu_seit_zp = germnatbirth
compress

save ${AVZ}miggen.dta, replace


********************************************************			
***** 2.2 Weitere Hilfsvariablen ***********************
********************************************************

cd ${AVZ}
use miggen.dta, clear


******************************************
***** 2.2.1 r_corigin* and r_nation ******
******************************************
gen r_corigin_zp  = corigin
gen r_corigin_f   = corigin_f
gen r_corigin_m   = corigin_m
gen r_corigin_f_f = corigin_f_f
gen r_corigin_f_m = corigin_f_m
gen r_corigin_m_m = corigin_m_m
gen r_corigin_m_f = corigin_m_f
gen r_nation_zp   = nation
gen r_nation_f    = nation_f
gen r_nation_m    = nation_m
gen r_nation_m_m  = nation_m_m
gen r_nation_m_f  = nation_m_f
gen r_nation_f_m  = nation_f_m
gen r_nation_f_f  = nation_f_f 

foreach var of varlist r_corigin_zp r_corigin_f r_corigin_m r_corigin_m_m r_corigin_m_f r_corigin_f_m r_corigin_f_f r_nation_zp r_nation_m r_nation_f r_nation_m_m r_nation_m_f r_nation_f_f r_nation_f_m {
	// Ehemalige Sowjetstaaten
	replace `var' = 444 if `var' ==  32 // Rekodiere Russland // +++MO: 444 muss noch Label bekommen 
	replace `var' = 444 if `var' ==  73 // Rekodiere Moldawien
	replace `var' = 444 if `var' ==  74 // Rekodiere Kasachstan
	replace `var' = 444 if `var' ==  77 // Rekodiere Kirgistan
	replace `var' = 444 if `var' ==  78 // Rekodiere Ukraine
	replace `var' = 444 if `var' ==  82 // Rekodiere Tadschikistan
	replace `var' = 444 if `var' ==  91 // Rekodiere Turkmenistan
	replace `var' = 444 if `var' ==  97 // Rekodiere Usbekistan
	replace `var' = 444 if `var' == 101 // Rekodiere Estland
	replace `var' = 444 if `var' == 103 // Rekodiere Lettland
	replace `var' = 444 if `var' == 130 // Rekodiere Aserbaidschan
	replace `var' = 444 if `var' == 132 // Rekodiere Weissrussland
	replace `var' = 444 if `var' == 141 // Rekodiere Georgien
	replace `var' = 444 if `var' == 146 // Rekodiere Litauen
	replace `var' = 444 if `var' == 148 // Rekodiere Armenien

	// Ex-Jugoslawien
	replace `var' =   3 if `var' == 106 // Rekodiere Montenegro
	replace `var' =   3 if `var' == 119 // Rekodiere Kroatien
	replace `var' =   3 if `var' == 120 // Rekodiere Bosnien-Herzegowina
	replace `var' =   3 if `var' == 121 // Rekodiere Makedonien
	replace `var' =   3 if `var' == 122 // Rekodiere Slowenien
	replace `var' =   3 if `var' == 140 // Rekodiere Kosovo-Albanien

	// Andere
	replace `var' =   1 if `var' == 153 // Rekodiere Freistaat Danzig -> Deutschland --> MO: DDR muesste noch ergaenzt werden (es gaht ja zunaechst um den Generationenstatus und bei origin differenzieren wir auch nicht zwischen Ost und West)
	replace `var' =   1 if `var' == 7   // Rekodiere Ex-DDR zu Deutschland
}


*******************************
***** 2.2.2 nr_corigin_zp *****
*******************************
gen nr_corigin_zp   = r_corigin_zp
gen nr_corigin_f    = r_corigin_f
gen nr_corigin_m    = r_corigin_m
gen nr_corigin_m_m  = r_corigin_m_m
gen nr_corigin_m_f  = r_corigin_m_f
gen nr_corigin_f_f  = r_corigin_f_f
gen nr_corigin_f_m  = r_corigin_f_m

replace nr_corigin_zp  = r_nation_zp  if nr_corigin_zp  >= .  
replace nr_corigin_f   = r_nation_f   if nr_corigin_f   >= .  
replace nr_corigin_m   = r_nation_m   if nr_corigin_m   >= .  
replace nr_corigin_m_m = r_nation_m_m if nr_corigin_m_m >= .  
replace nr_corigin_m_f = r_nation_m_f if nr_corigin_m_f >= .  
replace nr_corigin_f_f = r_nation_f_f if nr_corigin_f_f >= . 

*******************************
***** 2.2.3 migage ************
*******************************
gen migage = immiyear - gebjahr	// Jugendliche sind in immiyear auch enthalten

list persnr immiyear gebjahr if immiyear < gebjahr // 3 Personen sind Jahre vor ihrer Geburt eingewandert

***Speicherung des Datensatzes unter migra.dta***
sort persnr 
save ${AVZ}miggen_helpers.dta, replace


****************************************************************************************************
*** 3. Bildung Migrantenvariablen  *****************************************************************
*** Von Melanie ************************************************************************************
****************************************************************************************************

****************************************************************************************************
*** HINWEIS: Vorgehen basiert auf Grundlage des skizzierten Datenaufbereitungsvorgehens wie es im **
*** Sheet "Logik" skizziert ist (im Excel-Uebersichten-Dokument) ************************************
*** ALTERNATIV koennte zunaechst der Generationenstatus fuer die Eltern und Grosseltern gebildet werden
*** und im naechsten Schritt fuer juengste Generation --> ich bezweifle, dass das weniger komplex wird,
*** da die Zwischenschritte und Teilbedingungen immer anfallen werden
****************************************************************************************************

*** Variablenliste Bildung Mig
*** Germborn (wie germborn) --> hier werden spaeter noch Dummies gebildet/Rekodierungen vorgenommen 
* germborn
* germborn_m
* germborn_f
* germborn_m_m
* germborn_m_f
* germborn_f_m
* germborn_f_f


* migage // Muss zuvor aus Geburts- und Zuwanderungsalter (gebjahr und immiyear) fuer alle gebildet werden
** FRAGE: Ist das schon gebildet?

*** Corigin (wie corigin)
* corigin
* corigin_f
* corigin_m
* corigin_f_f
* corigin_f_m
* corigin_m_f
* corigin_m_m

*** r_corigin (Rekodierungen; siehe auch Excel-Sheet)
* r_corigin_zp
* r_corigin_f
* r_corigin_m
* r_corigin_f_f
* r_corigin_f_m
* r_corigin_m_f
* r_corigin_m_m

*** nr_corigin (Kombi aus r_nation und r_corigin)
* nr_corigin_zp
* nr_corigin_f
* nr_corigin_m
* nr_corigin_f_f
* nr_corigin_f_m
* nr_corigin_m_f
* nr_corigin_m_m

*** Nation (wie nation)
* nation
* nation_f
* nation_m
* nation_f_f
* nation_f_m
* nation_m_f
* nation_m_m

*** r_nation (Rekodierungen; siehe auch Excel-Sheet)
* r_nation_zp
* r_nation_f
* r_nation_m
* r_nation_f_f
* r_nation_f_m
* r_nation_m_f
* r_nation_m_m


*** BIIMGRP (wie BIIMGRP)
* BIIMGRP_f
* BIIMGRP_m
* BIIMGRP_f_f
* BIIMGRP_f_m
* BIIMGRP_m_f
* BIIMGRP_m_m

*** deu_seit 
* deu_seit_zp
* deu_seit_f
* deu_seit_m
* deu_seit_f_f
* deu_seit_f_m
* deu_seit_m_f
* deu_seit_m_m

****************************************************************************************************
*** 3.1. Generationenstatus ************************************************************************
****************************************************************************************************

****************************************************************************************************
*** 3.1.1 Generationenstatus unter ausschliesslicher Nutzung Geburtsland-Informationen **************
****************************************************************************************************

****************************************************************************************************
*** 3.1.1.1 Hilfsvariablen  ************************************************************************
****************************************************************************************************
use ${AVZ}miggen_helpers.dta, clear

*** Bildung Summenscore: Anzahl im Ausland geborener Grosseltern bzw. Missing bei dieser Info
*** Warum? Vereinfacht die Bildung der mig_gen_c(n) und entsprechender Hilfsvariable erheblich 

*1. Schritt Rekodierung von 2->1 und 1->0

	gen d_germborn_f_f=.
	replace d_germborn_f_f=1 if germborn_f_f==2
	replace d_germborn_f_f=0 if germborn_f_f==1
	lab var d_germborn_f_f "Dummy im Ausland geborenes Grosselternteil"
	lab def d_germborn_gp 1 "Ausland" 0 "Deutschland"
	lab val d_germborn_f_f d_germborn_gp
	tab d_germborn_f_f germborn_f_f

	gen d_germborn_f_m=.
	replace d_germborn_f_m=1 if germborn_f_m==2
	replace d_germborn_f_m=0 if germborn_f_m==1
	lab var d_germborn_f_m "Dummy im Ausland geborenes Grosselternteil"
	lab val d_germborn_f_m d_germborn_gp
	tab d_germborn_f_m germborn_f_m

	gen d_germborn_m_f=.
	replace d_germborn_m_f=1 if germborn_m_f==2
	replace d_germborn_m_f=0 if germborn_m_f==1
	lab var d_germborn_m_f "Dummy im Ausland geborenes Grosselternteil"
	lab val d_germborn_m_f d_germborn_gp
	tab d_germborn_m_f germborn_m_f

	gen d_germborn_m_m=.
	replace d_germborn_m_m=1 if germborn_m_m==2
	replace d_germborn_m_m=0 if germborn_m_m==1
	lab var d_germborn_m_m "Dummy im Ausland geborenes Grosselternteil"
	lab val d_germborn_m_m d_germborn_gp
	tab d_germborn_m_m germborn_m_m


*2. Schritt: Bildung Summenscore "sum_germborn_gp" (alle Werte 1 werden aufsummiert, unabhaengig davon, ob Missings vorhanden oder nicht)

	egen sum_germborn_gp = anycount(d_germborn_f_f d_germborn_f_m d_germborn_m_f d_germborn_m_m), values(1)
	lab var sum_germborn_gp "Anzahl im Ausland geborener Grosselternteile"
	tab sum_germborn_gp


*3. Schritt: Bildung Summenscore fuer die Anzahl Missings "sum_germborn_gp_mis"

	egen sum_germborn_gp_mis = rowmiss(d_germborn_f_f d_germborn_f_m d_germborn_m_f d_germborn_m_m)
	lab var sum_germborn_gp_mis "Anzahl Missings bei Geburtsland Grosseltern"
	tab sum_germborn_gp_mis



*** Bildung Summenscore: Anzahl Grosseltern mit auslaendischer SBS "sum_r_nation_gp"

*1. Schritt Rekodierung >=2->1, 1->0

	gen d_r_nation_f_f=.
	replace d_r_nation_f_f=1 if r_nation_f_f>=2
	replace d_r_nation_f_f=0 if r_nation_f_f==1
	lab var d_r_nation_f_f "Dummy Grosselternteil mit auslaendischer SBS"
	lab def d_r_nation_gp 1 "Ausland" 0 "Deutschland"
	lab val d_r_nation_f_f d_r_nation_gp
	tab d_r_nation_f_f r_nation_f_f

	gen d_r_nation_f_m=.
	replace d_r_nation_f_m=1 if r_nation_f_m>=2
	replace d_r_nation_f_m=0 if r_nation_f_m==1
	lab var d_r_nation_f_m "Dummy Grosselternteil mit auslaendischer SBS"
	lab val d_r_nation_f_m d_r_nation_gp
	tab d_r_nation_f_m r_nation_f_m

	gen d_r_nation_m_f=.
	replace d_r_nation_m_f=1 if r_nation_m_f>=2
	replace d_r_nation_m_f=0 if r_nation_m_f==1
	lab var d_r_nation_m_f "Dummy Grosselternteil mit auslaendischer SBS"
	lab val d_r_nation_m_f d_r_nation_gp
	tab d_r_nation_m_f r_nation_m_f

	gen d_r_nation_m_m=.
	replace d_r_nation_m_m=1 if r_nation_m_m>=2
	replace d_r_nation_m_m=0 if r_nation_m_m==1
	lab var d_r_nation_m_m "Dummy Grosselternteil mit auslaendischer SBS"
	lab val d_r_nation_m_m d_r_nation_gp
	tab d_r_nation_m_m r_nation_m_m


*2. Schritt: Bildung Summenscore "sum_r_nation_gp" (alle Werte 1 werden aufsummiert, unabhaengig davon, ob Missings vorhanden oder nicht)

	egen sum_r_nation_gp = anycount(d_r_nation_f_f d_r_nation_f_m d_r_nation_m_f d_r_nation_m_m), values(1)
	lab var sum_r_nation_gp "Anzahl Grosselternteile mit auslaendischer SBS"
	tab sum_r_nation_gp




*** Bildung von "eltern": Hilfsvariable ueber Vorhandensein Geburtslandinfo fuer Eltern

	gen eltern=.
	replace eltern=1 if germborn_f==germborn_m & (germborn_f==1 | germborn_f==2) // 1: Info liegt fuer beide Eltern vor
	replace eltern=2 if ((germborn_m==1 | germborn_m==2) & germborn_f<=0)  // 2: Info liegt nur fuer Mutter vor, Vater Missing
	replace eltern=3 if ((germborn_f==1 | germborn_f==2) & germborn_m<=0)  // 3: Info liegt nur fuer den Vater vor; Mutter Missing
	replace eltern=4 if germborn_f==germborn_m & germborn_f<=0 // 3: Info liegt fuer gar kein Elternteil vor


	lab var eltern "Geburtslandinfos fuer Eltern vorhanden"
	lab def eltern 1 "fuer beide Elternteile" ///
 	2 "Vater Missing; Mutter vorhanden" ///
 	3 "Mutter Missing; Vater vorhanden" ///
 	4 "fehlend fuer beide Elternteile" 
	lab val eltern eltern



***********************************************************************************************************************************************************
*** 3.1.1.2 mig_gen_c: Generationenstatus unter ausschliesslicher Nutzung Geburtsland-Informationen********************************************************
*** Liberale Bildungsweise, heisst: Im Falle fehlender Werte bei fuer die eindeutige Generationenstatus-Bestimmung*****************************************
*** benoetigter Variablen, werden die vorhandenen Informationen genutzt ***********************************************************************************
*** + Vermerk Missings in der mig_gen_hv*******************************************************************************************************************
***********************************************************************************************************************************************************
*** Germborn herangezogen, da hier mehr Infos als in corigin: *********************************************************************************************
	tab corigin germborn

***********************************************************************************************************************************************************
*** WICHTIG: Infos aus Jugendlichenbefragung muessen den "Haupt-Hilfsvariablen" (Germborn, germborn_f, etc.) zugeordnet werden ****************************
***********************************************************************************************************************************************************

	gen mig_gen_c = .

*1. Generation (nach dem 6. Lebensjahr zugewandert oder Missing bei migage) 
***************************************************************************
*** FRAGE: Unberuecksichtigt bleibt jetzt der Pfad ueber die Nationalitaet und den Einreisestatus, 
*** aber eigentlich muesste es doch jetzt so passen (oder geben Ossis an, im Ausland geboren zu sein?)???

	replace mig_gen_c = 1 if germborn==2 & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, muessten die Missing-Werte auch anders bestimmt werden


*1,5. Generation (vor dem 7. Lebensjahr zugewandert)
****************************************************
	replace mig_gen_c = 2 if germborn==2 & migage <=6 & migage != .


*2. Generation: beide Elternteile zugewandert (ZP in Deutschland geboren oder Missing)
**************************************************************************************
	replace mig_gen_c = 3 if (germborn==1 | germborn<=0) &                             // Befragter ///
	                         (germborn_f==2) & (germborn_m==2)                         // Eltern, . nicht kleiner 0 !!!


*2,5. Generation: ein Elternteil zugewandert, anderes 2. oder 2,5. (ZP in Deutschland geboren oder Missing)
***********************************************************************************************************
	replace mig_gen_c = 4 if (germborn==1 | germborn<=0) & ///                
	((((germborn_f==1 | germborn_f<=0) & (germborn_f_m==2 | germborn_f_f==2)) & germborn_m==2) | ///     
	(germborn_f==2 & ((germborn_m==1 | germborn_m<=0) & (germborn_m_m==2 | germborn_m_f==2)))) 


*2,5. Generation: ein Elternteil zugewandert, anderes deutsch oder Missing bei den Eltern (ZP in Deutschland geboren oder Missing)
**********************************************************************************************************************************
	replace mig_gen_c = 5 if (germborn==1 | germborn<=0) & ///
	(((germborn_f==1 | germborn_f<=0) & ((germborn_f_m<=0 | germborn_f_m==1) & (germborn_f_f<=0 | germborn_f_f==1)) & germborn_m==2) ///
	| (germborn_f==2 & (germborn_m==1 | germborn_m<=0) & ((germborn_m_f==1 | germborn_m_f<=0) & (germborn_m_m==1 | germborn_m_m<=0))))


*3. Generation: vier Grosseltern zugewandert
*******************************************
	replace mig_gen_c = 6 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==4


*3,25. Generation: drei Grosseltern zugewandert
**********************************************
	replace mig_gen_c = 7 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==3


*3,5. Generation: zwei Grosseltern zugewandert
*********************************************
	replace mig_gen_c = 8 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==2


*3,75. Generation: ein Grosselternteil zugewandert
*************************************************
	replace mig_gen_c = 9 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==1


*kein Migrationshintergrund (auch diejenigen, die im Ausland geboren sind, aber deren beiden Eltern in Deutschland geboren sind)
*******************************************************************************************************************************
	replace mig_gen_c = 0 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	(sum_germborn_gp==0 | sum_germborn_gp_mis==4)

* Beruecksichtigung auch derjenigen, die im Ausland geboren sind, aber deren beiden Eltern in Deutschland geboren sind
*** FRAGE: Wollen wir hier wirklich noch beruecksichtigen, ob der Befragte die deutsche Nationalitaet hat? Sinnvoll? 
	replace mig_gen_c=0 if germborn==2 & (germborn_f==1 & germborn_m==1)


*Rausfiltern von Faellen, die ueberall Missings haben
***************************************************
	replace mig_gen_c = . if germborn<=0 & (germborn_f<=0 & germborn_m<=0) & sum_germborn_gp_mis==4



	lab var mig_gen_c "Generationenstatus CORIGIN"
	lab def generationenstatus 0 "kein Migrationshintergrund" ///
 	1 "1.Generation: selbst zugewandert nach dem 6. Lebensjahr" ///
 	2 "1,5.Generation: selbst zugewandert bis einschliesslich 6. Lebensjahr" ///
 	3 "2.Generation: beide Eltern zugewandert" ///
 	4 "2,5.Generation: ein Elternteil zugewandert, anderes 2. oder 2,5. Generation" ///
 	5 "2,5.Generation: ein Elternteil zugewandert, anderes deutsch" ///
 	6 "3.Generation: vier Grosseltern zugewandert" ///
 	7 "3,25.Generation: drei Grosseltern zugewandert" ///
 	8 "3,5.Generation: zwei Grosseltern zugewandert" ///
 	9 "3,75.Generation: ein Grosselternteil zugewandert"
	lab val mig_gen_c generationenstatus

	tab mig_gen_c, m
	tab mig_gen_c migback

*XXX FEHLEND: Plausibilaetschecks XXX


***************************************************************************************************
*** 3.1.1.3 mig_gen_c_hv **************************************************************************
***************************************************************************************************

*** Logik: 
* Wenn ZP Missing --> -1; 
* Wenn ZP in Deutschland und bei Eltern Missings --> -2 oder -3 
* ABER AUCH: Wenn ZP im Ausland geboren ist und keine Info zu (beiden) Eltern --> ebenfalls -2 oder -3, da Diplomatenkinder ausgeschlossen werden sollen
* Wenn ZP und Eltern in Deutschland und Grosselternteil(e) Missing --> -4 und aufwaerts

	gen mig_gen_c_hv = .
	replace mig_gen_c_hv = -1 if germborn <=0
	replace mig_gen_c_hv = -2 if (germborn==1 | germborn==2) & ((germborn_f>=0 & germborn_m<=0) | (germborn_f<=0 & germborn_m>=0))
	replace mig_gen_c_hv = -3 if (germborn==1 | germborn==2) & (germborn_f<=0 & germborn_m<=0)
	replace mig_gen_c_hv = -4 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==1
	replace mig_gen_c_hv = -5 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==2
	replace mig_gen_c_hv = -6 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==3
	replace mig_gen_c_hv = -7 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==4

	lab var mig_gen_c_hv "Hilfsvariable Generationenstatus"
	lab def Hilfsvariable_Generationenstatus -1 "Informationen fuer Person selbst nicht bekannt" ///
 	-2 "Information fuer ein Elternteil nicht bekannt" ///
 	-3 "Information fuer beide Elternteile nicht bekannt" ///
 	-4 "Information fuer ein Grosselternteil nicht bekannt" ///
 	-5 "Information fuer zwei Grosselternteile nicht bekannt" ///
 	-6 "Information fuer drei Grosselternteile nicht bekannt" ///
 	-7 "Information fuer vier Grosselternteile nicht bekannt" 
	lab val mig_gen_c_hv Hilfsvariable_Generationenstatus

	tab mig_gen_c_hv, m
	tab mig_gen_c mig_gen_c_hv

*Speicherung des Datensatzes*
*****************************
sort persnr 
save ${AVZ}miggen_mig_gen_c.dta, replace

*XXX FEHLEND: Plausibilaetschecks XXX



********************************************************************************************************************
*** 3.1.2 Generationenstatus: Nutzung weiterer Informationen (Staatsangehoerigkeit; Einreisestatus; etc.)***********
*** FRAGE: Weglassen Weg ueber Living? Siehe auch Anmerkung im Excel-Sheet "Bildung Mig"****************************
********************************************************************************************************************

***************************************************************************************************
*** 3.1.2.1 mig_gen_cn: Generationenstatus unter Beruecksichtigung weiterer Informationen***********
***************************************************************************************************
use ${AVZ}miggen_mig_gen_c.dta, clear

*** HINWEIS: Grundlage bildet die mig_gen_c und die mig_gen_c_hv
*** FOLGLICH: Es werden immer noch die Geburtsland-Infos und eine liberale Bildungsweise genutzt
*** ZIEL ist es nun, bestehende Missings mittels weiterer Informationen zu "eliminieren" bzw. Faelle genauer zuzuordnen
*** Da Missings als "deutsch" behandelt werden und weitere Infos genutzt werden, ist es insbesondere wichtig,
*** Faelle, die eine Herkunft im Ausland aufweisen, zu identifizieren; Das Vorgehen weicht etwas vorm Chart ab - Trotzdem Ok (und so Anpassung Chart) 
*** oder soll was ergaenzt werden?
*** FRAGE: Teilweise fehlt jetzt die Beruecksichtigung des Einreisestatus (bei den Eltern/Grosseltern) --> wird der wirklich noch benoetigt?
*** Wenn ja, dann muesste diese Teilbedingung jeweils noch ergaenzt werden


	clonevar mig_gen_cn = mig_gen_c

******************************************************
*** Wenn der Befragte Missing beim Geburtsland hat ...
******************************************************

* ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Angabe beim Einreisestatus: 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp>=2 ///
	& (biimgrp==1 | biimgrp==3)

* ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
*** HINWEIS: Es wird jetzt darauf verzichtet ueber Living zu gehen, wenn Einreisealter Missing --> i.O.? Es wuerde sonst zu komplex werden und ich sehe nicht wirklich einen Mehrwert
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp>=2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, muessten die Missing-Werte auch anders bestimmt werden

* ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert vor dem 7. LJ oder Missing--> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp>=2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 

* ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Einreisestatus !=1 und !=3, ABER beide Elternteile in Deutschland geboren --> Diplomatenkinder --> kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp>=2 & germborn_m==1 & germborn_f==1 

* ... und die DEUTSCHE Nationalitaet NICHT seit der Geburt vorliegt und Angabe beim Einreisestatus: 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==2 ///
	& (biimgrp==1 | biimgrp==3)

* ... und die DEUTSCHE Nationalitaet NICHT seit der Geburt vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
*** HINWEIS: Es wird jetzt darauf verzichtet ueber Living zu gehen, wenn Einreisealter Missing --> i.O.? Es wuerde sonst zu komplex werden und ich sehe nicht wirklich einen Mehrwert
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, muessten die Missing-Werte auch anders bestimmt werden

* ... und die DEUTSCHE Nationalitaet NICHT seit der Geburt vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert vor dem 7. LJ oder Missing--> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 

* ... und die DEUTSCHE Nationalitaet vorliegt, aber KEINE Info, ob seit Geburt und beim Einreisestatus 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp<=0 ///
	& (biimgrp==1 | biimgrp==3)

* ... und die DEUTSCHE Nationalitaet vorliegt, aber KEINE Info, ob seit Geburt und Einreisestatus !=1 oder != 3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp<=0 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, muessten die Missing-Werte auch anders bestimmt werden

* ... und die DEUTSCHE Nationalitaet vorliegt, aber KEINE Info, ob seit Geburt und Einreisestatus !=1 oder != 3 sowie zugewandert vor dem 7. LJ --> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp<=0 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 



*********************************************************************************************************************************************************************
*** Wenn der Befragte in Deutschland geboren ist ODER seit der Geburt deutsche SBS ODER Missing bei beiden hat und bei mindestens einem Elternteil Missing vorliegt
*********************************************************************************************************************************************************************

* !!!@MO: ab hier komme ich nicht mehr weiter. Was bedeutet Deut_seit==1? Es steht auch mig_gen_hv, heisst es nicht eigentlich mig_gen_c_hv?

* DEUTSCHE Nationalitaet seit der Geburt hat und beide Eltern im Ausland geboren sind --> 2. Generation
	replace mig_gen_cn=3 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1 & (germborn_f==2) & (germborn_m==2)


* Mutter im Ausland und Vater Missing, aber auslaendische SBS und vice versa --> 2. Generation						
	replace mig_gen_cn=3 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& ((germborn_m==2 & (germborn_f<=0 & r_nation_f>=2)) | ((germborn_m<=0 & r_nation_m>=2) & germborn_f==2))


* Mutter und Vater Missing beim Gebland, aber beide auslaendische SBS --> 2. Generation
	replace mig_gen_cn=3 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& ((germborn_f<=0 & r_nation_f>=2) & (germborn_m<=0 & r_nation_m>=2))

* Mutter und Vater Missing beim Gebland, aber ein Elternteil hat auslaendische SBS und dessen Grosseltern aus Deutschland oder Missing --> 5: 2,5. Generation
	replace mig_gen_cn=5 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (((germborn_f<=0 & germborn_m<=0) & (r_nation_f>=2 & r_nation_m<=1) & ((germborn_m_f==1 | germborn_m_f<=0) & (germborn_m_m==1 | germborn_m_m<=0))) ///
	| ((germborn_f<=0 & germborn_m<=0) & (r_nation_m>=2 & r_nation_f<=1) & ((germborn_f_f==1 | germborn_f_f<=0) & (germborn_f_m==1 | germborn_f_m<=0))))

* Mutter und Vater Missing beim Gebland, aber ein Elternteil hat auslaendische SBS und mindestens ein Grosselternteil vom deutschen Elternteil im Ausland geboren --> 4: 2,5. Generation
	replace mig_gen_cn=4 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (((germborn_f<=0 & germborn_m<=0) & (r_nation_f>=2 & r_nation_m<=1) & (germborn_m_f==2 | germborn_m_m==2)) ///
	| ((germborn_f<=0 & germborn_m<=0) & (r_nation_m>=2 & r_nation_f<=1) & (germborn_f_f==2 | germborn_f_m==2)))


*******************************************************************************************************************************************************************************
*** Wenn der Befragte und die Eltern in Deutschland geboren sind ODER seit der Geburt die deutsche SBS haben ODER Missing sind, und bei mindestens einem Grosselternteil Missing 
*******************************************************************************************************************************************************************************

*** Vorgehenslogik: Faelle, bei denen Grosselternteil deutsch oder Missing sind schon zugeordnet worden in der mig_gen_c;
*** Es geht jetzt darum, Faelle mit auslaendischer SBS zu beruecksichtigen, die keine Gebland-Info aufweisen
*** Herangezogen wird der Summenscore fuer die Anzahl Missings beim Gebland der Grosseltern "sum_germborn_gp" und der Summenscore fuer die Missings "sum_germborn_gp_mis"
*** Ausserdem wird der Summenscore fuer die Grosseltern-SBS "sum_r_nation_gp" herangezogen 


* Wenn VIER Grosselternteile Missing beim Gebland und EIN Grosselternteil AUSLAENDISCHE SBS hat --> 3,75. Generation
	replace mig_gen_cn=9 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==1

* Wenn VIER Grosselternteile Missing beim Gebland und ZWEI Grosselternteile AUSLAENDISCHE SBS haben --> 3,5. Generation
	replace mig_gen_cn=8 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==2

* Wenn VIER Grosselternteile Missing beim Gebland und DREI Grosselternteile AUSLAENDISCHE SBS haben --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==3

* Wenn VIER Grosselternteile Missing beim Gebland und VIER Grosselternteile AUSLAENDISCHE SBS haben --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==4


* Wenn EIN Grosselternteil im Ausland geboren, DREI Missing beim Gebland und EIN Grosselternteil AUSLAENDISCHE SBS hat --> 3,5. Generation
	replace mig_gen_cn=8 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==1

* Wenn EIN Grosselternteil im Ausland geboren, DREI Missing beim Gebland und ZWEI Grosselternteile AUSLAENDISCHE SBS haben --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==2

* Wenn EIN Grosselternteil im Ausland geboren, DREI Missing beim Gebland und DREI Grosselternteile AUSLAENDISCHE SBS haben --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==3


* Wenn ZWEI Grosselternteile im Ausland geboren, ZWEI Missing beim Gebland und EIN Grosselternteil AUSLAENDISCHE SBS hat --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==2 & sum_germborn_gp_mis==2 & sum_r_nation_gp==1

* Wenn ZWEI Grosselternteile im Ausland geboren, ZWEI Missing beim Gebland und 2 Grosselternteile AUSLAENDISCHE SBS hat --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==2 & sum_germborn_gp_mis==2 & sum_r_nation_gp==2


* Wenn DREI Grosselternteile im Ausland geboren, EIN Missing beim Gebland und 1 Grosselternteil AUSLAENDISCHE SBS hat --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp <=0) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit_zp==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==3 & sum_germborn_gp_mis==1 & sum_r_nation_gp==1




*** Fuer die Faelle mit ueberhaupt keiner Info: Heranziehen von MIGBACK und versuchen, weitere Faelle zuzuordnen, die jetzt Missing sind
********************************************************************************************************************************
* Wenn Sysmis bei mig_gen_cn und migback=1 (kein Migrationshintergrund), dann mig_gen_cn ebenfalls kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_cn==. & migback==1

* Wenn Sysmis bei mig_gen_cn und migback=2 (direkter Migrationshintergrund), dann mig_gen_cn 1. Generation
	replace mig_gen_cn=1 if mig_gen_cn==. & migback==2

* Wenn Sysmis bei mig_gen_cn und migback=3 (indirekter Migrationshintergrund/mindestens ein Elternteil im Ausland geboren), 
* dann mig_gen_cn - jetzt erst einmal - 2,5. Generation (Ausland-deutsch)
	replace mig_gen_cn=5 if mig_gen_cn==. & migback==3



*** FRAGE MO: Habe ich was vergessen? Bestimmt ... 



	lab var mig_gen_cn "Generationenstatus CN"
	tab mig_gen_cn


	tab mig_gen_cn
	tab mig_gen_cn migback


*XXX FEHLEND: Plausibilaetschecks XXX




***************************************************************************************************
*** 3.1.3 soep_info - Muss noch gemacht werden ... ************************************************
***************************************************************************************************
* TODO

*** HINWEIS MO: JETZIGE BILDUNG SOEPINFO BEZIEHT SICH NUR AUF ZP! WIR HABEN ABER AUCH DIE ELTERN- UND GROssELTERNINFO!

* Vorbereitung
	gen soep_info=.

* 1: Nur Geburtsland
	replace soep_info=1 if (r_corigin_zp >= 0 & r_corigin_zp != .) & (r_nation_zp == . | r_nation_zp < 0)

* 2: Nur Staatsbuergerschaft (SBS)
	replace soep_info=2 if (r_corigin_zp <  0 | r_corigin_zp == .) & (r_nation_zp != . & r_nation_zp > 0)

* 3: Geburtsland und SBS
	replace soep_info=3 if (r_corigin_zp >= 0 & r_corigin_zp != .) & (r_nation_zp != . & r_nation_zp > 0)

* 4: Ausschliessliche Nutzung Migback (Wenn mig_gen_cn==.)
	replace soep_info=4 if mig_gen_cn==. & migback>=1

* 5: Ausschliessliche Nutzung Living
	*replace soep_info=5 if 


	lab var soep_info "CN Herangezogene Informationen"
	tab soep_info
	lab def soep_info 1 "Geburtsland" ///
	2 "Staatsbuergerschaft" ///
	3 "Geburtsland und SBS" ///
	4 "Nur Proxy Migback" ///
	// 5 "Nur Proxy Living" // Wenn irrelevant, wuerde ich das loeschen
	lab val soep_info soep_info

*******************************************************************************************************************
*** 3.2. Origin-Variablen *****************************************************************************************
*******************************************************************************************************************

***************************************************************************************************
*** 3.2.1 Hilfsvariablen  *************************************************************************
***************************************************************************************************

***************************************************************************************************
* Eltern aus demselben Land?: "eltern_geb_hv"  ****************************************************
* HINWEIS: Nur fuer Personen der 2. Generation! ****************************************************

	
	gen eltern_geb_hv=.

* 1: Beide Elternteile aus demselben Land (nicht Missing und nicht Deutschland)
*******************************************************************************
	replace eltern_geb_hv = 1 if mig_gen_cn == 3 & (nr_corigin_f>=2 & nr_corigin_m>=2) & (nr_corigin_f == nr_corigin_m)

* 0: Elternteile aus unterschiedlichen Laendern (nicht Missing und nicht Deutschland)
************************************************************************************
	replace eltern_geb_hv = 0 if mig_gen_cn == 3 & (nr_corigin_f>=2 & nr_corigin_m>=2) & (nr_corigin_f != nr_corigin_m)

* -1: Nur ein Elternteil migriert und dessen Geburtsland bekannt; anderes Elternteil deutsch oder Missing
*********************************************************************************************************
	replace eltern_geb_hv=-1 if (mig_gen_cn==4 | mig_gen_cn==5) & (((nr_corigin_f<=0 | nr_corigin_f==1) & nr_corigin_m>=2) | (nr_corigin_f>=2 & (nr_corigin_m<=0 | nr_corigin_m==1)))

* -2: Nur ein Elternteil migriert und dessen Geburtsland NICHT bekannt; anderes Elternteil deutsch oder Missing
***************************************************************************************************************
	replace eltern_geb_hv=-2 if (mig_gen_cn==4 | mig_gen_cn==5) & (((nr_corigin_f<=0 | nr_corigin_f==1) & nr_corigin_m<=0) | (nr_corigin_f<=0 & (nr_corigin_m<=0 | nr_corigin_m==1)))

* -3: Beide Elternteile migriert, EIN Geburtsland NICHT bekannt (Faelle, bei denen beide Laender nicht bekannt sind, werden im naechsten Schritt wieder rausgezogen)
*****************************************************************************************************************************************************************
	replace eltern_geb_hv=-3 if mig_gen_cn==3 & (nr_corigin_f<=0 | nr_corigin_m<=0) 

* -4: Beide Elternteile migriert, BEIDE Geburtslaender NICHT bekannt
*******************************************************************
	replace eltern_geb_hv=-4 if mig_gen_cn==3 & (nr_corigin_f<=0 & nr_corigin_m<=0) 


	lab var eltern_geb_hv "Hilfsvariable Eltern aus demselben Land" 
	lab def eltern_geb_hv 1 "Eltern aus demselben Land" ///
	0 "Eltern aus unterschiedlichen Laendern" ///
	-1 "nur 1 Elternteil migriert_Gebinfo bekannt" ///
	-2 "nur 1 Elternteil migriert_Gebinfo nicht bekannt" ///
	-3 "beide zugewandert, fuer einen fehlt Gebinfo" ///
	-4 "beide zugewandert, fuer beide fehlt Gebinfo"
	lab val eltern_geb_hv eltern_geb_hv

	tab eltern_geb_hv



*XXX FEHLEND: Plausibilaetschecks XXX


***************************************************************************************************
* Grosseltern aus demselben Land?: "grosseltern_geb_hv"  *******************************************
* HINWEIS: Nur fuer Personen der 3. und aufwaerts Generation! ***************************************


gen grosseltern_geb_hv=.

* 1: Wenn VIER Grosselternteile zugewandert und alle aus demselben Land (nicht D und kein Missing)--> mindestens 3 von 6 moeglichen Kombinationen, muessen erfuellt sein
********************************************************************************************************************************************************************
	replace grosseltern_geb_hv = 1 if mig_gen_cn==6 & ///
	(((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_m_f == nr_corigin_m_m) & (nr_corigin_f_f == nr_corigin_m_f)) ///
	& nr_corigin_f_f>=2) 


* 1: Wenn DREI Grosselternteile zugewandert und alle aus demselben Land (nicht D und kein Missing)--> 6 Konstellationen moeglich 
******************************************************************************************************************************
	replace grosseltern_geb_hv = 1 if mig_gen_cn==7 ///
	& (((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_f_f==nr_corigin_m_f) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_f_f==nr_corigin_m_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_m_f) & (nr_corigin_m_f==nr_corigin_m_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_m == nr_corigin_m_f) & (nr_corigin_m_f==nr_corigin_m_m) & (nr_corigin_f_m >= 2)))


* 1: Wenn ZWEI Grosselternteile zugewandert und alle aus demselben Land (nicht D und kein Missing) --> 6 Konstellationen moeglich 
******************************************************************************************************************************
	replace grosseltern_geb_hv = 1 if mig_gen_cn==8 ///
	& (((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_m_f) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_m_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_m == nr_corigin_m_f) & (nr_corigin_f_m >= 2)) ///
	| ((nr_corigin_f_m == nr_corigin_m_m) & (nr_corigin_f_m >= 2)) ///
	| ((nr_corigin_m_f == nr_corigin_m_m) & (nr_corigin_m_f >= 2)))


* 0: Wenn VIER Grosselternteile zugewandert und mindestens eine von 6 Kombinationen aus unterschiedlichen Laendern (nicht D und kein Missing)
*******************************************************************************************************************************************
	replace grosseltern_geb_hv = 0 if mig_gen_cn==6 & ///
	( ((nr_corigin_f_f != nr_corigin_f_m) & (nr_corigin_f_f>=2 & nr_corigin_f_m>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_f) & (nr_corigin_f_f>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_m) & (nr_corigin_f_f>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_f) & (nr_corigin_f_m>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_m) & (nr_corigin_f_m>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_m_f != nr_corigin_m_m) & (nr_corigin_m_f>=2 & nr_corigin_m_m>=2)))


* 0: Wenn DREI Grosselternteile zugewandert und mindestens 2 dieser aus unterschiedlichen Herkunftslaendern --> 6 Kombinationen (nicht D und kein Missing) 
********************************************************************************************************************************************************
	replace grosseltern_geb_hv = 0 if mig_gen_cn==7 & ///
	( ((nr_corigin_f_f != nr_corigin_f_m) & (nr_corigin_f_f>=2 & nr_corigin_f_m>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_f) & (nr_corigin_f_f>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_m) & (nr_corigin_f_f>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_f) & (nr_corigin_f_m>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_m) & (nr_corigin_f_m>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_m_f != nr_corigin_m_m) & (nr_corigin_m_f>=2 & nr_corigin_m_m>=2)))

* 0: Wenn ZWEI Grosselternteile zugewandert und diese aus unterschiedlichen Herkunftslaendern --> 6 Kombinationen (nicht D und kein Missing) 
*******************************************************************************************************************************************
	replace grosseltern_geb_hv = 0 if mig_gen_cn==8 & ///
	( ((nr_corigin_f_f!=nr_corigin_f_m) & (nr_corigin_f_f>=2 & nr_corigin_f_m>=2)) ///
	| ((nr_corigin_f_f!=nr_corigin_m_f) & (nr_corigin_f_f>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_f!=nr_corigin_m_m) & (nr_corigin_f_f>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_f_m!=nr_corigin_m_f) & (nr_corigin_f_m>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_m!=nr_corigin_m_m) & (nr_corigin_f_m>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_m_f!=nr_corigin_m_m) & (nr_corigin_m_f>=2 & nr_corigin_m_m>=2)))

* -1: Wenn nur EIN Grosselternteil migriert ist (anderes deutsch oder Missing)
*****************************************************************************
	replace grosseltern_geb_hv = -1 if mig_gen_cn==9 


	lab var grosseltern_geb_hv "Hilfsvariable Grosseltern aus demselben Land" 
	lab def grosseltern_geb_hv 1 "Grosseltern aus demselben Land" ///
	0 "Grosseltern aus unterschiedlichen Laendern" ///
	-1 "nur 1 Grosselternteil migriert"
	lab val grosseltern_geb_hv grosseltern_geb_hv

	tab grosseltern_geb_hv

***************************************************************************************************
*** 3.2.2 Herkunftsland-Variable origin ***********************************************************
***************************************************************************************************

***************************************************************************************************
*** 3.2.2.1 origin_long****************************************************************************
***************************************************************************************************
*** Es werden allen Faellen Werte zugewiesen, bei denen eine Herkunftsland-Info vorliegt ***********
*** HINWEIS: Missings bei dieser Info werden in der origin_hv abgebildet **************************
*** HINWEIS 2: Grundlage bilden die rekodierten Laender- und SBS-Infos (nr_corigin), da hier *******
*** meisten Infos enthalten + Hilfsvariablen darauf aufbauend *************************************
***************************************************************************************************

*** Vorgehenslogik:
* Wenn kein Migrationshintergrund, dann origin=1 (Deutschland)
* Fuer die 1. und 1,5. Generation: Wenn selbst zugewandert, dann Geburtsland Zielperson
* Fuer die 2. Generation: Wenn Vater und Mutter in demselben Land geboren sind, dann das Geburtsland nehmen; Wenn Vater und Mutter in unterschiedlichen Laendern geboren sind, dann in origin_zp zu sonstigen zaehlen; Wenn nur fuer einen Info vorliegt, dann diese nehmen
* Fuer die 2,5. Generation: Wenn Vater oder Mutter im Ausland geboren, dann Geburtsland des jeweiligen Elternteils nehmen
* Fuer die 3.; 3,25., 3,5. und 3,75. Generation: Das Geburtsland des jeweils im Ausland geborenen Grosselternteils wird fuer origin_zp genutzt. Vorgehen analog wie bei der 2. Generation
* Grundsaetzlich: Wenn Geburtsland-Info nicht fuer alle bekannt, dann werden die Informationen genutzt, die vorhanden sind (und Vermerk in der Hilfsvariable)
* Grundsaetzlich 2: Wenn verschiedene Geburtslaender, dann zu �sonstigen�



	gen origin_long=.

* Wenn Nicht-Migrant (ZK, Eltern + alle Grosseltern  aus D oder Missing, aber nicht alle Missing)
************************************************************************************************
	replace origin_long=1 if mig_gen_cn==0


* Befragter selbst zugewandert (mig_gen_cn==1 oder 2) --> Geburtsland ist Herkunftsland
***************************************************************************************
	replace origin_long=nr_corigin_zp if ((mig_gen_cn==1 | mig_gen_cn==2) &  nr_corigin_zp>=2)


* Befragter NICHT zugewandert, aber mindestens (ein) Eltern(teil)
*****************************************************************

*** Beide Eltern zugewandert und aus gleichem Land
	replace origin_long=nr_corigin_f if eltern_geb_hv==1

*** Beide Eltern zugewandert und aus unterschiedlichen Laendern --> Sonstiges 2222
	replace origin_long=2222 if eltern_geb_hv==0

*** Beide Eltern zugewandert, aber nur fuer einen Elternteil Geburtslandinfo, dann wird diese genutzt
	replace origin_long=nr_corigin_f if eltern_geb_hv==-3 & nr_corigin_f>=2
	replace origin_long=nr_corigin_m if eltern_geb_hv==-3 & nr_corigin_m>=2

*** Nur ein Elternteil zugewandert, dann diese Info als Herkunftsland
	replace origin_long=nr_corigin_f if (eltern_geb_hv==-1 & (nr_corigin_f>=2))
	replace origin_long=nr_corigin_m if (eltern_geb_hv==-1 & (nr_corigin_m>=2))


* Befragter und Eltern nicht zugewandert (oder Missing), aber mindestens ein Grosselternteil zugewandert
*******************************************************************************************************

*** VIER Grosselternteile zugewandert und alle aus demselben Land
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==6 & grosseltern_geb_hv==1)


*** DREI Grosseltern zugewandert und alle aus demselben Land, dann diejenige Info nehmen, die nicht deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==7 & grosseltern_geb_hv==1 & nr_corigin_f_f>=2)
	replace origin_long=nr_corigin_f_m if (mig_gen_cn==7 & grosseltern_geb_hv==1 & nr_corigin_f_m>=2)


*** ZWEI Grosseltern zugewandert und diese aus demselben Land, dann diejenige Info nehmen, die nicht deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==8 & grosseltern_geb_hv==1 & nr_corigin_f_f>=2)
	replace origin_long=nr_corigin_f_m if (mig_gen_cn==8 & grosseltern_geb_hv==1 & nr_corigin_f_m>=2)
	replace origin_long=nr_corigin_m_f if (mig_gen_cn==8 & grosseltern_geb_hv==1 & nr_corigin_m_f>=2)


*** VIER Grosselternteile zugewandert und nur fuer einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist 
	replace origin_long=nr_corigin_f_f if mig_gen_cn==6 & nr_corigin_f_f>=2 & (nr_corigin_f_m<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)
	replace origin_long=nr_corigin_f_m if mig_gen_cn==6 & nr_corigin_f_m>=2 &(nr_corigin_f_f<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)
	replace origin_long=nr_corigin_m_f if mig_gen_cn==6 & nr_corigin_m_f>=2 &(nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_m<=0)
	replace origin_long=nr_corigin_m_m if mig_gen_cn==6 & nr_corigin_m_m>=2 &(nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_f<=0)


*** DREI Grosselternteile zugewandert und nur fuer einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist 
	replace origin_long=nr_corigin_f_f if mig_gen_cn==7 & nr_corigin_f_f>=2 & ((nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_f_m if mig_gen_cn==7 & nr_corigin_f_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_f if mig_gen_cn==7 & nr_corigin_m_f>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_m if mig_gen_cn==7 & nr_corigin_m_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*** ZWEI Grosselternteile zugewandert und nur fuer einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if mig_gen_cn==8 & nr_corigin_f_f>=2 & ((nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_f_m if mig_gen_cn==8 & nr_corigin_f_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_f if mig_gen_cn==8 & nr_corigin_m_f>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_m if mig_gen_cn==8 & nr_corigin_m_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*** Grosseltern aus mindestens zwei verschiedenen Laendern
	replace origin_long=2222 if grosseltern_geb_hv==0


*** Wenn nur EIN Grosselternteil zugewandert ist, dann die Info nutzen, die nicht Deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==9 & nr_corigin_f_f>=2)
	replace origin_long=nr_corigin_f_m if (mig_gen_cn==9 & nr_corigin_f_m>=2)
	replace origin_long=nr_corigin_m_f if (mig_gen_cn==9 & nr_corigin_m_f>=2)
	replace origin_long=nr_corigin_m_m if (mig_gen_cn==9 & nr_corigin_m_m>=2)


*  Befragter oder Eltern oder Grosseltern im Ausland geboren, aber keine Geburtslandinfo --> origin_long==-2
***********************************************************************************************************
*** Befragter zugewandert, aber keine Gebland-Info
	replace origin_long=-2 if ((mig_gen_cn==1 | mig_gen_cn==2) & nr_corigin_zp<=0)


*** Befragter nicht selbst zugewandert oder Missing und keine Gebland-Info fuer ein bzw. beide Elternteil(e)
	replace origin_long=-2 if (eltern_geb_hv==-2 | eltern_geb_hv==-4)


*** VIER Grosselternteile zugewandert, aber keine Info zum Gebland
	replace origin_long=-2 if mig_gen_cn==6 & (nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)


*** DREI Grosselternteile zugewandert und fuer keinen Land bekannt
	replace origin_long=-2 if mig_gen_cn==7 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	

*** ZWEI Grosselternteile zugewandert und fuer keinen Land bekannt
	replace origin_long=-2 if mig_gen_cn==8 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	

*** EIN Grosselternteil zugewandert, aber keine Info zum Gebland
	replace origin_long=-2 if mig_gen_cn==9 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	

* UEberall Sysmis (Befragter, Eltern, Grosseltern): keine Info, ob ueberhaupt Migrant --> origin_long==-1
******************************************************************************************************
	replace origin_long=-1 if mig_gen_cn==.



	lab var origin_long "Herkunftsland long"

*** XXX Auspraegungen noch Labeln, wenn die endgueltigen bekannt XXX

	tab origin_long mig_gen_cn
	tab origin_long mig_gen_c


*XXX FEHLEND: Plausibilaetschecks XXX


***************************************************************************************************
*** 3.2.2.2 origin_short **************************************************************************
***************************************************************************************************


*** Vorgehensweise:
* Zunaechst Sonstige zuordnen und dann Faelle den Klassen zuweisen
* HINWEIS: Sonstiges umfasst bei der Long-Version nur Faelle, bei denen Personen aus unterschiedlichen Laendern migriert sind; 
* Hier kommen ausserdem diejenigen Faelle hinzu, bei denen aus Laendern migriert wurde, die nicht extra klassifiziert sind:

***************************************************************************************************
*** 1. SCHRITT: Erneutes Rekodieren der Geb- und SBS-Info analog Klassen
***************************************************************************************************

gen nr_corigin_zp2   = nr_corigin_zp
gen nr_corigin_f2    = nr_corigin_f
gen nr_corigin_m2    = nr_corigin_m
gen nr_corigin_m_m2  = nr_corigin_m_m
gen nr_corigin_m_f2  = nr_corigin_m_f
gen nr_corigin_f_m2  = nr_corigin_f_m
gen nr_corigin_f_f2  = nr_corigin_f_f 

* HINWEIS: Deutschland; Ex-Jugoslawien und Ex-Sojetunion sind schon rekodiert

foreach var of varlist nr_corigin_zp2 nr_corigin_f2 nr_corigin_m2 nr_corigin_m_m2 nr_corigin_m_f2 nr_corigin_f_m2 nr_corigin_f_f2 {
	// West-EU (Belgien, Daenemark, Finnland, Frankreich, GB, Irland, Luxemburg, Holland, ï¿½sterreich, Portugal, Schweden)" 
	replace `var' = 555 if `var' ==  10 // Rekodiere Oesterreich 
	replace `var' = 555 if `var' ==  11 // Rekodiere Frankreich
	replace `var' = 555 if `var' ==  12 // Rekodiere Benelux
	replace `var' = 555 if `var' ==  13 // Rekodiere DÃ¤nemark
	replace `var' = 555 if `var' ==  14 // Rekodiere GB
	replace `var' = 555 if `var' ==  15 // Rekodiere Schweden
	replace `var' = 555 if `var' ==  17 // Rekodiere Finnland
	replace `var' = 555 if `var' ==  28 // Rekodiere Portugal
	replace `var' = 555 if `var' ==  71 // Rekodiere Irland
	replace `var' = 555 if `var' == 116 // Rekodiere Luxemburg
	replace `var' = 555 if `var' == 117 // Rekodiere Belgien
	replace `var' = 555 if `var' == 118 // Rekodiere Holland

	// Sonstige Laender
	replace `var' =   2222 if `var' == 16
	replace `var' =   2222 if `var' >= 18 & `var'<=21 
	replace `var' =   2222 if `var' >= 23 & `var'<=82 
	replace `var' =   2222 if `var' >= 84 & `var'<=333 

}


***************************************************************************************************
*** 2. SCHRITT: Bildung neuer Eltern- und Grosseltern-HVs
***************************************************************************************************

* Eltern aus demselben Land?: "eltern_geb_hv"
* HINWEIS: Nur fuer Personen der 2. Generation!

	
	gen eltern_geb_hv1=.

* 1: Beide Elternteile aus demselben Land (nicht Missing und nicht Deutschland)
*******************************************************************************
	replace eltern_geb_hv1 = 1 if mig_gen_cn == 3 & (nr_corigin_f2>=2 & nr_corigin_m2>=2) & (nr_corigin_f2 == nr_corigin_m2)

* 0: Elternteile aus unterschiedlichen Laendern (nicht Missing und nicht Deutschland)
************************************************************************************
	replace eltern_geb_hv1 = 0 if mig_gen_cn == 3 & (nr_corigin_f2>=2 & nr_corigin_m2>=2) & (nr_corigin_f2 != nr_corigin_m2)

* -1: Nur ein Elternteil migriert und dessen Geburtsland bekannt; anderes Elternteil deutsch oder Missing
*********************************************************************************************************
	replace eltern_geb_hv1=-1 if (mig_gen_cn==4 | mig_gen_cn==5) & (((nr_corigin_f2<=0 | nr_corigin_f2==1) & nr_corigin_m2>=2) | (nr_corigin_f2>=2 & (nr_corigin_m2<=0 | nr_corigin_m2==1)))

* -2: Nur ein Elternteil migriert und dessen Geburtsland NICHT bekannt; anderes Elternteil deutsch oder Missing
***************************************************************************************************************
	replace eltern_geb_hv1=-2 if (mig_gen_cn==4 | mig_gen_cn==5) & (((nr_corigin_f2<=0 | nr_corigin_f2==1) & nr_corigin_m2<=0) | (nr_corigin_f2<=0 & (nr_corigin_m2<=0 | nr_corigin_m2==1)))

* -3: Beide Elternteile migriert, EIN Geburtsland NICHT bekannt (Faelle, bei denen beide Laender nicht bekannt sind, werden im naechsten Schritt wieder rausgezogen)
*****************************************************************************************************************************************************************
	replace eltern_geb_hv1=-3 if mig_gen_cn==3 & (nr_corigin_f2<=0 | nr_corigin_m2<=0) 

* -4: Beide Elternteile migriert, BEIDE Geburtslaender NICHT bekannt
*******************************************************************
	replace eltern_geb_hv1=-4 if mig_gen_cn==3 & (nr_corigin_f2<=0 & nr_corigin_m2<=0) 


	lab var eltern_geb_hv1 "Hilfsvariable Eltern aus demselben Land_kat" 
	lab def eltern_geb_hv1 1 "Eltern aus demselben Land" ///
	0 "Eltern aus unterschiedlichen Laendern" ///
	-1 "nur 1 Elternteil migriert_Gebinfo bekannt" ///
	-2 "nur 1 Elternteil migriert_Gebinfo nicht bekannt" ///
	-3 "beide zugewandert, fuer einen fehlt Gebinfo" ///
	-4 "beide zugewandert, fuer beide fehlt Gebinfo"
	lab val eltern_geb_hv1 eltern_geb_hv1

	tab eltern_geb_hv1



*XXX FEHLEND: Plausibilaetschecks XXX


***************************************************************************************************
* Grosseltern aus demselben Land?: "grosseltern_geb_hv"  *******************************************
* HINWEIS: Nur fuer Personen der 3. und aufwaerts Generation! ***************************************


gen grosseltern_geb_hv1=.

* 1: Wenn VIER Grosselternteile zugewandert und alle aus demselben Land (nicht D und kein Missing)--> mindestens 3 von 6 moeglichen Kombinationen, muessen erfuellt sein
********************************************************************************************************************************************************************
	replace grosseltern_geb_hv1 = 1 if mig_gen_cn==6 & ///
	(((nr_corigin_f_f2 == nr_corigin_f_m2) & (nr_corigin_m_f2 == nr_corigin_m_m2) & (nr_corigin_f_f2 == nr_corigin_m_f2)) ///
	& nr_corigin_f_f2>=2) 


* 1: Wenn DREI Grosselternteile zugewandert und alle aus demselben Land (nicht D und kein Missing)--> 6 Konstellationen moeglich 
******************************************************************************************************************************
	replace grosseltern_geb_hv1 = 1 if mig_gen_cn==7 ///
	& (((nr_corigin_f_f2 == nr_corigin_f_m2) & (nr_corigin_f_f2==nr_corigin_m_f2) & (nr_corigin_f_f2 >= 2)) ///
	| ((nr_corigin_f_f2 == nr_corigin_f_m2) & (nr_corigin_f_f2==nr_corigin_m_m2) & (nr_corigin_f_f2 >= 2)) ///
	| ((nr_corigin_f_f2 == nr_corigin_m_f2) & (nr_corigin_m_f2==nr_corigin_m_m2) & (nr_corigin_f_f2 >= 2)) ///
	| ((nr_corigin_f_m2 == nr_corigin_m_f2) & (nr_corigin_m_f2==nr_corigin_m_m2) & (nr_corigin_f_m2 >= 2)))


* 1: Wenn ZWEI Grosselternteile zugewandert und alle aus demselben Land (nicht D und kein Missing) --> 6 Konstellationen moeglich 
******************************************************************************************************************************
	replace grosseltern_geb_hv1 = 1 if mig_gen_cn==8 ///
	& (((nr_corigin_f_f2 == nr_corigin_f_m2) & (nr_corigin_f_f2 >= 2)) ///
	| ((nr_corigin_f_f2 == nr_corigin_m_f2) & (nr_corigin_f_f2 >= 2)) ///
	| ((nr_corigin_f_f2 == nr_corigin_m_m2) & (nr_corigin_f_f2 >= 2)) ///
	| ((nr_corigin_f_m2 == nr_corigin_m_f2) & (nr_corigin_f_m2 >= 2)) ///
	| ((nr_corigin_f_m2 == nr_corigin_m_m2) & (nr_corigin_f_m2 >= 2)) ///
	| ((nr_corigin_m_f2 == nr_corigin_m_m2) & (nr_corigin_m_f2 >= 2)))


* 0: Wenn VIER Grosselternteile zugewandert und mindestens eine von 6 Kombinationen aus unterschiedlichen Laendern (nicht D und kein Missing)
*******************************************************************************************************************************************
	replace grosseltern_geb_hv1 = 0 if mig_gen_cn==6 & ///
	( ((nr_corigin_f_f2 != nr_corigin_f_m2) & (nr_corigin_f_f2>=2 & nr_corigin_f_m2>=2)) ///
	| ((nr_corigin_f_f2 != nr_corigin_m_f2) & (nr_corigin_f_f2>=2 & nr_corigin_m_f2>=2)) ///
	| ((nr_corigin_f_f2 != nr_corigin_m_m2) & (nr_corigin_f_f2>=2 & nr_corigin_m_m2>=2)) ///
	| ((nr_corigin_f_m2 != nr_corigin_m_f2) & (nr_corigin_f_m2>=2 & nr_corigin_m_f2>=2)) ///
	| ((nr_corigin_f_m2 != nr_corigin_m_m2) & (nr_corigin_f_m2>=2 & nr_corigin_m_m2>=2)) ///
	| ((nr_corigin_m_f2 != nr_corigin_m_m2) & (nr_corigin_m_f2>=2 & nr_corigin_m_m2>=2)))


* 0: Wenn DREI Grosselternteile zugewandert und mindestens 2 dieser aus unterschiedlichen Herkunftslaendern --> 6 Kombinationen (nicht D und kein Missing) 
********************************************************************************************************************************************************
	replace grosseltern_geb_hv1 = 0 if mig_gen_cn==7 & ///
	( ((nr_corigin_f_f2 != nr_corigin_f_m2) & (nr_corigin_f_f2>=2 & nr_corigin_f_m2>=2)) ///
	| ((nr_corigin_f_f2 != nr_corigin_m_f2) & (nr_corigin_f_f2>=2 & nr_corigin_m_f2>=2)) ///
	| ((nr_corigin_f_f2 != nr_corigin_m_m2) & (nr_corigin_f_f2>=2 & nr_corigin_m_m2>=2)) ///
	| ((nr_corigin_f_m2 != nr_corigin_m_f2) & (nr_corigin_f_m2>=2 & nr_corigin_m_f2>=2)) ///
	| ((nr_corigin_f_m2 != nr_corigin_m_m2) & (nr_corigin_f_m2>=2 & nr_corigin_m_m2>=2)) ///
	| ((nr_corigin_m_f2 != nr_corigin_m_m2) & (nr_corigin_m_f2>=2 & nr_corigin_m_m2>=2)))

* 0: Wenn ZWEI Grosselternteile zugewandert und diese aus unterschiedlichen Herkunftslaendern --> 6 Kombinationen (nicht D und kein Missing) 
*******************************************************************************************************************************************
	replace grosseltern_geb_hv1 = 0 if mig_gen_cn==8 & ///
	( ((nr_corigin_f_f2!=nr_corigin_f_m2) & (nr_corigin_f_f2>=2 & nr_corigin_f_m2>=2)) ///
	| ((nr_corigin_f_f2!=nr_corigin_m_f2) & (nr_corigin_f_f2>=2 & nr_corigin_m_f2>=2)) ///
	| ((nr_corigin_f_f2!=nr_corigin_m_m2) & (nr_corigin_f_f2>=2 & nr_corigin_m_m2>=2)) ///
	| ((nr_corigin_f_m2!=nr_corigin_m_f2) & (nr_corigin_f_m2>=2 & nr_corigin_m_f2>=2)) ///
	| ((nr_corigin_f_m2!=nr_corigin_m_m2) & (nr_corigin_f_m2>=2 & nr_corigin_m_m2>=2)) ///
	| ((nr_corigin_m_f2!=nr_corigin_m_m2) & (nr_corigin_m_f2>=2 & nr_corigin_m_m2>=2)))

* -1: Wenn nur EIN Grosselternteil migriert ist (anderes deutsch oder Missing)
*****************************************************************************
	replace grosseltern_geb_hv1 = -1 if mig_gen_cn==9 


	lab var grosseltern_geb_hv1 "Hilfsvariable Grosseltern aus demselben Land_kat" 
	lab def grosseltern_geb_hv1 1 "Grosseltern aus demselben Land" ///
	0 "Grosseltern aus unterschiedlichen Laendern" ///
	-1 "nur 1 Grosselternteil migriert"
	lab val grosseltern_geb_hv1 grosseltern_geb_hv1

	tab grosseltern_geb_hv1





***************************************************************************************************
*** 3. SCHRITT: Bildung Origin_Short
***************************************************************************************************

	gen origin_short=.

* Wenn Nicht-Migrant (ZK, Eltern + alle Grosseltern  aus D oder Missing, aber nicht alle Missing)
************************************************************************************************
	replace origin_short=1 if mig_gen_cn==0


* Befragter selbst zugewandert (mig_gen_cn==1 oder 2) --> Geburtsland ist Herkunftsland
***************************************************************************************
	replace origin_short=nr_corigin_zp2 if ((mig_gen_cn==1 | mig_gen_cn==2) &  nr_corigin_zp2>=2)


* Befragter NICHT zugewandert, aber mindestens (ein) Eltern(teil)
*****************************************************************

*** Beide Eltern zugewandert und aus gleichem Land
	replace origin_short=nr_corigin_f2 if eltern_geb_hv1==1

*** Beide Eltern zugewandert und aus unterschiedlichen Laendern --> Sonstiges 2222
	replace origin_short=2222 if eltern_geb_hv1==0

*** Beide Eltern zugewandert, aber nur fuer einen Elternteil Geburtslandinfo, dann wird diese genutzt
	replace origin_short=nr_corigin_f2 if eltern_geb_hv1==-3 & nr_corigin_f2>=2
	replace origin_short=nr_corigin_m2 if eltern_geb_hv1==-3 & nr_corigin_m2>=2

*** Nur ein Elternteil zugewandert, dann diese Info als Herkunftsland
	replace origin_short=nr_corigin_f2 if (eltern_geb_hv1==-1 & (nr_corigin_f2>=2))
	replace origin_short=nr_corigin_m2 if (eltern_geb_hv1==-1 & (nr_corigin_m2>=2))


* Befragter und Eltern nicht zugewandert (oder Missing), aber mindestens ein Grosselternteil zugewandert
*******************************************************************************************************

*** VIER Grosselternteile zugewandert und alle aus demselben Land
	replace origin_short=nr_corigin_f_f2 if (mig_gen_cn==6 & grosseltern_geb_hv1==1)


*** DREI Grosseltern zugewandert und alle aus demselben Land, dann diejenige Info nehmen, die nicht deutsch oder Missing ist
	replace origin_short=nr_corigin_f_f2 if (mig_gen_cn==7 & grosseltern_geb_hv1==1 & nr_corigin_f_f2>=2)
	replace origin_short=nr_corigin_f_m2 if (mig_gen_cn==7 & grosseltern_geb_hv1==1 & nr_corigin_f_m2>=2)


*** ZWEI Grosseltern zugewandert und diese aus demselben Land, dann diejenige Info nehmen, die nicht deutsch oder Missing ist
	replace origin_short=nr_corigin_f_f2 if (mig_gen_cn==8 & grosseltern_geb_hv1==1 & nr_corigin_f_f2>=2)
	replace origin_short=nr_corigin_f_m2 if (mig_gen_cn==8 & grosseltern_geb_hv1==1 & nr_corigin_f_m2>=2)
	replace origin_short=nr_corigin_m_f2 if (mig_gen_cn==8 & grosseltern_geb_hv1==1 & nr_corigin_m_f2>=2)


*** VIER Grosselternteile zugewandert und nur fuer einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist 
	replace origin_short=nr_corigin_f_f2 if mig_gen_cn==6 & nr_corigin_f_f2>=2 & (nr_corigin_f_m2<=0 & nr_corigin_m_f2<=0 & nr_corigin_m_m2<=0)
	replace origin_short=nr_corigin_f_m2 if mig_gen_cn==6 & nr_corigin_f_m2>=2 & (nr_corigin_f_f2<=0 & nr_corigin_m_f2<=0 & nr_corigin_m_m2<=0)
	replace origin_short=nr_corigin_m_f2 if mig_gen_cn==6 & nr_corigin_m_f2>=2 & (nr_corigin_f_f2<=0 & nr_corigin_f_m2<=0 & nr_corigin_m_m2<=0)
	replace origin_short=nr_corigin_m_m2 if mig_gen_cn==6 & nr_corigin_m_m2>=2 & (nr_corigin_f_f2<=0 & nr_corigin_f_m2<=0 & nr_corigin_m_f2<=0)


*** DREI Grosselternteile zugewandert und nur fuer einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist 
	replace origin_short=nr_corigin_f_f2 if mig_gen_cn==7 & nr_corigin_f_f2>=2 & ((nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	replace origin_short=nr_corigin_f_m2 if mig_gen_cn==7 & nr_corigin_f_m2>=2 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	replace origin_short=nr_corigin_m_f2 if mig_gen_cn==7 & nr_corigin_m_f2>=2 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	replace origin_short=nr_corigin_m_m2 if mig_gen_cn==7 & nr_corigin_m_m2>=2 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1))


*** ZWEI Grosselternteile zugewandert und nur fuer einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist
	replace origin_short=nr_corigin_f_f2 if mig_gen_cn==8 & nr_corigin_f_f2>=2 & ((nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	replace origin_short=nr_corigin_f_m2 if mig_gen_cn==8 & nr_corigin_f_m2>=2 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	replace origin_short=nr_corigin_m_f2 if mig_gen_cn==8 & nr_corigin_m_f2>=2 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	replace origin_short=nr_corigin_m_m2 if mig_gen_cn==8 & nr_corigin_m_m2>=2 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1))


*** Grosseltern aus mindestens zwei verschiedenen Laendern
	replace origin_short=2222 if grosseltern_geb_hv1==0


*** Wenn nur EIN Grosselternteil zugewandert ist, dann die Info nutzen, die nicht Deutsch oder Missing ist
	replace origin_short=nr_corigin_f_f2 if (mig_gen_cn==9 & nr_corigin_f_f2>=2)
	replace origin_short=nr_corigin_f_m2 if (mig_gen_cn==9 & nr_corigin_f_m2>=2)
	replace origin_short=nr_corigin_m_f2 if (mig_gen_cn==9 & nr_corigin_m_f2>=2)
	replace origin_short=nr_corigin_m_m2 if (mig_gen_cn==9 & nr_corigin_m_m2>=2)


*  Befragter oder Eltern oder Grosseltern im Ausland geboren, aber keine Geburtslandinfo --> origin_long==-2
***********************************************************************************************************
*** Befragter zugewandert, aber keine Gebland-Info
	replace origin_short=-2 if ((mig_gen_cn==1 | mig_gen_cn==2) & nr_corigin_zp2<=0)


*** Befragter nicht selbst zugewandert oder Missing und keine Gebland-Info fuer ein bzw. beide Elternteil(e)
	replace origin_short=-2 if (eltern_geb_hv1==-2 | eltern_geb_hv1==-4)


*** VIER Grosselternteile zugewandert, aber keine Info zum Gebland
	replace origin_short=-2 if mig_gen_cn==6 & (nr_corigin_f_f2<=0 & nr_corigin_f_m2<=0 & nr_corigin_m_f2<=0 & nr_corigin_m_m2<=0)


*** DREI Grosselternteile zugewandert und fuer keinen Land bekannt
	replace origin_short=-2 if mig_gen_cn==7 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	

*** ZWEI Grosselternteile zugewandert und fuer keinen Land bekannt
	replace origin_short=-2 if mig_gen_cn==8 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	

*** EIN Grosselternteil zugewandert, aber keine Info zum Gebland
	replace origin_short=-2 if mig_gen_cn==9 & ((nr_corigin_f_f2<=0 | nr_corigin_f_f2==1) & (nr_corigin_f_m2<=0 | nr_corigin_f_m2==1) & (nr_corigin_m_f2<=0 | nr_corigin_m_f2==1) & (nr_corigin_m_m2<=0 | nr_corigin_m_m2==1))
	

* UEberall Sysmis (Befragter, Eltern, Grosseltern): keine Info, ob ueberhaupt Migrant --> origin_long==-1
******************************************************************************************************
	replace origin_short=-1 if mig_gen_cn==.


*** Werte rekodieren (Kann man das auch einfach innerhalb der origin_short machen (also keine neue Variable bilden), ohne Gefahr zu laufen, dass etwas ueberschrieben wird?)
	
	gen origin_short1=.
	replace origin_short1=1 if origin_short==1 // Deutschland
	replace origin_short1=2 if origin_short==3 // Ex-Jugoslawien
	replace origin_short1=3 if origin_short==444 // Ehem. SU
	replace origin_short1=4 if origin_short==4 // Griechenland
	replace origin_short1=5 if origin_short==5 // Italien
	replace origin_short1=6 if origin_short==22 // Polen
	replace origin_short1=7 if origin_short==6 // Spanien
	replace origin_short1=8 if origin_short==2 // Tuerkei
	replace origin_short1=9 if origin_short==83 // Vietnam
	replace origin_short1=10 if origin_short==555 // West-EU
	replace origin_short1=11 if origin_short==2222 // Sonstige
	replace origin_short1=-1 if origin_short==-1 // Sonstige
	replace origin_short1=-2 if origin_short==-2 // Sonstige

	lab var origin_short "Herkunftsland short_klassifiziert"

	lab def origin_short 1 "Deutschland" ///
	2 "Ehem. Jugoslawien" ///
	3 "Ehem. Sowjetunion" ///
	4 "Griechenland" ///
	5 "Italien" ///
	6 "Polen" ///
	7 "Spanien" ///
	8 "Tuerkei" ///
	9 "Vietnam" ///
	10 "West-EU (Belgien, Daenemark, Finnland, Frankreich, GB, Irland, Luxemburg, Holland, �sterreich, Portugal, Schweden)" ///
	11 "Sonstige" ///
	-1 "Ueberall Sysmis (Befragter, beide Elternteile, alle Grosselternteile)" ///
	-2 "Befragter, Eltern oder Grosseltern im Ausland geboren, aber keine Geblandinfo"

	lab val origin_short origin_short

	tab origin_long origin_short
	tab origin_short mig_gen_cn
	tab origin_short mig_gen_c



*XXX FEHLEND: Plausibilaetschecks XXX


***************************************************************************************************
*** 3.2.2.3 origin_hv: Hilfsvariable **************************************************************
***************************************************************************************************

*** Vorgehenslogik
* Origin_hv bezieht sich auf das Bestehen fehlender Werte von im Ausland geborenen Personen, die fuer den jeweiligen Generationenstatus relevant sind; also:								
* Wenn 1. Gen. und zugewandert, aber keine Info Gebland, dann origin_hv== -1								
* Wenn 2,5 Gen. und bei dem im Ausland geborenen Elternteil keine Gebinfo, dann == -2								
* Wenn 2. Gen. und beide Eltern im Ausland geboren, aber fuer einen fehlt Info, welches Land genau, dann ==-2; wenn fuer beide Infos fehlen ==-3								
* etc.
						

gen origin_hv=.


*-1: Befragter zugewandert, aber keine Gebland-Info
****************************************************
	replace origin_hv=-1 if ((mig_gen_cn==1 | mig_gen_cn==2) & nr_corigin_zp<=0)


*-2: Befragter nicht selbst zugewandert oder Missing, aber mindestens EIN Elternteil und hier eine fehlende Gebland-Info
************************************************************************************************************************
	replace origin_hv=-2 if (eltern_geb_hv==-2 | eltern_geb_hv==-3)


*-3: Befragter nicht selbst zugewandert oder Missing, aber BEIDE Elternteile, wobei Gebland-Info fuer beide fehlt
****************************************************************************************************************
	replace origin_hv=-3 if (eltern_geb_hv==-4)


*-4: Befragter und Eltern nicht selbst zugewandert oder Missing, aber EIN Grosselternteil und fuer diesen keine Gebland-Info
**************************************************************************************************************************
	replace origin_hv=-4 if mig_gen_cn==9 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))


*-5: Befragter und Eltern nicht selbst zugewandert oder Missing, aber ZWEI Grosselternteile mit mindestens einer fehlenden Gebland-Info
**************************************************************************************************************************************
* Fuer alle liegt keine Geburtsland-Info vor /// Im naechsten Schritt werden diese Faelle ja eigentlich beruecksichtigt ... Noch mal ueberlegen, ob dieses Vorgehen sinnvoll ... 
	replace origin_hv=-5 if mig_gen_cn==8 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))

* Fuer mindestens einen Grosselternteil liegt keine Geburtsland-Info vor 
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_f_f<=0 & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_f_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_m_f<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_m_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*-6: Befragter und Eltern nicht selbst zugewandert oder Missing, aber DREI Grosselternteile und hier keine Gebland-Info
**********************************************************************************************************************
* Fuer alle liegt keine Geburtsland-Info vor
	replace origin_hv=-6 if mig_gen_cn==7 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	
* Fuer mindestens ein Grosselternteil liegt keine Geburtsland-Info vor // FRAGE MO: Sind so auch diejenigen enthalten, bei denen zwei Missing beim Gebland haben?
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_f_f<=0 & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_f_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_m_f<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_m_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*-7: Befragter und Eltern nicht selbst zugewandert oder Missing, aber VIER Grosselternteile und hier mindestens eine fehlende Gebland-Info
*****************************************************************************************************************************************
* Fuer alle liegt keine Geburtsland-Info vor
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)
	
* Fuer mindestens einen Grosselternteil liegt keine Geburtsland-Info vor // FRAGE MO: Sind so auch diejenigen enthalten, bei denen zwei oder drei Missings beim Gebland?
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_f_f<=0 & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_f_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_m_f<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_m_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))



	lab var origin_hv "Hilfsvariable origin"
	lab def origin_hv	///
	-1 "Geburtslandinfo fuer Befragten selbst nicht bekannt" ///
	-2 "Geburtslandinfo fuer ein Elternteil nicht bekannt" ///
	-3 "Geburtslandinfo fuer beide Elternteile nicht bekannt" ///
	-4 "3,75.: Gebinfo fuer im Ausland geborenes Grosselternteil nicht bekannt" ///
	-5 "3,5.: Gebinfo fuer mind. ein im Ausland geborenes Grosselternteil nicht bekannt" ///
	-6 "3,25.: Gebinfo fuer mind. ein im Ausland geborenes Grosselternteil nicht bekannt" ///
	-7 "3.: Gebinfo fuer mind. ein im Ausland geborenes Grosselternteil bekannt" 
	lab val origin_hv origin_hv


order persnr mig_gen_c mig_gen_c_hv origin_long mig_gen_cn eltern_geb_hv grosseltern_geb_hv origin_short origin_hv

***Log-File schliessen***
log close 


* ------------------------ *
* ------- THE END -------- *
* ------------------------ *


tab mig_gen_c mig_gen_cn, m




