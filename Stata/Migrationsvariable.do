***************************************************************************************************************************
* MASTER DO-FILE **********************************************************************************************************
***************************************************************************************************************************
* Konventionen: Missings mit . kodiert


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

**************************************************************
***** 1. Zusammenfuehrung der benoetigten Datensaetze ********
**************************************************************

***** 1.01 ppfad.dta *****************************************
do ${AVZ}DoFile/01_ppfad.do                                             // Output: ppfad_mig.dta 	|| persnr, corigin, gebjahr, gebmoval, germborn, immiyear, migback, sex, hhnr, hhnr1984-hhnr2010

***** 1.02 $pgen.dta *****************************************
do ${AVZ}DoFile/02_pgen.do                                              // Output: pgen_mig.dta		|| persnr, hhnr1984-hhnr2010, nation1984-nation2010

***** 1.03 $kind.dta *****************************************
do ${AVZ}DoFile/03_kind.do                                              // Output: kind_mig.dta		|| persnr, hhnr1984, hhnr1989, nationkind1984, nationkind1989, hhnr

***** 1.04 hbrutt$.dta ***************************************
do ${AVZ}DoFile/04_hbrutt.do                                            // Output: hbrutt_mig.dta	|| hhnr, hhnr1998, hhnr2000, sexhv1998, sexhv2000, nathv1998, nathv2000

***** 1.05 $p.dta ********************************************
* do ${AVZ}DoFile/05_p.do                                               // Output: p_mig.dta		|| persnr, hhnr, deu_seit2002-deu_seit2010, hhnr2002-hhnr2010
* redundant, brauchen wir nicht, siehe 1.09

***** 1.06 bioimmig.dta **************************************
do ${AVZ}DoFile/06_bioimmig.do						// Output: bioimmig_mig.dta	|| persnr, hhnr1984 bis hhnr2010, biresper1984-biresper2010, biimgrp1984-biimgrp2010 

***** 1.07 bioparen.dta **************************************
do ${AVZ}DoFile/07_bioparen.do                                          // Output: bioparen_mig.dta	|| vnat, mnat, vgebj, mgebj, vaortakt, maortakt, vaortup, maortup, living1-living7, persnr, hhnr 

***** 1.08 Elternzeiger (von Sabine Keller) ******************
do ${AVZ}DoFile/08_parents.do                                           // Output: elternzeiger2.dta	|| persnr, v_persnr, m_persnr, m_quelle, v_quelle, gv_v, gv_m, gm_v, gm_m

***** 1.09 Eingebuergerte ************************************
do ${AVZ}DoFile/09_deu_seit.do                                          // Output: germ_sbs.dta		|| persnr, germ_since, deu_seit, sbs
* welche Nationalitaet frueher?

***** 1.10 Jugendliche ***************************************
do ${AVZ}DoFile/10.1_jugend.do                                          // Output: melanie_jugendliche_recoded.dta	|| Germborn; Corigin; immiyear; gebjahr; erste und zweite Nation zum Befragrungszeitpunkt (ab einschliesslich 2006); Deu_seit; biresper; biimgrp

***** 1.10 Jugendliche ***************************************
do ${AVZ}DoFile/10.2_jugend.do 						// Output: melanie_jugendliche_eltern.dta	|| persnr, germborn_f, corigin_f, germborn_m, corigin_m

***** 1.11 Mergen aller Datensaetze **************************
do ${AVZ}DoFile/11_merge.do						// Output: miggen_merged.dta	|| persnr, sex, biimgrp, corigin, deu_seit, gebjahr, gebmoval, germ_since, sbs
									//                    		|| immiyear, germborn, gm_m, gm_v, gv_m, gv_v, hhnr, m_persnr, m_quelle, maortakt, maortup, mgebj, migback, mnat
									//                              || nathv1998, nathv2000, nationkind1984, nationkind1989, v_persnr, vaortakt, vaortup, vgebj, vnat
									//                              || biimgrp1984 - biimgrp2010,
									//                              || biresper1984 - biresper2010,
									//                              || living1 - living7,
									//                              || nation1984 - nation2010,
									//				|| germborn_f, corigin_f, germborn_m, corigin_m

