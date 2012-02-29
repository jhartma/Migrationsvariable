
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
	***** 																						*****
	*************************************************************************************************


	************************************************************ VERFASSER **********************************************************************
	***** Reihenfolge i.O.?	(kann ehrlich gesagt nicht einschätzen, wie aufwendig die Sachen teilweise waren; ggf. noch mal mündlich klären																						  	*****
	***** Joerg Hartmann, Georg-August-UniversitÃ¤t Goettingen, Institut fuer Soziologie, Platz der Goettinger Sieben 3, 37073 Goettingen *******
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
	global temp="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\temp/" //TemporÃ¤rer Arbeitsspeicher
	global LoFi="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\LogFile/" // Ordner fÃ¼r Log-Files
	global DoFi="\\Ug-uszu-s1\ussz100_all$\Projekte\SOEPlong\Migrationsvariable\DoFile/" // Ordner fÃ¼r Do-Files 
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
					1.9.3 ZusammenfÃ¼ehrung von Eltern und Grosseltern 
			1.10 	Mergen aller Datensaetze - Output: miggen.dta	

		2. 	Bildung von Hilfsvariablen
			2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation immiyear, BIIGRP, Deu_seit, biimgrp, staatsang)			
			2.2 Weitere Hilfsvariablen 
		
		3.	Bildung Migrantenvariablen
			3.1	Generationenstatus
					3.1.1 Generationenstatus unter ausschließlicher Nutzung Geburtsland-Informationen
						3.1.1.1 Hilfsvariablen: sum_germborn_gp, sum_germborn_gp_mis und sum_r_nation_gp
						3.1.1.2 mig_gen_c: Generationenstatus unter ausschließlicher Nutzung der Geburtsland-Informationen
						3.1.1.3 mig_gen_c_hv: Hilfsvariable Missings
					3.1.2 Generationenstatus unter Nutzung weiterer Informationen (Staatsangehörigkeit, etc.)
						3.1.2.1 mig_gen_cn: Generationenstatus unter Berücksichtigung weiterer Informationen
					3.1.3 soep_info
			3.2	Origin-Variablen
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
***** 2.2 Weitere Hilfsvariablen ***********************
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
	replace `var' =   1 if `var' == 153 // Rekodiere Freistaat Danzig -> Deutschland --> MO: DDR müßte noch ergänzt werden (es gaht ja zunächst um den Generationenstatus und bei origin differenzieren wir auch nicht zwischen Ost und West)
	replace `var' =  -5 if `var' ==  98 // Rekodiere Staatenlose --> MO: Wenn = im Ausland geboren; würde ich die nicht rekodieren (siehe Excel-Sheet Ländercodierung)
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




****************************************************************************************************
*** 3. Bildung Migrantenvariablen  *****************************************************************
*** Von Melanie ************************************************************************************
****************************************************************************************************

****************************************************************************************************
*** HINWEIS: Vorgehen basiert auf Grundlage des skizzierten Datenaufbereitungsvorgehens wie es im **
*** Sheet "Logik" skizziert ist (im Excel-Übersichten-Dokument) ************************************
*** ALTERNATIV könnte zunächst der Generationenstatus für die Eltern und Großeltern gebildet werden
*** und im nächsten Schritt für jüngste Generation --> ich bezweifle, dass das weniger komplex wird,
*** da die Zwischenschritte und Teilbedingungen immer anfallen werden
****************************************************************************************************

****************************************************************************************************
*** 3.1. Generationenstatus ************************************************************************
****************************************************************************************************

****************************************************************************************************
*** 3.1.1 Generationenstatus unter ausschließlicher Nutzung Geburtsland-Informationen **************
****************************************************************************************************

****************************************************************************************************
*** 3.1.1.1 Hilfsvariablen  ************************************************************************
****************************************************************************************************

*** Bildung Summenscore: Anzahl im Ausland geborener Großeltern bzw. Missing bei dieser Info
*** Warum? Vereinfacht die Bildung der mig_gen_c(n) und entsprechender Hilfsvariable erheblich 

*1. Schritt Rekodierung

	gen d_germborn_f_f=.
	replace d_germborn_f_f=1 if germborn_f_f==2
	replace d_germborn_f_f=0 if germborn_f_f==1
	lab var d_germborn_f_f "Dummy im Ausland geborenes Großelternteil"
	lab def d_germborn_gp 1 "Ausland" 0 "Deutschland"
	lab val d_germborn_f_f d_germborn_gp
	tab d_germborn_f_f germborn_f_f

	gen d_germborn_f_m=.
	replace d_germborn_f_m=1 if germborn_f_m==2
	replace d_germborn_f_m=0 if germborn_f_m==1
	lab var d_germborn_f_m "Dummy im Ausland geborenes Großelternteil"
	lab val d_germborn_f_m d_germborn_gp
	tab d_germborn_f_m germborn_f_m

	gen d_germborn_m_f=.
	replace d_germborn_m_f=1 if germborn_m_f==2
	replace d_germborn_m_f=0 if germborn_m_f==1
	lab var d_germborn_m_f "Dummy im Ausland geborenes Großelternteil"
	lab val d_germborn_m_f d_germborn_gp
	tab d_germborn_m_f germborn_m_f

	gen d_germborn_m_m=.
	replace d_germborn_m_m=1 if germborn_m_m==2
	replace d_germborn_m_m=0 if germborn_m_m==1
	lab var d_germborn_m_m "Dummy im Ausland geborenes Großelternteil"
	lab val d_germborn_m_m d_germborn_gp
	tab d_germborn_m_m germborn_m_m


*2. Schritt: Bildung Summenscore "sum_germborn_gp" (alle Werte 1 werden aufsummiert, unabhängig davon, ob Missings vorhanden oder nicht)

	egen sum_germborn_gp = anycount(d_germborn_f_f d_germborn_f_m d_germborn_m_f d_germborn_m_m)
	lab var sum_germborn_gp "Anzahl im Ausland geborener Großelternteile"
	tab sum_germborn_gp


