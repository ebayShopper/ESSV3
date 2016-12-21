# Class Configuration
* You can add or delete any class in the class_public and class_private lists. Don't forget to leave off the last comma for the last element in the array.
* Class_customLoadout - List of UIDs with custom loadouts.
* Class_customLoadouts - List of custom loadouts. These must match the order of the first list. The first UID in _customLoadout corresponds with the first loadout in _customLoadouts and so on. These will only show in the class dialog for the player who owns them. If multiple UIDs share the same loadout then add the same loadout multiple times to maintain order, or consider making it a VIP class in class_private instead. Each loadout must have a unique name just like regular classes. Do not include humanity or VIP level in these.
* Any of the class_customLoadouts, class_public and class_private can be made into random classes. They just need to be in the random format and it will be automatically detected. You can have multiple random classes, i.e. Random LMG, Random Rifle, Random Sniper, Random  Bandit, Random Hero, etc. You can make every class a random class if you want.
* Instead of repeating long strings of the same items multiple times you can use constants in this format. Then replace all occurrences of "Item1","Item2","Item3","Item4" with SHORT_HAND_NAME as I did with the VIP_ITEMS example.

	```sqf
	#define SHORT_HAND_NAME "Item1","Item2","Item3","Item4"
	```

## Regular Class Format
```
[Name,  Male Skin,  Female Skin,  Magazines and Items,  Weapons and Tools,  Bag,  Bag Mags and Items,  Bag Weps and Tools,  VIP Level,  Humanity Level, Coins, OnBack]
```
* Name - Each class must have a unique name.
* Male Skin - Must be a skin compatible with your mod.
* Female Skin - This will be used if the player picked female on the gender selection screen.
* Magazines and Items - Mags and items to add. For multiple add the quantity after (i.e. "ItemBandage",3) The quantity is assumed to be 1 if not specified.  
* Weapons and Tools - Weps and tools to add.
* Bag - Leave as "" for none.
* Bag Mags - Same format as magazines. Leave as [] for none
* Bag Weps - Same format as weapons. Leave as [] for none
* VIP Level
	* 0 - Anyone can pick this class
	* 1 - Only players with UIDs in class_level1 can pick this class
	* 2 - Only players with UIDs in class_level2 can pick this class
	* 3 - Only players with UIDs in class_level3 can pick this class​
* Humanity Level
	* 0 - Anyone can pick this class
	* Negative # - Only players with humanity less than this number can pick this class
	* Positive # - Only players with humanity greater than this number can pick this class​
* Coins
	* 0 - Does nothing, use if single currency is not installed
	* Positive # - Gives player coins with loadout
* OnBack - Adds primary weapon to back. For melee weapons be sure to use the Melee class, not the Item class.
		
## Random Class Format
```
[
	Name, 
	[[Male Skins],[Female Skins]],
	Mags+Items, #ofItemPicks, 
	Tools, #ofToolPicks, 
	Primary, #ofPrimaryMags, 
	Pistol, #ofPistolMags, 
	Bags, 
	BagItems, #ofBagItemPicks, 
	BagTools, #ofBagToolPicks, 
	BagPrimary, #ofBagPrimaryMags, 
	BagPistol, #ofBagPistolMags, 
	VIPLevel, HumanityLevel, Coins,
	OnBack,
	GuaranteedMags+Items,
	GuaranteedTools
]
```
* Name - Can be anything unique, does not have to be "Random"
* Skins - One will be chosen at random for your gender.
* Mags+Items - Same format as regular.
* #ofItemPicks - # of unique items to pick randomly from the previous list. Never use a # higher than the # of unique Mags+Items.
* Tools - List of toolbelt items to be picked from randomly.
* #ofToolPicks - # of unique tools to pick randomly from the previous list. Never use a # higher than the # of unique Tools.
* Primary - List of primary weapons to be picked from randomly.
* #ofPrimaryMags - The quantity of mags you will always get for your primary weapon.
* Pistol - List of pistols to be picked from randomly.
* #ofPistolMags - The quantity of mags you will always get for your pistol.
* Bags - One will be selected at random. Use [] for none.
* BagX,#ofBagX - Same as their respective non-bag counter parts, except they will be added to the backpack.
* VIPLevel, HumanityLevel, Coins - Same as regular.
* OnBack - List of primary weapons to be picked from randomly. Use [] for none. For melee weapons be sure to use the Melee class, not the Item class.
* GuaranteedMags+Items - List of mags that are guaranteed.
* GuaranteedTools - List of tools that are guaranteed. Make sure these aren't included in the random tools.

# Spawn Configuration
* You can add or delete any spawn in the spawn_public and spawn_private lists. Don't forget to leave off the last comma for the last element in the array.

## Spawn Format
```[Name, Pos, VIP Level, Humanity Level]```
* Name - Each spawn must have a unique name. Can be anything.
* Pos - Coordinates in AboveTerrainLevel Format [x,y,z]
* VIP Level
	* 0 - Anyone can pick this spawn
	* 1 - Only players with UIDs in spawn_level1 can pick this spawn
	* 2 - Only players with UIDs in spawn_level2 can pick this spawn
	* 3 - Only players with UIDs in spawn_level3 can pick this spawn​
* Humanity Level
	* 0 - Anyone can pick this spawn
	* Negative # - Only players with humanity less than this number can pick this spawn
	* Positive # - Only players with humanity greater than this number can pick this spawn​

## Custom Bases
* Spawn_base - List of UIDs that own custom bases.
* Spawn_bases - List of custom bases in this format: `["Name",[Pos]]`
	* Name - Each base must have a unique name. Can be anything.
	* Pos - In AboveTerrainLevel [x,y,z] format
	* These must match the order of the first list. The first UID in spawn_base corresponds with the first base in spawn_bases and so on. 
	* These will only show in the spawn list for the player who owns them. If multiple UIDs share the same base then add the same base multiple times to maintain order, or consider making it a VIP spawn in spawn_private instead. Pos is exactly where you will spawn, does not run through findSafePos. These override body check.