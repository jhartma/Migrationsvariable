
	****** Variable: Generationsspezifischer Migrationshintergrund 'miggen' *****


	*************************************************************************************************
	*****							ANMERKUNGEN - BITTE ZUERST LESEN							*****
	*****																						*****
	***** 																						*****
	*****	*Bei elternzeiger.dta wurden nicht die Datensaetze $PBRUTTO rangespielt. 			*****
	*****   Diesen Schritt wird Sabine noch machen. - hat sie gemacht?							*****
	***** 																						*****
	*****	*Hilfsvariable Deu_seit muss noch bearbeitet werden									*****
	*****	*Hilfsvariable BIIMGRP richtig?														*****
	*****	*Wenn die Hilfsvariablen generiert werden, dauert es sehr lange, bis alles			*****	
	*****	durchgelaufen ist (quietly richtig anwenden!)										*****
	*****																						*****	
	*****																						*****
	*****	*Zielvariablen wurden noch nicht angefangen											*****	
	***** 																						*****
	*************************************************************************************************


	************************************************************ VERFASSER **********************************************************************
	***** 												DERZEIT ALPHABETISCH GEORDNET													  	*****
	***** Sabine Keller, Georg-August-Universitaet Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen  	*****
	***** Joerg Hartmann, Georg-August-Universität Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen   	*****
	***** Melanie Olzyck, Universitaet Bamberg																							  	*****
	***** Carolyn stolberg, Georg-August-Universitaet Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen *****
	*****																																	*****																						  
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
	global temp="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\temp/" //Temporärer Arbeitsspeicher
	global LoFi="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\LogFile/" // Ordner für Log-Files
	global DoFi="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\DoFile/" // Ordner für Do-Files 
	*/
	
	// Globals Joerg
	global dir= "/home/Knut/Documents/UniGoettingen/SOEP/" // Arbeitsverzeichnis der Originaldatensaetze 
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
					1.9.3 Zusammenfüehrung von Eltern und Grosseltern 
			1.10 	Mergen aller Datensaetze - Output: miggen.dta	

		2. 	Bildung von Hilfsvariablen
			2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation immiyear, BIIGRP, Deu_seit, biimgrp, staatsang)			
			2.2 Weitere Hilfsvariablen und Zielvariablen
					2.2.1 mig_gen_hv
					2.2.2 mig_gen (generationenstatus)
					2.2.3 mig (Dummy Migrationshintergrund bis 3,5)
					2.2.4 mig_erw (Dummy Migrationshintergrund bis 3,75)
					2.2.5 eltern_geb_hv
					2.2.6 grosseltern_geb_hv
					2.2.7 origin_zp (Herkunftsland)
					2.2.8 origin_zp_hv (Herkunftsland Zielperson)
					2.2.9 soep_info (fuer migback verwendete Informationen)
	*/


***********************************************************
***** 1. Zusammenfuehrung der benoetigten Datensaetze *****
***********************************************************


*************************************************
***** 1.1 ppfad.dta - Output: ppfad_mig.dta ***** 
*************************************************


use ${dir}ppfad.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr persnr sex gebmoval gebjahr ?hhnr immiyear germborn corigin 

***Zahlen als Missings kodieren***
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

soepren ahhnr bhhnr chhnr dhhnr ehhnr fhhnr ghhnr hhhnr ihhnr jhhnr khhnr lhhnr mhhnr nhhnr ohhnr phhnr qhhnr rhhnr shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr, newstub(hhnr) waves (1/26)   

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
foreach file in bpgen.dta cpgen.dta dpgen.dta epgen.dta fpgen.dta gpgen.dta hpgen.dta ipgen.dta jpgen.dta kpgen.dta lpgen.dta mpgen.dta npgen.dta opgen.dta ppgen.dta qpgen.dta rpgen.dta spgen.dta tpgen.dta upgen.dta vpgen.dta wpgen.dta xpgen.dta ypgen.dta zpgen.dta{
	merge persnr using "`file'", sort keep (?hhnr nation*)
  	drop _merge
	quietly: compress
}

***Umbennenung ausgewaehlter Variablen***
soepren nation84 nation85 nation86 nation87 nation88 nation89 nation90 nation91 nation92 nation93 nation94 nation95 nation96 nation97 nation98 nation99 nation00 nation01 nation02 nation03 nation04 nation05 nation06 nation07 nation08 nation09, newstub(nation) waves (1/26)  

***Zahlen als Missings kodieren***
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

soepren ahhnr bhhnr chhnr dhhnr ehhnr fhhnr ghhnr hhhnr ihhnr jhhnr khhnr lhhnr mhhnr nhhnr ohhnr phhnr qhhnr rhhnr shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr, newstub(hhnr) waves (1/26)   

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}pgen_mig.dta, replace


************************************************
***** 1.3 $kind.dta - Output: kind_mig.dta ***** 
************************************************

/* WARUM NUR akind UND EKIND???? */

cd ${dir}
use akind.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep hhnr ?hhnr persnr ak07a 
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
merge persnr using ekind.dta, sort keep (hhnr ?hhnr persnr ek03a)
drop _merge

