******************************
	***** Grundeinstellungen *****
	******************************

	display "$S_DATE $S_TIME"
	clear all  //Arbeitsspeicher reinigen
	macro drop _all  // alle Makros loeschen
	version 11  // Version einlesen
	capture log close  // falls Log-Files offen sind schliessen, ansonsten Fehlermeldung unterdruecken
	set more off, perm  // Ergebnisse ohne Unterbrechung am Seitenende durchlaufen lassen
	set scrollbufsize 500000  // Rueckschau erweitern
	set memory 500m, perm  // Arbeitsspeicher erweitern
	set dp comma  // Bei Dezimalzahlen Kommas anstelle von Punkten verwenden
	numlabel, add  // Kategrelennr. anzeigen
	capture net install st0085_1.pkg
	capture ssc install soepren

	
	******************************
	************ Globals *********
	******************************
	
	global dir= "F:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/" // Arbeitsverzeichnis der relginaldatensaetze 
	global AVZ= "F:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Diss/" // Arbeitsverzeichnis der neu generierten Datensaetze und anderer Ordner
	global temp="F:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Diss/" //Temporaerer Arbeitsspeicher
	global LoFi="F:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Diss/" // Ordner fuer Log-Files
	global DoFi="F:/_Arbeit/_Diss/_Datensätze/SOEP/SOEP27/Datensätze_Diss/" // Ordner fuer Do-Files 
	

	
	******************************
	********** Gliederung ********
	******************************
	
	* 1. Bildung Masterdatensatz
	* 2. Identifizierung Migranten
	* 3. Bildung AVs
	* 4. Bilund Explanans
	* 5. Deskriptive Analysen
	* 6. Multivariate Analysen
	
	
	
	
*****************************************************************************************************************
*** 1. Bildung Masterdatensatz: bioage17_diss.dta
*****************************************************************************************************************

*****************************************************************************************
*** $PAGE17: Informationen zur Bestimmung Generationenstatus Jugendlicher (seit 2006) ***
*****************************************************************************************
	cd ${dir}
	use ${dir}wpage17.dta, clear

* Beibehaltung ausgewaehlter Variablen***
	keep wj6001 wj6002 wj61 wj6201 wj63 wj64 wj65 wj67 wj6601 wj6602 wj6801 wj69 persnr hhnr
	sort persnr

* Datensatzzusammenfuehrung und Beibehaltung ausgewaehlter Variablen*** --> FRAGE: MüßTE DAS NICHT APPEND SEIN?
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
	save ${AVZ}page17_diss.dta, replace



************************************************************************************************************
*** PPFAD: Weitere Hintergrundinformationen zum Jugendlichen (bis einschließlich 2005) und dessen Eltern ***
************************************************************************************************************

	use ${dir}ppfad.dta, clear

* Beibehaltung ausgewaehlter Variablen*** 
	keep hhnr persnr sex gebmoval gebjahr immiyear germborn corigin 

* Reduzierten Datensatz speichern
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}ppfad_diss.dta, replace


****************
*** BIOIMMIG ***
****************

* Erst einmal unberücksichtigt


****************
*** BIOPAREN ***
****************

	use ${dir}/bioparen.dta, clear

* Beibehaltung ausgewaehlter Variablen***
	keep persnr hhnr vnr mnr vnat mnat vorigin morigin vgebj mgebj vaortakt maortakt vaortup maortup living* 

	*** FRAGE: Benötigt man hier die vnr bzw. mnr? Ich habe jetzt die persnr des Jugendlichen zum mergen genommen ...
	
* Reduzierten Datensatz speichern***
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}bioparen_diss.dta, replace


*********************************************************
*** $P: 3 BESTE FREUNDE DER ELTERN (1996, 2001, 2006) ***
*********************************************************

*** 1996
********
	use ${dir}/mp.dta, clear

* Beibehaltung ausgewaehlter Variablen***
	keep persnr hhnr mp06a01 mp06b01 mp06c01 mp06a02 mp06b02 mp06c02 mp06a03 mp06b03 mp06c03 mp06a04 mp06b04 mp06c04 

* Umbenennen zentraler Variablen
	rename mp06a01 bf1_sex_96 // das nächste mal foreach ... 
	rename mp06b01 bf2_sex_96
	rename mp06c01 bf3_sex_96

	rename mp06a02 bf1_rel_96
	rename mp06b02 bf2_rel_96
	rename mp06c02 bf3_rel_96

	rename mp06a03 bf1_ori_96
	rename mp06b03 bf2_ori_96
	rename mp06c03 bf3_ori_96

	rename mp06a04 bf1_sameori_96
	rename mp06b04 bf2_sameori_96
	rename mp06c04 bf3_sameori_96

* Reduzierten Datensatz speichern***
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}mp_diss.dta, replace


*** 2001
********
	use ${dir}/rp.dta, clear

