
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
