// 1.1.1.1.3 - 1.1.01.01     GerGerGebBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 1.1.02.02    GerGerGebBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 2.1.01.01     GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 2.1.02.02    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 2.2.01.01     GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 2.2.02.01     GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 2.2.02.02    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 2.2.03.03    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.1.1.3 - 2.2.03.04    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissGermGermGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissGermGermGerm'

// 1.1.1.1.3 - 2.2.03.15    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 11 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.1.1.1.3 - 2.2.04.03    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissGermGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissGermGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.1.1.3 - 2.2.04.04    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissGermGermGerm  &  grandsCorMissGermGermGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissGermGermGerm' & `grandsCorMissGermGermGerm'

// 1.1.1.1.3 - 2.2.05.05    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatGermGermGermGerm  &  grandsCorGermGermGermGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

// 1.1.1.1.3 - 2.2.15.15    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 11 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.1.1.1.3 - 2.3.01.01     GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 2.3.02.02    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 2.3.03.02    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 2.4.01.01     GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 2.5.01.01     GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 2.5.02.02    GerGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 6 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 3.1.01.01     GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 3.2.01.01     GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 3.2.02.02    GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 3.2.03.03    GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.1.1.3 - 3.3.01.01     GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 3.3.02.02    GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 3.3.03.15    GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 11 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.1.1.1.3 - 3.4.01.01     GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 3.5.01.01     GerGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 5.5.01.01     GerGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.1.1.3 - 5.5.02.02    GerGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 6 if `GerGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.1.1.3 - 6.6.01.01     GerGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `GerGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.2.1.3 - 1.1.01.01    GerGerEinBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if `GerGerEinBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.2.1.3 - 2.1.01.01     GerGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `GerGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.2.1.3 - 2.2.01.01     GerGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.2.1.3 - 2.2.02.02    GerGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 12 if `GerGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.2.1.3 - 2.2.03.03    GerGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 12 if `GerGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.2.1.3 - 2.3.01.01     GerGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `GerGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.2.1.3 - 3.2.03.03    GerGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 12 if `GerGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.2.1.3 - 3.3.01.01     GerGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `GerGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 1.1.01.01    GerGerMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 1.1.02.02    GerGerMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.3.1.3 - 2.1.01.01     GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 2.2.01.01     GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 2.2.02.01     GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 2.2.02.02    GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.3.1.3 - 2.2.03.03    GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.3.1.3 - 2.2.03.15    GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.1.3.1.3 - 2.2.05.05    GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatGermGermGermGerm  &  grandsCorGermGermGermGerm
replace mig_gen_cn = 12 if `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

// 1.1.3.1.3 - 2.2.12.01    GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 2.3.01.01     GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 2.5.01.01     GerGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 3.1.01.01     GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 3.2.01.01     GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 3.2.02.02    GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.3.1.3 - 3.2.03.03    GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.1.3.1.3 - 3.3.01.01     GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 3.3.02.02    GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.1.3.1.3 - 3.4.01.01     GerGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `GerGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 5.3.01.01     GerGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 5.5.01.01     GerGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 5.5.11.11    GerGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `GerGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 1.1.3.1.3 - 5.6.01.01     GerGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 4 if  `GerGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.1.3.1.3 - 6.6.01.01     GerGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 4 if  `GerGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 1.1.01.01    GerMisMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 1.1.02.02    GerMisMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 2.1.01.01     GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 2.2.01.01     GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 2.2.02.02    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 2.2.02.12    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 11 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 1.2.3.1.3 - 2.2.03.01    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 2.2.03.02    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 2.2.03.03    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.2.3.1.3 - 2.2.03.04    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissGermGermGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissGermGermGerm'

// 1.2.3.1.3 - 2.2.03.11    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 10 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 1.2.3.1.3 - 2.2.03.15    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 2.2.04.04    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissGermGermGerm  &  grandsCorMissGermGermGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissGermGermGerm' & `grandsCorMissGermGermGerm'

// 1.2.3.1.3 - 2.2.05.05    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatGermGermGermGerm  &  grandsCorGermGermGermGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

// 1.2.3.1.3 - 2.2.12.02    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 2.2.15.02    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 11 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 2.2.15.03    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 11 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorMissMissGermGerm'

// 1.2.3.1.3 - 2.2.15.15    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 11 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 2.3.01.01     GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 2.3.03.15    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 2.3.15.15    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 2.5.01.01     GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 6 if  `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 2.5.02.02    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 6 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 2.5.03.11    GerMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 6 if `GerMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 1.2.3.1.3 - 3.3.01.01     GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 3.3.02.02    GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 3.3.03.02    GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 3.3.03.03    GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 0 if `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.2.3.1.3 - 3.3.03.11    GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 13 if `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 1.2.3.1.3 - 3.3.03.15    GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 13 if `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 3.3.15.15    GerMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 13 if `GerMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 5.2.01.01     GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 5.2.11.11    GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 10 if `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 1.2.3.1.3 - 5.2.11.15    GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 10 if `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 5.2.15.15    GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 10 if `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.2.3.1.3 - 5.3.01.01     GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 5.5.01.01     GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.2.3.1.3 - 5.5.02.02    GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.2.3.1.3 - 5.5.11.11    GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 5 if `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 1.2.3.1.3 - 5.5.15.15    GerMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 5 if `GerMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.3.1.1.3 - 2.2.01.01     GerForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.1.1.3 - 3.2.01.01     GerForGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerForGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 1.1.01.01    GerForMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 1.1.02.02    GerForMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 2.1.01.01     GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 2.2.01.01     GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 2.2.02.02    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 2.2.02.12    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 1.3.3.1.3 - 2.2.03.01    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 2.2.03.02    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 2.2.03.03    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.3.3.1.3 - 2.2.03.04    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissGermGermGerm
replace mig_gen_cn = 11 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissGermGermGerm'

