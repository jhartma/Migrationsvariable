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
/*
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
*/
****************************************************************************************************
*** 3. Bildung Migrantenvariablen  *****************************************************************
*** Von Melanie ************************************************************************************
****************************************************************************************************

****************************************************************************************************
*** 3.1. Generationenstatus ************************************************************************
****************************************************************************************************

****************************************************************************************************
*** 3.1.1 Generationenstatus unter ausschliesslicher Nutzung Geburtsland-Informationen *************
****************************************************************************************************

****************************************************************************************************
*** 3.1.1.1 Hilfsvariablen  ************************************************************************
****************************************************************************************************
use ${AVZ}miggen_helpers.dta, clear
order persnr migback corigin nation deu_seit germborn immiyear mnat vnat corigin* nation*

gen mig_gen_cn = .

include ${DoFi}Logic/00_macros.do  
file open  RecodeFile using "${DoFi}Logic/02_recode.do", write replace
file close RecodeFile

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a. personCoriginGerman -----------------------------------------------------------------------------------------------------------------------------*
* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.a.a. personCoriginGerman & personNationGerman & personDeuSeitGeb ---------------------------------------------------------------------------------*
local GerGerGebBirthEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // 1.1.1.1.1		0
local GerGerGebBirthLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'	// 1.1.1.1.2		0
local GerGerGebBirthMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // 1.1.1.1.3		27495
local GerGerGebMigraEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // 1.1.1.2.1		0
local GerGerGebMigraLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // 1.1.1.2.2		0
local GerGerGebMigraMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // 1.1.1.2.3		0
local GerGerGebMissiEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // 1.1.1.3.1		0
local GerGerGebMissiLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // 1.1.1.3.2		0
local GerGerGebMissiMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // 1.1.1.3.3		0

