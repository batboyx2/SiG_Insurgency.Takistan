_obj = _this select 0;
_obj allowDamage false;
_light = "Land_runway_edgelight" createVehicle getPos _obj; getDir _obj;
_light setPos getPos _obj;
deleteVehicle _obj;
_light setDir getdir _obj;
_light allowDamage false;

exit