* Person - migback, corigin, nation, deu_seit, germborn, migage, biimgrp
local personCoriginGerman 	( migback == 1 )
local personCoriginMissing	( migback == . )
local personCoriginForeign	( migback > 1 & !mi(migback) )

local personNationGerman	( nation == 1 )
local personNationMissing	( nation == . )
local personNationForeign	( nation > 1 & !mi(migback) )

local personDeuSeitGeb		( deu_seit == 1 )
local personDeuSeitEin		( deu_seit == 0 )
local personDeuSeitMis		( deu_seit == . )

local personInGermBirth		( germborn == 1 )
local personInGermMigra		( germborn == 2 )
local personInGermMissi		( germborn == 3 )

local personMigAgeEarly		( migage <= 6 )
local personMigAgeLate		( migage > 6 & !mi(migage) )
local personMigAgeMiss		( migage == . )

* Eltern Nationalitaet - mnat, vnat, nation_m, nation_f - missing, German, Foreign - father, mother
local parentsNatMissinMissin	(  mnat == . & vnat == .   &   nation_m == . & nation_f == . )
local parentsNatGermanGerman	(( mnat == 1 & vnat == 1 ) |                            ( nation_m == 1 & nation_f == 1 ))
local parentsNatMissinGerman	(( mnat == . & vnat == 1 ) | ( mnat == 1 & vnat == .) | ( nation_m == . & nation_f == 1 ) | ( nation_m == 1 & nation_f == . ))
local parentsNatMissinForeig    (( mnat == . & vnat >  1 & !mi(vnat)) | ( mnat > 1 & !mi(mnat) & vnat == . ) | ( nation_m == . & nation_f > 1 & !mi(nation_f) ) | ( nation_m > 1 & !mi(nation_m) & nation_f == .))
local parentsNatGermanForeig    (( mnat == . & vnat >  1 & !mi(vnat)) | ( mnat > 1 & !mi(mnat) & vnat == 1 ) | ( nation_m == 1 & nation_f > 1 & !mi(nation_f) ) | ( nation_m > 1 & !mi(nation_m) & nation_f == 1))
local parentsNatForeigForeig	(( mnat >  1 & !mi(mnat) & vnat > 1 & !mi(vnat) ) | ( nation_m > 1 & !mi(nation_m) & nation_f > 1 & !mi(nation_f) ))

* Eltern Corigin - corigin_m, corigin_f, corigin_m2, corigin_f2 -> kann ignoriert werden, da die zweite Corigin nicht von der 1. abweicht
local parentsCorMissinMissin	( corigin_m == . & corigin_f == . )
local parentsCorGermanGerman    ( corigin_m == 1 & corigin_f == 1 )
local parentsCorMissinGerman    (( corigin_m == . & corigin_f == 1 ) | (corigin_m == 1 & corigin_f == .))
local parentsCorMissinForeig	(( corigin_m == . & corigin_f > 1 & corigin_f != . ) | ( corigin_m > 1 & corigin_m != . & corigin_f == . ))
local parentsCorGermanForeig	(( corigin_m == 1 & corigin_f > 1 & corigin_f != . ) | ( corigin_m > 1 & corigin_m != . & corigin_f == 1 ))
local parentsCorForeigForeig	( corigin_m > 1 & corigin_m != . & corigin_f > 1 & corigin_f != . )

* Grosseltern Nationalitaet - nation_m_m, nation_m_f, nation_f_f, nation_f_m
local grandsNatMissMissMissMiss	( nation_m_m == . & nation_m_f == . & nation_f_f == . & nation_f_m == . )
local grandsNatMissMissMissGerm	(( nation_m_m == 1 & nation_m_f == . & nation_f_f == . & nation_f_m == . ) | ( nation_m_m == . & nation_m_f == 1 & nation_f_f == . & nation_f_m == . ) | ( nation_m_m == . & nation_m_f == . & nation_f_f == 1 & nation_f_m == . ) | ( nation_m_m == . & nation_m_f == . & nation_f_f == . & nation_f_m == 1 ))
local grandsNatMissMissGermGerm (( nation_m_m == 1 & nation_m_f == 1 & nation_f_f == . & nation_f_m == . ) | ( nation_m_m == 1 & nation_m_f == . & nation_f_f == 1 & nation_f_m == . ) | ( nation_m_m == 1 & nation_m_f == . & nation_f_f == 1 & nation_f_m == 1 ) | ( nation_m_m == . & nation_m_f == 1 & nation_f_f == 1 & nation_f_m == . ) | ( nation_m_m == . & nation_m_f == 1 & nation_f_f == . & nation_f_m == 1 ) | ( nation_m_m == . & nation_m_f == . & nation_f_f == 1 & nation_f_m == 1 ))
local grandsNatMissGermGermGerm (( nation_m_m == 1 & nation_m_f == 1 & nation_f_f == 1 & nation_f_m == . ) | ( nation_m_m == 1 & nation_m_f == 1 & nation_f_f == . & nation_f_m == 1 ) | ( nation_m_m == 1 & nation_m_f == . & nation_f_f == 1 & nation_f_m == 1 ) | ( nation_m_m == . & nation_m_f == 1 & nation_f_f == 1 & nation_f_m == 1 ))