***Zahlen als Missings kodieren***
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

***Umbennenung ausgewaehlter Variablen***
soepren ak07a ek03a, newstub(nationkind) waves (1, 5)  
soepren ahhnr  ehhnr , newstub(hhnr) waves (1,5)   

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}kind_mig.dta, replace


****************************************************
***** 1.4 hbrutt$.dta - Output: hbrutt_mig.dta ***** 
****************************************************


// hbrutt98.dta und hbrutt00.dta können erst später zusammengefuehrt werden, da es sich um Haushaltsdaten handelt, die keine 'persnr' besitzen


***hbrutt98.dta***
cd ${dir}
use hbrutt98.dta, clear

keep hhnr ?hhnr nathv sexhv
rename nathv nathv15
rename sexhv sexhv15
rename ohhnr hhnr15 // Notwendig, aufgrund bioimmig (siehe 1.6)

quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

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

quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

isid hhnr hhnr17 // hhnr und hhnr17 sind eindeutige Identifikationsvariable
sort hhnr hhnr17

save ${AVZ}hbrutt00_mig.dta, replace


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
soepren shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr, newstub(hhnr) waves (19/26)   

***Zahlen als Missings kodieren***
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

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
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

***Formataenderung (vom Long-Format ins Wide-Format); Dieser Schritt ist für die nachfolgenden Analysen wichtig***
reshape wide biimgrp biresper hhnr, i(persnr) j(erhebj)
isid persnr // Überprüfung, persnr ist jetzt die eindeutige Identifikationsvariable

soepren hhnr1984 hhnr1985 hhnr1986 hhnr1987 hhnr1988 hhnr1989 hhnr1990 hhnr1991 hhnr1992 hhnr1993 hhnr1994 hhnr1995 hhnr1996 hhnr1997 hhnr1998 hhnr1999 hhnr2000 hhnr2001 hhnr2002 hhnr2003 hhnr2004 hhnr2005 hhnr2006 hhnr2007 hhnr2008 hhnr2009, newstub(hhnr) waves (1/26)   
soepren biresper1984 biresper1985 biresper1986 biresper1987 biresper1988 biresper1989 biresper1990 biresper1991 biresper1992 biresper1993 biresper1994 biresper1995 biresper1996 biresper1997 biresper1998 biresper1999 biresper2000 biresper2001 biresper2002 biresper2003 biresper2004 biresper2005 biresper2006 biresper2007 biresper2008 biresper2009, newstub(biresper) waves (1/26)  
soepren biimgrp1984 biimgrp1985 biimgrp1986 biimgrp1987 biimgrp1988 biimgrp1989 biimgrp1990 biimgrp1991 biimgrp1992 biimgrp1993 biimgrp1994 biimgrp1995 biimgrp1996 biimgrp1997 biimgrp1998 biimgrp1999 biimgrp2000 biimgrp2001 biimgrp2002 biimgrp2003 biimgrp2004 biimgrp2005 biimgrp2006 biimgrp2007 biimgrp2008 biimgrp2009, newstub(biimgrp) waves (1/26)  

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
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}bioparen_mig.dta, replace


****************************************************
***** 1.8 $page17.dta - Output: page17_mig.dta ***** 
****************************************************

use ${dir}/wpage17.dta, clear

***Beibehaltung ausgewaehlter Variablen***
keep wj6001 wj6002 wj61 wj6201 wj63 wj64 wj65 wj67 wj6601 wj6602 wj6801 wj69 persnr hhnr ?hhnr
sort persnr

***Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen***
foreach file in xpage17.dta ypage17.dta zpage17.dta{
	merge persnr using "`file'", sort keep (hhnr ?hhnr ?j6001 ?j6002 ?j61 ?j62 ?j63 ?j64 ?j65 ?j67 ?j6601 ?j6602 ?j68 ?j69)
  	drop _merge
	quietly: compress
}

***Zahlen als Missings kodieren***
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

***Umbennenung ausgewaehlter Variablen***
soepren wj6001 xj6001 yj6001 zj6001, newstub(Jgebjahr) waves (23, 24, 25, 26)  
soepren wj6002 xj6002 yj6002 zj6002, newstub(Jgebmoval) waves (23, 24, 25, 26)  
soepren wj61 xj61 yj61 zj61, newstub(Jgermborn) waves (23, 24, 25, 26)  
soepren wj6201 xj62 yj62 zj62, newstub(Jcorigin) waves (23, 24, 25, 26)  
soepren wj63 xj63 yj63 zj63, newstub(Jimmiyear) waves (23, 24, 25, 26)  
soepren wj64 xj64 yj64 zj64, newstub(Jbiimgrp) waves (23, 24, 25, 26)  
soepren wj65 xj65 yj65 zj65, newstub(Jdeutschstaatsang) waves (23, 24, 25, 26)  
soepren wj67 xj67 yj67 zj67, newstub(Jnation) waves (23, 24, 25, 26)  
soepren wj6601 xj6601 yj6601 zj6601, newstub(Jzweitestaatsang) waves (23, 24, 25, 26)  
soepren wj6602 xj6602 yj6602 zj6602, newstub(Jzweitestaatsang_code) waves (23, 24, 25, 26)  
soepren wj6801 xj68 yj68 zj68, newstub(Jstaatsang) waves (23, 24, 25, 26)  
soepren wj69 xj69 yj69 zj69, newstub(Jaufenthaltserl) waves (23, 24, 25, 26)  
soepren whhnr xhhnr yhhnr zhhnr, newstub(hhnr) waves (23, 24, 25, 26)   