* Beibehaltung ausgewaehlter Variablen***
	keep persnr hhnr rp106a01 rp106b01 rp106c01 rp106a02 rp106b02 rp106c02 rp106a03 rp106b03 rp106c03 rp106a04 rp106b04 rp106c04 

* Umbenennen zentraler Variablen
	rename rp106a01 bf1_sex_01
	rename rp106b01 bf2_sex_01
	rename rp106c01 bf3_sex_01

	rename rp106a02 bf1_rel_01
	rename rp106b02 bf2_rel_01
	rename rp106c02 bf3_rel_01

	rename rp106a03 bf1_ori_01
	rename rp106b03 bf2_ori_01
	rename rp106c03 bf3_ori_01

	rename rp106a04 bf1_sameori_01
	rename rp106b04 bf2_sameori_01
	rename rp106c04 bf3_sameori_01

* Reduzierten Datensatz speichern***
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}rp_diss.dta, replace


*** 2006
********
	use ${dir}/wp.dta, clear

* Beibehaltung ausgewaehlter Variablen***
	keep persnr hhnr wp11604 wp11605 wp11606 wp11601 wp11602 wp11603 wp11610 wp11611 wp11612 wp11613 wp11614 wp11615

* Umbenennen zentraler Variablen
	rename wp11604 bf1_sex_06
	rename wp11605 bf2_sex_06
	rename wp11606 bf3_sex_06

	rename wp11601 bf1_rel_06
	rename wp11602 bf2_rel_06
	rename wp11603 bf3_rel_06

	rename wp11610 bf1_ori_06
	rename wp11611 bf2_ori_06
	rename wp11612 bf3_ori_06

	rename wp11613 bf1_sameori_06
	rename wp11614 bf2_sameori_06
	rename wp11615 bf3_sameori_06

* Reduzierten Datensatz speichern***
	isid persnr // persnr ist eindeutige Identifikationsvariable
	sort persnr
	save ${AVZ}wp_diss.dta, replace



*******************************
*** BILDUNG MASTERDATENSATZ ***
*******************************

* Öffnen des Masterdatensatzes 
	use ${dir}/bioage17.dta, clear

**************************************************
*** Ranspielen der Infos für die MUTTER
* Umbenennung der persnr
	rename hhnr kindhhnr
	rename persnr kindpersnr
	rename bymnr persnr
	sort persnr

* Ranspielen Infos für die Mutter aus ppfad_diss
	merge m:1 persnr using ${AVZ}ppfad_diss.dta
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

* Ranspielen Infos für die Mutter aus mp_diss
	sort persnr
	merge m:1 persnr using ${AVZ}mp_diss.dta

	rename hhnr hhnr_96_m
	
	rename bf1_sex_96 bf1_sex_96_m
	rename bf2_sex_96 bf2_sex_96_m
	rename bf3_sex_96 bf3_sex_96_m

	rename bf1_rel_96 bf1_rel_96_m
	rename bf2_rel_96 bf2_rel_96_m
	rename bf3_rel_96 bf3_rel_96_m

	rename bf1_ori_96 bf1_ori_96_m
	rename bf2_ori_96 bf2_ori_96_m
	rename bf3_ori_96 bf3_ori_96_m

	rename bf1_sameori_96 bf1_sameori_96_m
	rename bf2_sameori_96 bf2_sameori_96_m
	rename bf3_sameori_96 bf3_sameori_96_m

	tab _merge
	drop if _merge==2
	drop _merge
	
* Ranspielen Infos für die Mutter aus rp_diss
	sort persnr
	merge m:1 persnr using ${AVZ}rp_diss.dta

	rename hhnr hhnr_01_m

	rename bf1_sex_01 bf1_sex_01_m
	rename bf2_sex_01 bf2_sex_01_m
	rename bf3_sex_01 bf3_sex_01_m

	rename bf1_rel_01 bf1_rel_01_m
	rename bf2_rel_01 bf2_rel_01_m
	rename bf3_rel_01 bf3_rel_01_m

	rename bf1_ori_01 bf1_ori_01_m
	rename bf2_ori_01 bf2_ori_01_m
	rename bf3_ori_01 bf3_ori_01_m

	rename bf1_sameori_01 bf1_sameori_01_m
	rename bf2_sameori_01 bf2_sameori_01_m
	rename bf3_sameori_01 bf3_sameori_01_m


	tab _merge
	drop if _merge==2
	drop _merge

	
* Ranspielen Infos für die Mutter aus wp_diss
	sort persnr
	merge m:1 persnr using ${AVZ}wp_diss.dta

	rename hhnr hhnr_06_m

	rename bf1_sex_06 bf1_sex_06_m
	rename bf2_sex_06 bf2_sex_06_m
	rename bf3_sex_06 bf3_sex_06_m

	rename bf1_rel_06 bf1_rel_06_m
	rename bf2_rel_06 bf2_rel_06_m
	rename bf3_rel_06 bf3_rel_06_m

	rename bf1_ori_06 bf1_ori_06_m
	rename bf2_ori_06 bf2_ori_06_m
	rename bf3_ori_06 bf3_ori_06_m

	rename bf1_sameori_06 bf1_sameori_06_m
	rename bf2_sameori_06 bf2_sameori_06_m
	rename bf3_sameori_06 bf3_sameori_06_m

	tab _merge
	drop if _merge==2
	drop _merge

