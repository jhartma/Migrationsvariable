// Ausgangsdatensatz: ???
// Enddatensatz:      melanie_jugendliche_recoded.dta
// Variablen:         ???

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