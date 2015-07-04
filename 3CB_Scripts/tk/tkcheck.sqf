if (isdedicated) exitwith {};
private ["_unit"];

_unit = _this select 0;
whoDunnit = {
	private ["_deatharray","_victim","_shooter"];
	_deatharray =_this select 0;
	_victim = _deatharray select 0;
	_shooter = _deatharray select 1;
	if (vehicle _victim == _victim) then {
	if (_shooter != _victim) then {
	if ((side _shooter ) == west) then {
	_victim groupchat format ["TEAM DAMAGE - YOU WERE DAMAGED BY %1", name _shooter];
	hint format ["TEAM DAMAGE - YOU WERE DAMAGED BY %1", name _shooter];
	[_shooter,nil,rexecVM,"3cb_scripts\tk\tkalert.sqf",_shooter,_victim] call RE;
	[server,nil,rexecVM,"3cb_scripts\tk\tkreport.sqf",_shooter,_victim] call RE;
	};
	};
};
};

_unit addeventhandler ["hit",{nul=[_this] call whoDunnit}];