*3. Schritt: Bildung Summenscore für die Anzahl Missings "sum_germborn_gp_mis"

	egen sum_germborn_gp_mis = rowmiss(d_germborn_f_f d_germborn_f_m d_germborn_m_f d_germborn_m_m)
	lab var sum_germborn_gp_mis "Anzahl Missings bei Geburtsland Großeltern"
	tab sum_germborn_gp_mis



*** Bildung Summenscore: Anzahl Großeltern mit ausländischer SBS "sum_r_nation_gp"

*1. Schritt Rekodierung

	gen d_r_nation_f_f=.
	replace d_r_nation_f_f=1 if r_nation_f_f>=2
	replace d_r_nation_f_f=0 if r_nation_f_f==1
	lab var d_r_nation_f_f "Dummy Großelternteil mit ausländischer SBS"
	lab def d_r_nation_gp 1 "Ausland" 0 "Deutschland"
	lab val d_r_nation_f_f d_r_nation_gp
	tab d_r_nation_f_f r_nation_f_f

	gen d_r_nation_f_m=.
	replace d_r_nation_f_m=1 if r_nation_f_m>=2
	replace d_r_nation_f_m=0 if r_nation_f_m==1
	lab var d_r_nation_f_m "Dummy Großelternteil mit ausländischer SBS"
	lab val d_r_nation_f_m d_r_nation_gp
	tab d_r_nation_f_m r_nation_f_m

	gen d_r_nation_m_f=.
	replace d_r_nation_m_f=1 if r_nation_m_f>=2
	replace d_r_nation_m_f=0 if r_nation_m_f==1
	lab var d_r_nation_m_f "Dummy Großelternteil mit ausländischer SBS"
	lab val d_r_nation_m_f d_r_nation_gp
	tab d_r_nation_m_f r_nation_m_f

	gen d_r_nation_m_m=.
	replace d_r_nation_m_m=1 if r_nation_m_m>=2
	replace d_r_nation_m_m=0 if r_nation_m_m==1
	lab var d_r_nation_m_m "Dummy Großelternteil mit ausländischer SBS"
	lab val d_r_nation_m_m d_r_nation_gp
	tab d_r_nation_m_m r_nation_m_m


*2. Schritt: Bildung Summenscore "sum_r_nation_gp" (alle Werte 1 werden aufsummiert, unabhängig davon, ob Missings vorhanden oder nicht)

	egen sum_r_nation_gp = anycount(d_r_nation_f_f d_r_nation_f_m d_r_nation_m_f d_r_nation_m_m)
	lab var sum_r_nation_gp "Anzahl Großelternteile mit ausländischer SBS"
	tab sum_r_nation_gp


***********************************************************************************************************************************************************
*** 3.1.1.2 mig_gen_c: Generationenstatus unter ausschließlicher Nutzung Geburtsland-Informationen*********************************************************
*** Liberale Bildungsweise, heißt: Im Falle fehlender Werte bei für die eindeutige Generationenstatus-Bestimmung*******************************************
*** benötigter Variablen, werden die vorhandenen Informationen genutzt ************************************************************************************
*** + Vermerk Missings in der mig_gen_hv*******************************************************************************************************************
***********************************************************************************************************************************************************
*** Germborn herangezogen, da hier mehr Infos als in corigin: **********************************************************************************************
	tab corigin germborn

***********************************************************************************************************************************************************
*** WICHTIG: Infos aus Jugendlichenbefragung müssen den "Haupt-Hilfsvariablen" (Germborn, germborn_f, etc.) zugeordnet werden *****************************
***********************************************************************************************************************************************************

	gen mig_gen_c = .

*1. Generation (nach dem 6. Lebensjahr zugewandert oder Missing bei migage) 
***************************************************************************
*** FRAGE: 	Ünberücksichtigt bleibt jetzt der Pfad über die Nationalität und den Einreisestatus, 
*** aber eigentlich müßte es doch jetzt so passen (oder geben Ossis an, im Ausland geboren zu sein?)???

	replace mig_gen_c = 1 if germborn==2 & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, müßten die Missing-Werte auch anders bestimmt werden


*1,5. Generation (vor dem 7. Lebensjahr zugewandert)
****************************************************
	replace mig_gen_c = 2 if germborn==2 & migage <=6


*2. Generation: beide Elternteile zugewandert (ZP in Deutschland geboren oder Missing)
**************************************************************************************
	replace mig_gen_c = 3 if (germborn==1 | germborn<=0) & (germborn_f==2) & (germborn_m==2) 


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


*3. Generation: vier Großeltern zugewandert
*******************************************
	replace mig_gen_c = 6 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==4


*3,25. Generation: drei Großeltern zugewandert
**********************************************
	replace mig_gen_c = 7 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==3


*3,5. Generation: zwei Großeltern zugewandert
*********************************************
	replace mig_gen_c = 8 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==2


*3,75. Generation: ein Großelternteil zugewandert
*************************************************
	replace mig_gen_c = 9 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	sum_germborn_gp==1


*kein Migrationshintergrund (auch diejenigen, die im Ausland geboren sind, aber deren beiden Eltern in Deutschland geboren sind)
*******************************************************************************************************************************
	replace mig_gen_c = 0 if (germborn==1 | germborn<=0) & (germborn_f==1 | germborn_f<=0) & (germborn_m==1 | germborn_m<=0) & ///
	(sum_germborn_gp==0 | sum_germborn_gp_mis==4)

* Berücksichtigung auch derjenigen, die im Ausland geboren sind, aber deren beiden Eltern in Deutschland geboren sind
*** FRAGE: Wollen wir hier wirklich noch berücksichtigen, ob der Befragte die deutsche Nationalität hat? Sinnvoll? 
	replace mig_gen_c=0 if germborn==2 & (germborn_f==1 & germborn_m==1)


*Rausfiltern von Fällen, die überall Missings haben
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



	tab mig_gen_c
	tab mig_gen_c migback


*XXX FEHLEND: Plausibilätschecks XXX


***************************************************************************************************
*** 3.1.1.3 mig_gen_c_hv **************************************************************************
***************************************************************************************************

