#define DEBUG		false

//Constants
#define VIEWDISTANCE		2000
#define SPAWNRANGE 			500
#define WEP_DESPAWN_RANGE	100

//Misc Functions
// getDirTo - vector of X towards Y in degrees while Y can be either a position or an object; 
// if X is in the East of Y, vector is from 0.01° to 179.99° and if on the West it's from -0.01° to -179.99° (N is 0°, S is 180°)
#define getDirTo(X,Y)       (((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 0) - (getPosATL X select 0)) atan2 ((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 1) - (getPosATL X select 1)))  

//Params
if (isNil "paramsArray") then {
    if (isClass (missionConfigFile/"Params")) then {
        for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
            _paramName = configName ((missionConfigFile >> "Params") select _i);
            missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
        };
    };
} else {
    for "_i" from 0 to (count paramsArray - 1) do {
        missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
    };
}; 

#define startLocation       (if(isDead(MHQ))then{HQ}else{MHQ})
#define startPos            (getPosATL baseSpawn)
#define livesLeft           (startLives - westDeaths)

//AI
#define infDeleteTime		30

//String Functions
#define squadNumber(X)      call compile toString[toArray(str X) select 7]
#define squadString(X)      ("Hitman1" + str squadNumber(X))
#define squadUnitStrings(X)	[X+"1",X+"2",X+"3",X+"4",X+"5"]
#define unitNumber(X)		call compile toString[toArray(str X) select (count toArray(str X) - 1)]
#define vehicleSquad(X)     (call compile ("Hitman1" + str unitNumber(X)))
#define getName(X)          (playerNames select (westPlayerStrings find str X))
#define squadLeader(X)      (squadString(X)+"1")

// these macros do NOT return the actual name of the unit - these are only for text references
#define squadVictor(X)      ("Victor-1-" + str squadNumber(X))
#define vehicleID(X)		("Hitman-1-" + str unitNumber(X))
#define squadID(X)          ("Hitman-1-" + str squadNumber(X))
#define unitID(X)           ("Hitman-1-" + str squadNumber(X) + "-" + str unitNumber(X))

#define victorID(X)         (\
if(typeOf X == ATVTYPE)then{"ATV-1-" + str unitNumber(X)}else{\
if(typeOf X == HELITYPE)then{"Heli"}else{\
if(typeOf X == MHQTYPE)then{"MHQ"}else{\
"Victor-1-" + str unitNumber(X)}}})