foreach x in "`GerGerGebBirthEarly'" "`GerGerGebBirthLate'" "`GerGerGebBirthMiss'" "`GerGerGebMigraEarly'" "`GerGerGebMigraLate'" "`GerGerGebMigraMiss'" "`GerGerGebMissiEarly'" "`GerGerGebMissiLate'" "`GerGerGebMissiMiss'" {
	distinct persnr if `x' 			// display number of changes that each combinations produces -> take then only those that occur in the dataset
	}
	
include ${DoFi}Logic/combinations/11113.do

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.a.b. personCoriginGerman & personNationGerman & personDeuSeitEin ---------------------------------------------------------------------------------*
local GerGerEinBirthEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 1.1.2.1.1		0
local GerGerEinBirthLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 1.1.2.1.2		0		
local GerGerEinBirthMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 1.1.2.1.3		23
local GerGerEinMigraEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 1.1.2.2.1		0
local GerGerEinMigraLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 1.1.2.2.2		0
local GerGerEinMigraMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 1.1.2.2.3		0
local GerGerEinMissiEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 1.1.2.3.1		0
local GerGerEinMissiLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 1.1.2.3.2		0
local GerGerEinMissiMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 1.1.2.3.3		0

foreach x in "`GerGerEinBirthEarly'" "`GerGerEinBirthLate'" "`GerGerEinBirthMiss'" "`GerGerEinMigraEarly'" "`GerGerEinMigraLate'" "`GerGerEinMigraMiss'" "`GerGerEinMissiEarly'" "`GerGerEinMissiLate'" "`GerGerEinMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/11213.do 

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.a.c personCoriginGerman & personNationGerman & personDeuSeitMis ----------------------------------------------------------------------------------*
local GerGerMisBirthEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 1.1.3.1.1		0
local GerGerMisBirthLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 1.1.3.1.2		0
local GerGerMisBirthMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 1.1.3.1.3		13183
local GerGerMisMigraEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 1.1.3.2.1		0
local GerGerMisMigraLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 1.1.3.2.2		0
local GerGerMisMigraMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 1.1.3.2.3		0
local GerGerMisMissiEarly `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 1.1.3.3.1		0
local GerGerMisMissiLate  `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 1.1.3.3.2		0
local GerGerMisMissiMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 1.1.3.3.3		0

foreach x in "`GerGerMisBirthEarly'" "`GerGerMisBirthLate'" "`GerGerMisBirthMiss'" "`GerGerMisMigraEarly'" "`GerGerMisMigraLate'" "`GerGerMisMigraMiss'" "`GerGerMisMissiEarly'" "`GerGerMisMissiLate'" "`GerGerMisMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/11313.do
	
* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.b.a personCoriginGerman & personNationMissing & personDeuSeitGeb ---------------------------------------------------------------------------------*	
local GerMisGebBirthEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 1.2.1.1.1		0
local GerMisGebBirthLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 1.2.1.1.2		0
local GerMisGebBirthMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 1.2.1.1.3		0
local GerMisGebMigraEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 1.2.1.2.1		0
local GerMisGebMigraLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 1.2.1.2.2		0
local GerMisGebMigraMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 1.2.1.2.3		0
local GerMisGebMissiEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 1.2.1.3.1		0
local GerMisGebMissiLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 1.2.1.3.2		0
local GerMisGebMissiMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 1.2.1.3.3		0

foreach x in "`GerMisGebBirthEarly'" "`GerMisGebBirthLate'" "`GerMisGebBirthMiss'" "`GerMisGebMigraEarly'" "`GerMisGebMigraLate'" "`GerMisGebMigraMiss'" "`GerMisGebMissiEarly'" "`GerMisGebMissiLate'" "`GerMisGebMissiMiss'" {
	distinct persnr if `x' 
	}

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.b.b. person CoriginGerman & personNationMissing & personDeuSeitEin -------------------------------------------------------------------------------*
local GerMisEinBirthEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 1.2.2.1.1		0
local GerMisEinBirthLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 1.2.2.1.2		0
local GerMisEinBirthMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 1.2.2.1.3		0
local GerMisEinMigraEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 1.2.2.2.1		0
local GerMisEinMigraLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 1.2.2.2.2		0
local GerMisEinMigraMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 1.2.2.2.3		0
local GerMisEinMissiEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 1.2.2.3.1		0
local GerMisEinMissiLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 1.2.2.3.2		0
local GerMisEinMissiMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 1.2.2.3.3		0