*** Logik: 
* Wenn ZP Missing --> -1; 
* Wenn ZP in Deutschland und bei Eltern Missings --> -2 oder -3 
* ABER AUCH: Wenn ZP im Ausland geboren ist und keine Info zu (beiden) Eltern --> ebenfalls -2 oder -3, da Diplomatenkinder ausgeschlossen werden sollen
* Wenn ZP und Eltern in Deutschland und Großelternteil(e) Missing --> -4 und aufwärts


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


	tab mig_gen_c_hv
	tab mig_gen_c mig_gen_c_hv



*XXX FEHLEND: Plausibilätschecks XXX



********************************************************************************************************************
*** 3.1.2 Generationenstatus: Nutzung weiterer Informationen (Staatsangehörigkeit; Einreisestatus; etc.)************
*** FRAGE: Weglassen Weg über Living? Siehe auch Anmerkung im Excel-Sheet "Bildung Mig"*****************************
********************************************************************************************************************

***************************************************************************************************
*** 3.1.2.1 mig_gen_cn: Generationenstatus unter Berücksichtigung weiterer Informationen***********
***************************************************************************************************

*** HINWEIS: Grundlage bildet die mig_gen_c und die mig_gen_c_hv
*** FOLGLICH: Es werden immer noch die Geburtsland-Infos und eine liberale Bildungsweise genutzt
*** ZIEL ist es nun, bestehende Missings mittels weiterer Informationen zu "eliminieren" bzw. Fälle genauer zuzuordnen
*** Da Missings als "deutsch" behandelt werden und weitere Infos genutzt werden, ist es insbesondere wichtig,
*** Fälle, die eine Herkunft im Ausland aufweisen, zu identifizieren; Das Vorgehen weicht etwas vorm Chart ab - Trotzdem Ok (und so Anpassung Chart) 
*** oder soll was ergänzt werden?
*** FRAGE: Teilweise fehlt jetzt die Berücksichtigung des Einreisestatus (bei den Eltern/Großeltern) --> wird der wirklich noch benötigt?
*** Wenn ja, dann müßte diese Teilbedingung jeweils noch ergänzt werden


	clonevar mig_gen_cn = mig_gen_c

******************************************************
*** Wenn der Befragte Missing beim Geburtsland hat ...
******************************************************

* ... und eine AUSLÄNDISCHE Nationalität vorliegt und Angabe beim Einreisestatus: 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp>=2 ///
	& (biimgrp==1 | biimgrp==3)

* ... und eine AUSLÄNDISCHE Nationalität vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
*** HINWEIS: Es wird jetzt darauf verzichtet über Living zu gehen, wenn Einreisealter Missing --> i.O.? Es würde sonst zu komplex werden und ich sehe nicht wirklich einen Mehrwert
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp>=2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, müßten die Missing-Werte auch anders bestimmt werden

* ... und eine AUSLÄNDISCHE Nationalität vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert vor dem 7. LJ oder Missing--> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp>=2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 

* ... und eine AUSLÄNDISCHE Nationalität vorliegt und Einreisestatus !=1 und !=3, ABER beide Elternteile in Deutschland geboren --> Diplomatenkinder --> kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp>=2 & germborn_m==1 & germborn_f==1 



* ... und die DEUTSCHE Nationalität NICHT seit der Geburt vorliegt und Angabe beim Einreisestatus: 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp==2 ///
	& (biimgrp==1 | biimgrp==3)

* ... und die DEUTSCHE Nationalität NICHT seit der Geburt vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
*** HINWEIS: Es wird jetzt darauf verzichtet über Living zu gehen, wenn Einreisealter Missing --> i.O.? Es würde sonst zu komplex werden und ich sehe nicht wirklich einen Mehrwert
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp==2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, müßten die Missing-Werte auch anders bestimmt werden

* ... und die DEUTSCHE Nationalität NICHT seit der Geburt vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert vor dem 7. LJ oder Missing--> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp==2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 



* ... und die DEUTSCHE Nationalität vorliegt, aber KEINE Info, ob seit Geburt und beim Einreisestatus 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp<=0 ///
	& (biimgrp==1 | biimgrp==3)

* ... und die DEUTSCHE Nationalität vorliegt, aber KEINE Info, ob seit Geburt und Einreisestatus !=1 oder != 3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp<=0 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7 | migage == .) // Wenn migage anders gebildet, so dass keine sysmis, müßten die Missing-Werte auch anders bestimmt werden

* ... und die DEUTSCHE Nationalität vorliegt, aber KEINE Info, ob seit Geburt und Einreisestatus !=1 oder != 3 sowie zugewandert vor dem 7. LJ --> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp<=0 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 



*********************************************************************************************************************************************************************
*** Wenn der Befragte in Deutschland geboren ist ODER seit der Geburt deutsche SBS ODER Missing bei beiden hat und bei mindestens einem Elternteil Missing vorliegt
*********************************************************************************************************************************************************************

* DEUTSCHE Nationalität seit der Geburt hat und beide Eltern im Ausland geboren sind --> 2. Generation
	replace mig_gen_cn=3 if mig_gen_c_hv==-1 & r_nation_zp==1 & Deu_seit_zp==1 & (germborn_f==2) & (germborn_m==2)


* Mutter im Ausland und Vater Missing, aber ausländische SBS und vice versa --> 2. Generation
	replace mig_gen_cn=3 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& ((germborn_m==2 & (germborn_f<=0 & r_nation_f>=2)) | ((germborm_m<=0 & r_nation_m>=2) & germborn_f==2))


* Mutter und Vater Missing beim Gebland, aber beide ausländische SBS --> 2. Generation
	replace mig_gen_cn=3 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& ((germborn_f<=0 & r_nation_f>=2) & (germborm_m<=0 & r_nation_m>=2))