local grandsNatGermGermGermGerm ( nation_m_m == 1 & nation_m_f == 1 & nation_f_f == 1 & nation_f_m == 1 )
local grandsNatGermGermGermFore (( nation_m_m == 1 & nation_m_f == 1 & nation_f_f == 1 & nation_f_m >  1 & !mi(nation_f_m) ) | ( nation_m_m == 1 & nation_m_f == 1 & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == 1 ) | ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m == 1 ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == 1 & nation_f_f == 1 & nation_f_m == 1 ))
local grandsNatGermGermForeFore (( nation_m_m == 1 & nation_m_f == 1 & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m >  1 & !mi(nation_f_m) ) | ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m > 1 & !mi(nation_f_m) ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == 1 & nation_f_f == 1 & nation_f_m > 1 & !mi(nation_f_m)) | ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == 1 ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == 1 & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == 1 ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m == 1 ))
local grandsNatGermForeForeFore (( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == 1 ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m > 1 & !mi(nation_f_m)) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == 1 & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m > 1 & !mi(nation_f_m)) | ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m > 1 & !mi(nation_f_m)))

local grandsNatForeForeForeFore (( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & nation_f_m > 1 & !mi(nation_f_m) ))
local grandsNatForeForeForeMiss (( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == . ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m > 1 & !mi(nation_f_m)) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == . & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m > 1 & !mi(nation_f_m)) | ( nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m > 1 & !mi(nation_f_m)))
local grandsNatForeForeMissMiss (( nation_m_m == . & nation_m_f == . & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m >  1 & !mi(nation_f_m) ) | ( nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m > 1 & !mi(nation_f_m) ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == . & nation_f_f == . & nation_f_m > 1 & !mi(nation_f_m)) | ( nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == . ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == . & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == . ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m == . ))
local grandsNatForeMissMissMiss (( nation_m_m == . & nation_m_f == . & nation_f_f == . & nation_f_m >  1 & !mi(nation_f_m) ) | ( nation_m_m == . & nation_m_f == . & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == . ) | ( nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m == . ) | ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == . & nation_f_f == . & nation_f_m == . ))

local grandsNatForeForeGermMiss ((nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f)& nation_f_f == 1  & nation_f_m == . ) | /// //FFGM
			        ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f > 1 & !mi(nation_m_f)& nation_f_f == .  & nation_f_m == 1 ) | /// //FFMG
			        ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==. & nation_f_f > 1 & !mi(nation_f_f)  & nation_f_m == 1 ) | /// //FMFG
			        ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==1 & nation_f_f > 1 & !mi(nation_f_f)  & nation_f_m == . ) | /// //FGFM
			        ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==1 & nation_f_f ==. & nation_f_m > 1   & !mi(nation_f_m) ) | /// //FGMF
			        ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==. & nation_f_f ==1 & nation_f_m > 1   & !mi(nation_f_m) ) | /// //FMGF
			        ( nation_m_m ==. & nation_m_f > 1  & !mi(nation_m_f)& nation_f_f > 1 & !mi(nation_f_f)  & nation_f_m == 1 ) | /// //MFFG
			        ( nation_m_m ==. & nation_m_f > 1  & !mi(nation_m_f)& nation_f_f ==1 & nation_f_m > 1   & !mi(nation_f_m) ) | /// //MFGF
			        ( nation_m_m ==. & nation_m_f == 1 & nation_f_f > 1 & !mi(nation_f_f)& nation_f_m > 1   & !mi(nation_f_m) ) | /// //MGFF
			        ( nation_m_m ==1 & nation_m_f > 1  & !mi(nation_m_f) & nation_f_f > 1 & !mi(nation_f_f) & nation_f_m == . ) | /// //GFFM
			        ( nation_m_m ==1 & nation_m_f > 1  & !mi(nation_m_f) & nation_f_f ==. & nation_f_m > 1  & !mi(nation_f_m) ) | /// //GFMF
			        ( nation_m_m ==1 & nation_m_f == . & nation_f_f > 1 & !mi(nation_f_f)& nation_f_m > 1   & !mi(nation_f_m) ))  /// //GMFF

