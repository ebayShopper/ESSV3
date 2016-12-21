/*
	ESSV3 Client Side Config
	
	For detailed information about these variables see:
	https://github.com/ebayShopper/ESSV3/DOCUMENTATION.MD
*/

class_selection = true; //Enable class selection dialog
#define START_ITEMS "HandRoadFlare","ItemBandage",2,"ItemPainkiller","ItemWaterbottle","FoodPistachio"
class_public = [ // These are visible to anyone on the server
	[(localize "str_playerstats_bandit")+" Lvl1","Bandit1_DZ","BanditW1_DZ",[START_ITEMS,"17Rnd_9x19_glock17",2],["G17_DZ"],"",[],[],0,-5000,0,""],
	[(localize "str_playerstats_bandit")+" Lvl2","Bandit1_DZ","BanditW1_DZ",[START_ITEMS,"17Rnd_9x19_glock17",3,"ItemMorphine"],["G17_DZ"],"DZ_Assault_Pack_EP1",[],[],0,-10000,0,""],
	[(localize "str_playerstats_bandit")+" Lvl3","Bandit1_DZ","BanditW1_DZ",[START_ITEMS,"17Rnd_9x19_glock17",4,"ItemMorphine"],["G17_DZ"],"DZ_TK_Assault_Pack_EP1",[],[],0,-15000,0,"MeleeHatchet"],
	[(localize "str_playerstats_hero")+" Lvl1","Survivor3_DZ","SurvivorW2_DZ",[START_ITEMS,"6Rnd_45ACP",2],["Revolver_DZ"],"",[],[],0,5000,0,""],
	[(localize "str_playerstats_hero")+" Lvl2","Survivor3_DZ","SurvivorW2_DZ",[START_ITEMS,"6Rnd_45ACP",3,"ItemMorphine"],["Revolver_DZ"],"DZ_Assault_Pack_EP1",[],[],0,10000,0,""],
	[(localize "str_playerstats_hero")+" Lvl3","Survivor3_DZ","SurvivorW2_DZ",[START_ITEMS,"6Rnd_45ACP",4,"ItemMorphine"],["Revolver_DZ"],"DZ_TK_Assault_Pack_EP1",[],[],0,15000,0,"MeleeHatchet"],
	[localize "str_playerstats_survivor","Survivor2_DZ","SurvivorW2_DZ",[START_ITEMS,"8Rnd_9x18_Makarov",2],["Makarov_DZ"],"",[],[],0,0,0]
];

halo_selection = true; // Enable HALO selection dialog
halo_force = false; // Skip HALO selection dialog and force HALO spawn.
halo_type = "AN2_DZ"; // Type of plane. Tested with C130J_US_EP1_DZ, AN2_DZ, MV22_DZ. Use "" to disable the plane and use regular HALO.

spawn_selection = true; // Enable spawn selection dialog
spawn_bodyCheck = 4000; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
spawn_nearGroup = false; // Allow players to spawn near their group. BodyCheck can override.
spawn_nearPlot = false; // Allow players to spawn near their plot. BodyCheck can override.
spawn_radius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