* Mutter und Vater Missing beim Gebland, aber ein Elternteil hat ausländische SBS und dessen Großeltern aus Deutschland oder Missing --> 5: 2,5. Generation
	replace mig_gen_cn=5 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (((germborn_f<=0 & germborn_m<=0) & (r_nation_f>=2 & r_nation_m<=1) & ((germborn_m_f==1 | germborn_m_f<=0) & (germborn_m_m==1 | germborn_m_m<=0)))///
	| ((germborn_f<=0 & germborn_m<=0) & (r_nation_m>=2 & r_nation_f<=1) & ((germborn_f_f==1 | germborn_f_f<=0) & (germborn_f_m==1 | germborn_f_m<=0))))

* Mutter und Vater Missing beim Gebland, aber ein Elternteil hat ausländische SBS und mindestens ein Großelternteil vom deutschen Elternteil im Ausland geboren --> 4: 2,5. Generation
	replace mig_gen_cn=4 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (((germborn_f<=0 & germborn_m<=0) & (r_nation_f>=2 & r_nation_m<=1) & (germborn_m_f==2 | germborn_m_m==2)) ///
	| ((germborn_f<=0 & germborn_m<=0) & (r_nation_m>=2 & r_nation_f<=1) & (germborn_f_f==2 | germborn_f_m==2)))


*******************************************************************************************************************************************************************************
*** Wenn der Befragte und die Eltern in Deutschland geboren sind ODER seit der Geburt die deutsche SBS haben ODER Missing sind, und bei mindestens einem Großelternteil Missing 
*******************************************************************************************************************************************************************************

*** Vorgehenslogik: Fälle, bei denen Großelternteil deutsch oder Missing sind schon zugeordnet worden in der mig_gen_c;
*** Es geht jetzt darum, Fälle mit ausländischer SBS zu berücksichtigen, die keine Gebland-Info aufweisen
*** Herangezogen wird der Summenscore für die Anzahl Missings beim Gebland der Großeltern "sum_germborn_gp" und der Summenscore für die Missings "sum_germborn_gp_mis"
*** Außerdem wird der Summenscore für die Großeltern-SBS "sum_r_nation_gp" herangezogen 


* Wenn VIER Großelternteile Missing beim Gebland und EIN Großelternteil AUSLÄNDISCHE SBS hat --> 3,75. Generation
	replace mig_gen_cn=9 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==1

* Wenn VIER Großelternteile Missing beim Gebland und ZWEI Großelternteile AUSLÄNDISCHE SBS haben --> 3,5. Generation
	replace mig_gen_cn=8 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==2

* Wenn VIER Großelternteile Missing beim Gebland und DREI Großelternteile AUSLÄNDISCHE SBS haben --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==3

* Wenn VIER Großelternteile Missing beim Gebland und VIER Großelternteile AUSLÄNDISCHE SBS haben --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==4


* Wenn EIN Großelternteil im Ausland geboren, DREI Missing beim Gebland und EIN Großelternteil AUSLÄNDISCHE SBS hat --> 3,5. Generation
	replace mig_gen_cn=8 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==1

* Wenn EIN Großelternteil im Ausland geboren, DREI Missing beim Gebland und ZWEI Großelternteile AUSLÄNDISCHE SBS haben --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==2

* Wenn EIN Großelternteil im Ausland geboren, DREI Missing beim Gebland und DREI Großelternteile AUSLÄNDISCHE SBS haben --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==3


* Wenn ZWEI Großelternteile im Ausland geboren, ZWEI Missing beim Gebland und EIN Großelternteil AUSLÄNDISCHE SBS hat --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp==2 & sum_germborn_gp_mis==2 & sum_r_nation_gp==1

* Wenn ZWEI Großelternteile im Ausland geboren, ZWEI Missing beim Gebland und 2 Großelternteile AUSLÄNDISCHE SBS hat --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp==2 & sum_germborn_gp_mis==2 & sum_r_nation_gp==2


* Wenn DREI Großelternteile im Ausland geboren, EIN Missing beim Gebland und 1 Großelternteil AUSLÄNDISCHE SBS hat --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_hv==-1 & r_nation_zp <=0) | (mig_gen_hv==-1 & r_nation_zp==1 & Deut_seit==1)) ///
	& (germborn_m==1 | (germborn_m<=0 & r_nation_m <=0) | (germborn_m<=0 & r_nation_m==1 & Deut_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f<=0 & r_nation_f <=0) | (germborn_f<=0 & r_nation_f==1 & Deut_seit_f==1)) ///
	& sum_germborn_gp==3 & sum_germborn_gp_mis==1 & sum_r_nation_gp==1




*** Für die Fälle mit überhaupt keiner Info: Heranziehen von MIGBACK und versuchen, weitere Fälle zuzuordnen, die jetzt Missing sind
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


*XXX FEHLEND: Plausibilätschecks XXX




***************************************************************************************************
*** 3.1.3 soep_info - Muss noch gemacht werden ... ************************************************
***************************************************************************************************

	gen soep_info=.

* 1: Nur Geburtsland
	replace soepinfo=1 if  // eventuell: mig_gen_hv==. 

* 2: Nur Staatsbürgerschaft (SBS)
	replace soepinfo=2 if 

* 3: Geburtsland und SBS
	replace soepinfo=3 if 

* 4: Ausschließliche Nutzung Migback (Wenn mig_gen_cn==.)
	replace soepinfo=4 if mig_gen_cn==. & migback>=1

* 5: Ausschließliche Nutzung Living
	replace soepinfo=5 if 


	lab var soep_info "CN Herangezogene Informationen"
	tab soep_info
	lab def soep_info 1 "Geburtsland" ///
	2 "Staatsbürgerschaft" ///
	3 "Geburtsland und SBS" ///
	4 "Nur Proxy Migback" ///
	5 "Nur Proxy Living" // Wenn irrelevant, würde ich das löschen
	val lab soep_info soep_info



*******************************************************************************************************************
*** 3.2. Origin-Variablen *****************************************************************************************
*******************************************************************************************************************

***************************************************************************************************
*** 3.2.1 Hilfsvariablen  *************************************************************************
***************************************************************************************************

***************************************************************************************************
* Eltern aus demselben Land?: "eltern_geb_hv"  ****************************************************
* HINWEIS: Nur für Personen der 2. Generation! ****************************************************

	
	gen eltern_geb_hv=.

