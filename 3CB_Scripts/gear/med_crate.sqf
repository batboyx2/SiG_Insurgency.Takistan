// ---------------------------------------------------------------------------------------------------------------------
// Class Specific Ammo Box Script by Jamie (A.K.A WalkingHazard)
// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------
// Place this on ammo crate(s)
// nul = this execVM "common\client\gear\main_crate.sqf";
// ---------------------------------------------------------------------------------------------------------------------


// Settings
_m			= 500;		// Amount of each med
_t			= 3600;		// Ammobox refill timer (seconds)

// Loop script so ammo box can be refilled after a certain time (_t)
while {alive _this} do
{

sleep 5;
// Remove the stock items from the crate
clearMagazineCargo 	_this;
clearWeaponCargo 	_this;

	/*
	// Weapons & Items
	_this addMagazineCargo ["ACE_Bandage", _m];
	_this addMagazineCargo ["ACE_Epinephrine", _m];
	_this addMagazineCargo ["ACE_LargeBandage", _m];
	_this addMagazineCargo ["ACE_Medkit", _m];
	_this addMagazineCargo ["ACE_Morphine", _m];
	_this addMagazineCargo ["ACE_Tourniquet", _m];
	_this addWeaponCargo ["ACE_Earplugs", _m];
	// _this addMagazineCargo ["ACE_Plasma", _m];
	// _this addMagazineCargo ["ACE_Splint", _m];
	// _this addMagazineCargo ["ACE_IV", _m];
	*/
	
// Refill ammo box after this time
sleep _t;
};