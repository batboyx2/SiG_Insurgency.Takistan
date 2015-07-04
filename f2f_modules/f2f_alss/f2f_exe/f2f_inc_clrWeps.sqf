if (_tgt isKindOf "Air") then
{
	private ["_curWeps","_curMags","_turMagDvr","_turMag0","_turMag1","_turMag2"];
	_curWeps = weapons vehicle player;
	_curMags = magazines vehicle player;
	_turMagDvr = _tgt magazinesTurret [-1];
	_turMag0 = _tgt magazinesTurret [0];
	_turMag1 = _tgt magazinesTurret [1];
	_turMag2 = _tgt magazinesTurret [2];
	while {count weapons _tgt > 0} do
	{
		{_tgt removeWeapon _x} forEach _curWeps;
	};
	while {count magazines _tgt > 0} do
	{
		{_tgt removeMagazine _x} forEach _curMags;
	};
	while {count (_tgt magazinesTurret [-1]) > 0} do
	{
		{_tgt removeMagazinesTurret [_x,[-1]]} forEach _turMagDvr;
	};
	while {count (_tgt magazinesTurret [0]) > 0} do
	{
		{_tgt removeMagazinesTurret [_x,[0]]} forEach _turMag0;
	};
	while {count (_tgt magazinesTurret [1]) > 0} do
	{
		{_tgt removeMagazinesTurret [_x,[1]]} forEach _turMag1;
	};
	while {count (_tgt magazinesTurret [2]) > 0} do
	{
		{_tgt removeMagazinesTurret [_x,[2]]} forEach _turMag2;
	};
}
else
{
	hint "Error clearing weapons and/or magazines!";
};