local grandsNatForeGermGermMiss ((nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m == 1 ) |  /// //MFGG
                                ( nation_m_m == . & nation_m_f ==1 & nation_f_f > 1  & !mi(nation_f_f) & nation_f_m == 1 ) |  /// //MGFG
                                ( nation_m_m == . & nation_m_f ==1 & nation_f_f ==1  & nation_f_m > 1  & !mi(nation_f_m) ) |  /// //MGGF
                                ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==1 & nation_f_f ==1   & nation_f_m == . ) |  /// //FGGM
                                ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==1 & nation_f_f ==.   & nation_f_m == 1 ) |  /// //FGMG
                                ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==. & nation_f_f ==1   & nation_f_m == 1 ) |  /// //FMGG
                                ( nation_m_m == 1 & nation_m_f ==1 & nation_f_f ==. & nation_f_m > 1   & !mi(nation_f_m) ) |  /// //GGMF
                                ( nation_m_m == 1 & nation_m_f ==. & nation_f_f ==1 & nation_f_m > 1   & !mi(nation_f_m) ) |  /// //GMGF
                                ( nation_m_m == 1 & nation_m_f ==. & nation_f_f > 1  & !mi(nation_f_f) & nation_f_m == 1 ) |  /// //GMFG
			        ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m == 1 ) |  /// //GFMG
			        ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m == . ) |  /// //GFGM
                                ( nation_m_m == 1 & nation_m_f ==1 & nation_f_f > 1  & !mi(nation_f_f) & nation_f_m == . ))   /// //GGFM

local grandsNatForeMissMissGerm ((nation_m_m > 1 & !mi(nation_m_m) & nation_m_f == . & nation_f_f == . & nation_f_m == 1 ) |  /// //FMMG
                                ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==. & nation_f_f == 1  & nation_f_m == . ) |  /// //FMGM
                                ( nation_m_m > 1 & !mi(nation_m_m) & nation_m_f ==1 & nation_f_f == .  & nation_f_m == . ) |  /// //FGMM
                                ( nation_m_m == 1 & nation_m_f ==. & nation_f_f ==. & nation_f_m > 1   & !mi(nation_f_m) ) |  /// //GMMF
                                ( nation_m_m == 1 & nation_m_f ==. & nation_f_f > 1  & !mi(nation_f_f) & nation_f_m == . ) |  /// //GMFM
			        ( nation_m_m == 1 & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m == . ) |  /// //GFMM
                                ( nation_m_m == . & nation_m_f ==. & nation_f_f > 1  & !mi(nation_f_f) & nation_f_m == 1 ) |  /// //MMFG
                                ( nation_m_m == . & nation_m_f ==. & nation_f_f ==1 & nation_f_m > 1   & !mi(nation_f_m) ) |  /// //MMGF
                                ( nation_m_m == . & nation_m_f ==1 & nation_f_f ==. & nation_f_m > 1   & !mi(nation_f_m) ) |  /// //MGMF
			        ( nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == . & nation_f_m == 1 ) |  /// //MFMG
			        ( nation_m_m == . & nation_m_f > 1 & !mi(nation_m_f) & nation_f_f == 1 & nation_f_m == . ) |  /// //MFGM
                                ( nation_m_m == . & nation_m_f ==1 & nation_f_f > 1  & !mi(nation_f_f) & nation_f_m == . ))   /// //MGFM