***************************************************
*** Ranspielen der Infos für den VATER
* Umbenennung der persnr
	rename persnr bymnr
	rename byvnr persnr
	sort persnr

* Ranspielen Infos für den Vater aus PPFAD
	merge m:1 persnr using ${AVZ}ppfad_diss.dta

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
	
* Ranspielen Infos für den Vater aus MP 
	sort persnr
	merge m:1 persnr using ${AVZ}mp_diss.dta

	rename hhnr hhnr_96_f

	rename bf1_sex_96 bf1_sex_96_f
	rename bf2_sex_96 bf2_sex_96_f
	rename bf3_sex_96 bf3_sex_96_f

	rename bf1_rel_96 bf1_rel_96_f
	rename bf2_rel_96 bf2_rel_96_f
	rename bf3_rel_96 bf3_rel_96_f

	rename bf1_ori_96 bf1_ori_96_f
	rename bf2_ori_96 bf2_ori_96_f
	rename bf3_ori_96 bf3_ori_96_f

	rename bf1_sameori_96 bf1_sameori_96_f
	rename bf2_sameori_96 bf2_sameori_96_f
	rename bf3_sameori_96 bf3_sameori_96_f

	tab _merge
	drop if _merge==2
	drop _merge

* Ranspielen Infos für den Vater aus RP
	sort persnr
	merge m:1 persnr using ${AVZ}rp_diss.dta

	rename hhnr hhnr_01_f

	rename bf1_sex_01 bf1_sex_01_f
	rename bf2_sex_01 bf2_sex_01_f
	rename bf3_sex_01 bf3_sex_01_f

	rename bf1_rel_01 bf1_rel_01_f
	rename bf2_rel_01 bf2_rel_01_f
	rename bf3_rel_01 bf3_rel_01_f

	rename bf1_ori_01 bf1_ori_01_f
	rename bf2_ori_01 bf2_ori_01_f
	rename bf3_ori_01 bf3_ori_01_f

	rename bf1_sameori_01 bf1_sameori_01_f
	rename bf2_sameori_01 bf2_sameori_01_f
	rename bf3_sameori_01 bf3_sameori_01_f

	tab _merge
	drop if _merge==2
	drop _merge

* Ranspielen Infos für den Vater aus WP
	sort persnr
	merge m:1 persnr using ${AVZ}wp_diss.dta

	rename hhnr hhnr_06_f

	rename bf1_sex_06 bf1_sex_06_f
	rename bf2_sex_06 bf2_sex_06_f
	rename bf3_sex_06 bf3_sex_06_f

	rename bf1_rel_06 bf1_rel_06_f
	rename bf2_rel_06 bf2_rel_06_f
	rename bf3_rel_06 bf3_rel_06_f

	rename bf1_ori_06 bf1_ori_06_f
	rename bf2_ori_06 bf2_ori_06_f
	rename bf3_ori_06 bf3_ori_06_f

	rename bf1_sameori_06 bf1_sameori_06_f
	rename bf2_sameori_06 bf2_sameori_06_f
	rename bf3_sameori_06 bf3_sameori_06_f

	tab _merge
	drop if _merge==2
	drop _merge

************************************************************
*** Ranspielen der Infos für den befragten JUGENDLICHEN/KIND
* Umbenennung der persnr
	rename persnr byvnr
	rename kindpersnr persnr
	sort persnr

* Ranspielen Infos für Kind aus $PAGE17
	merge m:1 persnr using ${AVZ}page17_diss.dta // Merge 1:1, da Kinder nur einmal im Datensatz sein können, allerdings: funktioniert nicht!
	tab _merge
	drop _merge

* Ranspielen Infos für Kind aus dem Datensatz von Elisabeth
	sort persnr
	merge m:1 persnr using ${AVZ}wjugend.dta
	tab _merge
	drop _merge

	rename wj7901 germborn_f_j
	rename wj7902 germborn_m_j

* Ranspielen Infos für Kind aus PPFAD
	sort persnr
	merge m:1 persnr using ${AVZ}ppfad_diss.dta
	
	tab _merge
	drop if _merge==2
	drop _merge
	
* Ranspielen Infos für Kind aus BIOPAREN --> FRAGE: Hier gibt es eine mnr und vnr --> Sind das dieselben wie bymnr und byvnr? 
	sort persnr
	merge m:1 persnr using ${AVZ}bioparen_diss.dta
	
	tab _merge
	drop if _merge==2
	drop _merge


drop hhnr
rename kindhhnr hhnr
