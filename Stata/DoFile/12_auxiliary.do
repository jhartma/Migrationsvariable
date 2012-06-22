// Ausgangsdatensatz: miggen_merged.dta, miggen.dta
// Enddatensatz:      miggen_helpers.dta
// Variablen:         

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
***** 12_auxiliary.do ***************************
*************************************************
***** von Joerg *************************

cd ${AVZ}
use miggen_merged.dta, clear

***************************************************************************************************************************
***** 2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation, immiyear, BIIGRP, deu_seit, biimgrp, staatsang) *****
***************************************************************************************************************************


***Vorbereitungen***
*generate biimgrp =.
forvalues x=1/27 {
	replace biimgrp = biimgrp`x' if biimgrp`x'!=.
}

* Neu machen: wenn einmal auslaendisch, dann diese 
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