*** Zusatzinfos fuer Eltern aus Kinderdatensatz uebernehmen!!!

*****************************************
***** 2. Bildung von Hilfsvariablen *****
*****************************************
do ${AVZ}DoFile/12_auxiliary.do						// Output: miggen_helpers.dta

* deu_seit von Jugendlichen vervollstaendlichen mit Melanies Daten, melanie_jugendliche
* Melanies Elterndatensatz aus den Jugendlichen ranspielen
* Generell noch mal durchschauen

****************************************************************************************************
*** 3. Bildung Migrantenvariablen  *****************************************************************
*** Von Melanie ************************************************************************************
****************************************************************************************************

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
	replace d_r_nation_f_f=1 if r_nation_f_f>=2 & r_nation_f_f != .
	replace d_r_nation_f_f=0 if r_nation_f_f==1 
	lab var d_r_nation_f_f "Dummy Grosselternteil mit auslaendischer SBS"
	lab def d_r_nation_gp 1 "Ausland" 0 "Deutschland"
	lab val d_r_nation_f_f d_r_nation_gp
	tab d_r_nation_f_f r_nation_f_f, m

	gen d_r_nation_f_m=.
	replace d_r_nation_f_m=1 if r_nation_f_m>=2 & r_nation_f_m != .
	replace d_r_nation_f_m=0 if r_nation_f_m==1
	lab var d_r_nation_f_m "Dummy Grosselternteil mit auslaendischer SBS"
	lab val d_r_nation_f_m d_r_nation_gp
	tab d_r_nation_f_m r_nation_f_m, m

	gen d_r_nation_m_f=.
	replace d_r_nation_m_f=1 if r_nation_m_f>=2 & r_nation_m_f != .
	replace d_r_nation_m_f=0 if r_nation_m_f==1
	lab var d_r_nation_m_f "Dummy Grosselternteil mit auslaendischer SBS"
	lab val d_r_nation_m_f d_r_nation_gp
	tab d_r_nation_m_f r_nation_m_f, m

	gen d_r_nation_m_m=.
	replace d_r_nation_m_m=1 if r_nation_m_m>=2 & r_nation_m_m != .
	replace d_r_nation_m_m=0 if r_nation_m_m==1
	lab var d_r_nation_m_m "Dummy Grosselternteil mit auslaendischer SBS"
	lab val d_r_nation_m_m d_r_nation_gp
	tab d_r_nation_m_m r_nation_m_m, m


*2. Schritt: Bildung Summenscore "sum_r_nation_gp" (alle Werte 1 werden aufsummiert, unabhaengig davon, ob Missings vorhanden oder nicht)

	egen sum_r_nation_gp = anycount(d_r_nation_f_f d_r_nation_f_m d_r_nation_m_f d_r_nation_m_m), values(1)
	lab var sum_r_nation_gp "Anzahl Grosselternteile mit auslaendischer SBS"
	tab sum_r_nation_gp




*** Bildung von "eltern": Hilfsvariable ueber Vorhandensein Geburtslandinfo fuer Eltern

	gen eltern=.
	replace eltern=1 if germborn_f==germborn_m & (germborn_f==1 | germborn_f==2) 	// 1: Info liegt fuer beide Eltern vor
	replace eltern=2 if ((germborn_m==1 | germborn_m==2) & germborn_f == .)  	// 2: Info liegt nur fuer Mutter vor, Vater Missing
	replace eltern=3 if ((germborn_f==1 | germborn_f==2) & germborn_m == .)  	// 3: Info liegt nur fuer den Vater vor; Mutter Missing
	replace eltern=4 if germborn_f== germborn_m & germborn_f == . 			// 3: Info liegt fuer gar kein Elternteil vor


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
* Faelle durchgehen und Logik auch: Joerg!!!

	gen mig_gen_c = .

