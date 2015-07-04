//no better place than any to put retarded shit, TEEHEE
fnc_Function1 = {
	_ai  = _this select 0;
	_plr = _this select 1;
	_gun = _this select 2;
	if !isNull _ai then {
		_ai reveal _plr;
		_ai setUnitPos "UP";
		_ai doWatch _plr;
		_ai doMove getPosATL _plr;
	};
	if !isNull _gun then {
		_gun reveal _plr;
		_dir = ((getPosATL _plr select 0) - (getPosATL _gun select 0)) atan2 ((getPosATL _plr select 1) - (getPosATL _gun select 1)); 
		group _gun setFormDir _dir;
		_gun doTarget _plr;
		sleep 1;
		curTime = time;
		while { time - curTime < 5 } do {
			vehicle _gun fireAtTarget [_plr,currentWeapon vehicle _gun];
			sleep (0.1 + random 0.2);
		};			
	};
};

//if !isDedicated then { startLoadingScreen ["Loading...","RscLoadScreenCustom"]; };
enableSaving [false, false]; 
waitUntil { isServer || !isNull player }; 
//waitUntil { !isNil "BIS_MPF_InitDone" }; 
//waitUntil { BIS_MPF_InitDone }; 

// Global Variable Init
curTime				= time;    //mission start time
serverLoadHint      = false;   //server load hint message

if (isServer) then {

// ACE Modules
	ace_sys_wounds_enabled = true;							publicVariable "ace_sys_wounds_enabled";
	ace_sys_wounds_noai = false;							publicVariable "ace_sys_wounds_noai";
	ace_sys_wounds_leftdam = 0.5;							publicVariable "ace_sys_wounds_leftdam";
	ace_sys_wounds_all_medics = true;						publicVariable "ace_sys_wounds_all_medics";
	ace_sys_wounds_no_rpunish = true;						publicVariable "ace_sys_wounds_no_rpunish";
	ace_sys_wounds_auto_assist_any = true;					publicVariable "ace_sys_wounds_auto_assist_any";
	ace_sys_wounds_ai_movement_bloodloss = true;			publicVariable "ace_sys_wounds_ai_movement_bloodloss";
	ace_sys_wounds_player_movement_bloodloss = true;		publicVariable "ace_sys_wounds_player_movement_bloodloss";
	ace_sys_wounds_auto_assist = true;						publicVariable "ace_sys_wounds_auto_assist";

	ace_sys_aitalk_enabled = true;							publicVariable "ace_sys_aitalk_enabled";
	ace_sys_aitalk_radio_enabled = false;					publicVariable "ace_sys_aitalk_radio_enabled";
	ace_sys_aitalk_talkforplayer = false;					publicVariable "ace_sys_aitalk_talkforplayer";
	if !(player hasWeapon "ACE_Earplugs") then {player addWeapon "ACE_Earplugs";};
};

// EXECs
_nul = [] execVM "3cb_scripts\gear\safe_weapon.sqf";
_nul = [] execVM "3cb_scripts\init-check.sqf";
//_null = player execVM "3cb_scripts\ts_autoChannelSwitch.sqf";

//Ammobox init
stuffbox allowDamage false;
stuffbox lock false;
stuffbox setVehicleLock "UNLOCKED";
_null = [stuffbox] execVM "common\client\gear\AmmoCrate.sqf";
_null = [fieldHospital] execVM "common\client\gear\HospitalCargo.sqf";

if (local player) then { call compile preprocessFileLineNumbers "initclient.sqf"; }; 
if (isServer) then { call compile preprocessFileLineNumbers "initserver.sqf"; }; 
