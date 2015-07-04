// Vehicle Lock Script
// 3CB - Edited by PhanTactical

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
_txt	= "You must be connected to the PhanTactical Teamspeak server to use vehicles.";
_veh	= _this select 0;
_pos	= _this select 1;
_unit	= _this select 2;

// ==========================================================================================

// PERFORM CHECK
if (_pos == "driver" AND _unit == player) then {
	if acre_sys_core_ts3id == -1) then {
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