foreach x in "`GerMisEinBirthEarly'" "`GerMisEinBirthLate'" "`GerMisEinBirthMiss'" "`GerMisEinMigraEarly'" "`GerMisEinMigraLate'" "`GerMisEinMigraMiss'" "`GerMisEinMissiEarly'" "`GerMisEinMissiLate'" "`GerMisEinMissiMiss'" {
	distinct persnr if `x' 
	}

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.b.c. personCoriginGerman & personNationMissing & personDeuSeitMis ---------------------------------------------------------------------------------*			
include ${DoFi}Logic/00_macros.do                                     
local GerMisMisBirthEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 1.2.3.1.1		0
local GerMisMisBirthLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 1.2.3.1.2		0	
local GerMisMisBirthMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 1.2.3.1.3		7492
local GerMisMisMigraEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 1.2.3.2.1		0
local GerMisMisMigraLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 1.2.3.2.2		0
local GerMisMisMigraMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 1.2.3.2.3		0
local GerMisMisMissiEarly `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 1.2.3.3.1		0
local GerMisMisMissiLate  `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 1.2.3.3.2		0
local GerMisMisMissiMiss  `personCoriginGerman' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 1.2.3.3.3		0

foreach x in "`GerMisMisBirthEarly'" "`GerMisMisBirthLate'" "`GerMisMisBirthMiss'" "`GerMisMisMigraEarly'" "`GerMisMisMigraLate'" "`GerMisMisMigraMiss'" "`GerMisMisMissiEarly'" "`GerMisMisMissiLate'" "`GerMisMisMissiMiss'" {
	distinct persnr if `x'
	}
	
include ${DoFi}Logic/combinations/12313.do

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.c.a. personCoriginGerman & personNationForeign & personDeuSeitGeb ---------------------------------------------------------------------------------*
local GerForGebBirthEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 1.3.1.1.1		0
local GerForGebBirthLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 1.3.1.1.2		0
local GerForGebBirthMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 1.3.1.1.3		4
local GerForGebMigraEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 1.3.1.2.1		0
local GerForGebMigraLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 1.3.1.2.2		0
local GerForGebMigraMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 1.3.1.2.3		0
local GerForGebMissiEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 1.3.1.3.1		0	
local GerForGebMissiLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 1.3.1.3.2		0
local GerForGebMissiMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 1.3.1.3.3		0

foreach x in "`GerForGebBirthEarly'" "`GerForGebBirthLate'" "`GerForGebBirthMiss'" "`GerForGebMigraEarly'" "`GerForGebMigraLate'" "`GerForGebMigraMiss'" "`GerForGebMissiEarly'" "`GerForGebMissiLate'" "`GerForGebMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/13113.do

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.c.b. personCoriginGerman & personNationForeign & personDeuSeitEin --------------------------------------------------------------------------------*
local GerForEinBirthEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 1.3.2.1.1		0
local GerForEinBirthLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 1.3.2.1.2		0
local GerForEinBirthMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 1.3.2.1.3		0
local GerForEinMigraEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 1.3.2.2.1		0
local GerForEinMigraLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 1.3.2.2.2		0
local GerForEinMigraMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 1.3.2.2.3		0
local GerForEinMissiEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 1.3.2.3.1		0
local GerForEinMissiLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 1.3.2.3.2		0
local GerForEinMissiMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 1.3.2.3.3		0

foreach x in "`GerForEinBirthEarly'" "`GerForEinBirthLate'" "`GerForEinBirthMiss'" "`GerForEinMigraEarly'" "`GerForEinMigraLate'" "`GerForEinMigraMiss'" "`GerForEinMissiEarly'" "`GerForEinMissiLate'" "`GerForEinMissiMiss'" {
	distinct persnr if `x' 
	}

* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* a.c.c. personCoriginGerman & personNationForeign & personDeuSeitMis --------------------------------------------------------------------------------*	
local GerForMisBirthEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 1.3.3.1.1		0
local GerForMisBirthLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 1.3.3.1.2		0
local GerForMisBirthMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'	 // * 1.3.3.1.3		7493
local GerForMisMigraEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 1.3.3.2.1		0
local GerForMisMigraLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 1.3.3.2.2		0
local GerForMisMigraMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 1.3.3.2.3		0
local GerForMisMissiEarly `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 1.3.3.3.1		0
local GerForMisMissiLate  `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 1.3.3.3.2		0
local GerForMisMissiMiss  `personCoriginGerman' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 1.3.3.3.3		0 = SUM 1 = 55.690

foreach x in "`GerForMisBirthEarly'" "`GerForMisBirthLate'" "`GerForMisBirthMiss'" "`GerForMisMigraEarly'" "`GerForMisMigraLate'" "`GerForMisMigraMiss'" "`GerForMisMissiEarly'" "`GerForMisMissiLate'" "`GerForMisMissiMiss'" {
	distinct persnr if `x' 
	}
	
include ${DoFi}Logic/combinations/13313.do
	
* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* b. personCoriginMissing -----------------------------------------------------------------------------------------------------------------------------
* ----------------------------------------------------------------------------------------------------------------------------------------------------*

local MisGerGebBirthEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 2.1.1.1.1		0
local MisGerGebBirthLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 2.1.1.1.2		0
local MisGerGebBirthMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 2.1.1.1.3		0
local MisGerGebMigraEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 2.1.1.2.1		0
local MisGerGebMigraLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 2.1.1.2.2		0
local MisGerGebMigraMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 2.1.1.2.3		0
local MisGerGebMissiEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 2.1.1.3.1		0
local MisGerGebMissiLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 2.1.1.3.2		0
local MisGerGebMissiMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 2.1.1.3.3		0

