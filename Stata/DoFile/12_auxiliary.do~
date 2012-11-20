// Ausgangsdatensatz: miggen_merged.dta, miggen.dta
// Enddatensatz:      miggen_helpers.dta
// Variablen:         

******************************
***** Grundeinstellungen *****
******************************

display "$S_DATE $S_TIME"
clear all                                                                        // Arbeitsspeicher reinigen
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
***** von Joerg *********************************

cd ${AVZ}
use miggen_merged.dta, clear

***************************************************************************************************************************
***** 2.1 Eltern und Grosseltern (gebjahr, germborn, corigin, nation, immiyear, BIIGRP, deu_seit, biimgrp, staatsang) *****
***************************************************************************************************************************


***************************************************************************************************************************
***** 2.1.1 Fasse Jahre zu einer Variablen zusammen ***********************************************************************
***************************************************************************************************************************

***** biimgrp *************************************************************************************************************
preserve
mvdecode biimgrp*, mv(-3 -2 -1)
egen biimgrp_min = rowmin(biimgrp*)
egen biimgrp_max = rowmax(biimgrp*)
list persnr biimgrp* if biimgrp_min != biimgrp_max  // keine Abweichungen ueber die Jahre, nehme deswegen irgendein nichtleeres Jahr
restore

generate abiimgrp =.					
forvalues x=1984/2010 {
	replace abiimgrp = biimgrp`x' if biimgrp`x'!=.
}

drop biimgrp*
rename abiimgrp biimgrp

***** germnatbirth ********************************************************************************************************	// Warum? haben doch deu_seit? -> germnatbirth aus page17, deu_seit aus p -> anpassen in 1 Variable
*preserve
*mvdecode germnatbirth*, mv(-3 -2 -1)
*egen germnatbirth_min = rowmin(germnatbirth*)
*egen germnatbirth_max = rowmax(germnatbirth*)
*list persnr germnatbirth* if germnatbirth_min != germnatbirth_max 	// viele Unterschiede zwischen den Jahren
*restore

*egen agermnatbirth = rowmax(germnatbirth*)				// nehme die groesste Zahl, um maximale Migrantenzahlen zu bekommen
*drop germnatbirth2*
*rename agermnatbirth germnatbirth

***** nation **************************************************************************************************************	// ToDo: auf nation2 aufpassen!
preserve
mvdecode nation*, mv(-3 -2 -1)
egen nation_min = rowmin(nation*)
egen nation_max = rowmax(nation*)
list persnr nation* if nation_min != nation_max // viele Unterschiede zwischen den Jahren
restore

egen anation = rowmax(nation*)			// nehme die groesste Nationenzahl, um maximale Migrantenzahlen zu bekommen
label value anation nation10
drop nation*
rename anation nation


***** biresper ************************************************************************************************************
preserve
mvdecode biresper*, mv(-3 -2 -1)
egen biresper_min = rowmin(biresper*)
egen biresper_max = rowmax(biresper*)
list persnr biresper* if biresper_min != biresper_max // keine Abweichungen ueber die Jahre
restore

egen abiresper = rowmax(biresper*)
label value abiresper biresper
drop biresper*
rename abiresper biresper

***** immiyear ************************************************************************************************************
/*egen immiyear_min = rowmin(immiyear*)
egen immiyear_max = rowmax(immiyear*)
list persnr immiyear* if immiyear_min != immiyear_max	// es gibt Abweichungen, nehme immiyear aus ppfad

replace immiyear = immiyear_max if immiyear == .
drop immiyear_j2006 immiyear_j2007 immiyear_j2008 immiyear_j2009 immiyear_j2010 immiyear_max immiyear_min

***** germborn ************************************************************************************************************
rename germborn_m agermborn_m
rename germborn_f agermborn_f
egen germborn_min = rowmin(germborn*)
egen germborn_max = rowmax(germborn*)
list persnr germborn* if germborn_min != germborn_max	// es gibt Abweichungen, nehme germborn aus ppfad

replace germborn = germborn_max if germborn == .
drop germborn_j2006 germborn_j2007 germborn_j2008 germborn_j2009 germborn_j2010 germborn_max germborn_min

rename agermborn_m germborn_m
rename agermborn_f germborn_f

***** corigin *************************************************************************************************************
preserve
rename corigin_m acorigin_m
rename corigin_f acorigin_f
mvdecode corigin*, mv(-3 -2 -1)
egen corigin_min = rowmin(corigin*)
egen corigin_max = rowmax(corigin*)
list persnr corigin* if corigin_max != corigin_min	// es gibt Abweichungen zwischen corigin und corigin_j*, nehme corigin aus ppfad
restore

egen corigin_max = rowmax(corigin_j*)
replace corigin = corigin_max if corigin == .
drop corigin_max corigin_j*
*/
***** deu_seit ************************************************************************************************************
preserve
mvdecode deu_seit*, mv(-3 -2 -1)
egen deu_seit_max = rowmax(deu_seit*)
egen deu_seit_min = rowmin(deu_seit*)
list persnr deu_seit* if deu_seit_max != deu_seit_min	// es gibt Abweichungen sowohl zwischen deu_seit und Rest als auch innerhalb deu_seit*
restore