*1. Generation (nach dem 6. Lebensjahr zugewandert oder Missing bei migage) 
***************************************************************************
*** FRAGE: Unberuecksichtigt bleibt jetzt der Pfad ueber die Nationalitaet und den Einreisestatus, 
*** aber eigentlich muesste es doch jetzt so passen (oder geben Ossis an, im Ausland geboren zu sein?)???

	replace mig_gen_c = 1 if germborn==2 & migage >=7 	


*1,5. Generation (vor dem 7. Lebensjahr zugewandert)
****************************************************
	replace mig_gen_c = 2 if germborn==2 & migage <=6

*2. Generation: beide Elternteile zugewandert (ZP in Deutschland geboren oder Missing)
**************************************************************************************
	replace mig_gen_c = 3 if germborn!=2 & ///                                       // Befragter ///
	germborn_f==2 & germborn_m==2                         				// Eltern, . nicht kleiner 0 !!!


*2,5. Generation: ein Elternteil zugewandert, anderes 2. oder 2,5. (ZP in Deutschland geboren oder Missing)
***********************************************************************************************************
	replace mig_gen_c = 4 if germborn!=2 & ///                
	(((germborn_f!=2 & (germborn_f_m==2 | germborn_f_f==2)) & germborn_m==2) ///   
	| (germborn_f==2 & (germborn_m!=2 & (germborn_m_m==2 | germborn_m_f==2)))) 


*2,5. Generation: ein Elternteil zugewandert, anderes deutsch oder Missing bei den Eltern (ZP in Deutschland geboren oder Missing)
**********************************************************************************************************************************
	replace mig_gen_c = 5 if germborn!=2 & ///
	((germborn_f!=2 & germborn_f_m!=2 & germborn_f_f!=2 & germborn_m==2) ///
	| (germborn_m!=2 & germborn_m_f!=2 & germborn_m_m!=2 & germborn_f==2))


*3. Generation: vier Grosseltern zugewandert
*******************************************
	replace mig_gen_c = 6 if germborn!=2 & germborn_f!=2 & germborn_m!=2 & ///
	sum_germborn_gp==4


*3,25. Generation: drei Grosseltern zugewandert
**********************************************
	replace mig_gen_c = 7 if germborn!=2 & germborn_f!=2 & germborn_m!=2 & ///
	sum_germborn_gp==3


*3,5. Generation: zwei Grosseltern zugewandert
*********************************************
	replace mig_gen_c = 8 if germborn!=2 & germborn_f!=2 & germborn_m!=2 & ///
	sum_germborn_gp==2


*3,75. Generation: ein Grosselternteil zugewandert
*************************************************
	replace mig_gen_c = 9 if germborn!=2 & germborn_f!=2 & germborn_m!=2 & ///
	sum_germborn_gp==1


*kein Migrationshintergrund (auch diejenigen, die im Ausland geboren sind, aber deren beiden Eltern in Deutschland geboren sind)
*******************************************************************************************************************************
	replace mig_gen_c = 0 if germborn!=2 & germborn_f!=2 & germborn_m!=2 & ///
	(sum_germborn_gp==0 | sum_germborn_gp_mis==4)

* Beruecksichtigung auch derjenigen, die im Ausland geboren sind, aber deren beiden Eltern in Deutschland geboren sind
*** FRAGE: Wollen wir hier wirklich noch beruecksichtigen, ob der Befragte die deutsche Nationalitaet hat? Sinnvoll? 
	replace mig_gen_c=0 if germborn==2 & (germborn_f==1 & germborn_m==1)


*Rausfiltern von Faellen, die ueberall Missings haben
***************************************************
	replace mig_gen_c = . if germborn==. & germborn_f==. & germborn_m==. & sum_germborn_gp_mis==4