foreach x in "`MisGerGebBirthEarly'" "`MisGerGebBirthLate'" "`MisGerGebBirthMiss'" "`MisGerGebMigraEarly'" "`MisGerGebMigraLate'" "`MisGerGebMigraMiss'" "`MisGerGebMissiEarly'" "`MisGerGebMissiLate'" "`MisGerGebMissiMiss'" {
	distinct persnr if `x' 
	}
	
local MisGerEinBirthEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 2.1.2.1.1		0
local MisGerEinBirthLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 2.1.2.1.2		0
local MisGerEinBirthMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 2.1.2.1.3		0
local MisGerEinMigraEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 2.1.2.2.1		0
local MisGerEinMigraLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 2.1.2.2.2		0
local MisGerEinMigraMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 2.1.2.2.3		0
local MisGerEinMissiEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 2.1.2.3.1		0
local MisGerEinMissiLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 2.1.2.3.2		0
local MisGerEinMissiMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 2.1.2.3.3		0

foreach x in "`MisGerEinBirthEarly'" "`MisGerEinBirthLate'" "`MisGerEinBirthMiss'" "`MisGerEinMigraEarly'" "`MisGerEinMigraLate'" "`MisGerEinMigraMiss'" "`MisGerEinMissiEarly'" "`MisGerEinMissiLate'" "`MisGerEinMissiMiss'" {
	distinct persnr if `x' 
	}
	
local MisGerMisBirthEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 2.1.3.1.1		0
local MisGerMisBirthLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 2.1.3.1.2		0
local MisGerMisBirthMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 2.1.3.1.3		0
local MisGerMisMigraEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 2.1.3.2.1		0
local MisGerMisMigraLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 2.1.3.2.2		0
local MisGerMisMigraMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 2.1.3.2.3		0
local MisGerMisMissiEarly `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 2.1.3.3.1		0
local MisGerMisMissiLate  `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 2.1.3.3.2		0
local MisGerMisMissiMiss  `personCoriginMissing' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 2.1.3.3.3		0

foreach x in "`MisGerMisBirthEarly'" "`MisGerMisBirthLate'" "`MisGerMisBirthMiss'" "`MisGerMisMigraEarly'" "`MisGerMisMigraLate'" "`MisGerMisMigraMiss'" "`MisGerMisMissiEarly'" "`MisGerMisMissiLate'" "`MisGerMisMissiMiss'" {
	distinct persnr if `x' 
	}
	
local MisMisGebBirthEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 2.2.1.1.1	0
local MisMisGebBirthLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 2.2.1.1.2	0
local MisMisGebBirthMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 2.2.1.1.3	0
local MisMisGebMigraEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 2.2.1.2.1	0
local MisMisGebMigraLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 2.2.1.2.2	0
local MisMisGebMigraMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 2.2.1.2.3	0
local MisMisGebMissiEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 2.2.1.3.1	0
local MisMisGebMissiLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 2.2.1.3.2	0
local MisMisGebMissiMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 2.2.1.3.3	0