***Zahlen als Missings kodieren***
quietly: mvdecode _all, mv(-1=.k\-2=.t\-3=.v)

***Reduzierten Datensatz speichern***
isid persnr // persnr ist eindeutige Identifikationsvariable
sort persnr
save ${AVZ}page17_mig.dta, replace


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
quietly: merge persnr using bpbrutto cpbrutto dpbrutto epbrutto fpbrutto gpbrutto hpbrutto ipbrutto jpbrutto kpbrutto lpbrutto mpbrutto npbrutto opbrutto ppbrutto qpbrutto rpbrutto spbrutto tpbrutto upbrutto vpbrutto wpbrutto xpbrutto ypbrutto zpbrutto, sort keep (*stell *hhnr)
drop _merge* hhnr

soepren astell bstell cstell dstell estell fstell gstell hstell istell jstell kstell lstell mstell nstell ostell pstell qstell rstell sstell tstell ustell vstell wstell xstell ystell zstell, newstub(stell) wave(1/26)
soepren ahhnr bhhnr chhnr dhhnr ehhnr fhhnr ghhnr hhhnr ihhnr jhhnr khhnr lhhnr mhhnr nhhnr ohhnr phhnr qhhnr rhhnr shhnr thhnr uhhnr vhhnr whhnr xhhnr yhhnr zhhnr, newstub(hhnr) wave(1/26)

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

replace sex_hhv=sex_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&stell!=0 // Geschlecht des HH-Vorstandes auf die restlichen HH-Mitglieder übertragen
replace persnr_hhv=persnr_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&stell!=0 // persnr des HH-Vorstandes auf die restlichen HH-Mitglieder übertragen
replace sex_p_hhv=sex_p_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&(stell!=1&stell!=2) // Geschlecht des Partners des HH-Vorstandes auf die restlichen HH-Mitglieder übertragen
replace persnr_p_hhv=persnr_p_hhv[_n-1] if hhnr==hhnr[_n-1]&wave==wave[_n-1]&(stell!=1&stell!=2) // persnr des Partners des HH-Vorstandes auf die restlichen HH-Mitglieder übertragen

keep if stell==3 // nur die Kinder des HH-Vorstandes beibehalten

replace mnr_br=persnr_p_hhv if sex_p_hhv==2 // Daten vom (Partner des) HH-Vorstandes auf Elternnr. schreiben ...
replace mnr_br=persnr_hhv if sex_hhv==2

replace vnr_br=persnr_p_hhv if sex_p_hhv==1
replace vnr_br=persnr_hhv if sex_hhv==1

drop sex_* persnr_*

collapse (firstnm) mnr_br vnr_br, by (persnr) // erste Angabe beibehalten -> kann ggf. auch auf die letzte oder die häufigste Angabe angepasst werden 

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
merge persnr using bkind ckind dkind ekind fkind gkind hkind ikind jkind kkind lkind mkind nkind okind pkind qkind rkind skind tkind ukind vkind wkind xkind ykind zkind, sort
drop _merge*
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
save ${temp}biobirth, replace // im TEMProraeren Ordner des AVZ ablegen


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

quietly: mvencode _all, mv(.k=-1\.t=-2\.v=-3) // ggf. Missingkodierung rückgängig machen

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
***** 1.9.3 Zusammenfüehrung von Eltern und Grosseltern *****
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
***** 1.10 Mergen aller Datensaetze - Output: miggen.dta *****
*************************************************************


***Merge-Prozess mit denjenigen Datensaetzen, deren eindeutige Identifikationsvariable 'persnr' ist***
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
merge persnr using elternzeiger2.dta
drop _merge

sort persnr
merge persnr using page17_mig.dta
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

cd ${AVZ}
use miggen_merged.dta, clear

***************************************************************************************************************************
***** 2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation, immiyear, BIIGRP, Deu_seit, biimgrp, staatsang) *****
***************************************************************************************************************************


***Vorbereitungen***
generate staatsang = .
forvalues x=19/26 {
	replace staatsang = staatsang`x' if staatsang`x'!=.
}

generate biimgrp =.
forvalues x=1/26 {
	replace biimgrp = biimgrp`x' if biimgrp`x'!=.
}

generate nation =.
forvalues x=1/26 {
	replace nation = nation`x' if nation`x'!=.
}