* Belabelung der Variable und ihren Ausprägungen
************************************************

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
       10 "nicht definierbar"
	lab val mig_gen_c generationenstatus

	tab mig_gen_c, m
	tab mig_gen_c migback

*XXX FEHLEND: Plausibilaetschecks XXX


* Einzelfaelle aus der Kreuztabelle anschauen
/* Fehler?:
	- persnr 604, 22901: migback indirekt, mig_gen_c ohne Migrationhintergrund, allerdings keine Anzeichen auf Migrationshintergrund ausser keiner dt. SBS
	- persnr 8603, 8604, 8605, 8606: mig_gen_c kein Migrationshintergrund, aber Mutter eingebuergert --> vermutlich keine Geb-Land-Info für Mutter --> wird im nächsten Schritt berücksichtigt?
	- persnr 7203, 7204: mig_gen_c kein Migrationshintergrund, migback indirekter Migrationshintergrund,  Mutter Schweizer Nationalitaet

=> Abweichungen zwischen mig_gen_c und migback resultieren aus fehlendem Einbezug der Staatsbuergerschaft
*/



***************************************************************************************************
*** 3.1.1.3 mig_gen_c_hv **************************************************************************
***************************************************************************************************

*** Logik: 
* Wenn ZP Missing --> -1; 
* Wenn ZP in Deutschland und bei Eltern Missings --> -2 oder -3 
* ABER AUCH: Wenn ZP im Ausland geboren ist und keine Info zu (beiden) Eltern --> ebenfalls -2 oder -3, da Diplomatenkinder ausgeschlossen werden sollen
* Wenn ZP und Eltern in Deutschland und Grosselternteil(e) Missing --> -4 und aufwaerts

	gen mig_gen_c_hv = .
	replace mig_gen_c_hv = -1 if germborn ==.
	replace mig_gen_c_hv = -2 if (germborn==1 | germborn==2) & ((germborn_f==. & germborn_m!=.) | (germborn_f!=. & germborn_m==.))
	replace mig_gen_c_hv = -3 if (germborn==1 | germborn==2) & (germborn_f==. & germborn_m==.)
	replace mig_gen_c_hv = -4 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==1
	replace mig_gen_c_hv = -5 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==2
	replace mig_gen_c_hv = -6 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==3
	replace mig_gen_c_hv = -7 if germborn==1 & germborn_f==1 & germborn_m==1 & sum_germborn_gp_mis==4

	lab var mig_gen_c_hv "Hilfsvariable Generationenstatus"
	lab def Hilfsvariable_Generationenstatus -1 "Informationen fuer Person selbst nicht bekannt" ///
 	-2 "Information fuer ein Elternteil nicht bekannt"        ///
 	-3 "Information fuer beide Elternteile nicht bekannt"     ///
 	-4 "Information fuer ein Grosselternteil nicht bekannt"   ///
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

* 0 |  ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Angabe beim Einreisestatus: 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp>=2 & r_nation_zp != . & (biimgrp==1 | biimgrp==3)
	
* 2 | ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp>=2 & r_nation_zp != . ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage >=7 

* 0 | ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert vor dem 7. LJ oder Missing--> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp>=2 & r_nation_zp != . ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 

* 3 | ... und eine AUSLAENDISCHE Nationalitaet vorliegt und Einreisestatus !=1 und !=3, ABER beide Elternteile in Deutschland geboren --> Diplomatenkinder --> kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp>=2 & r_nation_zp != . & germborn_m==1 & germborn_f==1 

* 0 | ... und die DEUTSCHE Nationalitaet NICHT seit der Geburt vorliegt und Angabe beim Einreisestatus: 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==2 ///
	& (biimgrp==1 | biimgrp==3)

* 0 | ... und die DEUTSCHE Nationalitaet NICHT seit der Geburt vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7) 

* 0 | ... und die DEUTSCHE Nationalitaet NICHT seit der Geburt vorliegt und Einreisestatus !=1 und !=3 sowie zugewandert vor dem 7. LJ oder Missing--> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==2 ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 

