// Vehicle Lock Script
// 3CB - Edited by PhanTactical
// ==========================================================================================

// PLACE ON VEHICLE
// _eh = this addEventHandler ["GetIn", {_this execVM "3cb_scripts\vehicles\lock_crewman.sqf"}];

// ==========================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

if (!isDedicated && (player != player)) then
{
    waitUntil {player == player};
    waitUntil {time > 10};
};

// ==========================================================================================

// DEFINE VARIABLES
_txt	= "Only crewmen who are connected to the PhanTactical Teamspeak server are allowed to use heavy vehicles.";
_plt	= "BAF_crewman_DDPM";
_veh	= _this select 0;
_pos	= _this select 1;
_unit	= _this select 2;

// ==========================================================================================

// PERFORM CHECK
if (_pos == "driver" AND _unit == player) then {
	if ((typeOf _unit) != _plt OR acre_sys_core_ts3id == -1) then {
		_fuel = fuel _veh;
		_veh setFuel 0;
		unAssignVehicle _unit;
		_unit action ["getOut", _veh];
		waitUntil {sleep 1; (fuel _veh) == 0};
		_veh setFuel _fuel;
		player groupChat _txt;
		hint _txt;
	};
};

// ==========================================================================================