* Grosseltern Corigin - corigin_m_m, corigin_m_f, corigin_f_m, corigin_f_f
local grandsCorMissMissMissMiss	( corigin_m_m == . & corigin_m_f == . & corigin_f_f == . & corigin_f_m == . )
local grandsCorMissMissMissGerm	(( corigin_m_m == 1 & corigin_m_f == . & corigin_f_f == . & corigin_f_m == . ) | ( corigin_m_m == . & corigin_m_f == 1 & corigin_f_f == . & corigin_f_m == . ) | ( corigin_m_m == . & corigin_m_f == . & corigin_f_f == 1 & corigin_f_m == . ) | ( corigin_m_m == . & corigin_m_f == . & corigin_f_f == . & corigin_f_m == 1 ))
local grandsCorMissMissGermGerm (( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f == . & corigin_f_m == . ) | ( corigin_m_m == 1 & corigin_m_f == . & corigin_f_f == 1 & corigin_f_m == . ) | ( corigin_m_m == 1 & corigin_m_f == . & corigin_f_f == 1 & corigin_f_m == 1 ) | ( corigin_m_m == . & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m == . ) | ( corigin_m_m == . & corigin_m_f == 1 & corigin_f_f == . & corigin_f_m == 1 ) | ( corigin_m_m == . & corigin_m_f == . & corigin_f_f == 1 & corigin_f_m == 1 ))
local grandsCorMissGermGermGerm (( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m == . ) | ( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f == . & corigin_f_m == 1 ) | ( corigin_m_m == 1 & corigin_m_f == . & corigin_f_f == 1 & corigin_f_m == 1 ) | ( corigin_m_m == . & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m == 1 ))

local grandsCorGermGermGermGerm ( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m == 1 )
local grandsCorGermGermGermFore (( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m >  1 & !mi(corigin_f_m) ) | ( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == 1 ) | ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m == 1 ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m == 1 ))
local grandsCorGermGermForeFore (( corigin_m_m == 1 & corigin_m_f == 1 & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m >  1 & !mi(corigin_f_m) ) | ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m > 1 & !mi(corigin_f_m) ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == 1 & corigin_f_f == 1 & corigin_f_m > 1 & !mi(corigin_f_m)) | ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == 1 ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == 1 & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == 1 ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m == 1 ))
local grandsCorGermForeForeFore (( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == 1 ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m > 1 & !mi(corigin_f_m)) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == 1 & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m > 1 & !mi(corigin_f_m)) | ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m > 1 & !mi(corigin_f_m)))

local grandsCorForeForeForeFore (( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & corigin_f_m > 1 & !mi(corigin_f_m) ))
local grandsCorForeForeForeMiss (( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == . ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m > 1 & !mi(corigin_f_m)) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == . & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m > 1 & !mi(corigin_f_m)) | ( corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m > 1 & !mi(corigin_f_m)))
local grandsCorForeForeMissMiss (( corigin_m_m == . & corigin_m_f == . & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m >  1 & !mi(corigin_f_m) ) | ( corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m > 1 & !mi(corigin_f_m) ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == . & corigin_f_f == . & corigin_f_m > 1 & !mi(corigin_f_m)) | ( corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == . ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == . & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == . ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m == . ))
local grandsCorForeMissMissMiss (( corigin_m_m == . & corigin_m_f == . & corigin_f_f == . & corigin_f_m >  1 & !mi(corigin_f_m) ) | ( corigin_m_m == . & corigin_m_f == . & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == . ) | ( corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m == . ) | ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == . & corigin_f_f == . & corigin_f_m == . ))

local grandsCorForeForeGermMiss	((corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f)& corigin_f_f == 1  & corigin_f_m == . ) | /// //FFGM
			        ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f > 1 & !mi(corigin_m_f)& corigin_f_f == .  & corigin_f_m == 1 ) | /// //FFMG
			        ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==. & corigin_f_f > 1 & !mi(corigin_f_f)  & corigin_f_m == 1 ) | /// //FMFG
			        ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==1 & corigin_f_f > 1 & !mi(corigin_f_f)  & corigin_f_m == . ) | /// //FGFM
			        ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==1 & corigin_f_f ==. & corigin_f_m > 1   & !mi(corigin_f_m) ) | /// //FGMF
			        ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==. & corigin_f_f ==1 & corigin_f_m > 1   & !mi(corigin_f_m) ) | /// //FMGF
			        ( corigin_m_m ==. & corigin_m_f > 1  & !mi(corigin_m_f)& corigin_f_f > 1 & !mi(corigin_f_f)  & corigin_f_m == 1 ) | /// //MFFG
			        ( corigin_m_m ==. & corigin_m_f > 1  & !mi(corigin_m_f)& corigin_f_f ==1 & corigin_f_m > 1   & !mi(corigin_f_m) ) | /// //MFGF
			        ( corigin_m_m ==. & corigin_m_f == 1 & corigin_f_f > 1 & !mi(corigin_f_f)& corigin_f_m > 1   & !mi(corigin_f_m) ) | /// //MGFF
			        ( corigin_m_m ==1 & corigin_m_f > 1  & !mi(corigin_m_f) & corigin_f_f > 1 & !mi(corigin_f_f) & corigin_f_m == . ) | /// //GFFM
			        ( corigin_m_m ==1 & corigin_m_f > 1  & !mi(corigin_m_f) & corigin_f_f ==. & corigin_f_m > 1  & !mi(corigin_f_m) ) | /// //GFMF
			        ( corigin_m_m ==1 & corigin_m_f == . & corigin_f_f > 1 & !mi(corigin_f_f)& corigin_f_m > 1   & !mi(corigin_f_m) ))      //GMFF

