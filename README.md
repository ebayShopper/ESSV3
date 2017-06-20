Provides extra spawn options for Epoch 1.0.6 and DayZ 1.8.8:
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
	
3. Put the \spawn\ folder and stringtable.xml in your mission root.

4. In `dayz_server\compile\server_playerSetup.sqf` find <code>PVCDZ_plr_Login2 = [_worldspace,_state];</code> Change to:

	```sqf
	PVCDZ_plr_Login2 = [[0,respawn_west_original],_state,_worldspace,_randomSpot,([_randomSpot,_playerID] call spawn_config)];
	```
	
5. If using body check, in `dayz_server\compile\server_playerDied.sqf` find <code>_newObject setVariable ["bodyName",_playerName,true];</code> Add below:

	```sqf
	_newObject setVariable ["bodyUID",_playerID,true];
	```

6. Copy `spawn_config.sqf` to the `dayz_server\init\` folder. At the bottom of `dayz_server\init\server_functions.sqf` add:

	```sqf
	#include "spawn_config.sqf"
	```
7. If using infiSTAR, in AHconfig.sqf make sure this option is disabled!
	```sqf
	/*  check MapSingleClick  */ _OMC = true;	/* true or false */	/* announces: "MapSingleClick modified", if modification is found - NEEDS _MBC to be true! */
	```

8. Edit the settings in both config files to your liking. See DOCUMENTATION.MD for detailed information.

# Legal:
This work is licensed under the DAYZ MOD LICENSE SHARE ALIKE (DML-SA). The full license is here:<br /> https://www.bistudio.com/community/licenses/dayz-mod-license-share-alike