#define IEDList             ["BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4"]
#define cacheType 			"HLC_FAL_ammobox"
#define ammoBoxType			"HLC_AK_ammobox"
// define westVehicles 		[humv11,humv12,humv13,humv14,humv15,humv16,atv11,atv12,atv13,atv14,atv15,heli,MHQ]
#define westVehicles 		[]
// define westVehicleStrings	["humv11","humv12","humv13","humv14","humv15","humv16","atv11","atv12","atv13","atv14","atv15","heli","MHQ"]
#define westVehicleStrings	[]
#define westPlayerStrings	["UnitNATO_PLT","UnitNATO_PLT_M","UnitNATO_PSG","UnitNATO_PLT_FO","UnitNATO_ASL_SL","UnitNATO_ASL_M","UnitNATO_A1_FTL","UnitNATO_A1_AR","UnitNATO_A1_AAR","UnitNATO_A1_AT","UnitNATO_A2_FTL","UnitNATO_A2_AR","UnitNATO_A2_AAR","UnitNATO_A2_AT","UnitNATO_A3_FTL","UnitNATO_A3_AR","UnitNATO_A3_AAR","UnitNATO_A3_AT","UnitNATO_BSL_SL","UnitNATO_BSL_M","UnitNATO_B1_FTL","UnitNATO_B1_AR","UnitNATO_B1_AAR","UnitNATO_B1_AT","UnitNATO_B2_FTL","UnitNATO_B2_AR","UnitNATO_B2_AAR","UnitNATO_B2_AT","UnitNATO_B3_FTL","UnitNATO_B3_AR","UnitNATO_B3_AAR","UnitNATO_B3_AT","UnitNATO_CSL_SL","UnitNATO_CSL_M","UnitNATO_C1_FTL","UnitNATO_C1_AR","UnitNATO_C1_AAR","UnitNATO_C1_AT","UnitNATO_C2_FTL","UnitNATO_C2_AR","UnitNATO_C2_AAR","UnitNATO_C2_AT","UnitNATO_C3_FTL","UnitNATO_C3_AR","UnitNATO_C3_AAR","UnitNATO_C3_AT","UnitNATO_TH1_P","UnitNATO_TH1_CP","UnitNATO_TH1_G1","UnitNATO_TH1_G2","UnitNATO_TH2_P","UnitNATO_TH2_CP","UnitNATO_TH2_G1","UnitNATO_TH2_G2","UnitNATO_AH1_P","UnitNATO_AH1_CP","UnitNATO_FW1_P","UnitNATO_IFV1_C","UnitNATO_IFV1_G","UnitNATO_IFV1_D","UnitNATO_IFV2_C","UnitNATO_IFV2_G","UnitNATO_IFV2_D","UnitNATO_APC1_C","UnitNATO_APC1_G","UnitNATO_APC1_D","UnitNATO_APC2_C","UnitNATO_APC2_G","UnitNATO_APC2_D","UnitNATO_TNK1_C","UnitNATO_TNK1_G","UnitNATO_TNK1_D","UnitNATO_MMG1_AG","UnitNATO_MMG1_G","UnitNATO_HMG1_AG","UnitNATO_HMG1_G","UnitNATO_MAT1_AG","UnitNATO_MAT1_G","UnitNATO_HAT1_AG","UnitNATO_HAT1_G","UnitNATO_MTR1_AG","UnitNATO_MTR1_G","UnitNATO_MSAM1_AG","UnitNATO_MSAM1_G","UnitNATO_HSAM1_AG","UnitNATO_HSAM1_G","UnitNATO_ST1_SP","UnitNATO_ST1_SN","UnitNATO_ENG1_FTL","UnitNATO_ENG1_A1","UnitNATO_ENG1_A2","UnitNATO_ENG1_A3"]
#define eastPlayerStrings   ["east1","east2","east3","east4"]
#define westAllClasses		(westSoldierClasses + westVehicleClasses)
#define eastStationaryGuns	["LOP_ChDKZ_NSV_TriPod"]
#define eastVclClasses		["LOP_ChDKZ_BMP1","LOP_ChDKZ_Ural_open","LOP_ChDKZ_Ural","LOP_ChDKZ_UAZ_Open","LOP_ChDKZ_UAZ","LOP_ChDKZ_BM21","LOP_ChDKZ_ZSU234","LOP_ChDKZ_BTR70","LOP_ChDKZ_BTR60","LOP_ChDKZ_BMP2D","LOP_ChDKZ_BMP2","LOP_ChDKZ_BMP1D"]
#define eastRanks			["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE"] 
#define eastInfClasses		["LOP_ChDKZ_Infantry_TL","LOP_ChDKZ_Infantry_SL","LOP_ChDKZ_Infantry_Rifleman","LOP_ChDKZ_Infantry_Marksman","LOP_ChDKZ_Infantry_MG","LOP_ChDKZ_Infantry_GL","LOP_ChDKZ_Infantry_Engineer","LOP_ChDKZ_Infantry_Corpsman","LOP_ChDKZ_Infantry_Commander","LOP_ChDKZ_Infantry_Bardak","LOP_ChDKZ_Infantry_AT"]

#define eastAllClasses      (eastInfClasses + eastStationaryGuns + eastVclClasses)

