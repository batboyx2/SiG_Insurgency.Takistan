// Initial Checks Scripts
//Created by 3CB - Edited by Phantom of PhanTactical - Thanks for the scripts! ==========================================================================================

if (isServer) exitWith {};

// ==========================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

if (!isDedicated && (player != player)) then
{
    waitUntil {player == player};
    waitUntil {time > 10};
};

// ==========================================================================================

// START CHECKS
player groupChat "INITIALIZING";
addonclear = false;
naughty = false;

#include "mando.h"
#include "slx.h"

da_lostkey = isClass(configFile >> "CfgPatches" >> "Loki_Lost_Key");

da_inkodisp = isClass(configFile >> "CfgPatches" >> "inko_disposable_oa");

da_jtd = isClass(configFile >> "CfgPatches" >> "JTD_FireAndSmoke");

sleep 0.5;

while {!addonclear} do
{

if (da_mando) then {
hintc "***ADDON DISALLOWED***\n\nMando Missile\n\nPlease disable this if you wish to play here.\n\nREASON: Undesired behavior";
player sidechat "***ADDON DISALLOWED***  Mando Missile   Please disable this if you wish to play here.   REASON: Undesired behavior";
naughty = true;
};
sleep 0.25;

if (da_lostkey) then {
hintc "***ADDON DISALLOWED***\n\nLost Key\n\nPlease disable this if you wish to play here.\n\nREASON: Tampering Program";
player sidechat "***ADDON DISALLOWED***   Lost Key   Please disable this if you wish to play here.   REASON: Tampering Program";
naughty = true;
};
sleep 0.25;

if (da_inkodisp) then {
hintc "***ADDON DISALLOWED***\n\nINKO Disposable\n\nPlease disable this if you wish to play here.\n\nREASON: ACE already does this, why are you running this addon?";
player sidechat "***ADDON DISALLOWED***   INKO Disposable   Please disable this if you wish to play here.   REASON: ACE already does this, why are you running this addon?";
naughty = true;
};
sleep 0.25;

if (da_jtd) then {
hintc "***ADDON DISALLOWED***\n\nJTD Fire and Smoke\n\nPlease disable this if you wish to play here.\n\nREASON: Multiplayer unfriendly";
player sidechat "***ADDON DISALLOWED***   JTD Fire and Smoke   Please disable this if you wish to play here.   REASON: Multiplayer unfriendly";

naughty = true;
};
sleep 0.25;

if (da_slx) then {
hintc "***ADDON DISALLOWED***\n\nSLX\n\nPlease disable this if you wish to play here.\n\nREASON: Multiplayer unfriendly";
player sidechat "***ADDON DISALLOWED***   SLX   Please disable this if you wish to play here.   REASON: Multiplayer unfriendly";
naughty = true;
};
sleep 0.25;

if (naughty) then {
player groupChat "YOU WILL NOW BE DISCONNECTED";
player action ["eject", vehicle player];
removeallweapons player;
removeallitems player;
player setPos (getmarkerpos "jail");
sleep 5;
endmission "end3";
};

if (!naughty) exitWith {
addonclear = true;
player groupChat "INITIALIZATION COMPLETE";
nul= [player] execVM "3cb_scripts\tk\tkcheck.sqf";
};

sleep 0.5;
};

// ==========================================================================================