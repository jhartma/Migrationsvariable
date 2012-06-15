// Ausgangsdatensatz: sp.dta bis bap.dta, apgen.dta bis bapgen.dta
// Enddatensatz:      germ_sbs.dta, Wide-Format
// Variablen:         persnr, germ_since, deu_seit

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
	global DoFi="/home/Knut/Documents/UniGoettingen/Projekte/Migrationsvariable/Stata/temp/" // Ordner fuer Do-Files 


*************************************************
***** 09_deu_seit.do *****************************
*************************************************


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
soepren nation84 nation85 nation86 nation87 nation88 nation89 nation90 nation91 nation92 nation93 nation94 nation95 nation96 nation97 nation98 nation99 nation00 nation01 nation02 nation03 nation04 nation05 nation06 nation07 nation08 nation09 nation10, newstub(nation) waves (1984/2010)  

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