local grandsCorForeGermGermMiss ((corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m == 1 ) | /// //MFGG
                                ( corigin_m_m == . & corigin_m_f ==1 & corigin_f_f > 1  & !mi(corigin_f_f) & corigin_f_m == 1 ) | /// //MGFG
                                ( corigin_m_m == . & corigin_m_f ==1 & corigin_f_f ==1  & corigin_f_m > 1  & !mi(corigin_f_m) ) | /// //MGGF
                                ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==1 & corigin_f_f ==1   & corigin_f_m == . ) | /// //FGGM
                                ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==1 & corigin_f_f ==.   & corigin_f_m == 1 ) | /// //FGMG
                                ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==. & corigin_f_f ==1   & corigin_f_m == 1 ) | /// //FMGG
                                ( corigin_m_m == 1 & corigin_m_f ==1 & corigin_f_f ==. & corigin_f_m > 1   & !mi(corigin_f_m) ) | /// //GGMF
                                ( corigin_m_m == 1 & corigin_m_f ==. & corigin_f_f ==1 & corigin_f_m > 1   & !mi(corigin_f_m) ) | /// //GMGF
                                ( corigin_m_m == 1 & corigin_m_f ==. & corigin_f_f > 1  & !mi(corigin_f_f) & corigin_f_m == 1 ) | /// //GMFG
			        ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m == 1 ) | /// //GFMG
			        ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m == . ) | /// //GFGM
                                ( corigin_m_m == 1 & corigin_m_f ==1 & corigin_f_f > 1  & !mi(corigin_f_f) & corigin_f_m == . ))      //GGFM

local grandsCorForeMissMissGerm ((corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f == . & corigin_f_f == . & corigin_f_m == 1 ) |  /// //FMMG
                                ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==. & corigin_f_f == 1  & corigin_f_m == . ) |  /// //FMGM
                                ( corigin_m_m > 1 & !mi(corigin_m_m) & corigin_m_f ==1 & corigin_f_f == .  & corigin_f_m == . ) |  /// //FGMM
                                ( corigin_m_m == 1 & corigin_m_f ==. & corigin_f_f ==. & corigin_f_m > 1   & !mi(corigin_f_m) ) |  /// //GMMF
                                ( corigin_m_m == 1 & corigin_m_f ==. & corigin_f_f > 1  & !mi(corigin_f_f) & corigin_f_m == . ) |  /// //GMFM
			        ( corigin_m_m == 1 & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m == . ) |  /// //GFMM
                                ( corigin_m_m == . & corigin_m_f ==. & corigin_f_f > 1  & !mi(corigin_f_f) & corigin_f_m == 1 ) |  /// //MMFG
                                ( corigin_m_m == . & corigin_m_f ==. & corigin_f_f ==1 & corigin_f_m > 1   & !mi(corigin_f_m) ) |  /// //MMGF
                                ( corigin_m_m == . & corigin_m_f ==1 & corigin_f_f ==. & corigin_f_m > 1   & !mi(corigin_f_m) ) |  /// //MGMF
			        ( corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == . & corigin_f_m == 1 ) |  /// //MFMG
			        ( corigin_m_m == . & corigin_m_f > 1 & !mi(corigin_m_f) & corigin_f_f == 1 & corigin_f_m == . ) |  /// //MFGM
                                ( corigin_m_m == . & corigin_m_f ==1 & corigin_f_f > 1  & !mi(corigin_f_f) & corigin_f_m == . ))       //MGFM
