  
// Switch players automatically to correct Teamspeak channel if they have ACRE
//Created by Jamie of 3CB, edited and reworked by Phantom of PhanTactical
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
_switchCount	= 3;		// The number of times the script should attempt to move the player to the channel.
_t				= 5;		// The time the script should wait between each attempt.

// ==========================================================================================

while {_switchCount != 0} do {
	if (isClass(configFile>>"CfgPatches">>"acre_main")) then {
		[96, "QQQQ"] call acre_api_fnc_joinChannel;
	};
	_switchCount = _switchCount - 1;
	sleep _t;
};

// ==========================================================================================