spawn_public = switch (toLower worldName) do {
	case "chernarus": {
		[
			[localize "str_disp_srvsetup_random",[[4523,2444,0],[12037,9100,0],[6723,2562,0],[10417,2120,0],[1896,2242,0],[13470,6306,0]],0,0,1], // Random will never be blocked, so always keep it if using body check.
			[localize "str_location_balota",[4523,2444,0],0,0],
			[localize "str_location_berezino",[12037,9100,0],0,0],
			[localize "str_location_chernogorsk",[6723,2562,0],0,0],
			[localize "str_location_elektrozavodsk",[10417,2120,0],0,0],
			[localize "str_location_kamenka",[1896,2242,0],0,0],
			[localize "str_location_solnichniy",[13470,6306,0],0,0],
			// Above are defaults
			[localize "str_location_loc_devilscastle",[6900,11419,0],0,0],
			[localize "str_location_gorka",[9659,8839,0],0,0],
			[localize "str_location_grishino",[5967,10323,0],0,0],
			[localize "str_location_guglovo",[8472,6754,0],0,0],
			[localize "str_location_gvozdno",[8654,11832,0],0,0],
			[localize "str_location_kabanino",[5346,8630,0],0,0],
			[localize "str_location_kamyshovo",[12073,3490,0],0,0],
			[localize "str_location_komarovo",[3643,2473,0],0,0],
			[localize "str_location_krasnostav",[11342,12232,0],0,0],
			[localize "str_location_loc_capkrutoy",[13395,4159,0],0,0],
			[localize "str_location_lopatino",[2731,10000,0],0,0],
			[localize "str_location_petrovka",[5035,12459,0],0,0],
			[localize "str_location_pogorevka",[4461,6424,0],0,0],
			[localize "str_location_prigorodki",[8059,3381,0],0,0],
			[localize "str_location_pusta",[9178,3928,0],0,0],
			[localize "str_location_vybor",[3893,8883,0],0,0],
			[localize "str_location_vyshnoe",[6612,6065,0],0,0],
			[localize "str_location_zelenogorsk",[2858,5313,0],0,0]
		]
	};
	case "tavi": {
		[
			[localize "str_disp_srvsetup_random",[[9093,2614,0],[17588,4952,0],[15954,15847,0],[16674,13930,0],[11361,6685,0],[17744,10299,0],[18292,7537,0],[13561,19300,0],[15246,17425,0],[12268,9763,0]],0,0,1],
			["Topolka",[9093,2614,0],0,0],
			["Stari Sad",[17588,4952,0],0,0],
			["Sevastopol",[15954,15847,0],0,0],
			["Martin",[16674,13930,0],0,0],
			["Komarovo",[11361,6685,0],0,0],
			["Dubovo",[17744,10299,0],0,0],
			["Byelov",[18292,7537,0],0,0],
			["Khotanovsk",[13561,19300,0],0,0],
			["Dalnogorsk",[15246,17425,0],0,0],
			// Above are defaults
			["Kameni",[8350,18937,0],0,0],
			["Lyepestok",[11238,14413,0],0,0],
			["Marina",[10184,1542,0],0,0],
			["Race Track",[1529,7271,0],0,0],
			["Chernovar",[5904,10519,0],0,0]
		]
	};
	case "napf": {
		[
			[localize "str_disp_srvsetup_random",[[5411,16676,0],[1511,11479,0],[12231,16319,0],[6946,17385,0],[12862,14850,0],[4672,14940,0],[2720,12226,0],[4104,13026,0],[1461,10584,0],[10283,18449,0],[10709,17085,0]],0,0,1],
			["Seltishafen",[5411,16676,0],0,0],
			["Hubel",[1511,11479,0],0,0],
			["Lausen",[12231,16319,0],0,0],	
			["Seewen",[6946,17385,0],0,0],
			["Bunig",[12862,14850,0],0,0],	
			["Bubendorf",[4672,14940,0],0,0],
			["Hindelbank",[2720,12226,0],0,0],
			["Huttwil",[4104,13026,0],0,0],
			["Ittingen",[1461,10584,0],0,0],
			["Hordstern",[10283,18449,0],0,0],
			["Magden",[10709,17085,0],0,0],
			// Above are defaults
			["South Airstrip",[18291,1790,0],0,0],
			["Buckten",[5906,5637,0],0,0],
			["Giswil",[17101,5282,0],0,0],
			["Horw",[17262,13502,0],0,0],
			["Romoos",[12694,11878,0],0,0],
			["Sachseln",[15554,10651,0],0,0],
			["Schangen",[9412,5882,0],0,0],
			["Sissach",[11111,8326,0],0,0],
			["Waldegg",[8538,852,0],0,0]
		]
	};
	case "lingor": {
		[
			[localize "str_disp_srvsetup_random",[[2085,5501,0],[1355,315,0],[4550,913,0],[8880,1703,0],[580,5547,0],[3250,2556,0],[6143,2753,0],[1269,2858,0],[8295,8667,0],[9072,7323,0],[6899,3971,0]],0,0,1],
			["Vidora",[2085,5501,0],0,0],
			["Alma",[1355,315,0],0,0],
			["Calamar",[4550,913,0],0,0],
			["Pikawas",[8880,1703,0],0,0],
			["Benio",[580,5547,0],0,0],
			["Aguado",[3250,2556,0],0,0],
			["Prospero",[6143,2753,0],0,0],
			["Rago",[1269,2858,0],0,0],
			["Cemarin",[8295,8667,0],0,0],
			["Conoteta",[9072,7323,0],0,0],
			["Sanvigado",[6899,3971,0],0,0]
			// Above are defaults
		]
	};
	case "namalsk": {
		[
			[localize "str_disp_srvsetup_random",[[4620,10916,0],[7600,6020,0],[6498,11851,0],[7668,11707,0],[4340,4960,0],[7885,7206,0],[3013,7506,0],[4673,10004,0],[7859,9096,0],[8756,10119,0],[5823,5641,0]],0,0,1],
			["Lubjansk",[4620,10916,0],0,0],
			["Old Sawmill",[7600,6020,0],0,0],
			["West Vorkuta",[6498,11851,0],0,0],
			["East Vorkuta",[7668,11707,0],0,0],
			["Brensk",[4340,4960,0],0,0],
			["Tara Harbor",[7885,7206,0],0,0],
			["Norinsk Tunnel",[3013,7506,0],0,0],
			["Lubjansk Bay",[4673,10004,0],0,0],
			["Nemsk Factory",[7859,9096,0],0,0],
			["Jalovisko",[8756,10119,0],0,0],
			["Brensk Bay",[5823,5641,0],0,0]
			// Above are defaults
		]
	};
	case "sauerland": {
		[
			[localize "str_disp_srvsetup_random",[[15448,8466,0],[19488,7462,0],[19478,12440,0],[20210,14501,0],[16453,6895,0],[19666,10377,0],[11000,10157,0],[10669,13320,0],[11349,12225,0],[12104,8936,0],[12879,14983,0]],0,0,1],
			["Buersfeld",[15448,8466,0],0,0],
			["Hoeinghausen",[19488,7462,0],0,0],
			["Berghausen",[19478,12440,0],0,0],
			["Heggen",[20210,14501,0],0,0],
			["Heidermuehle",[16453,6895,0],0,0],
			["Remblinghausen",[19666,10377,0],0,0],
			["Schueren",[11000,10157,0],0,0],
			["Schmallenberg",[10669,13320,0],0,0],
			["Calle",[11349,12225,0],0,0],
			["Oberdorf",[12104,8936,0],0,0],
			["Burg Calle",[12879,14983,0],0,0],
			// Above are defaults
			["Strelingen",[3437,18843,0],0,0],
			["Berghoven",[18734,21955,0],0,0],
			["Oeventrop",[8668,22650,0],0,0],
			["Arnsberg",[1134,24264,0],0,0],
			["Suederbarup",[13260,543,0],0,0],
			["Osterholz",[2580,8344,0],0,0],
			["Uhlenbusch",[4092,12942,0],0,0],
			["Ihrhofen",[9640,19193,0],0,0],
			["Old Airfield",[17253,2167,0],0,0]
		]
	};
	case "panthera2": {
		[
			[localize "str_disp_srvsetup_random",[[2354,5213,0],[3281,3348,0],[4793,1862,0],[5969,944,0],[7873,1403,0],[8425,3152,0],[8679,5043,0],[7961,4949,0],[6420,6127,0],[4823,6512,0],[3354,6649,0],[5549,7227,0],[4624,8042,0],[2267,9042,0],[1062,9359,0],[1646,8814,0],[5406,3876,0],[7883,1936,0],[7022,1134,0],[5840,2363,0],[2688,3400,0]],0,0,1],
			["Sella Nevea",[2354,5213,0],0,0],
			["Kobarid",[3281,3348,0],0,0],
			["Taff Grove",[4793,1862,0],0,0],
			["Zappado",[5969,944,0],0,0],
			["New Skooma",[7873,1403,0],0,0],
			["Zelezniki",[8425,3152,0],0,0],
			["Begunje",[8679,5043,0],0,0],
			["Bled",[7961,4949,0],0,0],
			["Mojstrana",[6420,6127,0],0,0],
			["Podkoren",[4823,6512,0],0,0],
			["Tarvisio",[3354,6649,0],0,0],
			// Above are defaults
			["Hoopsberg",[5549,7227,0],0,0],
			["Arnoldstein",[4624,8042,0],0,0],
			["Mello",[2267,9042,0],0,0],
			["Vatra",[1062,9359,0],0,0],
			["Borna",[1646,8814,0],0,0],
			["Ukanc",[5406,3876,0],0,0],
			["Smugglers Den",[7883,1936,0],0,0],
			["Foxhill",[7022,1134,0],0,0],
			["Koritnica",[5840,2363,0],0,0],
			["FOB Boriana",[2688,3400,0],0,0]
		]
	};
	case "smd_sahrani_a2": {
		[
			[localize "str_disp_srvsetup_random",[[11369,5348,0],[9343,5953,0],[7645,6408,0],[12369,7108,0],[9131,8319,0],[10697,9490,0],[13197,8848,0],[14307,12496,0],[9763,14424,0],[10690,16186,0],[17314,14304,0],[18952,13913,0],[4541,15297,0],[9691,11021,0],[8311,9058,0],[2106,2679,0],[7767,15806,0],[6222,17336,0],[14230,1691,0]],0,0,1], // Random will never be blocked, so always keep it if using body check.
			["Parato",[11369,5348,0],0,0],
			["Cayo",[9343,5953,0],0,0],
			["Arcadia",[7645,6408,0],0,0],
			["Ortego",[12369,7108,0],0,0],
			["Somato",[9131,8319,0],0,0],
			["Paraiso",[10697,9490,0],0,0],
			["Corazol",[13197,8848,0],0,0],
			["Bagango",[14307,12496,0],0,0],
			["Pacamac",[9763,14424,0],0,0],
			["Mataredo",[10690,16186,0],0,0],
			["Masbete",[17314,14304,0],0,0],
			["Pita",[18952,13913,0],0,0],
			["Isla Del Vassal",[4541,15297,0],0,0],
			["Rashidah",[9691,11021,0],0,0],
			["Chantico",[8311,9058,0],0,0],
			["Rahmadi",[2106,2679,0],0,0],
			["Hunapu",[7767,15806,0],0,0],
			["Cabo Valiente",[6222,17336,0],0,0]
		]
	};
};