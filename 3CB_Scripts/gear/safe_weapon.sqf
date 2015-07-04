// Lowers player's weapon on server start
// ==========================================================================================

if (isDedicated) exitWith{};
if !(local player) exitWith{};

waitUntil {!(isNull player)};
waitUntil {player == player};

player action ["WEAPONONBACK", player];

if (true) exitWith{};