foreach x in "`MisMisGebBirthEarly'" "`MisMisGebBirthLate'" "`MisMisGebBirthMiss'" "`MisMisGebMigraEarly'" "`MisMisGebMigraLate'" "`MisMisGebMigraMiss'" "`MisMisGebMissiEarly'" "`MisMisGebMissiLate'" "`MisMisGebMissiMiss'" {
	distinct persnr if `x' 
	}
	
local MisMisEinBirthEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 2.2.2.1.1	0
local MisMisEinBirthLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 2.2.2.1.2	0	
local MisMisEinBirthMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 2.2.2.1.3	0
local MisMisEinMigraEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 2.2.2.2.1	0
local MisMisEinMigraLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 2.2.2.2.2	0
local MisMisEinMigraMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 2.2.2.2.3	0
local MisMisEinMissiEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 2.2.2.3.1	0
local MisMisEinMissiLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 2.2.2.3.2	0
local MisMisEinMissiMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 2.2.2.3.3	0

foreach x in "`MisMisEinBirthEarly'" "`MisMisEinBirthLate'" "`MisMisEinBirthMiss'" "`MisMisEinMigraEarly'" "`MisMisEinMigraLate'" "`MisMisEinMigraMiss'" "`MisMisEinMissiEarly'" "`MisMisEinMissiLate'" "`MisMisEinMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/00_macros.do  	
local MisMisMisBirthEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 2.2.3.1.1	0
local MisMisMisBirthLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 2.2.3.1.2	0	
local MisMisMisBirthMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 2.2.3.1.3	1
local MisMisMisMigraEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 2.2.3.2.1	0
local MisMisMisMigraLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 2.2.3.2.2	0
local MisMisMisMigraMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 2.2.3.2.3	0
local MisMisMisMissiEarly `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 2.2.3.3.1	0
local MisMisMisMissiLate  `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 2.2.3.3.2	0
local MisMisMisMissiMiss  `personCoriginMissing' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 2.2.3.3.3	0

foreach x in "`MisMisMisBirthEarly'" "`MisMisMisBirthLate'" "`MisMisMisBirthMiss'" "`MisMisMisMigraEarly'" "`MisMisMisMigraLate'" "`MisMisMisMigraMiss'" "`MisMisMisMissiEarly'" "`MisMisMisMissiLate'" "`MisMisMisMissiMiss'" {
	distinct persnr if `x' 
	}
	
include ${DoFi}Logic/combinations/22313.do 	// create log file for extracting combinations that occur in the dataset and excluding all others

local MisForGebBirthEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 2.3.1.1.1	0
local MisForGebBirthLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 2.3.1.1.2	0
local MisForGebBirthMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 2.3.1.1.3	0
local MisForGebMigraEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 2.3.1.2.1	0
local MisForGebMigraLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 2.3.1.2.2	0
local MisForGebMigraMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 2.3.1.2.3	0
local MisForGebMissiEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 2.3.1.3.1	0
local MisForGebMissiLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 2.3.1.3.2	0
local MisForGebMissiMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 2.3.1.3.3	0

foreach x in "`MisForGebBirthEarly'" "`MisForGebBirthLate'" "`MisForGebBirthMiss'" "`MisForGebMigraEarly'" "`MisForGebMigraLate'" "`MisForGebMigraMiss'" "`MisForGebMissiEarly'" "`MisForGebMissiLate'" "`MisForGebMissiMiss'" {
	distinct persnr if `x' 
	}

local MisForEinBirthEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 2.3.2.1.1	0
local MisForEinBirthLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 2.3.2.1.2	0
local MisForEinBirthMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 2.3.2.1.3	0
local MisForEinMigraEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 2.3.2.2.1	0
local MisForEinMigraLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 2.3.2.2.2	0
local MisForEinMigraMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 2.3.2.2.3	0
local MisForEinMissiEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 2.3.2.3.1	0
local MisForEinMissiLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 2.3.2.3.2	0
local MisForEinMissiMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 2.3.2.3.3	0

foreach x in "`MisForEinBirthEarly'" "`MisForEinBirthLate'" "`MisForEinBirthMiss'" "`MisForEinMigraEarly'" "`MisForEinMigraLate'" "`MisForEinMigraMiss'" "`MisForEinMissiEarly'" "`MisForEinMissiLate'" "`MisForEinMissiMiss'" {
	distinct persnr if `x' 
	}
	
local MisForMisBirthEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 2.3.3.1.1	0
local MisForMisBirthLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 2.3.3.1.2	0
local MisForMisBirthMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 2.3.3.1.3	0
local MisForMisMigraEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 2.3.3.2.1	0
local MisForMisMigraLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 2.3.3.2.2	0
local MisForMisMigraMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 2.3.3.2.3	0
local MisForMisMissiEarly `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 2.3.3.3.1	0
local MisForMisMissiLate  `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 2.3.3.3.2	0
local MisForMisMissiMiss  `personCoriginMissing' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 2.3.3.3.3	0 = Sum 2 = 1

foreach x in "`MisForMisBirthEarly'" "`MisForMisBirthLate'" "`MisForMisBirthMiss'" "`MisForMisMigraEarly'" "`MisForMisMigraLate'" "`MisForMisMigraMiss'" "`MisForMisMissiEarly'" "`MisForMisMissiLate'" "`MisForMisMissiMiss'" {
	distinct persnr if `x' 
	}
	
* ----------------------------------------------------------------------------------------------------------------------------------------------------*
* c. personCoriginForeign -----------------------------------------------------------------------------------------------------------------------------
* ----------------------------------------------------------------------------------------------------------------------------------------------------*
local ForGerGebBirthEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 3.1.1.1.1		0
local ForGerGebBirthLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 3.1.1.1.2		0
local ForGerGebBirthMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 3.1.1.1.3		814
local ForGerGebMigraEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 3.1.1.2.1		61
local ForGerGebMigraLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 3.1.1.2.2		266
local ForGerGebMigraMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 3.1.1.2.3		50
local ForGerGebMissiEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 3.1.1.3.1		0
local ForGerGebMissiLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 3.1.1.3.2		0
local ForGerGebMissiMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 3.1.1.3.3		0

foreach x in "`ForGerGebBirthEarly'" "`ForGerGebBirthLate'" "`ForGerGebBirthMiss'" "`ForGerGebMigraEarly'" "`ForGerGebMigraLate'" "`ForGerGebMigraMiss'" "`ForGerGebMissiEarly'" "`ForGerGebMissiLate'" "`ForGerGebMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/31113.do
include ${DoFi}Logic/combinations/31121.do
include ${DoFi}Logic/combinations/31122.do
include ${DoFi}Logic/combinations/31123.do

local ForGerEinBirthEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 3.1.2.1.1		0
local ForGerEinBirthLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 3.1.2.1.2		0
local ForGerEinBirthMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 3.1.2.1.3		330
local ForGerEinMigraEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 3.1.2.2.1		147
local ForGerEinMigraLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 3.1.2.2.2		916
local ForGerEinMigraMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 3.1.2.2.3		54
local ForGerEinMissiEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 3.1.2.3.1		0
local ForGerEinMissiLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 3.1.2.3.2		0
local ForGerEinMissiMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 3.1.2.3.3		0

foreach x in "`ForGerEinBirthEarly'" "`ForGerEinBirthLate'" "`ForGerEinBirthMiss'" "`ForGerEinMigraEarly'" "`ForGerEinMigraLate'" "`ForGerEinMigraMiss'" "`ForGerEinMissiEarly'" "`ForGerEinMissiLate'" "`ForGerEinMissiMiss'" {
	distinct persnr if `x' 
	}
	
include ${DoFi}Logic/combinations/31213.do
include ${DoFi}Logic/combinations/31221.do
include ${DoFi}Logic/combinations/31222.do
include ${DoFi}Logic/combinations/31223.do
	
local ForGerMisBirthEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 3.1.3.1.1		0
local ForGerMisBirthLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 3.1.3.1.2		0
local ForGerMisBirthMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 3.1.3.1.3		232
local ForGerMisMigraEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 3.1.3.2.1		32
local ForGerMisMigraLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 3.1.3.2.2		473
local ForGerMisMigraMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 3.1.3.2.3		195
local ForGerMisMissiEarly `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 3.1.3.3.1		0
local ForGerMisMissiLate  `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 3.1.3.3.2		0
local ForGerMisMissiMiss  `personCoriginForeign' & `personNationGerman' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 3.1.3.3.3		0

foreach x in "`ForGerMisBirthEarly'" "`ForGerMisBirthLate'" "`ForGerMisBirthMiss'" "`ForGerMisMigraEarly'" "`ForGerMisMigraLate'" "`ForGerMisMigraMiss'" "`ForGerMisMissiEarly'" "`ForGerMisMissiLate'" "`ForGerMisMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/31313.do
include ${DoFi}Logic/combinations/31321.do
include ${DoFi}Logic/combinations/31322.do
include ${DoFi}Logic/combinations/31323.do
	
local ForMisGebBirthEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 3.2.1.1.1	0
local ForMisGebBirthLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 3.2.1.1.2	0
local ForMisGebBirthMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 3.2.1.1.3	0
local ForMisGebMigraEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 3.2.1.2.1	0
local ForMisGebMigraLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 3.2.1.2.2	0
local ForMisGebMigraMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 3.2.1.2.3	0
local ForMisGebMissiEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 3.2.1.3.1	0
local ForMisGebMissiLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 3.2.1.3.2	0
local ForMisGebMissiMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 3.2.1.3.3	0

foreach x in "`ForMisGebBirthEarly'" "`ForMisGebBirthLate'" "`ForMisGebBirthMiss'" "`ForMisGebMigraEarly'" "`ForMisGebMigraLate'" "`ForMisGebMigraMiss'" "`ForMisGebMissiEarly'" "`ForMisGebMissiLate'" "`ForMisGebMissiMiss'" {
	distinct persnr if `x' 
	}
	
local ForMisEinBirthEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 3.2.2.1.1	0
local ForMisEinBirthLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 3.2.2.1.2	0
local ForMisEinBirthMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 3.2.2.1.3	0
local ForMisEinMigraEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 3.2.2.2.1	0
local ForMisEinMigraLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 3.2.2.2.2	0
local ForMisEinMigraMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 3.2.2.2.3	0
local ForMisEinMissiEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 3.2.2.3.1	0
local ForMisEinMissiLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 3.2.2.3.2	0
local ForMisEinMissiMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 3.2.2.3.3	0

foreach x in "`ForMisEinBirthEarly'" "`ForMisEinBirthLate'" "`ForMisEinBirthMiss'" "`ForMisEinMigraEarly'" "`ForMisEinMigraLate'" "`ForMisEinMigraMiss'" "`ForMisEinMissiEarly'" "`ForMisEinMissiLate'" "`ForMisEinMissiMiss'" {
	distinct persnr if `x' 
	}

local ForMisMisBirthEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 3.2.3.1.1	0
local ForMisMisBirthLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 3.2.3.1.2	0
local ForMisMisBirthMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 3.2.3.1.3	1992
local ForMisMisMigraEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 3.2.3.2.1	161
local ForMisMisMigraLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 3.2.3.2.2	54
local ForMisMisMigraMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 3.2.3.2.3	11
local ForMisMisMissiEarly `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 3.2.3.3.1	0
local ForMisMisMissiLate  `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 3.2.3.3.2	0
local ForMisMisMissiMiss  `personCoriginForeign' & `personNationMissing' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 3.2.3.3.3	0

foreach x in "`ForMisMisBirthEarly'" "`ForMisMisBirthLate'" "`ForMisMisBirthMiss'" "`ForMisMisMigraEarly'" "`ForMisMisMigraLate'" "`ForMisMisMigraMiss'" "`ForMisMisMissiEarly'" "`ForMisMisMissiLate'" "`ForMisMisMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/32313.do
include ${DoFi}Logic/combinations/32321.do
include ${DoFi}Logic/combinations/32322.do
include ${DoFi}Logic/combinations/32323.do
	
local ForForGebBirthEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeEarly' // * 3.3.1.1.1	0
local ForForGebBirthLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeLate'  // * 3.3.1.1.2	0
local ForForGebBirthMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // * 3.3.1.1.3	40
local ForForGebMigraEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeEarly' // * 3.3.1.2.1	1
local ForForGebMigraLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeLate'  // * 3.3.1.2.2	0
local ForForGebMigraMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMigra' & `personMigAgeMiss'  // * 3.3.1.2.3	1
local ForForGebMissiEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeEarly' // * 3.3.1.3.1	0
local ForForGebMissiLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeLate'  // * 3.3.1.3.2	0	
local ForForGebMissiMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitGeb' & `personInGermMissi' & `personMigAgeMiss'  // * 3.3.1.3.3	0

foreach x in "`ForForGebBirthEarly'" "`ForForGebBirthLate'" "`ForForGebBirthMiss'" "`ForForGebMigraEarly'" "`ForForGebMigraLate'" "`ForForGebMigraMiss'" "`ForForGebMissiEarly'" "`ForForGebMissiLate'" "`ForForGebMissiMiss'" {
	distinct persnr if `x' 
	}


include ${DoFi}Logic/combinations/33113.do
include ${DoFi}Logic/combinations/33121.do
include ${DoFi}Logic/combinations/33123.do

include ${DoFi}Logic/00_macros.do                                     					
local ForForEinBirthEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeEarly' // * 3.3.2.1.1	0
local ForForEinBirthLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeLate'  // * 3.3.2.1.2	0
local ForForEinBirthMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermBirth' & `personMigAgeMiss'  // * 3.3.2.1.3	659
local ForForEinMigraEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeEarly' // * 3.3.2.2.1	213
local ForForEinMigraLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeLate'  // * 3.3.2.2.2	1874
local ForForEinMigraMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermMigra' & `personMigAgeMiss'  // * 3.3.2.2.3	197
local ForForEinMissiEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeEarly' // * 3.3.2.3.1	0
local ForForEinMissiLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeLate'  // * 3.3.2.3.2	0
local ForForEinMissiMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitEin' & `personInGermMissi' & `personMigAgeMiss'  // * 3.3.2.3.3	0

foreach x in "`ForForEinBirthEarly'" "`ForForEinBirthLate'" "`ForForEinBirthMiss'" "`ForForEinMigraEarly'" "`ForForEinMigraLate'" "`ForForEinMigraMiss'" "`ForForEinMissiEarly'" "`ForForEinMissiLate'" "`ForForEinMissiMiss'" {
	distinct persnr if `x' 
	}

