************************
***** Uebersetzung *****
************************


*******************************************************************
***** Festlegung von Macros = local MAKRO "Inhalt des Makros" *****
*******************************************************************


local welle "a b c d e f g h i j k l m n o p q r s t u v w x y z";			// Wichtig: Welle z (2009) kommt erst noch!				
local eingeb "sp116 tp124 up128 vp137 wp129 xp141 yp139 zp139"; 				// Einbuergerungsfrage Variable
local eingeb17 "wj67 xj67 yj67 zj67";								// Einbuergerungsfrage - Jugendfragebogen (bioage01.dta)		
local geb17 "uj56 vj56 wj61 xj61 yj61 zj61";							// in D geboren - Jugendfragebogen (bioage01.dta)		
local mutgeb "wb2302 xb2302 yb2302 zb2302";	 						// Mutter in D geboren - Fragebogen Lebenslauf
local mutgeb_l "xb2306 yb2306 zb2306";
local vatgeb "wb2301 xb2301	yb2301 zb2301";							// Vater in D geboren - Fragebogen Lebenslauf	 
local vatgeb_l "xb2304 yb2304 zb2304";
local mutgeb17 "wj7902 xj7902 yj7902 zj7902";							// Mutter in D geboren - Jugendfragebogen (bioage01.dta)	
local mutgeb17_l "xj7906 yj7906 zj7906";								// Mutter Geburtsland - Jugendfragebogen (bioage01.dta)	
local vatgeb17 "wj7901 xj7901 yj7901 zj7901";							// Vater in D geboren - Jugendfragebogen (bioage01.dta)	
local vargeb17_l "xj7904 yj7904 zj7904";								// Vater Geburtsland - Jugendfragebogen (bioage01.dta)	
local mutstab17 "uj73m vj73m wj8002 xj8002 yj8002 zj8002";					// Mutter hat deutsche Staatsbuergerschaft - Jugendfragebogen (bioage01.dta)	
local vatstab17 "uj73v vj73v wj8001 xj8001 yj8001 zj8001";					// Vater hat ddeutsche Staatsbuergerschaft - Jugendfragebogen (bioage01.dta)	

local dstaat "qp12001 qp12002 rp11601 rp11602 sp11501 sp11503 tp12301 tp12302 up12701 up12702 vp13601 vp13602 wp12801 wp12802 xp14001 xp14002 yp13801 yp13802 zp13801 zp13802";	// Variablen zur doppelten Staatsangehoerigkeit					
*** Anmerkung dstaat: Als erstes Variable zur Frage 2. Staatsangehoerigkeit vorhanden, dann 2. Variable zur Frage nach dem Land der zweiten Staatsangehoerigkeit!


************************
***** MergeProzess *****
************************


*** Folgende Variablen wurden im Datensatz PPFAD beibehalten ***
PPFAD: persnr hhnr *hhnr corigin gebjahr immiyear germborn erstbe *netto letztbe psample loc1989 // *netto wurde umbenannt in netto*


************************************************************************************************************
***** Im folgenden stehen Variablen, die aus unterschiedlichen Datensaetzen dem PPFAD zugefuegt wurden *****
************************************************************************************************************


*** Variablen zur Nationalitaet *** 
PGEN: nation*
akind: ak07a // Nationalitaet Kind				
ekind: ek03a // Natopnalitaet Kind 
$PBRUTTO: ?pnat //wurde umbenannt in pnat* 

*** HV-Nationalitaet ***
EHBRUTTO: sampel // sampel wurde umbenannt in sample_e

*** ?HNetto ***    
$HPFAD: ?hnetto // ?hnetto wird nur beibehalten, wenn die Variable den Wert 1 annimmt

*** Gewichtungsfaktoren ***
PHRF: ?phrf

*** Zeitpunkt des erwerbs der deutschen Staatsangehoerigkeit ***
$P: eingeb // Makro (siehe oben)
$JUGEND: eingeb17 geb17 vatgeb17 mutgeb17 vatstab17 mutstab17 vatgeb17_l mutgeb17_l // Makro (siehe oben)

*** Infratest Brutto ***  
PERSONEN0$: pnat0* // wurde umbenannt in pnat_infra0*
PERSONEN$: pnat*  // wurde umbenannt in pnat_infra*

*** BIOPAREN ***	
BIOPAREN: vnat mnat
  
*** LELA ***
$LELA: vatgeb mutgeb vatgeb_l mutgeb_l

*** Nach Nationalitaet Differenzierte Stichprobenkennzeichen des HV ***
$P: sample1 // wurde umbenannt in sample_*				

*** BIOIMMIG ***	
BIOIMMIG$: biimgrp // wurde umbenannt in biimgrp*

*** Doppelte Staatsbuergerschaft ***
$P: dstaat* // wurde umbenannt in dnat* (Welle 1)und  dnat_code*

***** Es wurde alles unter dem Datensatz 'file_migr.dta' gespeichert *****


*******************************************
***** Generierung eines Elternzeigers *****
*******************************************
*****    Eigentlich nicht wichtig     *****
*******************************************


*** Benutzte Variablen (Die Missings wurden aussortiert ***
$KIND: $kmutti // wurde umbenannt in mutti*
$Kind: mnr, mut1, muts, mut1, mut2, mut3 persnr // Neu generierte Variablen; behinaltet alle Muetter im $Kind; persnr wurde umbenannt in Mutter
BIOBIRTH: kidpnr0*, kidpnr* // Beide wurden umbenannt in kid*; 
BIOBIRTHM: kidpnr0* kidpn* persnr // Beide wurden umbenannt in kid*; beinhaltet alle Väter im BIOBIRTHM; persnr wurde umbenannt in vater
BIOPAREN: mnr vnr 

*** Der Mergeprozess beinhaltet persnr (persnr des Kindes), Mutter (persnr der Mutter), Vater (persnr des Vaters) ***

***** Es wurde alles unter dem Datensatz 'elternzeiger.dta' gespeichert *****


********************************************************************************************************************
* Es handelt sich um die Übersetzung der ersten 10 Seiten. In den weiteren 20 Seiten werden fehlende Werte benannt, 
* neue Variablen generiert, Werte gelabelt etc.; Die Seiten sind hier nicht aufgelistet
* Variablen die ebenfalls noch benutzt wurden, sind germborn (Seite 18) und corigin (Seite 20) 
********************************************************************************************************************


*********************
***** Ergebniss *****
*********************


label var migback "Migrationshintergrund"
label def migback 
		-2 "trifft nicht zu" 
		-1 "keine Angabe"					
		1  "Kein Migrationshintergrund" 	
		2  "direkter Migrationshintergrund"	
		3  "indirekter Migrationshintergrund"	
		4  "Migrationshintergrund - nicht weiter differenzierbar"


****************
***** ENDE *****
****************


