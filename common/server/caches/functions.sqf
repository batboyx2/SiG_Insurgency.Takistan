cacheKilled = { 	
    private ["_pos","_dur","_count"];
    
    _pos	= getPosATL(_this);
	curTime	= time; 
	_dur	= 5 + random 5; 
	"Bo_Mk82" createVehicle _pos; 
	while{ true }do{ 
		"Bo_Mk82" createVehicle _pos; 
		if (random 100 > 70) then { "Bo_Mk82" createVehicle _pos; }; 
		if ((time - curTime) > _dur) exitWith { "Bo_Mk82" createVehicle _pos; }; 
		sleep random 1; 
	}; 
	{ deleteMarker _x; } forEach cacheMarkers(_this); 
	deleteVehicle _this;
	sleep 1; 
	_count = count cacheList;
	//[nil,nil,rHINT, parseText format["%1/%2 <t color='#80FF00'>ammo cache's</t> have been destroyed!", cacheCount - _count, cacheCount]] call RE;
	[(parseText format["%1/%2 <t color='#80FF00'>ammo cache's</t> have been destroyed!", cacheCount - _count, cacheCount]), "hint", true, true] call BIS_fnc_MP;
	if (_count == 0) then {
		["All ammo caches destroyed, nice werk ye scotsladdeh!", "hint", true, true] call BIS_fnc_MP;
		sleep 20;
		endMission "END1";
	};
}; 

setupCaches = { 
	private ["_cachePos","_cacheHouse","_cache","_id","_positions","_type","_nWestUnits","_cacheHouses","_n","_m"];

	_cacheHouses = [CENTERPOS, AORADIUS, 6, true] call findHouses;
	for "_i" from 1 to cacheCount do { 	
		if DEBUG then { server globalChat format["cache%1 spawning...", _i]; };
		_cache = createVehicle [cacheType, spawnPos, [], 0, "None"];
		//_cache setVehicleVarName "cache1";
		//cache1 = _cache;
		[[_cache, format["cache%1", _i]], "setVehicleVarName", true, true] call BIS_fnc_MP;
		missionNamespace setVariable [format["cache%1", _i], _cache];
		clearWeaponCargoGlobal _cache;
		clearMagazineCargoGlobal _cache;
		_n = round (random 2);
		_m = round (((random 3)+2) * _n);
		_cache addWeaponCargoGlobal ["rhs_weap_svd", _n];
		_cache addMagazineCargoGlobal ["rhs_10Rnd_762x54mmR_7N1", _m];
		/*
		call compile format['
			_cache setVehicleInit "
				this setVehicleVarName ""cache%1"";
				cache%1 = this;
				clearWeaponCargo this;
				clearMagazineCargo this;
				_n = round (random 2);
				this addWeaponCargo [""SVD"", _n];
				_m = round (((random 3)+2) * _n);
				this addMagazineCargo [""10Rnd_762x54_SVD"", _m];
			";
		', _i];
		*/	
						
		_cache addEventHandler["Killed", { (_this select 0) spawn cacheKilled; }]; 
		while { count _cacheHouses > 1 } do { 
			_cacheHouse	= _cacheHouses select floor(random(count _cacheHouses - 1)); 
			_type		= typeOf _cacheHouse; 	
			_nWestUnits	= nearestObjects[getPosATL _cacheHouse, westSoldierClasses+[cacheType], cacheRadius]; 		
			if (count _nWestUnits == 0 && _type in CACHEHOUSEPOSITIONS) exitWith { 
				_id = CACHEHOUSEPOSITIONS find _type; 
				_positions = CACHEHOUSEPOSITIONS select (_id+1); 
				_cachePos = _cacheHouse buildingPos (_positions select floor(random(count _positions - 1))); 						
			}; 
			_cacheHouses = _cacheHouses - [_cacheHouse]; 
		}; 	
		_cache setPosATL _cachePos;
		_cacheHouse addEventHandler ["handleDamage", { 
			_damage = _this select 2; 
			_cache  = getPosATL (_this select 0) nearestObject cacheType;
			if (_damage > 0.9) then {	_cache setDamage 1;	};
			_damage
		}];
		if DEBUG then { [_cache, format["cache%1", _i]] call createDebugMarker; };		
	};
	//processInitCommands;
}; 	

