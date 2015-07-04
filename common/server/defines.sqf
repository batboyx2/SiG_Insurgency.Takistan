//Vars
westDeaths = 0; 
publicVariable "westDeaths";

#define vclCrewClass		"LOP_ChDKZ_Infantry_Crewman"
#define staticClass			"LOP_ChDKZ_Infantry_Crewman"
#define eastVehiclesFreq	["LOP_ChDKZ_T72BA","LOP_ChDKZ_BTR70","LOP_ChDKZ_ZSU234","LOP_ChDKZ_BTR60","LOP_ChDKZ_BTR60","LOP_ChDKZ_BMP2","LOP_ChDKZ_BMP1","LOP_ChDKZ_Ural_open","LOP_ChDKZ_Ural_open","LOP_ChDKZ_Ural_open","LOP_ChDKZ_Ural","LOP_ChDKZ_Ural","LOP_ChDKZ_Ural","LOP_ChDKZ_UAZ_Open","LOP_ChDKZ_UAZ_Open","LOP_ChDKZ_UAZ_Open","LOP_ChDKZ_UAZ_Open","LOP_ChDKZ_UAZ","LOP_ChDKZ_UAZ","LOP_ChDKZ_UAZ","LOP_ChDKZ_UAZ"]
#define eastLightVehicles	["LOP_ChDKZ_UAZ","LOP_ChDKZ_Ural_open","LOP_ChDKZ_Ural","LOP_ChDKZ_UAZ_Open"]
#define stationaryGunsHigh 	["LOP_ChDKZ_NSV_TriPod"]
#define stationaryGunsMed	["LOP_ChDKZ_NSV_TriPod"]
#define stationaryGunsLow	["LOP_ChDKZ_NSV_TriPod"]
#define eastVclRspnTime		600
#define eastInfCount		(count(CENTERPOS nearObjects [eastInfClasses, AORADIUS]))
#define maxStaticGuns		5

//Markers
#define intelMarkerType		"hd_unknown"

//Misc
#define isEast(X)			(typeOf X in eastInfClasses)
#define isWest(X)			(typeOf X in westSoldierClasses)