* 0 | ... und die DEUTSCHE Nationalitaet vorliegt, aber KEINE Info, ob seit Geburt und beim Einreisestatus 1 oder 3 --> Kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit<=0 ///
	& (biimgrp==1 | biimgrp==3)

* 7 | ... und die DEUTSCHE Nationalitaet vorliegt, aber KEINE Info, ob seit Geburt und Einreisestatus !=1 oder != 3 sowie zugewandert nach dem 6. LJ oder Missing--> 1. Generation
	replace mig_gen_cn=1 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==. ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & (migage >=7) 

* 0 | ... und die DEUTSCHE Nationalitaet vorliegt, aber KEINE Info, ob seit Geburt und Einreisestatus !=1 oder != 3 sowie zugewandert vor dem 7. LJ --> 1,5. Generation
	replace mig_gen_cn=2 if mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==. ///
	& (biimgrp==2 | (biimgrp>=4 & biimgrp<=7)) & migage <=6 



*********************************************************************************************************************************************************************
*** Wenn der Befragte in Deutschland geboren ist ODER seit der Geburt deutsche SBS ODER Missing bei beiden hat und bei mindestens einem Elternteil Missing vorliegt
*********************************************************************************************************************************************************************

* 0 | DEUTSCHE Nationalitaet seit der Geburt hat und beide Eltern im Ausland geboren sind --> 2. Generation
	replace mig_gen_cn=3 if mig_gen_c_hv==-1 & r_nation_zp==1  &  deu_seit==1 & (germborn_f==2 & germborn_m==2)


* 0 | Mutter im Ausland und Vater Missing, aber auslaendische SBS und vice versa --> 2. Generation						
	replace mig_gen_cn=3 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& ((germborn_m==2 & (germborn_f==. & r_nation_f>=2 & r_nation_f!=.)) | ((germborn_m==. & r_nation_m>=2 & r_nation_m!=.) & germborn_f==2))


* 0 | Mutter und Vater Missing beim Gebland, aber beide auslaendische SBS --> 2. Generation
	replace mig_gen_cn=3 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& ((germborn_f==. & r_nation_f>=2 & r_nation_f!=.) & (germborn_m==. & r_nation_m>=2 & r_nation_m!=.))

* 0 | Mutter und Vater Missing beim Gebland, aber ein Elternteil hat auslaendische SBS und dessen Grosseltern aus Deutschland oder Missing --> 5: 2,5. Generation
	replace mig_gen_cn=5 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_f==. & germborn_m==.) ///
	& ( ((r_nation_f>=2 & r_nation_f!=.) & (r_nation_m==1 | r_nation_m==.) & ((germborn_m_f==1 | germborn_m_f==.) & (germborn_m_m==1 | germborn_m_m==.)) ) ///
	| ((r_nation_m>=2 & r_nation_m!=.) & (r_nation_f==1 | r_nation_f==.) & ((germborn_f_f==1 | germborn_f_f==.) & (germborn_f_m==1 | germborn_f_m==.))) )

* 0 | Mutter und Vater Missing beim Gebland, aber ein Elternteil hat auslaendische SBS und mindestens ein Grosselternteil vom deutschen Elternteil im Ausland geboren --> 4: 2,5. Generation
	replace mig_gen_cn=4 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_f==. & germborn_m==.) ///
	& ( ((r_nation_f>=2 & r_nation_f!=.) & (r_nation_m==1 | r_nation_m==.) & (germborn_m_f==2 | germborn_m_m==2)) ///
	| ((r_nation_m>=2 & r_nation_m!=.) & (r_nation_f==1 | r_nation_f==.) & (germborn_f_f==2 | germborn_f_m==2)) )


*******************************************************************************************************************************************************************************
*** Wenn der Befragte und die Eltern in Deutschland geboren sind ODER seit der Geburt die deutsche SBS haben ODER Missing sind, und bei mindestens einem Grosselternteil Missing 
*******************************************************************************************************************************************************************************

