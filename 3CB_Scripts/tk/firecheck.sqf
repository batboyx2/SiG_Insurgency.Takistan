// No fire in base script
// By: Jamie (Maj. Goodson) for 3 Commando Brigade - Edited by Phantom of PhanTactical - Thanks to Jamie for his amazing scripts!
// If you remove these credits you will be submitting your soul to satan
// ==========================================================================================

if (isdedicated) exitwith {};

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
isActive 		= "true";
offenceCount	= 0;
offenceChances	= 10;
coolDownTimer	= 60;

// ==========================================================================================

// DEBUG
hint "firecheck.sqf has been activated";
player groupChat "firecheck.sqf has been activated";

// ==========================================================================================

// PERFORM CHECKS AND ACTIONS

while {isActive == "true"} do {
	while {offenceCount < offenceChances} do {
		100 = player addEventHandler ["Fired", {
			offenceCount = offenceCount + 1;
			if (offenceCount <= offenceChances) then {
				player groupChat format ["DO NOT FIRE IN BASE. IF FIRING PERSISTS YOU WILL BE PUNISHED. WARNING: %1", offenceCount];
				hint format ["DO NOT FIRE IN BASE. IF FIRING PERSISTS YOU WILL BE PUNISHED. WARNING: %1", offenceCount];
			};
		}];
		sleep 1;
	};
	
	if (offenceCount >= offenceChances) then {
		player setPos (getMarkerPos "prisonPoint");
		disableUserInput true;
		sleep 1;
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		sleep 5;
		player sideChat format ["You have been placed in isolation due to eratic behaviour. You will be released in %1 seconds", coolDownTimer];
		hint format ["You have been placed in isolation due to eratic behaviour. You will be released in %1 seconds", coolDownTimer];
		sleep 5;
		while {coolDownTimer > 0} do {
			hint format ["%1", coolDownTimer];
			coolDownTimer = coolDownTimer - 1;
			sleep 1;
		};
		if (coolDownTimer <= 0) then {
			hint "";
			player setPos (getPos fieldHospital);
			disableUserInput false;
			offenceCount = 0;	// Reset offence counter
		};
	};

};
// ==========================================================================================
		
		