Dowload the Epoch 1.0.7 version here: **[>> Download <<](https://github.com/AirwavesMan/ESSV3/archive/refs/tags/Epoch_1.0.7.zip)**

For Epoch 1.0.7.1+

Provides extra spawn options for DayZ Epoch and vanilla DayZ Mod:
* Choose air or ground spawn
* Spawns and loadouts can be restricted by humanity and UID
* Spawns within x meters of the player's body can be blocked
* Optional spawn near plot pole or group
* Optional spawn in back seat of a plane for HALO
* Loadouts can be preset or random
* Compatible with vanilla anti-teleport
* Config formats are backwards compatible with V2 configs

Improvements over V2:
* Minimization was removed, files were restructured for readability and code was optimized.
* UID lists are now kept server side and never sent to clients.
* Private classes, loadouts, spawns and bases are now kept server side. The player is only sent what they have access to.
* Added support for dayz_onBack
* Added localization and stringtable for others to submit translations

# Install:

**[>> Download <<](https://github.com/ebayShopper/ESSV3/archive/master.zip)**

1. In mission\init.sqf find <code>execFSM "\z\addons\dayz_code\system\player_monitor.fsm";</code> Add directly above:

	```sqf
	call compile preprocessFileLineNumbers "spawn\init.sqf";
	```

2. At the bottom of description.ext add:

	```sqf
	#include "spawn\dialogs.hpp"
	```
	
3. Put the \spawn\ folder and stringtable.xml in your mission root. For vanilla DayZMod put the \custom\ folder in your mission root too.

4. In `dayz_server\compile\server_playerSetup.sqf` find <code>PVCDZ_plr_Login2 = [_worldspace,_state,_randomKey];</code> Change to:

	```sqf
	PVCDZ_plr_Login2 = [[0,respawn_west_original],_state,_randomKey,_worldspace,_randomSpot,([_randomSpot,_playerID] call spawn_config)];
	```
	
5. If using body check, in `dayz_server\compile\server_playerDied.sqf` find <code>_newObject setVariable ["bodyName",_playerName,true];</code> Add below:

	```sqf
	_newObject setVariable ["bodyUID",_playerID,true];
	```

6. Copy `spawn_config.sqf` to the `dayz_server\init\` folder. At the bottom of `dayz_server\init\server_functions.sqf` add:

	```sqf
	#include "spawn_config.sqf"
	```
	
7. Edit the settings in both config files to your liking. See DOCUMENTATION.md for detailed information.

8. Add the needed exceptions to BattlEye\scripts.txt. See SCRIPTS EXAMPLE.txt.

9. Only DayZ Mod user need to add the stringtable to the mission. For Epoch users it is build in already.

# Legal:
This work is licensed under the DAYZ MOD LICENSE SHARE ALIKE (DML-SA). The full license is here:<br /> https://www.bistudio.com/community/licenses/dayz-mod-license-share-alike