*** Vorgehenslogik: Faelle, bei denen Grosselternteil deutsch oder Missing sind schon zugeordnet worden in der mig_gen_c;
*** Es geht jetzt darum, Faelle mit auslaendischer SBS zu beruecksichtigen, die keine Gebland-Info aufweisen
*** Herangezogen wird der Summenscore fuer die Anzahl Missings beim Gebland der Grosseltern "sum_germborn_gp" und der Summenscore fuer die Missings "sum_germborn_gp_mis"
*** Ausserdem wird der Summenscore fuer die Grosseltern-SBS "sum_r_nation_gp" herangezogen 


* 0 | Wenn VIER Grosselternteile Missing beim Gebland und EIN Grosselternteil AUSLAENDISCHE SBS hat --> 3,75. Generation
	replace mig_gen_cn=9 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==1

* 1 | Wenn VIER Grosselternteile Missing beim Gebland und ZWEI Grosselternteile AUSLAENDISCHE SBS haben --> 3,5. Generation
	replace mig_gen_cn=8 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==2

* 7 | Wenn VIER Grosselternteile Missing beim Gebland und DREI Grosselternteile AUSLAENDISCHE SBS haben --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==3

* 0 | Wenn VIER Grosselternteile Missing beim Gebland und VIER Grosselternteile AUSLAENDISCHE SBS haben --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp_mis==4 & sum_r_nation_gp==4


* 0 | Wenn EIN Grosselternteil im Ausland geboren, DREI Missing beim Gebland und EIN Grosselternteil AUSLAENDISCHE SBS hat --> 3,5. Generation
	replace mig_gen_cn=8 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==1

* 0 | Wenn EIN Grosselternteil im Ausland geboren, DREI Missing beim Gebland und ZWEI Grosselternteile AUSLAENDISCHE SBS haben --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==2

* 1 | Wenn EIN Grosselternteil im Ausland geboren, DREI Missing beim Gebland und DREI Grosselternteile AUSLAENDISCHE SBS haben --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==1 & sum_germborn_gp_mis==3 & sum_r_nation_gp==3


* 0 | Wenn ZWEI Grosselternteile im Ausland geboren, ZWEI Missing beim Gebland und EIN Grosselternteil AUSLAENDISCHE SBS hat --> 3,25. Generation
	replace mig_gen_cn=7 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==2 & sum_germborn_gp_mis==2 & sum_r_nation_gp==1

* 6 | Wenn ZWEI Grosselternteile im Ausland geboren, ZWEI Missing beim Gebland und 2 Grosselternteile AUSLAENDISCHE SBS hat --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==2 & sum_germborn_gp_mis==2 & sum_r_nation_gp==2


* 0 | Wenn DREI Grosselternteile im Ausland geboren, EIN Missing beim Gebland und 1 Grosselternteil AUSLAENDISCHE SBS hat --> 3. Generation
	replace mig_gen_cn=6 if (germborn==1 | (mig_gen_c_hv==-1 & r_nation_zp ==.) | (mig_gen_c_hv==-1 & r_nation_zp==1 & deu_seit==1)) ///
	& (germborn_m==1 | (germborn_m==. & r_nation_m ==.) | (germborn_m==. & r_nation_m==1 & deu_seit_m==1)) ///
	& (germborn_f==1 | (germborn_f==. & r_nation_f ==.) | (germborn_f==. & r_nation_f==1 & deu_seit_f==1)) ///
	& sum_germborn_gp==3 & sum_germborn_gp_mis==1 & sum_r_nation_gp==1






***************************************************************************************************
*** Einschub ANFANG: 3.1.3 soep_info, um Migback-Fälle relativ einfach identifizieren zu können ***
***************************************************************************************************

* Vorbereitung
	gen soep_info=.

* 1: Nur Geburtsland
	replace soep_info=1 if mig_gen_c!=.