* 1: Beide Elternteile aus demselben Land (nicht Missing und nicht Deutschland)
*******************************************************************************
	replace eltern_geb_hv = 1 if mig_gen_cn == 3 & (nr_corigin_f>=2 & nr_corigin_m>=2) & (nr_corigin_f == nr_corigin_m)

* 0: Elternteile aus unterschiedlichen Ländern (nicht Missing und nicht Deutschland)
************************************************************************************
	replace eltern_geb_hv = 0 if mig_gen_cn == 3 & (nr_corigin_f>=2 & nr_corigin_m>=2) & (nr_corigin_f != nr_corigin_m)

* -1: Nur ein Elternteil migriert und dessen Geburtsland bekannt; anderes Elternteil deutsch oder Missing
*********************************************************************************************************
	replace eltern_geb_hv=-1 if (mig_gen_cn==4 | mig_gen_cn==5) & (((nr_corigin_f<=0 | nr_corigin_f==1) & nr_corigin_m>=2) | (nr_corigin_f>=2 & (nr_corigin_m<=0 | nr_corigin_m==1)))

* -2: Nur ein Elternteil migriert und dessen Geburtsland NICHT bekannt; anderes Elternteil deutsch oder Missing
***************************************************************************************************************
	replace eltern_geb_hv=-2 if (mig_gen_cn==4 | mig_gen_cn==5) & (((nr_corigin_f<=0 | nr_corigin_f==1) & nr_corigin_m<=0) | (nr_corigin_f<=0 & (nr_corigin_m<=0 | nr_corigin_m==1)))

* -3: Beide Elternteile migriert, EIN Geburtsland NICHT bekannt (Fälle, bei denen beide Länder nicht bekannt sind, werden im nächsten Schritt wieder rausgezogen)
*****************************************************************************************************************************************************************
	replace eltern_geb_hv=-3 if mig_gen_cn==3 & (nr_corigin_f<=0 | nr_corigin_m<=0) 

* -4: Beide Elternteile migriert, BEIDE Geburtsländer NICHT bekannt
*******************************************************************
	replace eltern_geb_hv=-4 if mig_gen_cn==3 & (nr_corigin_f<=0 & nr_corigin_m<=0) 


	lab var eltern_geb_hv "Hilfsvariable Eltern aus demselben Land" 
	lab def eltern_geb_hv 1 "Eltern aus demselben Land" ///
	0 "Eltern aus unterschiedlichen Ländern" ///
	-1 "nur 1 Elternteil migriert_Gebinfo bekannt" ///
	-2 "nur 1 Elternteil migriert_Gebinfo nicht bekannt" ///
	-3 "beide zugewandert, für einen fehlt Gebinfo" ///
	-4 "beide zugewandert, für beide fehlt Gebinfo"
	lab val eltern_geb_hv eltern_geb_hv

	tab eltern_geb_hv



*XXX FEHLEND: Plausibilätschecks XXX


***************************************************************************************************
* Großeltern aus demselben Land?: "grosseltern_geb_hv"  *******************************************
* HINWEIS: Nur für Personen der 3. und aufwärts Generation! ***************************************


gen grosseltern_geb_hv=.

* 1: Wenn VIER Großelternteile zugewandert und alle aus demselben Land (nicht D und kein Missing)--> mindestens 3 von 6 möglichen Kombinationen, müssen erfüllt sein
********************************************************************************************************************************************************************
	replace grosseltern_geb_hv = 1 if mig_gen_cn==6 & ///
	(((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_m_f == nr_corigin_m_m) & (nr_corigin_f_f == nr_corigin_m_f)) ///
	& nr_corigin_f_f>=2) 


* 1: Wenn DREI Großelternteile zugewandert und alle aus demselben Land (nicht D und kein Missing)--> 6 Konstellationen möglich 
******************************************************************************************************************************
	replace grosseltern_geb_hv = 1 if mig_gen_cn==7 ///
	& (((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_f_f==nr_corigin_m_f) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_f_f==nr_corigin_m_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_m_f) & (nr_corigin_m_f==nr_corigin_m_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_m == nr_corigin_m_f) & (nr_corigin_m_f==nr_corigin_m_m) & (nr_corigin_f_m >= 2)))


* 1: Wenn ZWEI Großelternteile zugewandert und alle aus demselben Land (nicht D und kein Missing) --> 6 Konstellationen möglich 
******************************************************************************************************************************
	replace grosseltern_geb_hv = 1 if mig_gen_cn==8 ///
	& (((nr_corigin_f_f == nr_corigin_f_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_m_f) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_f == nr_corigin_m_m) & (nr_corigin_f_f >= 2)) ///
	| ((nr_corigin_f_m == nr_corigin_m_f) & (nr_corigin_f_m >= 2)) ///
	| ((nr_corigin_f_m == nr_corigin_m_m) & (nr_corigin_f_m >= 2)) ///
	| ((nr_corigin_m_f == nr_corigin_m_m) & (nr_corigin_m_f >= 2)))


* 0: Wenn VIER Großelternteile zugewandert und mindestens eine von 6 Kombinationen aus unterschiedlichen Ländern (nicht D und kein Missing)
*******************************************************************************************************************************************
	replace grosseltern_geb_hv = 0 if mig_gen_cn==6 & ///
	( ((nr_corigin_f_f != nr_corigin_f_m) & (nr_corigin_f_f>=2 & nr_corigin_f_m>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_f) & (nr_corigin_f_f>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_m) & (nr_corigin_f_f>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_f) & (nr_corigin_f_m>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_m) & (nr_corigin_f_m>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_m_f != nr_corigin_m_m) & (nr_corigin_m_f>=2 & nr_corigin_m_m>=2)))