***Generierung der Hilfsvariablen***
sort hhnr persnr
forvalues x=1/36 {
	capture gen corigin_m=.
	replace corigin_m=corigin[_n-`x'] if m_persnr==persnr[_n-`x']
	replace corigin_m=corigin[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen corigin_f=.
	replace corigin_f=corigin[_n-`x'] if v_persnr==persnr[_n-`x']
	replace corigin_f=corigin[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen corigin_f_f=.
	replace corigin_f_f=corigin[_n-`x'] if gv_v==persnr[_n-`x']
	replace corigin_f_f=corigin[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen corigin_m_f=.
	replace corigin_m_f=corigin[_n-`x'] if gm_v==persnr[_n-`x']
	replace corigin_m_f=corigin[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen corigin_f_m=.
	replace corigin_f_m=corigin[_n-`x'] if gv_m==persnr[_n-`x']
	replace corigin_f_m=corigin[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen corigin_m_m=.
	replace corigin_m_m=corigin[_n-`x'] if gm_m==persnr[_n-`x']
	replace corigin_m_m=corigin[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen germborn_m=.
	replace germborn_m=germborn[_n-`x'] if m_persnr==persnr[_n-`x']
	replace germborn_m=germborn[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen germborn_f=.
	replace germborn_f=germborn[_n-`x'] if v_persnr==persnr[_n-`x']
	replace germborn_f=germborn[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen germborn_f_f=.
	replace germborn_f_f=germborn[_n-`x'] if gv_v==persnr[_n-`x']
	replace germborn_f_f=germborn[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen germborn_m_f=.
	replace germborn_m_f=germborn[_n-`x'] if gm_v==persnr[_n-`x']
	replace germborn_m_f=germborn[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen germborn_f_m=.
	replace germborn_f_m=germborn[_n-`x'] if gv_m==persnr[_n-`x']
	replace germborn_f_m=germborn[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen germborn_m_m=.
	replace germborn_m_m=germborn[_n-`x'] if gm_m==persnr[_n-`x']
	replace germborn_m_m=germborn[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen immiyear_m=.
	replace immiyear_m=immiyear[_n-`x'] if m_persnr==persnr[_n-`x']
	replace immiyear_m=immiyear[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen immiyear_f=.
	replace immiyear_f=immiyear[_n-`x'] if v_persnr==persnr[_n-`x']
	replace immiyear_f=immiyear[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen immiyear_f_f=.
	replace immiyear_f_f=immiyear[_n-`x'] if gv_v==persnr[_n-`x']
	replace immiyear_f_f=immiyear[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen immiyear_m_f=.
	replace immiyear_m_f=immiyear[_n-`x'] if gv_m==persnr[_n-`x']
	replace immiyear_m_f=immiyear[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen immiyear_f_m=.
	replace immiyear_f_m=immiyear[_n-`x'] if gm_v==persnr[_n-`x']
	replace immiyear_f_m=immiyear[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen immiyear_m_m=.
	replace immiyear_m_m=immiyear[_n-`x'] if gm_m==persnr[_n-`x']
	replace immiyear_m_m=immiyear[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen gebjahr_m=.
	replace gebjahr_m=gebjahr[_n-`x'] if m_persnr==persnr[_n-`x']
	replace gebjahr_m=gebjahr[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen gebjahr_f=.
	replace gebjahr_f=gebjahr[_n-`x'] if v_persnr==persnr[_n-`x']
	replace gebjahr_f=gebjahr[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen gebjahr_f_f=.
	replace gebjahr_f_f=gebjahr[_n-`x'] if gv_v==persnr[_n-`x']
	replace gebjahr_f_f=gebjahr[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen gebjahr_m_f=.
	replace gebjahr_m_f=gebjahr[_n-`x'] if gv_m==persnr[_n-`x']
	replace gebjahr_m_f=gebjahr[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen gebjahr_f_m=.
	replace gebjahr_f_m=gebjahr[_n-`x'] if gm_v==persnr[_n-`x']
	replace gebjahr_f_m=gebjahr[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen gebjahr_m_m=.
	replace gebjahr_m_m=gebjahr[_n-`x'] if gm_m==persnr[_n-`x']
	replace gebjahr_m_m=gebjahr[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen biimgrp_m=.
	replace biimgrp_m=biimgrp[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace biimgrp_m=biimgrp[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen biimgrp_v=.
	replace biimgrp_v=biimgrp[_n-`x'] if v_persnr==persnr[_n-`x']
	replace biimgrp_v=biimgrp[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen biimgrp_gv_v=.
	replace biimgrp_gv_v=biimgrp[_n-`x'] if gv_v==persnr[_n-`x']
	replace biimgrp_gv_v=biimgrp[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen biimgrp_gv_m=.
	replace biimgrp_gv_m=biimgrp[_n-`x'] if gv_m==persnr[_n-`x']
	replace biimgrp_gv_m=biimgrp[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen biimgrp_gm_v=.
	replace biimgrp_gm_v=biimgrp[_n-`x'] if gm_v==persnr[_n-`x']
	replace biimgrp_gm_v=biimgrp[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen biimgrp_gm_m=.
	replace biimgrp_gm_m=biimgrp[_n-`x'] if gm_m==persnr[_n-`x']
	replace biimgrp_gm_m=biimgrp[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen staatsang_m=.
	replace staatsang_m=staatsang[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace staatsang_m=staatsang[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen staatsang_v=.
	replace staatsang_v=staatsang[_n-`x'] if v_persnr==persnr[_n-`x']
	replace staatsang_v=staatsang[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen staatsang_gv_v=.
	replace staatsang_gv_v=staatsang[_n-`x'] if gv_v==persnr[_n-`x']
	replace staatsang_gv_v=staatsang[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen staatsang_gv_m=.
	replace staatsang_gv_m=staatsang[_n-`x'] if gv_m==persnr[_n-`x']
	replace staatsang_gv_m=staatsang[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen staatsang_gm_v=.
	replace staatsang_gm_v=staatsang[_n-`x'] if gm_v==persnr[_n-`x']
	replace staatsang_gm_v=staatsang[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen staatsang_gm_m=.
	replace staatsang_gm_m=staatsang[_n-`x'] if gm_m==persnr[_n-`x']
	replace staatsang_gm_m=staatsang[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen nation_m=.
	replace nation_m=nation[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace nation_m=nation[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen nation_f=.
	replace nation_f=nation[_n-`x'] if v_persnr==persnr[_n-`x']
	replace nation_f=nation[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen nation_f_f=.
	replace nation_f_f=nation[_n-`x'] if gv_v==persnr[_n-`x']
	replace nation_f_f=nation[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen nation_m_f=.
	replace nation_m_f=nation[_n-`x'] if gv_m==persnr[_n-`x']
	replace nation_m_f=nation[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen nation_f_m=.
	replace nation_f_m=nation[_n-`x'] if gm_v==persnr[_n-`x']
	replace nation_f_m=nation[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen nation_m_m=.
	replace nation_m_m=nation[_n-`x'] if gm_m==persnr[_n-`x']
	replace nation_m_m=nation[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen BIIMGRP_m=.
	replace BIIMGRP_m=biimgrp[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace BIIMGRP_m=biimgrp[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen BIIMGRP_f=.
	replace BIIMGRP_f=biimgrp[_n-`x'] if v_persnr==persnr[_n-`x']
	replace BIIMGRP_f=biimgrp[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen BIIMGRP_f_f=.
	replace BIIMGRP_f_f=biimgrp[_n-`x'] if gv_v==persnr[_n-`x']
	replace BIIMGRP_f_f=biimgrp[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen BIIMGRP_m_f=.
	replace BIIMGRP_m_f=biimgrp[_n-`x'] if gv_m==persnr[_n-`x']
	replace BIIMGRP_m_f=biimgrp[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen BIIMGRP_f_m=.
	replace BIIMGRP_f_m=biimgrp[_n-`x'] if gm_v==persnr[_n-`x']
	replace BIIMGRP_f_m=biimgrp[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen BIIMGRP_m_m=.
	replace BIIMGRP_m_m=biimgrp[_n-`x'] if gm_m==persnr[_n-`x']
	replace BIIMGRP_m_m=biimgrp[_n+`x'] if gm_m==persnr[_n+`x']

	capture gen DEU_seit_m=.
	replace DEU_seit_m=biimgrp[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace DEU_seit_m=biimgrp[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen DEU_seit_f=.
	replace DEU_seit_f=biimgrp[_n-`x'] if v_persnr==persnr[_n-`x']
	replace DEU_seit_f=biimgrp[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen DEU_seit_f_f=.
	replace DEU_seit_f_f=biimgrp[_n-`x'] if gv_v==persnr[_n-`x']
	replace DEU_seit_f_f=biimgrp[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen DEU_seit_m_f=.
	replace DEU_seit_m_f=biimgrp[_n-`x'] if gv_m==persnr[_n-`x']
	replace DEU_seit_m_f=biimgrp[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen DEU_seit_f_m=.
	replace DEU_seit_f_m=biimgrp[_n-`x'] if gm_v==persnr[_n-`x']
	replace DEU_seit_f_m=biimgrp[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen DEU_seit_m_m=.
	replace DEU_seit_m_m=biimgrp[_n-`x'] if gm_m==persnr[_n-`x']
	replace DEU_seit_m_m=biimgrp[_n+`x'] if gm_m==persnr[_n+`x']
}

compress

save ${AVZ}miggen.dta, replace


********************************************************			
***** 2.2 Weitere Hilfsvariablen und Zielvariablen *****
********************************************************

cd ${AVZ}
use miggen.dta, clear


******************************************
***** 2.2.1a r_corigin* and r_nation *****
******************************************
gen r_corigin_zp  = corigin
gen r_corigin_f   = corigin_f
gen r_corigin_m   = corigin_m
gen r_corigin_f_f = corigin_f_f
gen r_corigin_f_m = corigin_f_m
gen r_corigin_m_m = corigin_m_m
gen r_corigin_m_f = corigin_m_f
gen r_nation      = nation
gen r_nation_f    = nation_f
gen r_nation_m    = nation_m
gen r_nation_m_m  = nation_m_m
gen r_nation_m_f  = nation_m_f
gen r_nation_f_m  = nation_f_m
gen r_nation_f_f  = nation_f_f 

foreach var of varlist r_corigin_zp r_corigin_f r_corigin_m r_corigin_m_m r_corigin_m_f r_corigin_f_m r_corigin_f_f r_nation r_nation_m r_nation_f r_nation_m_m r_nation_m_f r_nation_f_f r_nation_f_m {
	// Ehemalige Sowjetstaaten
	replace `var' = 444 if `var' ==  32 // Rekodiere Russland
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
	replace `var' =   1 if `var' == 153 // Rekodiere Freistaat Danzig -> Deutschland
	replace `var' =  -5 if `var' ==  98 // Rekodiere Staatenlose
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

replace nr_corigin_zp  = r_nation     if nr_corigin_zp  >= .  
replace nr_corigin_f   = r_nation_f   if nr_corigin_f   >= .  
replace nr_corigin_m   = r_nation_m   if nr_corigin_m   >= .  
replace nr_corigin_m_m = r_nation_m_m if nr_corigin_m_m >= .  
replace nr_corigin_m_f = r_nation_m_f if nr_corigin_m_f >= .  
replace nr_corigin_f_f = r_nation_f_f if nr_corigin_f_f >= . 

******************************
***** 2.2.1 mig_gen_c_hv *****
******************************

gen mig_gen_hv = .
replace mig_gen_hv = -1 if  germborn     >= .
replace mig_gen_hv = -2 if (germborn_m   >= 0 | germborn_f >= .) | (germborn_m >= . | germborn_f >= 0 )
replace mig_gen_hv = -3 if  germborn_m   >= . & germborn_f >= .
replace mig_gen_hv = -4 if (germborn_m_m >= 0 & germborn_m_f >= 0 & germborn_f_m >= 0 & germborn_f_f >= .) | (germborn_m_m >= 0 & germborn_m_f >= 0 & germborn_f_m >= . & germborn_f_f >= 0) | (germborn_m_m >= 0 & germborn_m_f == . & germborn_f_m >= 0 & germborn_f_f >= 0) | (germborn_m_m == . & germborn_m_f >= 0 & germborn_f_m >= 0 & germborn_f_f >= 0)
replace mig_gen_hv = -5 if (germborn_m_m >= 0 & germborn_m_f >= 0 & germborn_f_m >= . & germborn_f_f >= .) | (germborn_m_m >= 0 & germborn_m_f >= . & germborn_f_m >=0  & germborn_f_f >= .) | (germborn_m_m >= 0 & germborn_m_f == . & germborn_f_m == . & germborn_f_f >= 0) | (germborn_m_m == . & germborn_m_f >= 0 & germborn_f_m >= 0 & germborn_f_f >= .) | (r_corigin_m_m >= . & r_corigin_m_f >= 0 & r_corigin_f_m >= . & r_corigin_f_f >= 0) | (r_corigin_m_m >= . & r_corigin_m_f >= . & r_corigin_f_m >= 0 & r_corigin_f_f >= 0)
replace mig_gen_hv = -6 if (germborn_m_m >= 0 & germborn_m_f >= . & germborn_f_m >= . & germborn_f_f >= .) | (germborn_m_m >= . & germborn_m_f >= 0 & germborn_f_m >= . & germborn_f_f >= .) | (germborn_m_m == . & germborn_m_f == . & germborn_f_m >= 0 & germborn_f_f == .) | (germborn_m_m == . & germborn_m_f == . & germborn_f_m == . & germborn_f_f >= 0)
replace mig_gen_hv = -7 if  germborn_m_m >= . & germborn_m_f >= . & germborn_f_m >= . & germborn_f_f >= .

label variable mig_gen_hv Hilfsvariable_Generationenstatus
label define Hilfsvariable_Generationenstatus -1 Informationen_fuer_Kind_Person_selbst_nicht_bekannt -2 Informationen_fuer_ein_Elternteil_nicht_bekannt -3 Information_fuer_beide_Elternteile_nicht_bekannt -4 Information_fuer_ein_Grosselternteil_nicht_bekannt -5 Information_fuer_zwei_Grosselternteile_nicht_bekannt -6 Information_fuer_drei_Grosselternteile_nicht_bekannt -7 Information_fuer_vier_Grosselternteile_nicht_bekannt 
label values mig_gen_hv Hilfsvariable_Generationenstatus


*********************************************************
***** 2.2.8 origin_zp_hv (Herkunftsland Zielperson) *****
*********************************************************

gen origin_zp_hv = .
replace origin_zp_hv = -1 if  r_corigin_zp  >= .
replace origin_zp_hv = -2 if (r_corigin_m   >= . & r_corigin_f   >= 0) | (r_corigin_m >= 0 & r_corigin_f >= .)
replace origin_zp_hv = -3 if  r_corigin_m   >= . & r_corigin_m   >= .
replace origin_zp_hv = -4 if (r_corigin_m_m >= 0 & r_corigin_m_f >= 0 & r_corigin_f_m >= 0 & r_corigin_f_f >= .) | (r_corigin_m_m >= 0 & r_corigin_m_f >= 0 & r_corigin_f_m >= . & r_corigin_f_f >= 0) | (r_corigin_m_m >= 0 & r_corigin_m_f == . & r_corigin_f_m >= 0 & r_corigin_f_f >= 0) | (r_corigin_m_m == . & r_corigin_m_f >= 0 & r_corigin_f_m >= 0 & r_corigin_f_f >= 0)
replace origin_zp_hv = -5 if (r_corigin_m_m >= 0 & r_corigin_m_f >= 0 & r_corigin_f_m >= . & r_corigin_f_f >= .) | (r_corigin_m_m >= 0 & r_corigin_m_f >= . & r_corigin_f_m >=0  & r_corigin_f_f >= .) | (r_corigin_m_m >= 0 & r_corigin_m_f == . & r_corigin_f_m == . & r_corigin_f_f >= 0) | (r_corigin_m_m == . & r_corigin_m_f >= 0 & r_corigin_f_m >= 0 & r_corigin_f_f >= .) | (r_corigin_m_m >= . & r_corigin_m_f >= 0 & r_corigin_f_m >= . & r_corigin_f_f >= 0) | (r_corigin_m_m >= . & r_corigin_m_f >= . & r_corigin_f_m >= 0 & r_corigin_f_f >= 0)
replace origin_zp_hv = -6 if (r_corigin_m_m >= 0 & r_corigin_m_f >= . & r_corigin_f_m >= . & r_corigin_f_f >= .) | (r_corigin_m_m >= . & r_corigin_m_f >= 0 & r_corigin_f_m >= . & r_corigin_f_f >= .) | (r_corigin_m_m == . & r_corigin_m_f == . & r_corigin_f_m >= 0 & r_corigin_f_f == .) | (r_corigin_m_m == . & r_corigin_m_f == . & r_corigin_f_m == . & r_corigin_f_f >= 0)
replace origin_zp_hv = -7 if  r_corigin_m_m >= . & r_corigin_m_f >= . & r_corigin_f_m >= . & r_corigin_f_f >= .

label variable origin_zp_hv Herkunftsland_Zielperson
label define Herkunftsland_Zielperson -1 Geburtslandinfo_fuer_Kind_o_Person_selbst_nicht_bekannt -2 Geburtslandinfo_fuer_ein_Elternteil_nicht_bekannt -3 Geburtslandinfo_fuer_beide_Elternteile_nicht_bekannt -4 Geburtslandinfo_fuer_ein_Grosselternteil_nicht_bekannt -5 Geburtslandinfo_fuer_zwei_Grosselternteile_nicht_bekannt -6 Geburtslandinfo_fuer_drei_Grosselternteile_nicht_bekannt -7 Geburtslandinfo_fuer_vier_Grosselternteile_nicht_bekannt
label value origin_zp_hv Herkunftsland_Zielperson

***Ueberpruefung***
tab origin_zp mig_gen
tab origin_zp mig
tab origin_zp mig_erw



****************************
* Von Caro *****************
*******************************
***** 2.2.2 eltern_geb_hv *****
******************************* !!! erstmal nur nr_corigin_zp genommen !!! mig_gen_cn fehlt noch

gen eltern_geb_hv = .
replace eltern_geb_hv =  0 if nr_corigin_m  == nr_corigin_f
replace eltern_geb_hv =  1 if nr_corigin_m  != nr_corigin_f
replace eltern_geb_hv = -1 if nr_corigin_m  >= . | nr_corigin_f >= .
replace eltern_geb_hv = -2 if (nr_corigin_m == 1 & nr_corigin_f != 1 ) | (nr_corigin_m != 1 & nr_corigin_f == 1)
replace eltern_geb_hv = -3 if nr_corigin_m  >= . | nr_corigin_f >= .

label variable eltern_geb_hv 'Hilfsvariable_ Eltern aus demselben Land' 
label define 'Hilfsvariable_ Eltern aus demselben Land' 
 1 'Ja' 
 0 'Nein' 
-1 'Geburtslandinfo nicht fuer alle bekannt' 
-2 'Nur ein Elternteil migriert'
-3 'fuer mindestens ein Elternteil ueberhaupt keine Info (ob Migrant und welches Geburtsland)'
label value eltern_hv 'Hilfsvariable_ Eltern aus demselben Land' 


************************************
***** 2.2.3 grosseltern_geb_hv *****
************************************

gen grosseltern_geb_hv = .
replace grosseltern_geb_hv = 0 if
replace grosseltern_geb_hv = 1 if
replace grosseltern_geb_hv = -1 if
replace grosseltern_geb_hv = -2 if 
replace grosseltern_geb_hv = -3 if 

label variable grosseltern_hv 'Hilfsvariable_Grosseltern aus demselben Land'
label define 'Hilfsvariable_Grosseltern aus demselben Land' 
1 'Ja' 
0 'Nein' 
-1 'Geburtslandinfo nicht fuer alle bekannt' 
-2 'Nur ein Grosselternteil migriert'
-3 'fuer mindestens ein Grosselternteil ueberhaupt keine Info (ob Migrant und welches Geburtsland)'
label value grosseltern_hv 'Hilfsvariable_Grosseltern aus demselben Land'


****************************
***** 2.2.1 mig_gen_hv *****
****************************

gen mig_gen_hv = .
replace mig_gen_hv = -1 if
replace mig_gen_hv = -2 if
replace mig_gen_hv = -3 if 
replace mig_gen_hv = -4 if
replace mig_gen_hv = -5 if
replace mig_gen_hv = -6 if
replace mig_gen_hv = -7 if

label variable mig_gen_hv Hilfsvariable_Generationenstatus
label define Hilfsvariable_Generationenstatus -1 Informationen_fuer_Kind_Person_selbst_nicht_bekannt -2 Informationen_fuer_ein_Elternteil_nicht_bekannt -3 Information_fuer_beide_Elternteile_nicht_bekannt -4 Information_fuer_ein_Grosselternteil_nicht_bekannt -5 Information_fuer_zwei_Grosselternteile_nicht_bekannt -6 Information_fuer_drei_Grosselternteile_nicht_bekannt -7 Information_fuer_vier_Grosselternteile_nicht_bekannt 
label values mig_gen_hv Hilfsvariable_Generationenstatus


**********************************************
***** 2.2.2 mig_gen (Generationenstatus) *****
**********************************************

gen mig_gen = .
replace mig_gen = 0 if 
replace mig_gen = 1 if
replace mig_gen = 2 if
replace mig_gen = 3 if 
replace mig_gen = 4 if
replace mig_gen = 5 if 
replace mig_gen = 6 if 
replace mig_gen = 7 if 
replace mig_gen = 8 if 

label variable mig_gen Generationenstatus
label define Generationenstatus 
0 'kein Migrationshintergrund' 
1 1.Generation:_selbst_zugewandert_nach_dem_6._Lebensjahr 
2 '1,5. Generation: selbst zugewandert bis einschliesslich 6. Lebensjahr'
3 '2. Generation: beide Eltern zugewandert' 
4 '2,5. Generation: ein Elternteil zugewandert' 
5 '3. Generation: vier Grosseltern zugewandert' 
6 '3,25. Generation: drei Grosseltern zugewandert'
7 '3,5. Generation: zwei Grosseltern zugewandert'
8 '3,75. Generation: ein Grosselternteil zugewandert'
label value mig_gen Generationenstatus


***********************************************************
***** 2.2.3 mig (Dummy Migrationshintergrund bis 3,5) *****
***********************************************************

gen mig = .
replace mig = 0 if 
replace mig = 1 if 
label varible mig 'Generationenstatus bis 3,5. Generation'
label define 'Generationenstatus bis 3,5. Generation' 
0 'kein Migrationshintergrund' 
1 'Migrationshintergrund (bis 3,5)'
label value mig 'Generationenstatus bis 3,5. Generation'


****************************************************************
***** 2.2.4 mig_erw (Dummy Migrationshintergrund bis 3,75) *****
****************************************************************

gen mig_erw = .
replace mig_erw = 0 if 
replace mig_erw = 1 if 
label variable mig_erw 'Generationenstatus bis 3,75. Generation'
label define 'Generationenstatus bis 3,75. Generation' 
0 'kein Migrationshintergrund' 
1 'Migrationshintergrund (bis 3,75)'
label value mig_erw 'Generationenstatus bis 3,75. Generation'

***Ueberpruefung von mig und mig_erw***
tab mig mig_erw



*******************************************
***** 2.2.7 origin_zp (Herkunftsland) *****
*******************************************

gen origin_zp = .
replace origin_zp = 1 if 
replace origin_zp = 2 if 
replace origin_zp = 3 if 
replace origin_zp = 4 if 
replace origin_zp = 5 if 
replace origin_zp = 6 if 
replace origin_zp = 7 if 
replace origin_zp = 8 if 
replace origin_zp = 9 if 
replace origin_zp = 10 if 
replace origin_zp = -1 if 
replace origin_zp = -2 if 

label variable origin_zp Herkunftsland
label define Herkunftsland 
1 Deutschland 
2 Tuerkei 
3 Polen 
4 'Ehemalige SU' 
5 Italien 
6 Griechenland 
7 'Ehem. Jugoslawien' 
8 Spanien
9 Vietnam 
10 Sonstige
-1 'keine Info, ob ueberhaupt Migrationshintergrund' 
-2 'Land unbekannt' 
label value origin_zp Herkunftsland



*****************************************************************
***** 2.2.9 soep_info (fuer migback verwendete Information) *****
*****************************************************************

gen soep_info = .
replace soep_info = 1 if 
replace soep_info = 2 if 
replace soep_info = 3 if 
replace soep_info = 4 if 
replace soep_info = 5 if 
replace soep_info = 6 if 
 

label variable soep_info 'fuer migback verwendete Information'
label define 'fuer migback verwendete information' 
1 'Geburtsland, SBS'
2 'Geburtsland' 
3 'SBS'
4 'Proxy Migback' 
5 'Prox Living'  
6 'keine Info benutzbar'  
label value soep_info 'fuer migback verwendete Information'

***Ueberpruefung***
tab soep_info

***Log-File schliessen***
log close 


* ------------------------ *
* ------- E N D E -------- *
* ------------------------ *