* 2: Nur Staatsbuergerschaft (SBS)
	replace soep_info=2 if mig_gen_c==. & mig_gen_cn!=.

* 3: Ausschliessliche Nutzung Migback (Wenn mig_gen_cn==.)
	replace soep_info=3 if 	mig_gen_cn==. & migback==1
	replace soep_info=3 if 	mig_gen_cn==. & migback==2
	replace soep_info=3 if 	mig_gen_cn==. & migback==3
* Hier ggf. noch Faelle ergänzen, die bei uns keinen Hintergrund haben, aber bei migback indirekten

	lab var soep_info "CN Herangezogene Informationen"
	tab soep_info
	lab def soep_info 1 "Geburtsland" ///
	2 "Staatsbuergerschaft" ///
	3 "Nur Proxy Migback"
	lab val soep_info soep_info

***************************************************************************************************
*** Einschub ENDE ********************************************************************************* 
***************************************************************************************************





*** Fuer die Faelle mit ueberhaupt keiner Info: Heranziehen von MIGBACK und versuchen, weitere Faelle zuzuordnen, die jetzt Missing sind
********************************************************************************************************************************
* Wenn Sysmis bei mig_gen_cn und migback=1 (kein Migrationshintergrund), dann mig_gen_cn ebenfalls kein Migrationshintergrund
	replace mig_gen_cn=0 if mig_gen_cn==. & migback==1

* Wenn Sysmis bei mig_gen_cn und migback=2 (direkter Migrationshintergrund), dann mig_gen_cn 1. Generation
	replace mig_gen_cn=1 if mig_gen_cn==. & migback==2

* Wenn Sysmis bei mig_gen_cn und migback=3 (indirekter Migrationshintergrund/mindestens ein Elternteil im Ausland geboren), 
* dann mig_gen_cn - jetzt erst einmal - 2,5. Generation (Ausland-deutsch)
	replace mig_gen_cn=5 if mig_gen_cn==. & migback==3
	
	lab var mig_gen_cn "Generationenstatus CN"
	
save ${temp}fertig, replace
use  ${temp}fertig, clear	
	
	tab mig_gen_cn
	tab mig_gen_cn, m
	tab mig_gen_c  migback, m
	tab mig_gen_cn migback, m


*XXX FEHLEND: Plausibilaetschecks XXX

* Checks
preserve
drop hhnr*
order persnr migback corigin nation deu_seit germborn immiyear mnat vnat

list persnr migback mig_gen_cn if migback == 3 & mig_gen_cn == 0 in 1/1000
keep if mig_gen_cn == 0 & migback == 3		// behalte nur problematische Faelle, also migback - indirekt, mig_gen_cn - deutsch
tab nation, m					// many with other nationality		

keep if nation == 1
tab deu_seit					// viele sind eingebuergert, kriegen wir raus, woher die kommen?
restore

preserve
keep if mig_gen_cn == 0 & migback == 2		// behalte nur problematische Faelle, also migback - direkt, mig_gen_cn - deutsch
order persnr migback corigin nation deu_seit germborn immiyear mnat vnat


restore