// 1.3.3.1.3 - 2.2.03.11    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 1.3.3.1.3 - 2.2.03.15    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 2.2.04.04    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissGermGermGerm  &  grandsCorMissGermGermGerm
replace mig_gen_cn = 11 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissGermGermGerm' & `grandsCorMissGermGermGerm'

// 1.3.3.1.3 - 2.2.05.05    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatGermGermGermGerm  &  grandsCorGermGermGermGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

// 1.3.3.1.3 - 2.2.12.02    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 2.2.15.02    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 2.2.15.03    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorMissMissGermGerm'

// 1.3.3.1.3 - 2.2.15.15    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 2.3.01.01     GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 2.3.03.15    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 2.3.15.15    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 2.5.01.01     GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 2.5.02.02    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 2.5.03.11    GerForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 10 if `GerForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 1.3.3.1.3 - 3.3.01.01     GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 3.3.02.02    GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 3.3.03.02    GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 3.3.03.03    GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 1.3.3.1.3 - 3.3.03.11    GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 1.3.3.1.3 - 3.3.03.15    GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 3.3.15.15    GerForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 13 if `GerForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 5.2.01.01     GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 12 if  `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 5.2.11.11    GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 1.3.3.1.3 - 5.2.11.15    GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 5.2.15.15    GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 12 if `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 1.3.3.1.3 - 5.3.01.01     GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 5.5.01.01     GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 1.3.3.1.3 - 5.5.02.02    GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 1.3.3.1.3 - 5.5.11.11    GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 1.3.3.1.3 - 5.5.15.15    GerForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 7 if `GerForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 2.2.3.1.3 - 3.3.01.01     MisMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 0 if  `MisMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 1.1.01.01    ForGerGebBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.1.01.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.1.02.12    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 2.2.01.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.2.02.02    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.1.1.3 - 2.2.12.12    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 2.3.01.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.4.01.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.4.02.12    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 2.4.03.11    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 2.5.01.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.5.02.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.5.02.02    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.1.1.3 - 2.5.02.12    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 2.5.03.03    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.1.1.1.3 - 2.5.11.11    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 2.5.12.12    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 2.5.15.15    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.1.1.1.3 - 2.6.01.01     ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 4 if  `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 2.6.02.12    ForGerGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 4 if `ForGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 3.1.01.01     ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 3.1.02.12    ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 3.3.01.01     ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 3.3.02.02    ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.1.1.3 - 3.4.01.01     ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 3.4.03.11    ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 3.5.01.01     ForGerGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 4.1.01.01     ForGerGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 4.2.01.01     ForGerGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 4.3.01.01     ForGerGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 4.4.01.01     ForGerGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 4.5.01.01     ForGerGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 4.5.12.02    ForGerGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissGerm'

// 3.1.1.1.3 - 5.1.01.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.2.01.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.2.03.03    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.1.1.1.3 - 5.2.11.11    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 5.3.01.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.4.01.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.5.01.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.5.02.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.5.02.02    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.1.1.3 - 5.5.11.11    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 5.5.12.02    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissGerm'

