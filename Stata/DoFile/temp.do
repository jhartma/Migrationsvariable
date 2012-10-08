* 1.1.1.1.3
* local GerGerGebBirthMiss  `personCoriginGerman' & `personNationGerman' & `personDeuSeitGeb' & `personInGermBirth' & `personMigAgeMiss'  // 1.1.1.1.3		27495

* 1.1.1 parentsNatMissinMissin, parentsCorMissinMissin, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 1.1.2. parentsNatMissinMissin, parentsCorMissinMissin, grandsNatMissMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinMissin' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

* 2.1.1 parentsNatGermanGerman, parentsCorMissinMissin, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 2.1.2. parentsNatGermanGerman, parentsCorMissinMissin, grandsNatMissMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

* 2.2.1 parentsNatGermanGerman, parentsCorGermanGerman, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 2.2.2. parentsNatGermanGerman, parentsCorGermanGerman, grandsNatMissMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

* 2.2.3 parentsNatGermanGerman, parentsCorGermanGerman, grandsNatMissMissGermGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissGermGerm'
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissGermGermGerm'
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

* 2.2.4 parentsNatGermanGerman, parentsCorGermanGerman, grandsNatMissGermGermGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatMissGermGermGerm' & `grandsCorMissMissGermGerm'

* 2.2.5 parentsNatGermanGerman, parentsCorGermanGerman, grandsNatGermGermGermGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatGermGermGermGerm' & `grandsCorGermGermGermGerm'

* 2.2.15 parentsNatGermanGerman, parentsCorGermanGerman, grandsNatForeMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanGerman' & `grandsNatForeMissMissGerm' & `grandsCorForeMissMissGerm'

* 2.3.1 parentsNatGermanGerman, parentsCorMissinGerman, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 2.3.2. parentsNatGermanGerman, parentsCorMissinGerman, grandsNatMissMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

* 2.3.3 parentsNatGermanGerman, parentsCorMissinGerman, grandsNatMissMissGermGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorMissMissMissGerm'

* 2.4.1 parentsNatGermanGerman, parentsCorMissinForeig, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorMissinForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 2.5.1 parentsNatGermanGerman, parentsCorGermanForeig, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 2.5.2. parentsNatGermanGerman, parentsCorGermanForeig, grandsNatMissMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissGerm'

* 3.1.1 parentsNatMissinGerman, parentsCorMissinMissin, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinMissin' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 3.3.1 parentsNatMissinGerman, parentsCorMissinGerman, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 3.3.2. parentsNatMissinGerman, parentsCorMissinGerman, grandsNatMissMissMissGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissMissGerm' & `grandsCorMissMissMissMiss'

* 3.3.3 parentsNatMissinGerman, parentsCorMissinGerman, grandsNatMissMissGermGerm, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorMissinGerman' & `grandsNatMissMissGermGerm' & `grandsCorForeMissMissGerm'

* 3.5.1 parentsNatMissinGerman, parentsCorGermanForeig, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatMissinGerman' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 5.5.1 parentsNatGermanForeig, parentsCorGermanForeig, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatGermanForeig' & `parentsCorGermanForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'

* 6.6.1 parentsNatForeigForeig, parentsCorForeigForeig, grandsNatMissMissMissMiss, grandsCor*
replace mig_gen_cn = 0 if `GerGerGebBirthMiss' & `parentsNatForeigForeig' & `parentsCorForeigForeig' & `grandsNatMissMissMissMiss' & `grandsCorMissMissMissMiss'