* 0: Wenn DREI Großelternteile zugewandert und mindestens 2 dieser aus unterschiedlichen Herkunftsländern --> 6 Kombinationen (nicht D und kein Missing) 
********************************************************************************************************************************************************
	replace grosseltern_geb_hv = 0 if mig_gen_cn==7 & ///
	( ((nr_corigin_f_f != nr_corigin_f_m) & (nr_corigin_f_f>=2 & nr_corigin_f_m>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_f) & (nr_corigin_f_f>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_f != nr_corigin_m_m) & (nr_corigin_f_f>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_f) & (nr_corigin_f_m>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_m != nr_corigin_m_m) & (nr_corigin_f_m>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_m_f != nr_corigin_m_m) & (nr_corigin_m_f>=2 & nr_corigin_m_m>=2)))

* 0: Wenn ZWEI Großelternteile zugewandert und diese aus unterschiedlichen Herkunftsländern --> 6 Kombinationen (nicht D und kein Missing) 
*******************************************************************************************************************************************
	replace grosseltern_geb_hv = 0 if mig_gen_cn==8 & ///
	( ((nr_corigin_f_f!=nr_corigin_f_m) & (nr_corigin_f_f>=2 & nr_corigin_f_m>=2)) ///
	| ((nr_corigin_f_f!=nr_corigin_m_f) & (nr_corigin_f_f>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_f!=nr_corigin_m_m) & (nr_corigin_f_f>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_f_m!=nr_corigin_m_f) & (nr_corigin_f_m>=2 & nr_corigin_m_f>=2)) ///
	| ((nr_corigin_f_m!=nr_corigin_m_m) & (nr_corigin_f_m>=2 & nr_corigin_m_m>=2)) ///
	| ((nr_corigin_m_f!=nr_corigin_m_m) & (nr_corigin_m_f>=2 & nr_corigin_m_m>=2)))

* -1: Wenn nur EIN Großelternteil migriert ist (anderes deutsch oder Missing)
*****************************************************************************
	replace grosseltern_geb_hv = -1 if mig_gen_cn==9 


	lab var grosseltern_geb_hv "Hilfsvariable Großeltern aus demselben Land" 
	lab def grosseltern_geb_hv 1 "Großeltern aus demselben Land" ///
	0 "Großeltern aus unterschiedlichen Ländern" ///
	-1 "nur 1 Großelternteil migriert" ///
	lab val grosseltern_geb_hv grosseltern_geb_hv

	tab grosseltern_geb_hv



***************************************************************************************************
*** 3.2.2 Herkunftsland-Variable origin ***********************************************************
***************************************************************************************************

***************************************************************************************************
*** 3.2.2.1 origin_long****************************************************************************
***************************************************************************************************
*** Es werden allen Fällen Werte zugewiesen, bei denen eine Herkunftsland-Info vorliegt ***********
*** HINWEIS: Missings bei dieser Info werden in der origin_hv abgebildet **************************
*** HINWEIS 2: Grundlage bilden die rekodierten Länder- und SBS-Infos (nr_corigin), da hier *******
*** meisten Infos enthalten + Hilfsvariablen darauf aufbauend *************************************
***************************************************************************************************

*** Vorgehenslogik:
* Wenn kein Migrationshintergrund, dann origin=1 (Deutschland)
* Für die 1. und 1,5. Generation: Wenn selbst zugewandert, dann Geburtsland Zielperson
* Für die 2. Generation: Wenn Vater und Mutter in demselben Land geboren sind, dann das Geburtsland nehmen; Wenn Vater und Mutter in unterschiedlichen Ländern geboren sind, dann in origin_zp zu sonstigen zählen; Wenn nur für einen Info vorliegt, dann diese nehmen
* Für die 2,5. Generation: Wenn Vater oder Mutter im Ausland geboren, dann Geburtsland des jeweiligen Elternteils nehmen
* Für die 3.; 3,25., 3,5. und 3,75. Generation: Das Geburtsland des jeweils im Ausland geborenen Großelternteils wird für origin_zp genutzt. Vorgehen analog wie bei der 2. Generation
* Grundsätzlich: Wenn Geburtsland-Info nicht für alle bekannt, dann werden die Informationen genutzt, die vorhanden sind (und Vermerk in der Hilfsvariable)
* Grundsätzlich 2: Wenn verschiedene Geburtsländer, dann zu sonstigen



	gen origin_long=.

* Wenn Nicht-Migrant (ZK, Eltern + alle Großeltern  aus D oder Missing, aber nicht alle Missing)
************************************************************************************************
	replace origin_long=1 if mig_gen_cn==0


* Befragter selbst zugewandert (mig_gen_cn==1 oder 2) --> Geburtsland ist Herkunftsland
***************************************************************************************
	replace origin_long=nr_corigin_zp if ((mig_gen_cn==1 | mig_gen_cn==2) &  nr_corigin_zp>=2)


* Befragter NICHT zugewandert, aber mindestens (ein) Eltern(teil)
*****************************************************************

*** Beide Eltern zugewandert und aus gleichem Land
	replace origin_long=nr_corigin_f if eltern_geb_hv==1

*** Beide Eltern zugewandert und aus unterschiedlichen Ländern --> Sonstiges 2222
	replace origin_long=2222 if eltern_geb_hv==0

*** Beide Eltern zugewandert, aber nur für einen Elternteil Geburtslandinfo, dann wird diese genutzt
	replace origin_long==nr_corigin_f if eltern_geb_hv==-3 & nr_corigin_f>=2
	replace origin_long==nr_corigin_m if eltern_geb_hv==-3 & nr_corigin_m>=2

*** Nur ein Elternteil zugewandert, dann diese Info als Herkunftsland
	replace origin_long=nr_corigin_f if (eltern_geb_hv==-1 & (nr_corigin_f>=2))
	replace origin_long=nr_corigin_m if (eltern_geb_hv==-1 & (nr_corigin_m>=2))


* Befragter und Eltern nicht zugewandert (oder Missing), aber mindestens ein Großelternteil zugewandert
*******************************************************************************************************

*** VIER Großelternteile zugewandert und alle aus demselben Land
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==6 & grosseltern_geb_hv==1)