//////class definitions						//Change vehicles, Helis to ACE
#define westVehicleClasses  	["hilux1_civil_3_open_EP1","MMT_Civ","M1030_US_DES_EP1","ACE_HMMWV_M2_USARMY","ACE_HMMWV_MK19_USARMY","HMMWV_Ambulance_DES_EP1","Lada2_TK_CIV_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","M1126_ICV_mk19_EP1","M1126_ICV_M2_EP1","CH_47F_EP1","UH1Y","ACE_MH6","BAF_Merlin_HC3_D","AW159_Lynx_BAF","MV22","ACE_UH60M","HMMWV_M1151_M2_DES_EP1","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","LandRover_CZ_EP1","LandRover_Special_CZ_EP1","BAF_Offroad_D","ArmoredSUV_PMC","SUV_PMC","SUV_PMC_BAF","HMMWV_M998A2_SOV_DES_EP1","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","LandRover_Special_CZ_EP1","BAF_Offroad_D","ArmoredSUV_PMC","SUV_PMC","ACE_ATV_Honda_Desert"]
#define westSoldierClasses 		["B_soldier_AAA_F","B_support_Mort_F","B_support_AMort_F","B_support_MG_F","B_support_AMG_F","B_Soldier_A_F","B_crew_F","B_Pilot_F","B_helicrew_F","B_soldier_repair_F","B_Helipilot_F","B_Soldier_LAT_F","B_Soldier_AAR_F","B_soldier_AR_F","B_Soldier_TL_F","B_Soldier_F","B_Soldier_SL_F","B_medic_F","B_officer_F","B_soldier_AA_F","B_spotter_F","B_sniper_F","B_engineer_F"]

//////unit definitions
#define ATVTYPE         (\
if(INS_ATVType1 == 1)then{"ACE_ATV_Honda_Desert"}else{\
if(INS_ATVType1 == 2)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_ATVType1 == 3)then{"LandRover_CZ_EP1"}else{\
if(INS_ATVType1 == 4)then{"Lada2_TK_CIV_EP1"}else{\
if(INS_ATVType1 == 5)then{"M1030_US_DES_EP1"}else{\
if(INS_ATVType1 == 6)then{"BAF_Offroad_D"}else{\
if(INS_ATVType1 == 7)then{"MMT_Civ"}else{\
if(INS_ATVType1 == 8)then{"SUV_PMC"}else{\
if(INS_ATVType1 == 10)then{"hilux1_civil_3_open_EP1"}else{\
"SUV_PMC_BAF"}}}}}}}}})

#define HELITYPE         (\
if(INS_AdvanceType == 1)then{"ACE_MH6"}else{\
if(INS_AdvanceType == 2)then{"UH1Y"}else{\
if(INS_AdvanceType == 3)then{"CH_47F_EP1"}else{\
if(INS_AdvanceType == 4)then{"BAF_Merlin_HC3_D"}else{\
if(INS_AdvanceType == 5)then{"AW159_Lynx_BAF"}else{\
if(INS_AdvanceType == 6)then{"MV22"}else{\
"ACE_UH60M"}}}}}})

	#define PILOTTYPE          "US_Soldier_Pilot_EP1"
	
	#define CAR1TYPE         (\
if(INS_CarType1 == 1)then{"HMMWV_M1151_M2_DES_EP1"}else{\
if(INS_CarType1 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType1 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType1 == 4)then{"ACE_HMMWV_M2_USARMY"}else{\
if(INS_CarType1 == 5)then{"LandRover_Special_CZ_EP1"}else{\
if(INS_CarType1 == 6)then{"BAF_Offroad_D"}else{\
if(INS_CarType1 == 7)then{"ArmoredSUV_PMC"}else{\
if(INS_CarType1 == 8)then{"SUV_PMC"}else{\
"SUV_PMC_BAF"}}}}}}}})

	#define CAR2TYPE         (\
if(INS_CarType2 == 1)then{"HMMWV_M998A2_SOV_DES_EP1"}else{\
if(INS_CarType2 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType2 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType2 == 4)then{"ACE_HMMWV_MK19_USARMY"}else{\
if(INS_CarType2 == 5)then{"LandRover_Special_CZ_EP1"}else{\
if(INS_CarType2 == 6)then{"BAF_Offroad_D"}else{\
if(INS_CarType2 == 7)then{"ArmoredSUV_PMC"}else{\
if(INS_CarType2 == 8)then{"SUV_PMC"}else{\
"SUV_PMC_BAF"}}}}}}}})

	#define MHQTYPE            "RHS_M6_wd"

#define humvMagazines []

#define humvItems []

#define heliMagazines []

#define heliItems []