/* 
1.Fehlende Faelle - migback indirekt, mig_gen_c kein migrationshintergrund
1.1. corigin - deutsch, nation - deutsch, aber ein Elternteil auslaendische Nationalitaet	| 8604
1.2. corigin - deutsch, nation - nicht deutsch, deu_seit - eingebuergert			| 8602
1.3. migback - indirekt, aber sonst alles deutsch						| 112506
1.4. migback - indirekt, nation - deutsch, deut_seit - eingebuergert, mnat==., vnat==.		| 121202
1.5. migback - indirekt, nation - deutsch, deut_seit - von Geburt, mnat==1, vnat==1		| 112508
1.6. migback - indirekt, corigin==1, nation==1, Rest missing					| 252403

2. Fehlende Faelle - migback direkt, mig_gen_c kein migrationshintergrund
2.1. migback==2, mig_gen_cn==0, corigin> 1, deu_seit==0, nation==1, germborn==2			| 82403
2.2. migback==2, mig_gen_cn==0, corigin> 1, deu_seit==1, nation> 1, germborn==2			| 271493
2.3. migback==2, mig_gen_cn==0, corigin==., deu_seit==0, nation==1, germborn==2			| 387203
2.4. migback==2, mig_gen_cn==0, corigin==., deu_seit==., nation==1, germborn==2			| 399004
2.5. migback==2, mig_gen_cn==0, corigin> 1, deu_seit==., nation==1, germborn==2			| 666105
*/



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
	replace eltern_geb_hv = 1 if mig_gen_cn == 3 ///
	& nr_corigin_f == nr_corigin_m ///
	& (nr_corigin_f>=2 & nr_corigin_f!=.) 


* 0: Elternteile aus unterschiedlichen Laendern (nicht Missing und nicht Deutschland)
************************************************************************************
	replace eltern_geb_hv = 0 if mig_gen_cn == 3 ///
	& nr_corigin_f != nr_corigin_m ///
	& ((nr_corigin_f>=2 & nr_corigin_f!=.) & (nr_corigin_m>=2 & nr_corigin_m!=.))


* -1: Nur ein Elternteil migriert und dessen Geburtsland bekannt; anderes Elternteil deutsch oder Missing
*********************************************************************************************************
	replace eltern_geb_hv=-1 if (mig_gen_cn==4 | mig_gen_cn==5) ///
	& ( ((nr_corigin_f==. | nr_corigin_f==1) & (nr_corigin_m>=2 & nr_corigin_m!=.)) ///
	| ((nr_corigin_f>=2 & nr_corigin_f!=.) & (nr_corigin_m==. | nr_corigin_m==1)) )


* -2: Nur ein Elternteil migriert und dessen Geburtsland NICHT bekannt; anderes Elternteil deutsch oder Missing
***************************************************************************************************************

* HINWEIS MO: Hier stimmt was nicht in der Logik, komme aber grad nicht dahinter ...

	replace eltern_geb_hv=-2 if (mig_gen_cn==4 | mig_gen_cn==5) ///
	& ( ((nr_corigin_f==. | nr_corigin_f==1) & nr_corigin_m==.) ///
	| (nr_corigin_f==. & (nr_corigin_m<=0 | nr_corigin_m==1)) )


* -3: Beide Elternteile migriert, EIN Geburtsland NICHT bekannt (Faelle, bei denen beide Laender nicht bekannt sind, werden im naechsten Schritt wieder rausgezogen)
*****************************************************************************************************************************************************************
	replace eltern_geb_hv=-3 if mig_gen_cn==3 & (nr_corigin_f==. | nr_corigin_m==.) 

* -4: Beide Elternteile migriert, BEIDE Geburtslaender NICHT bekannt
********************************************************************
	replace eltern_geb_hv=-4 if mig_gen_cn==3 & nr_corigin_f==. & nr_corigin_m==.


	lab var eltern_geb_hv "Hilfsvariable Eltern aus demselben Land" 
	lab def eltern_geb_hv 1 "Eltern aus demselben Land" ///
	0 "Eltern aus unterschiedlichen Laendern" ///
	-1 "nur 1 Elternteil migriert_Gebinfo bekannt" ///
	-2 "nur 1 Elternteil migriert_Gebinfo nicht bekannt" ///
	-3 "beide zugewandert, fuer einen fehlt Gebinfo" ///
	-4 "beide zugewandert, fuer beide fehlt Gebinfo"
	lab val eltern_geb_hv eltern_geb_hv

	tab eltern_geb_hv




***************************************************************************************************
* Grosseltern aus demselben Land?: "grosseltern_geb_hv"  ******************************************
* HINWEIS: Nur fuer Personen der 3. und aufwaerts Generation! *************************************
***************************************************************************************************

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