*include ${DoFi}Logic/combinations/33213.do
include ${DoFi}Logic/combinations/33221.do
include ${DoFi}Logic/combinations/33222.do
include ${DoFi}Logic/combinations/33223.do
	
include ${DoFi}Logic/00_macros.do    	
local ForForMisBirthEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeEarly' // * 3.3.3.1.1	0
local ForForMisBirthLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeLate'  // * 3.3.3.1.2	0
local ForForMisBirthMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermBirth' & `personMigAgeMiss'  // * 3.3.3.1.3	3085
local ForForMisMigraEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeEarly' // * 3.3.3.2.1	469
local ForForMisMigraLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeLate'  // * 3.3.3.2.2	2714
local ForForMisMigraMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermMigra' & `personMigAgeMiss'  // * 3.3.3.2.3	277
local ForForMisMissiEarly `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeEarly' // * 3.3.3.3.1	0
local ForForMisMissiLate  `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeLate'  // * 3.3.3.3.2	0
local ForForMisMissiMiss  `personCoriginForeign' & `personNationForeign' & `personDeuSeitMis' & `personInGermMissi' & `personMigAgeMiss'  // * 3.3.3.3.3	0 = Sum 3 = 15.318 = 71009
 
foreach x in "`ForForMisBirthEarly'" "`ForForMisBirthLate'" "`ForForMisBirthMiss'" "`ForForMisMigraEarly'" "`ForForMisMigraLate'" "`ForForMisMigraMiss'" "`ForForMisMissiEarly'" "`ForForMisMissiLate'" "`ForForMisMissiMiss'" {
	distinct persnr if `x' 
	}

include ${DoFi}Logic/combinations/33313.do
include ${DoFi}Logic/combinations/33321.do
include ${DoFi}Logic/combinations/33322.do
include ${DoFi}Logic/combinations/33323.do

* Recode mig_gen_cn
do ${DoFi}Logic/02_recode.do

* Label mig_gen_cn

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
	
tab migback mig_gen_cn	,m