// 3.1.1.1.3 - 5.5.12.12    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 5 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 5.6.01.01     ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 4 if  `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 5.6.02.12    ForGerGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 4 if `ForGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.1.3 - 6.1.01.01     ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 6.2.03.03    ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.1.1.1.3 - 6.2.11.11    ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 13 if `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 6.3.01.01     ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 6.4.01.01     ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 6.5.01.01     ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 6.5.11.11    ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.1.1.3 - 6.6.01.01     ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 4 if  `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.1.3 - 6.6.11.11    ForGerGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 4 if `ForGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.1.2.1 - 1.1.01.01    ForGerGebMigraEarly  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if `ForGerGebMigraEarly' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.1.01.01     ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.2.01.01     ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.3.01.01     ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.4.01.01     ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.5.01.01     ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.6.01.01     ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 2.6.02.12    ForGerGebMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 2 if `ForGerGebMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.1.2.1 - 3.1.01.01     ForGerGebMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 3.3.01.01     ForGerGebMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 3.4.01.01     ForGerGebMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 3.4.02.02    ForGerGebMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 2 if `ForGerGebMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.1.2.1 - 5.5.01.01     ForGerGebMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 5.6.01.01     ForGerGebMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.1 - 6.1.01.01     ForGerGebMigraEarly  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 2 if  `ForGerGebMigraEarly' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 1.1.01.01    ForGerGebMigraLate  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if `ForGerGebMigraLate' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 2.1.01.01     ForGerGebMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 2.2.01.01     ForGerGebMigraLate  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 2.3.01.01     ForGerGebMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 2.4.01.01     ForGerGebMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 2.6.01.01     ForGerGebMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 2.6.02.02    ForGerGebMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm
replace mig_gen_cn = 1 if `ForGerGebMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.1.2.2 - 3.1.01.01     ForGerGebMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 3.3.01.01     ForGerGebMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 3.4.01.01     ForGerGebMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 3.6.01.01     ForGerGebMigraLate  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 4.1.01.01     ForGerGebMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 4.4.01.01     ForGerGebMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 5.1.01.01     ForGerGebMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 5.6.01.01     ForGerGebMigraLate  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.2 - 6.1.01.01     ForGerGebMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 1 if  `ForGerGebMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 1.1.01.01    ForGerGebMigraMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if `ForGerGebMigraMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 2.1.01.01     ForGerGebMigraMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if  `ForGerGebMigraMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 2.2.01.01     ForGerGebMigraMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if  `ForGerGebMigraMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 3.2.01.01     ForGerGebMigraMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if  `ForGerGebMigraMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 3.3.01.01     ForGerGebMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if  `ForGerGebMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 5.5.01.01     ForGerGebMigraMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if  `ForGerGebMigraMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.1.2.3 - 6.1.01.01     ForGerGebMigraMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 3 if  `ForGerGebMigraMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 1.1.01.01    ForGerEinBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if `ForGerEinBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.1.01.01     ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.2.01.01     ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn =13 if  `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.3.01.01     ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.4.01.01     ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.5.01.01     ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.5.12.12    ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 13 if `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.2.1.3 - 2.6.01.01     ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 2.6.09.09    ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore
replace mig_gen_cn = 13 if `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.1.2.1.3 - 2.6.11.11    ForGerEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 13 if `ForGerEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.2.1.3 - 3.1.01.01     ForGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 3.3.01.01     ForGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 3.4.01.01     ForGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 3.6.01.01     ForGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 3.6.11.11    ForGerEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.2.1.3 - 4.4.01.01     ForGerEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 5.2.01.01     ForGerEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 5.4.01.01     ForGerEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 5.5.01.01     ForGerEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 5.6.01.01     ForGerEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 6.1.01.01     ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 13 if  `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 6.4.01.01     ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 7 if  `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 6.5.11.11    ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 7 if `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.2.1.3 - 6.5.12.12    ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 7 if `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.2.1.3 - 6.6.01.01     ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss
replace mig_gen_cn = 4 if  `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.1.3 - 6.6.09.09    ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore
replace mig_gen_cn = 4 if `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.1.2.1.3 - 6.6.11.11    ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss
replace mig_gen_cn = 4 if `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.2.1.3 - 6.6.12.12    ForGerEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss
replace mig_gen_cn = 4 if `ForGerEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.2.2.1 - 1.1.01.01    ForGerEinMigraEarly  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, // 3.1.2.2.1 - 1.1.01.01    ForGerEinMigraEarly  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 11 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 2.1.01.01     ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 22 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 2.2.01.01     ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 3 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 2.4.01.01     ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 3 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 2.4.02.12    ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, 2 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.1 - 2.5.01.01     ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 5 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 2.6.01.01     ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 67 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 2.6.02.02    ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, 1 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.2.2.1 - 2.6.11.11    ForGerEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, 1 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.2.2.1 - 3.4.01.01     ForGerEinMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 3 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 3.4.02.12    ForGerEinMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, 2 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.1 - 3.6.01.01     ForGerEinMigraEarly  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 2 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 4.1.01.01     ForGerEinMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 3 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 4.4.01.01     ForGerEinMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 2 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 5.1.01.01     ForGerEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 3 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 5.4.01.01     ForGerEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 1 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 5.5.01.01     ForGerEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 4 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 5.6.01.01     ForGerEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 6 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 5.6.02.12    ForGerEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, 1 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.1 - 6.1.01.01     ForGerEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 15 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 6.6.01.01     ForGerEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, 6 (changes) 
replace mig_gen_cn = 2 if  `ForGerEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.1 - 6.6.11.11    ForGerEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, 1 (changes) 
replace mig_gen_cn = 2 if `ForGerEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.2.2.2 - 1.1.01.01    ForGerEinMigraLate  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (311 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 2.1.01.01     ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (210 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 2.3.01.01     ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 2.4.01.01     ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 2.4.02.12    ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.2 - 2.5.01.01     ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 2.6.01.01     ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (114 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 2.6.02.12    ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (4 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.2 - 2.6.03.11    ForGerEinMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.1.2.2.2 - 3.1.01.01     ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 3.3.01.01     ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 3.4.01.01     ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (34 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 3.4.02.12    ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (4 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.2 - 3.5.01.01     ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 3.6.01.01     ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (6 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 3.6.03.11    ForGerEinMigraLate  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.1.2.2.2 - 4.4.01.01     ForGerEinMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (6 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 5.1.01.01     ForGerEinMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 5.4.01.01     ForGerEinMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 5.5.01.01     ForGerEinMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 5.6.01.01     ForGerEinMigraLate  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 5.6.02.12    ForGerEinMigraLate  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if `ForGerEinMigraLate' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.2.2.2 - 6.1.01.01     ForGerEinMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (216 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 6.4.01.01     ForGerEinMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.2 - 6.6.01.01     ForGerEinMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForGerEinMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 1.1.01.01    ForGerEinMigraMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (20 changes) 
replace mig_gen_cn = 3 if `ForGerEinMigraMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 2.1.01.01     ForGerEinMigraMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (22 changes) 
replace mig_gen_cn = 3 if  `ForGerEinMigraMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 2.6.01.01     ForGerEinMigraMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 3 if  `ForGerEinMigraMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 3.3.01.01     ForGerEinMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForGerEinMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 3.4.01.01     ForGerEinMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForGerEinMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 5.5.01.01     ForGerEinMigraMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForGerEinMigraMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.2.2.3 - 6.1.01.01     ForGerEinMigraMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (6 changes) 
replace mig_gen_cn = 3 if  `ForGerEinMigraMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 1.1.01.01    ForGerMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.1.01.01     ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (7 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.2.01.01     ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (10 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.2.02.02    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.3.1.3 - 2.3.01.01     ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.3.02.02    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.3.1.3 - 2.4.01.01     ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.5.01.01     ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (66 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.5.02.02    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.3.1.3 - 2.5.11.11    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.1.3 - 2.5.12.12    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.3.1.3 - 2.6.01.01     ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (24 changes) 
replace mig_gen_cn = 4 if  `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 2.6.09.09    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.1.3.1.3 - 2.6.10.10    ForGerMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.1.3.1.3 - 3.1.01.01     ForGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 3.3.01.01     ForGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 3.4.01.01     ForGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 3.5.01.01     ForGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (7 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 3.6.01.01     ForGerMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 4.1.01.01     ForGerMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 4.3.01.01     ForGerMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 4.4.01.01     ForGerMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 4.4.11.11    ForGerMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForGerMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.1.3 - 4.5.01.01     ForGerMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 4.6.11.11    ForGerMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.1.3 - 5.2.01.01     ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 5.2.11.11    ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.1.3 - 5.3.01.01     ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (11 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 5.4.01.01     ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 5.5.01.01     ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (55 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 5.5.02.02    ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 7 if `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.3.1.3 - 5.5.11.11    ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.1.3 - 5.5.12.12    ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.3.1.3 - 5.6.01.01     ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 4 if  `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 5.6.11.11    ForGerMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.1.3 - 6.1.01.01     ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 6.4.01.01     ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 6.5.01.01     ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 6.5.12.12    ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.1.3.1.3 - 6.6.01.01     ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 4 if  `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.1.3 - 6.6.09.09    ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.1.3.1.3 - 6.6.10.10    ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.1.3.1.3 - 6.6.11.11    ForGerMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 4 if `ForGerMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.1.3.2.1 - 1.1.01.01    ForGerMisMigraEarly  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 2 if `ForGerMisMigraEarly' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 2.1.01.01     ForGerMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 2.2.01.01     ForGerMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 2.3.01.01     ForGerMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 2.6.01.01     ForGerMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 3.4.01.01     ForGerMisMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 4.4.01.01     ForGerMisMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 5.5.01.01     ForGerMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 5.6.01.01     ForGerMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.1 - 6.6.01.01     ForGerMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForGerMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 1.1.01.01    ForGerMisMigraLate  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (327 changes) 
replace mig_gen_cn = 1 if `ForGerMisMigraLate' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 2.1.01.01     ForGerMisMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (27 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 2.2.01.01     ForGerMisMigraLate  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 2.3.01.01     ForGerMisMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 2.4.01.01     ForGerMisMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 2.6.01.01     ForGerMisMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (81 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 2.6.03.11    ForGerMisMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 1 if `ForGerMisMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.1.3.2.2 - 3.1.01.01     ForGerMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 3.3.01.01     ForGerMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 3.4.01.01     ForGerMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 3.4.02.02    ForGerMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 1 if `ForGerMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.1.3.2.2 - 3.4.02.12    ForGerMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if `ForGerMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.1.3.2.2 - 3.6.01.01     ForGerMisMigraLate  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 4.4.01.01     ForGerMisMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 5.5.01.01     ForGerMisMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 6.1.01.01     ForGerMisMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (19 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.2 - 6.6.01.01     ForGerMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForGerMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 1.1.01.01    ForGerMisMigraMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (175 changes) 
replace mig_gen_cn = 3 if `ForGerMisMigraMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 2.1.01.01     ForGerMisMigraMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 2.6.01.01     ForGerMisMigraMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (10 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 3.1.01.01     ForGerMisMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 3.3.01.01     ForGerMisMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 5.2.01.01     ForGerMisMigraMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 5.5.01.01     ForGerMisMigraMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.1.3.2.3 - 5.6.01.01     ForGerMisMigraMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForGerMisMigraMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 2.2.01.01     ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (39 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 2.2.03.03    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (6 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 2.2.03.15    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 2.2.11.11    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 2.2.15.15    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (5 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 2.3.03.03    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 2.3.03.11    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 2.4.01.01     ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 2.4.03.11    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 2.5.01.01     ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (86 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 2.5.02.02    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (3 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 2.5.03.03    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (2 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 2.5.03.11    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (10 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 2.5.11.11    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 2.6.01.01     ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (176 changes) 
replace mig_gen_cn = 4 if  `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 2.6.02.12    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (10 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 2.6.03.11    ForMisMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (59 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 3.3.01.01     ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (10 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 3.3.02.02    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (4 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 3.3.03.03    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (3 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 3.3.11.11    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 3.3.15.15    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 3.4.01.01     ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (36 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 3.4.02.12    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 3.4.03.11    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (11 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 3.4.15.15    ForMisMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 4.1.01.01     ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 4.3.01.01     ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (9 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 4.3.11.11    ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (14 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 4.3.12.12    ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 4.4.01.01     ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (32 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 4.4.11.11    ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (9 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 4.4.12.12    ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (5 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 4.4.15.15    ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 4.6.01.01     ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 4 if  `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 4.6.09.09    ForMisMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 5.2.01.01     ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (26 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 5.2.02.02    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (2 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 5.2.11.11    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (40 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 5.2.11.15    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (2 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 5.2.13.13    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeGermMiss  &  grandsCorForeForeGermMiss, (1 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeGermMiss' & `grandsCorForeForeGermMiss'

// 3.2.3.1.3 - 5.2.15.03    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 5.2.15.11    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 5.2.15.15    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (5 changes) 
replace mig_gen_cn = 12 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 5.3.01.01     ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (20 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 5.3.02.02    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 5.3.03.03    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 5.3.11.11    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 5.4.01.01     ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 5.4.09.09    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (2 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 5.4.09.10    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeMiss, (2 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeMiss'

// 3.2.3.1.3 - 5.4.10.09    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeFore, (2 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 5.4.10.10    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (2 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.2.3.1.3 - 5.5.01.01     ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (191 changes) 
replace mig_gen_cn = 6 if  `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 5.5.02.02    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (4 changes) 
replace mig_gen_cn = 6 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 5.5.03.02    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm, (4 changes) 
replace mig_gen_cn = 6 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 5.5.03.03    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (14 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.1.3 - 5.5.03.15    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm, (6 changes) 
replace mig_gen_cn = 6 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 5.5.11.11    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (49 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 5.5.12.02    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissGerm, (3 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissGerm'

// 3.2.3.1.3 - 5.5.12.12    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (10 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 5.5.13.13    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeGermMiss  &  grandsCorForeForeGermMiss, (1 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeGermMiss' & `grandsCorForeForeGermMiss'

// 3.2.3.1.3 - 5.5.15.15    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 5.6.01.01     ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (78 changes) 
replace mig_gen_cn = 4 if  `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 5.6.02.01     ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 5.6.02.12    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 5.6.03.11    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (21 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 5.6.11.11    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 5.6.12.12    ForMisMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (4 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 6.1.01.01     ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (13 changes) 
replace mig_gen_cn = 4 if  `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 6.2.01.01     ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (6 changes) 
replace mig_gen_cn = 13 if  `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 6.2.09.09    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (3 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 6.2.11.11    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (34 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 6.2.11.15    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 6.2.12.12    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 6.3.11.11    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (4 changes) 
replace mig_gen_cn = 13 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 6.4.01.01     ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 6.4.11.11    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (5 changes) 
replace mig_gen_cn = 5 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 6.5.01.01     ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (31 changes) 
replace mig_gen_cn = 7 if  `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 6.5.09.09    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (2 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 6.5.09.10    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeMiss'

// 3.2.3.1.3 - 6.5.10.09    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 6.5.10.10    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.2.3.1.3 - 6.5.11.11    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (139 changes) 
replace mig_gen_cn = 6 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 6.5.12.12    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (12 changes) 
replace mig_gen_cn = 6 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 6.5.15.11    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 6 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 6.6.01.01     ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (259 changes) 
replace mig_gen_cn = 4 if  `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.1.3 - 6.6.02.12    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (3 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 6.6.09.09    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (11 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.2.3.1.3 - 6.6.10.10    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.2.3.1.3 - 6.6.11.11    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (341 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.1.3 - 6.6.11.12    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 6.6.11.15    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.2.3.1.3 - 6.6.12.12    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (21 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.1.3 - 6.6.15.15    ForMisMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (2 changes) 
replace mig_gen_cn = 4 if `ForMisMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.2.3.2.1 - 2.5.01.01     ForMisMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 2.6.01.01     ForMisMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (77 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 2.6.02.12    ForMisMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (5 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.2.3.2.1 - 3.4.01.01     ForMisMisMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (7 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 4.4.01.01     ForMisMisMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 4.4.11.11    ForMisMisMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.2.1 - 5.5.01.01     ForMisMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 5.5.02.02    ForMisMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (2 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.2.1 - 5.5.03.03    ForMisMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.2.3.2.1 - 5.6.01.01     ForMisMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 6.6.01.01     ForMisMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (35 changes) 
replace mig_gen_cn = 2 if  `ForMisMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.1 - 6.6.11.11    ForMisMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (4 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.2.3.2.1 - 6.6.11.12    ForMisMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.2.1 - 6.6.12.12    ForMisMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if `ForMisMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.2.2 - 1.1.01.01    ForMisMisMigraLate  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if `ForMisMisMigraLate' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 2.5.01.01     ForMisMisMigraLate  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 2.6.01.01     ForMisMisMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (13 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 3.4.01.01     ForMisMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 4.4.01.01     ForMisMisMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 5.5.01.01     ForMisMisMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 5.5.02.02    ForMisMisMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 1 if `ForMisMisMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.2.3.2.2 - 5.6.01.01     ForMisMisMigraLate  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 6.1.01.01     ForMisMisMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 6.6.01.01     ForMisMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (16 changes) 
replace mig_gen_cn = 1 if  `ForMisMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.2 - 6.6.09.09    ForMisMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 1 if `ForMisMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.2.3.2.2 - 6.6.12.12    ForMisMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (5 changes) 
replace mig_gen_cn = 1 if `ForMisMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.2.3.2.3 - 2.2.01.01     ForMisMisMigraMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 3 if  `ForMisMisMigraMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.3 - 2.2.05.05    ForMisMisMigraMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatGermGermGermGerm  &  grandsCorGermGermGermGerm, (1 changes) 
replace mig_gen_cn = 3 if `ForMisMisMigraMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

// 3.2.3.2.3 - 3.4.01.01     ForMisMisMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForMisMisMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.3 - 5.6.01.01     ForMisMisMigraMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForMisMisMigraMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.2.3.2.3 - 6.6.01.01     ForMisMisMigraMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForMisMisMigraMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 2.2.01.01     ForForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 2.3.01.01     ForForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 2.5.01.01     ForForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 7 if  `ForForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 2.5.11.11    ForForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.1.1.3 - 2.6.01.01     ForForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 4 if  `ForForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 2.6.11.11    ForForGebBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForForGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.1.1.3 - 3.3.01.01     ForForGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 3.4.01.01     ForForGebBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForForGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 4.4.01.01     ForForGebBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForForGebBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 5.2.11.11    ForForGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 10 if `ForForGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.1.1.3 - 5.4.01.01     ForForGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 7 if  `ForForGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 5.5.01.01     ForForGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (22 changes) 
replace mig_gen_cn = 6 if  `ForForGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 5.5.02.02    ForForGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (2 changes) 
replace mig_gen_cn = 6 if `ForForGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.1.1.3 - 5.5.11.11    ForForGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 6 if `ForForGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.1.1.3 - 5.6.01.01     ForForGebBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 4 if  `ForForGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 6.2.11.11    ForForGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForForGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.1.1.3 - 6.5.01.01     ForForGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 6.6.01.01     ForForGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 4 if  `ForForGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.1.3 - 6.6.11.11    ForForGebBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForForGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.1.2.1 - 5.5.01.01     ForForGebMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2  if  `ForForGebMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.1.2.3 - 5.6.01.01     ForForGebMigraMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForGebMigraMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 1.1.01.01    ForForEinBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (69 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 2.1.01.01     ForForEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (10 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 2.5.01.01     ForForEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 2.6.01.01     ForForEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 2.6.11.11    ForForEinBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 3.2.01.01     ForForEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 3.3.01.01     ForForEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 3.6.01.01     ForForEinBirthMiss  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 4.3.01.01     ForForEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 4.4.01.01     ForForEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (15 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 4.4.12.12    ForForEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.2.1.3 - 4.5.11.11    ForForEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 4.6.01.01     ForForEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 4.6.11.11    ForForEinBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 5.2.01.01     ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 5.2.15.15    ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 12 if `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.2.1.3 - 5.4.01.01     ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 5.5.01.01     ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (9 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 5.5.11.11    ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 5.6.01.01     ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 5.6.11.11    ForForEinBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 6.1.01.01     ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (67 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 6.2.11.11    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 6.3.01.01     ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 6.3.11.11    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 6.4.01.01     ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 6.4.12.12    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.2.1.3 - 6.5.01.01     ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 7 if  `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 6.5.11.11    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (6 changes) 
replace mig_gen_cn = 7 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 6.6.01.01     ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (380 changes) 
replace mig_gen_cn = 4 if  `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.1.3 - 6.6.09.09    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (4 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.2.1.3 - 6.6.11.11    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (61 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.1.3 - 6.6.11.15    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (3 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.3.2.1.3 - 6.6.12.12    ForForEinBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (20 changes) 
replace mig_gen_cn = 4 if `ForForEinBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'


// 3.3.2.2.1 - 1.1.01.01    ForForEinMigraEarly  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (34 changes) 
replace mig_gen_cn = 2 if `ForForEinMigraEarly' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 2.1.01.01     ForForEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 2.2.01.01     ForForEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 2.5.01.01     ForForEinMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 3.4.01.01     ForForEinMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 4.4.01.01     ForForEinMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (9 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 4.6.01.01     ForForEinMigraEarly  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 5.4.01.01     ForForEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 5.5.01.01     ForForEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 5.6.01.01     ForForEinMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 6.1.01.01     ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (25 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 6.4.01.01     ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 6.5.01.01     ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 6.6.01.01     ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (133 changes) 
replace mig_gen_cn = 2 if  `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.1 - 6.6.09.09    ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 2 if `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.2.2.1 - 6.6.11.11    ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 2 if `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.2.2.1 - 6.6.12.12    ForForEinMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if `ForForEinMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.2.2.2 - 1.1.01.01    ForForEinMigraLate  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1010 changes) 
replace mig_gen_cn = 1 if `ForForEinMigraLate' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 2.1.01.01     ForForEinMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (14 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 2.3.01.01     ForForEinMigraLate  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 2.5.01.01     ForForEinMigraLate  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 2.6.01.01     ForForEinMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 3.1.01.01     ForForEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 3.3.01.01     ForForEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 3.4.01.01     ForForEinMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 3.6.01.01     ForForEinMigraLate  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 4.1.01.01     ForForEinMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 4.3.01.01     ForForEinMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 4.4.01.01     ForForEinMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (37 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 4.6.01.01     ForForEinMigraLate  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 5.1.01.01     ForForEinMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 5.4.01.01     ForForEinMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (10 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 5.5.01.01     ForForEinMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (7 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 5.6.01.01     ForForEinMigraLate  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 6.1.01.01     ForForEinMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (620 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 6.4.01.01     ForForEinMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (9 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 6.5.01.01     ForForEinMigraLate  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 6.6.01.01     ForForEinMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (169 changes) 
replace mig_gen_cn = 1 if  `ForForEinMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.2 - 6.6.12.12    ForForEinMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if `ForForEinMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.2.2.3 - 1.1.01.01    ForForEinMigraMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (153 changes) 
replace mig_gen_cn = 3 if `ForForEinMigraMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 2.1.01.01     ForForEinMigraMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 2.2.01.01     ForForEinMigraMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 3.3.01.01     ForForEinMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 4.4.01.01     ForForEinMigraMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 4.6.01.01     ForForEinMigraMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 5.4.01.01     ForForEinMigraMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 5.5.01.01     ForForEinMigraMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 5.6.01.01     ForForEinMigraMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 6.1.01.01     ForForEinMigraMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (6 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 6.6.01.01     ForForEinMigraMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (24 changes) 
replace mig_gen_cn = 3 if  `ForForEinMigraMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.2.2.3 - 6.6.09.09    ForForEinMigraMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 3 if `ForForEinMigraMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.2.2.3 - 6.6.12.12    ForForEinMigraMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if `ForForEinMigraMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 1.1.01.01    ForForMisBirthMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (49 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 2.1.01.01     ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 2.2.01.01     ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (40 changes) 
replace mig_gen_cn = 12 if  `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 2.2.03.03    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (6 changes) 
replace mig_gen_cn = 12 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 2.2.03.15    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 12 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 2.2.11.11    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 12 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 2.2.15.15    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (5 changes) 
replace mig_gen_cn = 12 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 2.3.03.03    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 2.3.03.11    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 2.4.01.01     ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 7 if  `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 2.4.03.11    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorMissinForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 2.5.01.01     ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (88 changes) 
replace mig_gen_cn = 7 if  `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 2.5.02.02    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (3 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 2.5.03.03    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (2 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 2.5.03.11    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (10 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 2.5.11.11    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (2 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 2.6.01.01     ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (179 changes) 
replace mig_gen_cn = 4 if  `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 2.6.02.12    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (10 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 2.6.03.11    ForForMisBirthMiss  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (59 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 3.1.01.01     ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 3.3.01.01     ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (11 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 3.3.02.02    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (4 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 3.3.03.03    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (3 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 3.3.11.11    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 3.3.15.15    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 3.4.01.01     ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (36 changes) 
replace mig_gen_cn = 7 if  `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 3.4.02.12    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 3.4.03.11    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (11 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 3.4.15.15    ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 3.5.01.01     ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 6 if  `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 3.6.01.01     ForForMisBirthMiss  &  parentsNatMissinGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 4 if  `ForForMisBirthMiss' & `parentsNatMissinGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 4.1.01.01     ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 4.3.01.01     ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 4.3.11.11    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (14 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 4.3.12.12    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinGerman  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinGerman' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 4.4.01.01     ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (61 changes) 
replace mig_gen_cn = 7 if  `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 4.4.11.11    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (14 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 4.4.12.12    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (6 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 4.4.15.15    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 4.6.01.01     ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (19 changes) 
replace mig_gen_cn = 4 if  `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 4.6.09.09    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 4.6.11.11    ForForMisBirthMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.2.01.01     ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (26 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 5.2.02.02    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (2 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 5.2.11.11    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (40 changes) 
replace mig_gen_cn = 12 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.2.11.15    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (2 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 5.2.13.13    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeForeGermMiss  &  grandsCorForeForeGermMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeForeGermMiss' & `grandsCorForeForeGermMiss'

// 3.3.3.1.3 - 5.2.15.03    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 5.2.15.11    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.2.15.15    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (5 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 5.3.01.01     ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (26 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 5.3.02.02    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 5.3.03.03    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 5.3.11.11    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.4.01.01     ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 7 if  `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 5.4.09.09    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 5.4.09.10    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeMiss'

// 3.3.3.1.3 - 5.4.10.09    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeFore, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 5.4.10.10    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.3.3.1.3 - 5.5.01.01     ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (212 changes) 
replace mig_gen_cn = 6 if  `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 5.5.02.02    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (4 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 5.5.03.02    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissMissGerm, (4 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 5.5.03.03    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (14 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.1.3 - 5.5.03.15    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeMissMissGerm, (6 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 5.5.11.11    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (50 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.5.12.02    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorMissMissMissGerm, (3 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorMissMissMissGerm'

// 3.3.3.1.3 - 5.5.12.12    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (10 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 5.5.13.13    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeForeGermMiss  &  grandsCorForeForeGermMiss, (1 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeForeGermMiss' & `grandsCorForeForeGermMiss'

// 3.3.3.1.3 - 5.5.15.15    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 6 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 5.6.01.01     ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (83 changes) 
replace mig_gen_cn = 6 if  `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 5.6.02.01     ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 5.6.02.12    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 5.6.03.11    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissGermGerm  &  grandsCorForeForeMissMiss, (21 changes) 
replace mig_gen_cn = 5 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissGermGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.6.11.11    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 5.6.12.12    ForForMisBirthMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (4 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 6.1.01.01     ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (32 changes) 
replace mig_gen_cn = 4 if  `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 6.2.01.01     ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (8 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 6.2.09.09    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (3 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 6.2.11.11    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (34 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 6.2.11.15    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 6.2.12.12    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanGerman  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 13 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanGerman' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 6.3.01.01     ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 13 if  `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 6.3.11.11    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinGerman  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (4 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinGerman' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 6.4.01.01     ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 4 if  `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 6.4.11.11    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (5 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 6.5.01.01     ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (39 changes) 
replace mig_gen_cn = 6 if  `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 6.5.09.09    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (2 changes) 
replace mig_gen_cn = 5 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 6.5.09.10    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeMiss, (1 changes) 
replace mig_gen_cn = 5 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeMiss'

// 3.3.3.1.3 - 6.5.10.09    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 5 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 6.5.10.10    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (1 changes) 
replace mig_gen_cn = 5 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.3.3.1.3 - 6.5.11.11    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (141 changes) 
replace mig_gen_cn = 5 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 6.5.12.12    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (14 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 6.5.15.11    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeForeMissMiss, (3 changes) 
replace mig_gen_cn = 7 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 6.6.01.01     ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1146 changes) 
replace mig_gen_cn = 4 if  `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.1.3 - 6.6.02.12    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (3 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 6.6.09.09    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (13 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.3.1.3 - 6.6.10.10    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeMiss  &  grandsCorForeForeForeMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeMiss' & `grandsCorForeForeForeMiss'

// 3.3.3.1.3 - 6.6.11.11    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (373 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.1.3 - 6.6.11.12    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissMiss, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 6.6.11.15    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissGerm, (1 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissGerm'

// 3.3.3.1.3 - 6.6.12.12    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (38 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.1.3 - 6.6.15.15    ForForMisBirthMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissGerm  &  grandsCorForeMissMissGerm, (2 changes) 
replace mig_gen_cn = 4 if `ForForMisBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

// 3.3.3.2.1 - 1.1.01.01    ForForMisMigraEarly  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (40 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 2.5.01.01     ForForMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 2.6.01.01     ForForMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (79 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 2.6.02.12    ForForMisMigraEarly  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissGerm  &  grandsCorForeMissMissMiss, (5 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissGerm' & `grandsCorForeMissMissMiss'

// 3.3.3.2.1 - 3.4.01.01     ForForMisMigraEarly  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (7 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 4.4.01.01     ForForMisMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (18 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 4.4.11.11    ForForMisMigraEarly  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (1 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.2.1 - 4.6.01.01     ForForMisMigraEarly  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 5.4.01.01     ForForMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 5.5.01.01     ForForMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (13 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 5.5.02.02    ForForMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (2 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.2.1 - 5.5.03.03    ForForMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissGermGerm  &  grandsCorMissMissGermGerm, (1 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'

// 3.3.3.2.1 - 5.6.01.01     ForForMisMigraEarly  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (9 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 6.1.01.01     ForForMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 6.6.01.01     ForForMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (280 changes) 
replace mig_gen_cn = 2 if  `ForForMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.1 - 6.6.11.11    ForForMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeForeMissMiss, (6 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeForeMissMiss'

// 3.3.3.2.1 - 6.6.11.12    ForForMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.2.1 - 6.6.12.12    ForForMisMigraEarly  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (3 changes) 
replace mig_gen_cn = 2 if `ForForMisMigraEarly' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.2.2 - 1.1.01.01    ForForMisMigraLate  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2156 changes) 
replace mig_gen_cn = 1 if `ForForMisMigraLate' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 2.5.01.01     ForForMisMigraLate  &  parentsNatGermanGerman  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 2.6.01.01     ForForMisMigraLate  &  parentsNatGermanGerman  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (15 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatGermanGerman' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 3.4.01.01     ForForMisMigraLate  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (3 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 4.4.01.01     ForForMisMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (68 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 4.4.12.12    ForForMisMigraLate  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if `ForForMisMigraLate' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.2.2 - 4.6.01.01     ForForMisMigraLate  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (12 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 5.4.01.01     ForForMisMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (17 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 5.4.12.12    ForForMisMigraLate  &  parentsNatGermanForeig  &  parentsCorMissinForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if `ForForMisMigraLate' & `parentsNatGermanForeig' & `parentsCorMissinForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.2.2 - 5.5.01.01     ForForMisMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (6 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 5.5.02.02    ForForMisMigraLate  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissGerm  &  grandsCorMissMissMissGerm, (1 changes) 
replace mig_gen_cn = 1 if `ForForMisMigraLate' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

// 3.3.3.2.2 - 5.6.01.01     ForForMisMigraLate  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (10 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 6.1.01.01     ForForMisMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (67 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 6.4.01.01     ForForMisMigraLate  &  parentsNatForeigForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (4 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatForeigForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 6.5.01.01     ForForMisMigraLate  &  parentsNatForeigForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatForeigForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 6.6.01.01     ForForMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (378 changes) 
replace mig_gen_cn = 1 if  `ForForMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.2 - 6.6.09.09    ForForMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeForeForeFore  &  grandsCorForeForeForeFore, (1 changes) 
replace mig_gen_cn = 1 if `ForForMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeForeForeFore' & `grandsCorForeForeForeFore'

// 3.3.3.2.2 - 6.6.12.12    ForForMisMigraLate  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatForeMissMissMiss  &  grandsCorForeMissMissMiss, (10 changes) 
replace mig_gen_cn = 1 if `ForForMisMigraLate' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatForeMissMissMiss' & `grandsCorForeMissMissMiss'

// 3.3.3.2.3 - 1.1.01.01    ForForMisMigraMiss  &  parentsNatMissinMissin  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (229 changes) 
replace mig_gen_cn = 3 if `ForForMisMigraMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 2.2.01.01     ForForMisMigraMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 2.2.05.05    ForForMisMigraMiss  &  parentsNatGermanGerman  &  parentsCorGermanGerman  &  grandsNatGermGermGermGerm  &  grandsCorGermGermGermGerm, (1 changes) 
replace mig_gen_cn = 3 if `ForForMisMigraMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

// 3.3.3.2.3 - 3.4.01.01     ForForMisMigraMiss  &  parentsNatMissinGerman  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatMissinGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 4.4.01.01     ForForMisMigraMiss  &  parentsNatMissinForeig  &  parentsCorMissinForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (5 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatMissinForeig' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 4.6.01.01     ForForMisMigraMiss  &  parentsNatMissinForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatMissinForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 5.5.01.01     ForForMisMigraMiss  &  parentsNatGermanForeig  &  parentsCorGermanForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (2 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 5.6.01.01     ForForMisMigraMiss  &  parentsNatGermanForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatGermanForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 6.1.01.01     ForForMisMigraMiss  &  parentsNatForeigForeig  &  parentsCorMissinMissin  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (1 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatForeigForeig' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

// 3.3.3.2.3 - 6.6.01.01     ForForMisMigraMiss  &  parentsNatForeigForeig  &  parentsCorForeigForeig  &  grandsNatMissMissMissMiss  &  grandsCorMissMissMissMiss, (30 changes) 
replace mig_gen_cn = 3 if  `ForForMisMigraMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'
