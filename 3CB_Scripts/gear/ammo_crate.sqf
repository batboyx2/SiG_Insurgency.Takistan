// ---------------------------------------------------------------------------------------------------------------------
// Class Specific Ammo Box Script by Jamie - Edited by Phantom of PhanTactical - Now includes more stuff, more options.
// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------
// Place this on ammo crate(s)
// _nul = this execVM "common\client\gear\ammo_crate.sqf";
// ---------------------------------------------------------------------------------------------------------------------


// Settings
_w			= 5;		// Amount of each weapon
_m			= 20;		// Amount of each magazine
_b			= 5;		// Amount of each backpack
_t			= 3600;		// Ammobox refill timer (seconds)


// Loop script so ammo box can be refilled after a certain time (_t)
while {alive _this} do
{

	sleep 5;
	// Remove the stock items from the crate
	clearMagazineCargo 	_this;
	clearWeaponCargo 	_this;

	/*
	// BAF Family
	_this addWeaponCargo ["BAF_L85A2_RIS_ACOG", _w];
	_this addWeaponCargo ["BAF_L85A2_RIS_CWS", _w];
	_this addWeaponCargo ["BAF_L85A2_RIS_Holo", _w];
	_this addWeaponCargo ["BAF_L85A2_RIS_SUSAT", _w];
	_this addWeaponCargo ["BAF_L85A2_UGL_ACOG", _w];
	_this addWeaponCargo ["BAF_L85A2_UGL_Holo", _w];
	_this addWeaponCargo ["BAF_L85A2_UGL_SUSAT", _w];
	_this addWeaponCargo ["BAF_L86A2_ACOG",_w];
	_this addWeaponCargo ["BAF_L110A1_Aim",_w];
	
	// M4A1 Family
	_this addWeaponCargo["ACE_M4", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_Aim", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_AIM_SD", _w];
	_this addWeaponCargo["ACE_M4A1_RCO2_GL_F", _w];
	_this addWeaponCargo["ACE_M4_RCO_GL_F", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_EOT_SD_F", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_SHORTDOT", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_SD_9", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_TWS", _w];
	_this addWeaponCargo["ACE_SOC_M4A1_SHORTDOT_SD", _w];
	
	// M16 Family
	_this addWeaponCargo["M16A4_ACG_GL", _w];
	_this addWeaponCargo["ACE_M16A4_CCO_GL", _w];
	_this addWeaponCargo["ACE_M16A4_EOT", _w];
	_this addWeaponCargo["ACE_M16A4_EOT_GL", _w];
	_this addWeaponCargo["ACE_M16A4_Iron", _w];
	_this addWeaponCargo["ACE_m16a2_scope", _w];
	
	// Mk16/Mk16 Family
	_this addWeaponCargo["ACE_SCAR_H_STD_Spect", _w];
	_this addWeaponCargo["SCAR_H_CQC_CCO", _w];
	_this addWeaponCargo["SCAR_H_CQC_CCO_SD", _w];
	_this addWeaponCargo["SCAR_H_STD_EGLM_Spect", _w];
	_this addWeaponCargo["SCAR_L_CQC", _w];
	_this addWeaponCargo["SCAR_L_CQC_CCO_SD", _w];
	_this addWeaponCargo["SCAR_L_CQC_EGLM_Holo", _w];
	_this addWeaponCargo["SCAR_L_CQC_Holo", _w];
	_this addWeaponCargo["SCAR_L_STD_EGLM_RCO", _w];
	
	// Machine Guns
	_this addWeaponCargo["ACE_GMV_M249_1", _w];
	_this addWeaponCargo["ACE_M240B", _w];
	_this addWeaponCargo["ACE_M249_AIM", _w];
	_this addWeaponCargo["ACE_M249_PIP_ACOG", _w];
	_this addWeaponCargo["M249_TWS_EP1", _w];
	_this addWeaponCargo["Mk_48_DES_EP1", _w];
	_this addWeaponCargo["M60A4_EP1", _w];
	_this addWeaponCargo["ACE_M60", _w];

	// HK Family
	_this addWeaponCargo ["ACE_HK416_D14_COMPM3", _w];
	_this addWeaponCargo ["ACE_HK416_D14_COMPM3_M320", _w];
	_this addWeaponCargo ["ACE_HK417_micro", _w];
	_this addWeaponCargo ["ACE_HK417_Eotech_4x", _w];
	_this addWeaponCargo ["ACE_HK417_Shortdot", _w];
	_this addWeaponCargo ["ACE_HK416_D14_SD", _w];
	_this addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", _w];
	_this addWeaponCargo ["ACE_HK416_D10_SD", _w];
	_this addWeaponCargo ["ACE_HK416_D14", _w];
	_this addWeaponCargo ["G36C", _w];
	_this addWeaponCargo ["G36C_camo", _w];
	_this addWeaponCargo ["G36_C_SD_eotech", _w];
	_this addWeaponCargo ["G36_C_SD_camo", _w];
	_this addWeaponCargo ["MG36_camo", _w];
	_this addWeaponCargo ["MG36", _w];
	
	// Snipers
	_this addWeaponCargo ["DMR", _w];
	_this addWeaponCargo ["M24_des_EP1", _w];
	_this addWeaponCargo ["ACE_M110", _w];
	_this addWeaponCargo ["ACE_M110_SD", _w];
	_this addWeaponCargo ["ACE_TAC50", _w];
	_this addWeaponCargo ["ACE_TAC50_SD", _w];
	_this addWeaponCargo ["M107", _w];
	_this addWeaponCargo ["m107_TWS_EP1", _w];


	// Launchers
	_this addWeaponCargo ["M136", _w];
	_this addWeaponCargo ["Javelin", _w];
	_this addWeaponCargo ["SMAW", _w];
	_this addWeaponCargo ["Stinger", _w];
	_this addWeaponCargo ["ACE_M72A2", _w];
	_this addWeaponCargo ["ACE_M136_CSRS", _w];

	// [Stock] Primary Ammo
	_this addMagazineCargo ["100Rnd_556x45_BetaCMag", _m];
	_this addMagazineCargo ["200Rnd_556x45_M249", _m];
	_this addMagazineCargo ["20Rnd_556x45_Stanag", _m];
	_this addMagazineCargo ["Javelin", _m];
	_this addMagazineCargo ["SMAW_HEAA", _m];
	_this addMagazineCargo ["SMAW_HEDP", _m];
	_this addMagazineCargo ["Stinger", _m];
	_this addMagazineCargo ["20Rnd_762x51_DMR", _m];
	_this addMagazineCargo ["30Rnd_556x45_Stanag", _m];
	_this addMagazineCargo ["30Rnd_556x45_StanagSD", _m];
	_this addMagazineCargo ["HandGrenade", _m];
	_this addMagazineCargo ["HandGrenade_West", _m];
	_this addMagazineCargo ["SmokeShell", _m];
	_this addMagazineCargo ["SmokeShellRed", _m];
	_this addMagazineCargo ["SmokeShellGreen", _m];
	_this addMagazineCargo ["SmokeShellYellow", _m];
	_this addMagazineCargo ["PipeBomb", _m];
	_this addMagazineCargo ["Mine", _m];
	_this addMagazineCargo ["Laserbatteries", _m];
	_this addMagazineCargo ["IR_Strobe_Target", _m];
	_this addMagazineCargo ["200Rnd_556x45_L110A1", _m];
	_this addMagazineCargo ["100Rnd_556x45_M249", _m];

	// [ACE] Primary Ammo
	_this addMagazineCargo ["ACE_Claymore_M", _m];
	_this addMagazineCargo ["ACE_BBetty_M", _m];
	_this addMagazineCargo ["ACE_Battery_Rangefinder", _m];
	_this addMagazineCargo ["ace_flashbang", _m];
	_this addMagazineCargo ["ACE_20Rnd_762x51_S_M110", _m];
	_this addMagazineCargo ["ACE_M2SLAM_M", _m];
	_this addMagazineCargo ["100Rnd_762x51_M240", _m];
	_this addMagazineCargo ["ACE_30Rnd_556x45_T_Stanag", _m];
	_this addMagazineCargo ["ACE_17Rnd_9x19_G17", _m];
	_this addMagazineCargo ["ACE_SSWhite_FG", _m];
	_this addMagazineCargo ["ACE_SSRed_FG", _m];
	_this addMagazineCargo ["ACE_SSGreen_FG", _m];
	_this addMagazineCargo ["ACE_SSYellow_FG", _m];
	_this addMagazineCargo ["ACE_200Rnd_556x45_T_M249", _m];
	_this addMagazineCargo ["ACE_SMAW_Spotting", _m];
	_this addMagazineCargo ["ACE_HuntIR_M203", _m];
	_this addMagazineCargo ["ACE_Knicklicht_R", _m];
	_this addMagazineCargo ["ACE_Knicklicht_G", _m];
	_this addMagazineCargo ["ACE_Knicklicht_W", _m];
	_this addMagazineCargo ["ACE_Knicklicht_Y", _m];
	_this addMagazineCargo ["ACE_Knicklicht_B", _m];
	_this addMagazineCargo ["ACE_Knicklicht_IR", _m];
	_this addMagazineCargo ["ACE_15Rnd_9x19_P226", _m];
	_this addMagazineCargo ["ACE_5Rnd_762x51_T_M24", _m];
	_this addMagazineCargo ["ACE_5Rnd_127x99_B_TAC50", _m];
	_this addMagazineCargo ["ACE_5Rnd_127x99_S_TAC50", _m];
	_this addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50", _m];
	_this addMagazineCargo ["10Rnd_127x99_m107", _m];
	_this addMagazineCargo ["ACE_10Rnd_127x99_Raufoss_m107", _m];
	_this addMagazineCargo ["ACE_10Rnd_127x99_T_m107", _m];

	// [HK Specfic] Ammo
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_HK417", _m];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_HK417", _m];
	_this addMagazineCargo ["ACE_20Rnd_762x51_SB_HK417", _m];

	// [Scar Specfic] Ammo
	_this addMagazineCargo ["20Rnd_762x51_B_SCAR", _m];
	_this addMagazineCargo ["20Rnd_762x51_SB_SCAR", _m];
	_this addMagazineCargo ["ACE_20Rnd_762x51_S_SCAR", _m];
	
	// Underbarrel Ammo
	_this addMagazineCargo ["1Rnd_HE_M203", _m];
	_this addMagazineCargo ["FlareWhite_M203", _m];
	_this addMagazineCargo ["FlareGreen_M203", _m];
	_this addMagazineCargo ["FlareRed_M203", _m];
	_this addMagazineCargo ["FlareYellow_M203", _m];
	_this addMagazineCargo ["1Rnd_Smoke_M203", _m];
	_this addMagazineCargo ["1Rnd_SmokeRed_M203", _m];
	_this addMagazineCargo ["1Rnd_SmokeGreen_M203", _m];
	_this addMagazineCargo ["1Rnd_SmokeYellow_M203", _m];
	_this addMagazineCargo ["ACE_SSWhite_M203", _m];
	_this addMagazineCargo ["ACE_SSGreen_M203", _m];
	_this addMagazineCargo ["ACE_SSRed_M203", _m];
	_this addMagazineCargo ["ACE_SSYellow_M203", _m];

	// Secondary Weapons
	_this addWeaponCargo ["Colt1911", _w];
	_this addWeaponCargo ["Glock17_EP1", _w];
	_this addWeaponCargo ["ACE_P226", _w];
	_this addWeaponCargo ["ACE_Glock18", _w];
	_this addWeaponCargo ["M9", _w];
	_this addWeaponCargo ["M9SD", _w];
	_this addWeaponCargo ["ACE_MugLite", _w];
	
	// Secondary Ammo
	_this addMagazineCargo ["7Rnd_45ACP_1911", _m];
	_this addMagazineCargo ["17Rnd_9x19_Glock17", _m];
	_this addMagazineCargo ["ACE_15Rnd_9x19_P226", _m];
	_this addMagazineCargo ["17Rnd_9x19_glock17", _m];
	_this addMagazineCargo ["15Rnd_9x19_M9", _m];
	_this addMagazineCargo ["15Rnd_9x19_M9SD", _m];
	
	// Equip
	_this addWeaponCargo ["Binocular", _w];
	_this addWeaponCargo ["ItemGPS", _w];
	_this addWeaponCargo ["NVGoggles", _w];
	_this addWeaponCargo ["Laserdesignator", _w];
	_this addWeaponCargo ["ACE_Javelin_CLU", _w];
	_this addWeaponCargo ["Laserdesignator", _w];
	_this addWeaponCargo ["ACE_Flaregun", _w];
	_this addWeaponCargo ["ACE_Rangefinder_OD", _w];
	_this addWeaponCargo ["ACE_Earplugs", _w];
	_this addWeaponCargo ["ACE_DAGR", _w];
	_this addWeaponCargo ["ACE_HuntIR_monitor", _w];
	_this addWeaponCargo ["ACE_Kestrel4500", _w];
	_this addWeaponCargo ["ACE_Wirecutter", _w];
	_this addWeaponCargo ["ACE_GlassesGasMask_US", _w];
	_this addWeaponCargo ["ACE_HuntIR_monitor", _w];
	_this addWeaponCargo ["ACE_GlassesLHD_glasses", _w];
	_this addWeaponCargo ["ACE_GlassesTactical", _w];
	_this addWeaponCargo ["ACE_GlassesBalaklava", _w];
	
	// Backpacks
	_this addWeaponCargo ["ACE_FAST_PackEDC",_b];
	_this addWeaponCargo ["ACE_FAST_PackEDC_ACU",_b];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Brown",_b];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_DMARPAT",_b];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Brown_Medic",_b];
	_this addWeaponCargo ["ACE_ParachutePack", _w];
	_this addWeaponCargo ["ACE_ParachuteRoundPack", _w];
	_this addWeaponCargo ["ACE_VTAC_RUSH72",_b];
	_this addWeaponCargo ["ACE_VTAC_RUSH72_ACU",_b];
	_this addWeaponCargo ["ACE_VTAC_RUSH72_FT_MEDIC",_b];
	/*
	// Refill ammo box after this time
	sleep _t;
};