egen deu_seit_min = rowmin(deu_seit*)
replace deu_seit = deu_seit_min if deu_seit == . 	// nehme eingebuergert an, wenn Konflikte
drop deu_seit2* deu_seit_min

***** gebjahr *************************************************************************************************************
/*egen gebjahr_max = rowmax(gebjahr*)
egen gebjahr_min = rowmin(gebjahr*)
list persnr gebjahr* if gebjahr_max != gebjahr_min	// keine Abweichungen

replace gebjahr = gebjahr_max if gebjahr == .
drop gebjahr_max gebjahr_min
*/
***** gebmoval ************************************************************************************************************
* brauchen wir nicht, also raus
drop gebmoval*

***** d_nation2 ***********************************************************************************************************
/*preserve
mvdecode d_nation2*, mv(-3 -2 -1)
egen d_nation2_min = rowmin(d_nation2*)
egen d_nation2_max = rowmax(d_nation2*)
list persnr d_nation2* if d_nation2_min != d_nation2_max	// keine Abweichungen
restore

egen d_nation2 = rowmax(d_nation2*)
drop d_nation2_j*
*/
aorder
sort persnr

***************************************************************************************************************************
***** 2.1.2 Ordne Eltern und Grosseltern zu Personen zu *******************************************************************
***************************************************************************************************************************
rename corigin_m corigin_m2
rename corigin_f corigin_f2
rename germborn_m germborn_m2
rename germborn_f germborn_f2

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

	capture gen deu_seit_m=.							// deu_seit_m
	replace deu_seit_m=deu_seit[_n-`x'] if m_persnr==persnr[_n-`x'] 
	replace deu_seit_m=deu_seit[_n+`x'] if m_persnr==persnr[_n+`x']
	capture gen deu_seit_f=.							// deu_seit_f
	replace deu_seit_f=deu_seit[_n-`x'] if v_persnr==persnr[_n-`x']
	replace deu_seit_f=deu_seit[_n+`x'] if v_persnr==persnr[_n+`x']
	capture gen deu_seit_f_f=.							// deu_seit_f_f
	replace deu_seit_f_f=deu_seit[_n-`x'] if gv_v==persnr[_n-`x']
	replace deu_seit_f_f=deu_seit[_n+`x'] if gv_v==persnr[_n+`x']
	capture gen deu_seit_m_f=.							// deu_seit_m_f
	replace deu_seit_m_f=deu_seit[_n-`x'] if gv_m==persnr[_n-`x']
	replace deu_seit_m_f=deu_seit[_n+`x'] if gv_m==persnr[_n+`x']
	capture gen deu_seit_f_m=.							// deu_seit_f_m
	replace deu_seit_f_m=deu_seit[_n-`x'] if gm_v==persnr[_n-`x']
	replace deu_seit_f_m=deu_seit[_n+`x'] if gm_v==persnr[_n+`x']
	capture gen deu_seit_m_m=.							// deu_seit_m_m
	replace deu_seit_m_m=deu_seit[_n-`x'] if gm_m==persnr[_n-`x']
	replace deu_seit_m_m=deu_seit[_n+`x'] if gm_m==persnr[_n+`x']
}

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
mvdecode *, mv(-3 -2 -1)
gen migage = immiyear - gebjahr	// Jugendliche sind in immiyear auch enthalten

list persnr immiyear gebjahr if immiyear < gebjahr // 3 Personen sind Jahre vor ihrer Geburt eingewandert

***Speicherung des Datensatzes unter migra.dta***
sort persnr 
save ${AVZ}miggen_helpers.dta, replace
