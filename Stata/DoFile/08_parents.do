// Ausgangsdatensatz: apbrutto.dta bis bapbrutto.dta, ppfad.dta, bioage17.dta, akind.dta bis bakind.dta, biobirth.dta, biorthm.dta, bioparen.dta
// Enddatensatz:      elternzeiger2.dta, Wide-Format
// Variablen:         persnr, v_persnr, m_persnr, m_quelle, v_quelle, gv_v, gv_m, gm_v, gm_m
      

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
	global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/DoFile/" // Ordner fuer Do-Files 


*************************************************
***** 08_parents.do ****************************
*************************************************
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

***Rekodiere Missings
mvdecode *, mv(-3 -2 -1)

***Sortierung und Speicherung des Datensatzes***
sort persnr
save ${AVZ}elternzeiger2, replace 


