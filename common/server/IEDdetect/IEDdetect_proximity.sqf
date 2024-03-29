//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_object","_rnd","_beep","_detonate","_wait","_currentDamage","_proximity","_pressureType","_proxyMen","_proxyCars","_proxyTanks"];
if (!isServer) exitWith{};

if (count _this < 1 OR count _this > 3) exitWith {hint "IED_DETECT_PROXIMITY.SQF WRONG PARAMETERS, QUITTING.." };
_object = _this select 0;
_beep = _this select 1;
_pressureType = _this select 2;

if (_pressureType == 2) then {
  _rnd = random 1;
  if (_rnd < 0.5) then { _pressureType = 0 } else { _pressureType = 1 };
};

waitUntil {!(isNull _object)};
waitUntil {_object == _object};
waitUntil {reezo_IEDdetect_initComplete};

Reezo_IED_detector_objects = Reezo_IED_detector_objects + [_object];
publicVariable "Reezo_IED_detector_objects";

// BEEPER VALUES
if (_beep == 2) then { _rnd = random 1; if (_rnd > 0.5) then { _beep = 1 } else { _beep = 0 }; };
if (_beep == 1) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers + [_object];
  publicVariable "reezo_IEDdetect_beepers";
};

// MAIN LOOP
_wait = true;
_detonate = false;
while { _wait } do {
  if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: PROXIMITY MAIN LOOP" };
  _proximity = []; _proxyCars = []; _proxyTanks = [];

  if (_pressureType == 1 && alive _object) then {
    _proxyCars = position _object nearObjects ["Car",(6 + random 2)];
    _proxyTanks = position _object nearObjects ["Tank",(6 + random 2)];
    _proximity = _proxyCars + _proxyTanks;
  };
  if (_pressureType == 0 && alive _object) then {
    _proxyCars = position _object nearObjects ["Car",(6 + random 2)];
    _proxyTanks = position _object nearObjects ["Tank",(6 + random 2)];
    _proxyMen = position _object nearObjects ["Man",(2 + random 2)];
    _proximity = _proxyMen + _proxyCars + _proxyTanks;
  };
  
  if (count _proximity > 0) then { _detonate = true; _wait = false;}; 
  if (damage _object != 0) then { _detonate = true; _wait = false; };
  if (!alive _object) then { _wait = false };
  if (_wait) then { sleep 3 };
};

if (_detonate) then {
    _rnd = random 1;
    _object say3D "IEDdetect_beep3"; sleep 0.2;
    _object say3D "IEDdetect_beep3"; sleep 0.2;
    _object say3D "IEDdetect_beep3"; sleep 0.33;
    _object say3D "IEDdetect_beep3"; sleep 0.33;
    _object say3D "IEDdetect_beep3"; sleep 1 + random 5;
    if (_rnd < 0.4) then { "B_30mm_HE" createVehicle (getPos _object) };
    if (_rnd > 0.6) then { "Bo_Mk82" createVehicle (getPos _object) }
    else { "Bo_GBU12_LGB" createVehicle (getPos _object) };
};

if (_object in reezo_IED_detector_objects) then {
  reezo_IED_detector_objects = reezo_IED_detector_objects - [_object];
  publicVariable "reezo_IED_detector_objects";
};

if (_object in reezo_IEDdetect_beepers) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers - [_object];
  publicVariable "reezo_IEDdetect_beepers"; 
};

if (reezo_IEDdetect_canFear == 1) then {
  reezo_IEDdetect_cursorTarget = 0;
  publicVariable "reezo_IEDdetect_cursorTarget";
  reezo_IEDdetect_Targeters = [];
  publicVariable "reezo_IEDdetect_Targeters";
  reezo_IEDdetect_canFear = 0;
  publicVariable "reezo_IEDdetect_canFear";
};

if (alive _object) then {deleteVehicle _object};

if (reezo_IEDdetect_debug) then { sleep 1; player globalChat "REEZO_IEDDETECT DEBUG: PROXIMITY COMPLETE"; sleep 1;};

if (true) exitWith {};