*** DREI Großeltern zugewandert und alle aus demselben Land, dann diejenige Info nehmen, die nicht deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==7 & grosseltern_geb_hv==1 & nr_corigin_f_f>=2)
	replace origin_long=nr_corigin_f_m if (mig_gen_cn==7 & grosseltern_geb_hv==1 & nr_corigin_f_m>=2)


*** ZWEI Großeltern zugewandert und diese aus demselben Land, dann diejenige Info nehmen, die nicht deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if (mig_gen_cn==8 & grosseltern_geb_hv==1 & nr_corigin_f_f>=2)
	replace origin_long=nr_corigin_f_m if (mig_gen_cn==8 & grosseltern_geb_hv==1 & nr_corigin_f_m>=2)
	replace origin_long=nr_corigin_m_f if (mig_gen_cn==8 & grosseltern_geb_hv==1 & nr_corigin_m_f>=2)


*** VIER Großelternteile zugewandert und nur für einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist 
	replace origin_long=nr_corigin_f_f if mig_gen_cn==6 & nr_corigin_f_f>=2 & (nr_corigin_f_m<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)
	replace origin_long=nr_corigin_f_m if mig_gen_cn==6 & nr_corigin_f_m>=2 &(nr_corigin_f_f<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)
	replace origin_long=nr_corigin_m_f if mig_gen_cn==6 & nr_corigin_m_f>=2 &(nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_m<=0)
	replace origin_long=nr_corigin_m_m if mig_gen_cn==6 & nr_corigin_m_m>=2 &(nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_f<=0)


*** DREI Großelternteile zugewandert und nur für einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist 
	replace origin_long=nr_corigin_f_f if mig_gen_cn==7 & nr_corigin_f_f>=2 & ((nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_f_m if mig_gen_cn==7 & nr_corigin_f_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_f if mig_gen_cn==7 & nr_corigin_m_f>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_m if mig_gen_cn==7 & nr_corigin_m_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*** ZWEI Großelternteile zugewandert und nur für einen Land bekannt, dann diese Info nutzen, die nicht Deutsch oder Missing ist
	replace origin_long=nr_corigin_f_f if mig_gen_cn==8 & nr_corigin_f_f>=2 & ((nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_f_m if mig_gen_cn==8 & nr_corigin_f_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_f if mig_gen_cn==8 & nr_corigin_m_f>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_long=nr_corigin_m_m if mig_gen_cn==8 & nr_corigin_m_m>=2 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*** Großeltern aus mindestens zwei verschiedenen Ländern
	replace origin_long=2222 if grosseltern_geb_hv==0


*** Wenn nur EIN Großelternteil zugewandert ist, dann die Info nutzen, die nicht Deutsch oder Missing ist
	replace origing_long=nr_corigin_f_f if (mig_gen_cn==9 & nr_corigin_f_f>=2)
	replace origing_long=nr_corigin_f_m if (mig_gen_cn==9 & nr_corigin_f_m>=2)
	replace origing_long=nr_corigin_m_f if (mig_gen_cn==9 & nr_corigin_m_f>=2)
	replace origing_long=nr_corigin_m_m if (mig_gen_cn==9 & nr_corigin_m_m>=2)


*  Befragter oder Eltern oder Großeltern im Ausland geboren, aber keine Geburtslandinfo --> origin_long==-2
***********************************************************************************************************
*** Befragter zugewandert, aber keine Gebland-Info
	replace origin_long=-2 if ((mig_gen_cn==1 | mig_gen_cn==2) & nr_corigin_zp<=0)


*** Befragter nicht selbst zugewandert oder Missing und keine Gebland-Info für ein bzw. beide Elternteil(e)
	replace origin_long=-2 if (eltern_geb_hv==-2 | eltern_geb_hv==-4)


*** VIER Großelternteile zugewandert, aber keine Info zum Gebland
	replace origin_long=-2 if mig_gen_cn==6 & (nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)


*** DREI Großelternteile zugewandert und für keinen Land bekannt
	replace origin_long=-2 if mig_gen_cn==7 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	

*** ZWEI Großelternteile zugewandert und für keinen Land bekannt
	replace origin_long=-2 if mig_gen_cn==8 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	

*** EIN Großelternteil zugewandert, aber keine Info zum Gebland
	replace origin_long=-2 if mig_gen_cn==9 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	

* Überall Sysmis (Befragter, Eltern, Großeltern): keine Info, ob überhaupt Migrant --> origin_long==-1
******************************************************************************************************
	replace origin_long=-1 if mig_gen_cn==.



	lab var origin_long "Herkunftsland long"

*** XXX Ausprägungen noch Labeln, wenn die endgültigen bekannt (Deutschland (DDR) + EU West fehlt bei den rekodierten Variablen m.W. noch --> EU West habe ich jetzt mal 555 gegeben; siehe auch Sheet Ländercodierung)XXX

	tab origin_long mig_gen_cn
	tab origin_long mig_gen_c


*XXX FEHLEND: Plausibilätschecks XXX


***************************************************************************************************
*** 3.2.2.2 origin_short***************************************************************************
***************************************************************************************************


*** Vorgehensweise:
* Zunächst Sonstige zuordnen und dann Fälle den Klassen zuweisen
* HINWEIS: Sonstiges umfasst bei der Long-Version nur Fälle, bei denen Personen aus unterschiedlichen Ländern migriert sind; 
* Hier kommen außerdem diejenigen Fälle hinzu, bei denen aus Ländern migriert wurde, die nicht extra klassifiziert sind:


	gen origin_short=.

	replace origin_short=11 if origin_long>=1 
	replace origin_short=1 if origin_long==1
	replace origin_short=2 if origin_long==3
	replace origin_short=3 if origin_long==444
	replace origin_short=4 if origin_long==4
	replace origin_short=5 if origin_long==5
	replace origin_short=6 if origin_long==22
	replace origin_short=7 if origin_long==6
	replace origin_short=8 if origin_long==2
	replace origin_short=9 if origin_long==83
	replace origin_short=10 if origin_long==555 // vorausgesetzt SBS und Gebland-Infos wurden schon zusammengefasst bei Rekodierung
	replace origin_short=-1 if origin_long==-1
	replace origin_short=-2 if origin_long==-2

	lab var origin_short "Herkunftsland short_klassifiziert"
	lab def origin_short 1 "Deutschland" ///
	2 "Ehem. Jugoslawien" ///
	3 "Ehem. Sowjetunion" ///
	4 "Griechenland" ///
	5 "Italien" ///
	6 "Polen" ///
	7 "Spanien" ///
	8 "Türkei" ///
	9 "Vietnam" ///
	10 "West-EU (Belgien, Dänemark, Finnland, Frankreich, GB, Irland, Luxemburg, Holland, Österreich, Portugal, Schweden)" ///
	11 "Sonstige" ///
	-1 "Überall Sysmis (Befragter, beide Elternteile, alle Großelternteile)" ///
	-2 "Befragter, Eltern oder Großeltern im Ausland geboren, aber keine Geblandinfo"

	lab val origin_short origin_short

	tab origin_long origin_short
	tab origin_short mig_gen_cn
	tab origin_short mig_gen_c



*XXX FEHLEND: Plausibilätschecks XXX


***************************************************************************************************
*** 3.2.2.3 origin_hv: Hilfsvariable **************************************************************
***************************************************************************************************

*** Vorgehenslogik
* Origin_hv bezieht sich auf das Bestehen fehlender Werte von im Ausland geborenen Personen, die für den jeweiligen Generationenstatus relevant sind; also:								
* Wenn 1. Gen. und zugewandert, aber keine Info Gebland, dann origin_hv== -1								
* Wenn 2,5 Gen. und bei dem im Ausland geborenen Elternteil keine Gebinfo, dann == -2								
* Wenn 2. Gen. und beide Eltern im Ausland geboren, aber für einen fehlt Info, welches Land genau, dann ==-2; wenn für beide Infos fehlen ==-3								
* etc.
						

gen origin_hv=.


*-1: Befragter zugewandert, aber keine Gebland-Info
****************************************************
	replace origin_hv=-1 if ((mig_gen_cn==1 | mig_gen_cn==2) & nr_corigin_zp<=0)


*-2: Befragter nicht selbst zugewandert oder Missing, aber mindestens EIN Elternteil und hier eine fehlende Gebland-Info
************************************************************************************************************************
	replace origin_hv=-2 if (eltern_geb_hv==-2 | eltern_geb_hv==-3)


*-3: Befragter nicht selbst zugewandert oder Missing, aber BEIDE Elternteile, wobei Gebland-Info für beide fehlt
****************************************************************************************************************
	replace origin_hv=-3 if (eltern_geb_hv==-4)


*-4: Befragter und Eltern nicht selbst zugewandert oder Missing, aber EIN Großelternteil und für diesen keine Gebland-Info
**************************************************************************************************************************
	replace origin_hv=-4 if mig_gen_cn==9 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))


*-5: Befragter und Eltern nicht selbst zugewandert oder Missing, aber ZWEI Großelternteile mit mindestens einer fehlenden Gebland-Info
**************************************************************************************************************************************
* Für alle liegt keine Geburtsland-Info vor /// Im nächsten Schritt werden diese Fälle ja eigentlich berücksichtigt ... Noch mal überlegen, ob dieses Vorgehen sinnvoll ... 
	replace origin_hv=-5 if mig_gen_cn==8 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))

