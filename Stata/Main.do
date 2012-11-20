***************************************************************************************************************************
* MASTER DO-FILE **********************************************************************************************************
***************************************************************************************************************************
* Konventionen: Missings mit . kodiert

set linesize 255

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

****************************************************************************************************
*** 3. Bildung Migrantenvariablen  *****************************************************************
*** Von Melanie ************************************************************************************
****************************************************************************************************

****************************************************************************************************
*** 3.1. Macros and Combinations *******************************************************************
****************************************************************************************************
use ${AVZ}miggen_helpers.dta, clear
order persnr migback corigin nation deu_seit germborn immiyear mnat vnat corigin* nation*

gen mig_gen_cn = .

include ${DoFi}Logic/00_macros.do  		// obtain basic macros with variables
include ${DoFi}Logic/01_macros_parents.do	// obtain full macros including parents
*include ${DoFi}Logic/03_write_recode_combi.do	// execute dofile that writes all the occuring combinations into 02_recode.do
						// !!! only uncomment when rebuilding variable

****************************************************************************************************
*** 3.2. Recode mig_gen_cn *************************************************************************
****************************************************************************************************
include ${DoFi}Logic/05_recode_full.do

****************************************************************************************************
*** 3.3. Assign Label ******************************************************************************
****************************************************************************************************
	lab var mig_gen_c "Generationenstatus CORIGIN"
	lab def status 0 "kein Migrationshintergrund" ///
 	1 "1.Generation: selbst zugewandert nach dem 6. Lebensjahr" ///
 	2 "1,5.Generation: selbst zugewandert bis einschliesslich 6. Lebensjahr" ///
	3 "1.Generation nicht weiter definierbar" ///
 	4 "2.Generation: beide Eltern zugewandert" ///
 	5 "2,5.Generation: ein Elternteil zugewandert, anderes 2. oder 2,5. Generation" ///
 	6 "2,5.Generation: ein Elternteil zugewandert, anderes deutsch" ///
 	7 "2.Generation nicht weiter definierbar" ///
	8 "3.Generation: vier Grosseltern zugewandert" ///
 	9 "3,25.Generation: drei Grosseltern zugewandert" ///
       10 "3,5.Generation: zwei Grosseltern zugewandert" ///
       11 "3,75.Generation: ein Grosselternteil zugewandert" ///
       12 "3.Generation nicht weiter definierbar" ///
       13 "Migrationshintergrund nicht definierbar"
	lab val mig_gen_c status
	
tab mig_gen_cn migback, m

save ${AVZ}mig_gen_cn, replace