* Für mindestens einen Großelternteil liegt keine Geburtsland-Info vor 
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_f_f<=0 & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_f_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_m_f<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-5 if mig_gen_cn==8 & (nr_corigin_m_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*-6: Befragter und Eltern nicht selbst zugewandert oder Missing, aber DREI Großelternteile und hier keine Gebland-Info
**********************************************************************************************************************
* Für alle liegt keine Geburtsland-Info vor
	replace origin_hv=-6 if mig_gen_cn==7 & ((nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	
* Für mindestens ein Großelternteil liegt keine Geburtsland-Info vor // FRAGE MO: Sind so auch diejenigen enthalten, bei denen zwei Missing beim Gebland haben?
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_f_f<=0 & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_f_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_m_f<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-6 if mig_gen_cn==7 & (nr_corigin_m_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))


*-7: Befragter und Eltern nicht selbst zugewandert oder Missing, aber VIER Großelternteile und hier mindestens eine fehlende Gebland-Info
*****************************************************************************************************************************************
* Für alle liegt keine Geburtsland-Info vor
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_f_f<=0 & nr_corigin_f_m<=0 & nr_corigin_m_f<=0 & nr_corigin_m_m<=0)
	
* Für mindestens einen Großelternteil liegt keine Geburtsland-Info vor // FRAGE MO: Sind so auch diejenigen enthalten, bei denen zwei oder drei Missings beim Gebland?
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_f_f<=0 & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_f_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_m_f<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_m<=0 | nr_corigin_m_m==1))
	replace origin_hv=-7 if mig_gen_cn==6 & (nr_corigin_m_m<=0 & (nr_corigin_f_f<=0 | nr_corigin_f_f==1) & (nr_corigin_f_m<=0 | nr_corigin_f_m==1) & (nr_corigin_m_f<=0 | nr_corigin_m_f==1))



	lab var origin_hv "Hilfsvariable origin"
	lab def origin hv -1 "Geburtslandinfo für Befragten selbst nicht bekannt" ///
	-2 "Geburtslandinfo für ein Elternteil nicht bekannt" ///
	-3 "Geburtslandinfo für beide Elternteile nicht bekannt" ///
	-4 "3,75.: Gebinfo für im Ausland geborenes Großelternteil nicht bekannt" ///
	-5 "3,5.: Gebinfo für mind. ein im Ausland geborenes Großelternteil nicht bekannt" ///
	-6 "3,25.: Gebinfo für mind. ein im Ausland geborenes Großelternteil nicht bekannt" ///
	-7 "3.: Gebinfo für mind. ein im Ausland geborenes Großelternteil bekannt"
	lab val origin_hv origin_hv




***Log-File schliessen***
log close 


* ------------------------ *
* ------- THE END -------- *
* ------------------------ *





