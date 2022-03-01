package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.Assets as OpenFlAssets;
import haxe.Json;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf-poof':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('ThereIsNoGf');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, true);
				animation.addByPrefix('singLEFT', 'GF left note', 24, true);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, true);
				animation.addByPrefix('singUP', 'GF Up Note', 24, true);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, true);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, true);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, true);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, true);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('GF_Assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, true);
				animation.addByPrefix('singLEFT', 'GF left note', 24, true);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, true);
				animation.addByPrefix('singUP', 'GF Up Note', 24, true);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, true);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, true);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, true);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');
			case 'pastgf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('project/characters/past_GF');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, true);
				animation.addByPrefix('singLEFT', 'GF left note', 24, true);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, true);
				animation.addByPrefix('singUP', 'GF Up Note', 24, true);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, true);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, true);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, true);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');
			case 'dad-deathmatch':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('DADDY_DEAREST_DEATHMATCH_ASSETS');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance-phase10', 26);
				animation.addByPrefix('singUP', 'Dad Sing Note UP-phase10', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT-phase10', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN-phase10', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT-phase10', 24);
				animation.addByPrefix('idle-alt', 'Dad idle dance-phase20', 24);
				animation.addByPrefix('singUP-alt', 'Dad Sing note UP-phase20', 24);
				animation.addByPrefix('singRIGHT-alt', 'Dad Sing Note LEFT-phase20', 24);
				animation.addByPrefix('singDOWN-alt', 'Dad Sing Note DOWN-phase20', 24);
				animation.addByPrefix('singLEFT-alt', 'dad sing note right-phase20', 24);
				animation.addByPrefix('idle-alt2', 'Dad idle dance-phase30', 24);
				animation.addByPrefix('singUP-alt2', 'Dad Sing note UP-phase30', 24);
				animation.addByPrefix('singRIGHT-alt2', 'Dad Sing Note LEFT-phase30', 24);
				animation.addByPrefix('singDOWN-alt2', 'Dad Sing Note DOWN-phase30', 24);
				animation.addByPrefix('singLEFT-alt2', 'dad sing note right-phase30', 24);
				animation.addByPrefix('idle-alt3', 'Dad idle dance-phase40', 24);
				animation.addByPrefix('singUP-alt3', 'Dad Sing note UP-phase40', 24);
				animation.addByPrefix('singRIGHT-alt3', 'Dad Sing Note LEFT-phase40', 24);
				animation.addByPrefix('singDOWN-alt3', 'Dad Sing Note DOWN-phase40', 24);
				animation.addByPrefix('singLEFT-alt3', 'dad sing note right-phase40', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'project-dad-1':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('project/characters/DEAREST');
				frames = tex;
				animation.addByPrefix('idle', 'DEAREST Idle', 24);
				animation.addByPrefix('singUP', 'DEAREST Up', 24);
				animation.addByPrefix('singLEFT', 'DEAREST Left', 24);
				animation.addByPrefix('singDOWN', 'DEAREST Down', 24);
				animation.addByPrefix('singRIGHT', 'DEAREST Right', 24);

				loadOffsetFile(curCharacter);
                playAnim('idle');

			case 'bigmonika':
				frames = Paths.getSparrowAtlas('epiphany/big_monikia_base');
				animation.addByPrefix('idle', 'Big Monika Idle', 24, false);
				animation.addByPrefix('singUP', 'Big Monika Up', 24, false);
				animation.addByPrefix('singDOWN', 'Big Monika Down', 24, false);
				animation.addByPrefix('singLEFT', 'Big Monika Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Big Monika Right', 24, false);
				animation.addByPrefix('lastNOTE', 'Big Monika Last Note', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				updateHitbox();
			case 'project-dad-2':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('project/characters/DEARESTS-DUET');
				frames = tex;
				animation.addByPrefix('idle', 'DEAREST Idle', 24);
				animation.addByPrefix('singUP', 'DEAREST Up', 24);
				animation.addByPrefix('singLEFT', 'DEAREST Left', 24);
				animation.addByPrefix('singDOWN', 'DEAREST Down', 24);
				animation.addByPrefix('singRIGHT', 'DEAREST Right', 24);

				loadOffsetFile(curCharacter);
                playAnim('idle');
			case 'project-dad-3':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('project/characters/DEAREST-FIGHT');
				frames = tex;
				animation.addByPrefix('idle', 'DEAREST Idle', 24);
				animation.addByPrefix('singUP', 'DEAREST Up', 24);
				animation.addByPrefix('singLEFT', 'DEAREST Left', 24);
				animation.addByPrefix('singDOWN', 'DEAREST Down', 24);
				animation.addByPrefix('singRIGHT', 'DEAREST Right', 24);
				animation.addByPrefix('fall', 'DEAREST Fall', 24);

				loadOffsetFile(curCharacter);
                playAnim('idle');
			case 'project-dad-4':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('project/characters/DEAREST-HOPELESS');
				frames = tex;
				animation.addByPrefix('idle', 'DEAREST Idle', 24);
				animation.addByPrefix('idle-alt', 'DEAREST Breath', 24);
				animation.addByPrefix('singUP', 'DEAREST Up', 24);
				animation.addByPrefix('singLEFT', 'DEAREST Left', 24);
				animation.addByPrefix('singDOWN', 'DEAREST Down', 24);
				animation.addByPrefix('singRIGHT', 'DEAREST Right', 24);
				animation.addByPrefix('singUP-alt', 'DEAREST Up', 24);
				animation.addByPrefix('singLEFT-alt', 'DEAREST Left', 24);
				animation.addByPrefix('singDOWN-alt', 'DEAREST Down', 24);
				animation.addByPrefix('singRIGHT-alt', 'DEAREST Right', 24);
                playAnim('idle');
				loadOffsetFile(curCharacter);
			case 'dad-fartmatch':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('PPDAD');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);

				loadOffsetFile(curCharacter);
			case 'dad-fartmatch-1':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('fart/HELL');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right', 24);

				loadOffsetFile(curCharacter);  
				playAnim('idle');
			case 'dad-fartmatch-2':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('fart/im dying');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right', 24);
				playAnim('idle');
				loadOffsetFile(curCharacter);
			case 'dad-fartmatch-3':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('fart/eye cancer');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right', 24);
				playAnim('idle');
				loadOffsetFile(curCharacter);

			case 'dad-hopeless':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('Hopeless_Dad_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24, true);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24, true);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, true);
				animation.addByPrefix('singLEFT', 'dad sing note right', 24, true);
				playAnim('idle');
				loadOffsetFile(curCharacter);
			case 'bf-sad':
				tex = Paths.getSparrowAtlas('BFSad');
				frames = tex;
				animation.addByPrefix('sad', 'BFSad', 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);
				playAnim('sad');

				flipX = true;
			case 'bf-throw':
				tex = Paths.getSparrowAtlas('dischargeAssets/BF_Guitar_Throw');
				frames = tex;
				animation.addByPrefix('idle', 'bf throw', 21, false);
				setGraphicSize(Std.int(width * 1.1));
				addOffset('idle');
				playAnim('idle');

				flipX = true;
			case 'bf-past':
                var tex = Paths.getSparrowAtlas('project/characters/BF_Past');
                frames = tex;

                trace(tex.frames.length);

                animation.addByPrefix('idle', 'BF idle dance', 24, false);
                animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
                animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
                animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
                animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
                animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
                animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
                animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
                animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
                animation.addByPrefix('hey', 'BF HEY', 24, false);

                animation.addByPrefix('firstDeath', "BF dies", 24, false);
                animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
                animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

                animation.addByPrefix('scared', 'BF idle shaking', 24);

                animation.addByPrefix('dodge','boyfriend dodge', 24, false);
                
                loadOffsetFile(curCharacter);

                playAnim('idle');

                flipX = true;
	case 'bf-spooky-death':
                var tex = Paths.getSparrowAtlas('the_kids_fucking_die');
                frames = tex;

                animation.addByPrefix('idle', "spooky death", 12, false);
                animation.addByPrefix('singUP', "spooky death", 12, false);
                animation.addByPrefix('firstDeath', "spooky death", 12, false);
                animation.addByPrefix('deathLoop', "loop", 12, true);
                animation.addByPrefix('deathConfirm', "retry", 24, false);
                animation.play('firstDeath');

                loadOffsetFile(curCharacter);

                playAnim('firstDeath');
				flipX = true;
			case 'pastdad':
				tex = Paths.getSparrowAtlas('project/characters/past_dad');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'Dad idle dance', 24, false);
				animation.addByPrefix('singDOWN', 'Dad idle dance', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad idle dance', 24, false);

				addOffset('idle');
				addOffset('singUP');
				addOffset('singRIGHT');
				addOffset('singLEFT');
				addOffset('singDOWN');

				playAnim('idle');
			case 'bf-guitar':
				var tex = Paths.getSparrowAtlas('dischargeAssets/GuitarBF');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP play instance 10', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN play instance 10', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT instance 10', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT play instance 10', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'lament-dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('DADDY_DEAREST_LAMENT_ASSETS');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance0', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP0', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT0', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right0', 24);
				animation.addByPrefix('idle-alt', 'Dad idle dance-RED', 24, true);
				animation.addByPrefix('singUP-alt', 'Dad Sing note UP-RED', 24);
				animation.addByPrefix('singRIGHT-alt', 'Dad Sing Note LEFT-RED', 24);
				animation.addByPrefix('singDOWN-alt', 'Dad Sing Note DOWN-RED', 24);
				animation.addByPrefix('singLEFT-alt', 'dad sing note right-RED', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'bsidelament-dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('BSide/characters/amogus lament dad real');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance-mad', 24, true);
				animation.addByPrefix('singUP', 'dad up mad 2', 24);
				animation.addByPrefix('singLEFT', 'dad left mad 2', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN-mad', 24);
				animation.addByPrefix('singRIGHT', 'dad right mad 2', 24);
				animation.addByPrefix('idle-alt', 'Dad idle dance-redeyes', 24, true);
				animation.addByPrefix('singUP-alt', 'Dad Sing Note UP-redeyes', 24);
				animation.addByPrefix('singLEFT-alt', 'Dad Sing Note LEFT-redeyes', 24);
				animation.addByPrefix('singDOWN-alt', 'Dad Sing Note DOWN-redeyes', 24);
				animation.addByPrefix('singRIGHT-alt', 'Dad Sing Note RIGHT-redeyes', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'dusk-dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('DADDY_DEAREST_DUSK_ASSETS');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance0', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP0', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT0', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right0', 24);
				animation.addByPrefix('idle-alt4', 'Dad idle dance-RED-alt0', 24, true);
				animation.addByPrefix('singUP-alt4', 'Dad Sing note UP-RED-alt0', 24);
				animation.addByPrefix('singRIGHT-alt4', 'Dad Sing Note LEFT-RED-alt0', 24);
				animation.addByPrefix('singDOWN-alt4', 'Dad Sing Note DOWN-RED-alt0', 24);
				animation.addByPrefix('singLEFT-alt4', 'dad sing note right-RED-alt0', 24);

				// less corrupted I don't even remember lol

				animation.addByPrefix('idle-alt2', 'Dad idle dance-phase2 aaa0', 24, true);
				animation.addByPrefix('singUP-alt2', 'Dad Sing note UP-phase2 aaa0', 24);
				animation.addByPrefix('singLEFT-alt2', 'Dad Sing Note LEFT-phase2 aaa0', 24);
				animation.addByPrefix('singDOWN-alt2', 'Dad Sing Note DOWN-phase2 aaa0', 24);
				animation.addByPrefix('singRIGHT-alt2', 'dad sing note right-phase2 aaa0', 24);
				animation.addByPrefix('idle-alt3', 'Dad idle dance-phase20', 24, true);
				animation.addByPrefix('singUP-alt3', 'Dad Sing note UP-phase20', 24);
				animation.addByPrefix('singRIGHT-alt3', 'Dad Sing Note LEFT-phase20', 24);
				animation.addByPrefix('singDOWN-alt3', 'Dad Sing Note DOWN-phase20', 24);
				animation.addByPrefix('singLEFT-alt3', 'dad sing note right-phase20', 24);

				// most corrupted I don't even remember lol

				animation.addByPrefix('idle-alt', 'Dad idle dance-RED0', 24, true);
				animation.addByPrefix('singUP-alt', 'Dad Sing note UP-RED0', 24);
				animation.addByPrefix('singRIGHT-alt', 'Dad Sing Note LEFT-RED0', 24);
				animation.addByPrefix('singDOWN-alt', 'Dad Sing Note DOWN-RED0', 24);
				animation.addByPrefix('singLEFT-alt', 'dad sing note right-RED0', 24);
				animation.addByPrefix('idle-alt5', 'Dad idle dance-alt0', 24, true);
				animation.addByPrefix('singUP-alt5', 'Dad Sing note UP-alt0', 24);
				animation.addByPrefix('singRIGHT-alt5', 'Dad Sing Note LEFT-alt0', 24);
				animation.addByPrefix('singDOWN-alt5', 'Dad Sing Note DOWN-alt0', 24);
				animation.addByPrefix('singLEFT-alt5', 'dad sing note right-alt0', 24);
				animation.addByPrefix('yourefucked', 'Die', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');


			case 'bsidedusk-dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('BSide/characters/culo');
				frames = tex;
				animation.addByPrefix('idle', 'dad idle sad 2', 24, true);
				animation.addByPrefix('singUP', 'dad up sad 2', 24);
				animation.addByPrefix('singLEFT', 'dad left sad 2', 24);
				animation.addByPrefix('singDOWN', 'dad down sad 2', 24);
				animation.addByPrefix('singRIGHT', 'dad right sad 2', 24);
				animation.addByPrefix('idle-alt', 'dad idle mad 2', 24, true);
				animation.addByPrefix('singUP-alt', 'dad up normal mad 2', 24);
				animation.addByPrefix('singLEFT-alt', 'dad left mad normal 2', 24);
				animation.addByPrefix('singDOWN-alt', 'dad down mad 2', 24);
				animation.addByPrefix('singRIGHT-alt', 'dad right mad normal', 24);

				// less corrupted I don't even remember lol

				animation.addByPrefix('idle-alt2', 'Dad idle dance-mad', 24, true);
				animation.addByPrefix('singUP-alt2', 'dad up mad 2', 24);
				animation.addByPrefix('singLEFT-alt2', 'dad left mad 2', 24);
				animation.addByPrefix('singDOWN-alt2', 'Dad Sing Note DOWN-mad', 24);
				animation.addByPrefix('singRIGHT-alt2', 'dad right mad 2', 24);
				animation.addByPrefix('idle-alt3', 'Dad idle dance-sad', 24, true);
				animation.addByPrefix('singUP-alt3', 'Dad Sing Note UP-sad', 24);
				animation.addByPrefix('singLEFT-alt3', 'Dad Sing Note LEFT-sad', 24);
				animation.addByPrefix('singDOWN-alt3', 'Dad Sing Note DOWN-sad', 24);
				animation.addByPrefix('singRIGHT-alt3', 'Dad Sing Note RIGHT-sad', 24);

				// most corrupted I don't even remember lol

				animation.addByPrefix('idle-alt4', 'corrupt Dad idle dance-mad', 24, true);
				animation.addByPrefix('singUP-alt4', 'corrupt dad up mad 3', 24);
				animation.addByPrefix('singLEFT-alt4', 'corrupt dad left mad 3', 24);
				animation.addByPrefix('singDOWN-alt4', 'corrupt dad down mad', 24);
				animation.addByPrefix('singRIGHT-alt4', 'corrupt dad right mad 3', 24);
				animation.addByPrefix('idle-alt5', 'corrupt Dad idle dance-sad3', 24, true);
				animation.addByPrefix('singUP-alt5', 'corrupt Dad Sing Note UP-sad3', 24);
				animation.addByPrefix('singLEFT-alt5', 'corrupt Dad Sing Note LEFT-sad3', 24);
				animation.addByPrefix('singDOWN-alt5', 'corrupt Dad Sing Note DOWN-sad3', 24);
				animation.addByPrefix('singRIGHT-alt5', 'corrupt Dad Sing Note RIGHT-sad3', 24);
				animation.addByPrefix('yourefucked', 'Die', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bsidedad-deathmatch-1':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('BSide/characters/DADDY_DEAREST_D3_1');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bsidedad-deathmatch-2':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('BSide/characters/DADDY_DEAREST_D3_2');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bsidedad-deathmatch-3':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('BSide/characters/DADDY_DEAREST_D3_3');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note right', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = false;

			case 'bf-doki':
				var tex = Paths.getSparrowAtlas('DDLCBoyFriend_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'natsuki':
				tex = Paths.getSparrowAtlas('Doki_Nat_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Nat Idle', 24, false);
				animation.addByPrefix('singUP', 'Nat Sing Note Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Nat Sing Note Right', 24, false);
				animation.addByPrefix('singDOWN', 'Nat Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Nat Sing Note Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'spooky-dm':
				tex = Paths.getSparrowAtlas('Spooky_Deathmatch_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'playable-gf':
				tex = Paths.getSparrowAtlas('GF_Player');
				frames = tex;
				animation.addByPrefix('idle', 'GF idle dance', 24, false);
				animation.addByPrefix('singUP', 'GF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'GF NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'GF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'GF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'GF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'GF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'GF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'GF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "GF Dies", 24, false);
				animation.addByPrefix('deathLoop', "GF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "GF Dead confirm", 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bsidespooky-dm':
				tex = Paths.getSparrowAtlas('BSide/characters/Spooky_Deathmatch_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bf-project':
				tex = Paths.getSparrowAtlas('project/characters/corruptbf');
				frames = tex;
				animation.addByPrefix('idle', 'BF Idle', 24, false);
				animation.addByPrefix('idle2', 'BF ALT Idle', 24, false);
				animation.addByPrefix('singUP', 'BF Up0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF Right0', 24, false);
				animation.addByPrefix('singLEFT', 'BF Left0', 24, false);
				animation.addByPrefix('singDOWN', 'BF Down0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF Fail Up', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF Fail Right', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF Fail Left', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF Fail Down', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');
                flipX = true;
			case 'bf-mom-project':
				tex = Paths.getSparrowAtlas('project/characters/deathmatch_mom');
				frames = tex;
				animation.addByPrefix('idle', 'Corrupted Mearest Idle', 24, false);
				animation.addByPrefix('singUP', 'Corrupted Mearest Up0', 24, false);
				animation.addByPrefix('singLEFT', 'Corrupted Mearest Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Corrupted Mearest Left0', 24, false);
				animation.addByPrefix('singDOWN', 'Corrupted Mearest Down0', 24, false);
				animation.addByPrefix('singUPmiss', 'Corrupted Fail Up', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Corrupted Fail Right', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Corrupted Fail Left', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Corrupted Fail Down', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'bf-mom-project-2':
				tex = Paths.getSparrowAtlas('project/characters/deathmatch_mom2');
				frames = tex;
				animation.addByPrefix('idle', 'Corrupted Mearest Idle', 24, false);
				animation.addByPrefix('singUP', 'Corrupted Mearest Up0', 24, false);
				animation.addByPrefix('singLEFT', 'Corrupted Mearest Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Corrupted Mearest Left0', 24, false);
				animation.addByPrefix('singDOWN', 'Corrupted Mearest Down0', 24, false);
				animation.addByPrefix('singUPmiss', 'Corrupted Fail Up', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Corrupted Fail Right', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Corrupted Fail Left', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Corrupted Fail Down', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'bf-spooky-project':
				tex = Paths.getSparrowAtlas('project/characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('idle', 'spooky idle', 24, false);
				animation.addByPrefix('singUP', 'spooky up', 24, false);
				animation.addByPrefix('singLEFT', 'spooky right', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky left', 24, false);
				animation.addByPrefix('singDOWN', 'spooky down', 24, false);
				animation.addByPrefix('singUPmiss', 'spooky miss up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'spooky miss right', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'spooky miss left', 24, false);
				animation.addByPrefix('singDOWNmiss', 'spooky miss down', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'bf-pico-project':
				tex = Paths.getSparrowAtlas('project/characters/corrupt_pico');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico miss UP', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Pico Miss Right', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Pico MISS LEFT', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Pico Miss Down', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');
                flipX = true;
			case 'gnome':
				tex = Paths.getSparrowAtlas('fart/Gnome');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'spooky-d1':
				tex = Paths.getSparrowAtlas('Spooky_D1_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'spooky-d2':
				tex = Paths.getSparrowAtlas('Spooky_D2_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'spooky-d3':
				tex = Paths.getSparrowAtlas('Spooky_D3_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-spooky-d3':
				tex = Paths.getSparrowAtlas('BSide/characters/Spooky_D3_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-spooky-d2':
				tex = Paths.getSparrowAtlas('BSide/characters/Spooky_D2_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-spooky-d1':
				tex = Paths.getSparrowAtlas('BSide/characters/Spooky_D1_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'mom-deathmatch':
				tex = Paths.getSparrowAtlas('Mom_Deathmatch_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Mom Idle0', 24, false);
				animation.addByPrefix('singUP', 'Mom Up Pose0', 24, false);
				animation.addByPrefix('singRIGHT', 'MOM LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'Mom Pose RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'MOM DOWN POSE0', 24, false);
				animation.addByPrefix('singUPmiss', 'mom miss up0', 24, false);
				animation.addByPrefix('singLEFTmiss', 'mom miss right0', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'mom left miss0', 24, false);
				animation.addByPrefix('singDOWNmiss', 'MOM MISS DOWN0', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				flipX = true;
			case 'bsidemom-deathmatch':
				tex = Paths.getSparrowAtlas('BSide/characters/BSIDE DM MOM');
				frames = tex;
				animation.addByPrefix('idle', 'Mom Idle', 24, false);
				animation.addByPrefix('singUP', 'Mom Up Pose0', 24, false);
				animation.addByPrefix('singLEFT', 'Mom Pose Left0', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Left Pose0', 24, false);
				animation.addByPrefix('singDOWN', 'MOM DOWN POSE0', 24, false);
				animation.addByPrefix('singUPmiss', 'mom miss up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'mom miss right', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'mom left miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'MOM MISS DOWN', 24, false);
				animation.addByPrefix('firstDeath', 'Mom dies', 24, false);
				animation.addByPrefix('deathLoop', 'Mom dead loop', 24, false);
				animation.addByPrefix('deathConfirm', 'mom dead corfirm', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'bf-whitty-deathmatch':
				tex = Paths.getSparrowAtlas('dlc/renx-deathmatch/Whitty_Deathmatch_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Whitty idle dance', 24, false);
				animation.addByPrefix('singUP', 'Whitty Sing Note UP0', 24, false);
				animation.addByPrefix('singLEFT', 'whitty sing note right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Whitty Sing Note LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24, false);
				animation.addByPrefix('singUPmiss', 'Whitty Sing Note UP0', 24, false);
				animation.addByPrefix('singLEFTmiss', 'whitty sing note right0', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Whitty Sing Note LEFT0', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Whitty Sing Note DOWN', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'mom-d1':
				tex = Paths.getSparrowAtlas('Mom_D1_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, true);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-mom-d1':
				tex = Paths.getSparrowAtlas('BSide/characters/Mom_D1_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, true);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'mom-d2':
				tex = Paths.getSparrowAtlas('Mom_D2_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, true);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'mom-d3':
				tex = Paths.getSparrowAtlas('Mom_D3_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, true);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'what':
				tex = Paths.getSparrowAtlas('fart/what the fuck');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico mez u p', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'peko mis lef t', 24, false);
				animation.addByPrefix('singLEFTmiss', 'right pkeo misz', 24, false);
				animation.addByPrefix('singDOWNmiss', 'pcio mizz note down', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Death Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Death confirm", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'pico-deathmatch':
				tex = Paths.getSparrowAtlas('Pico_Deathmatch_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico mez u p', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'peko mis lef t', 24, false);
				animation.addByPrefix('singLEFTmiss', 'right pkeo misz', 24, false);
				animation.addByPrefix('singDOWNmiss', 'pcio mizz note down', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Death Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Death confirm", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'pico-car':
				tex = Paths.getSparrowAtlas('Pico_Car_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico mez u p', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'peko mis lef t', 24, false);
				animation.addByPrefix('singLEFTmiss', 'right pkeo misz', 24, false);
				animation.addByPrefix('singDOWNmiss', 'pcio mizz note down', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Death Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Death confirm", 24, false);


				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'pico-car-alt':
				tex = Paths.getSparrowAtlas('Pico_Car_Assets_ALT');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico mez u p', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'peko mis lef t', 24, false);
				animation.addByPrefix('singLEFTmiss', 'right pkeo misz', 24, false);
				animation.addByPrefix('singDOWNmiss', 'pcio mizz note down', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Death Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Death confirm", 24, false);


				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'matricidal-pico':
				tex = Paths.getSparrowAtlas('Matricidal_Pico_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico mez u p', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'peko mis lef t', 24, false);
				animation.addByPrefix('singLEFTmiss', 'right pkeo misz', 24, false);
				animation.addByPrefix('singDOWNmiss', 'pcio mizz note down', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Death Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Death confirm", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-bside-pico-matricidal':
				tex = Paths.getSparrowAtlas('BSide/characters/Pico_Car_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico mez u p', 24, false);
				animation.addByPrefix('singLEFTmiss', 'peko mis lef t', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right pkeo misz', 24, false);
				animation.addByPrefix('singDOWNmiss', 'pcio mizz note down', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Death Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Death confirm", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf':
				var tex = Paths.getSparrowAtlas('BF_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY!!', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'monster':
				var tex = Paths.getSparrowAtlas('Monster_Christmas_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster Right note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster left note', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');

			case 'bf-deathmatch':
				var tex = Paths.getSparrowAtlas('BF_Deathmatch_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 20, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 20, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 20, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 20, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bfmind-deathShit':
				var tex = Paths.getSparrowAtlas('BF_Death');
                                  frames = tex;
				animation.addByPrefix('idle', "BF dies", 24, false);
				animation.addByPrefix('singUP', "BF dies", 24, false);
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
                animation.play('firstDeath');

				playAnim('firstDeath');

				flipX = true;
			case 'bf-deathShit':
				var tex = Paths.getSparrowAtlas('CBF_Death');
                                  frames = tex;
				animation.addByPrefix('idle', "BF FUCKING COMMITS DEATH", 24, false);
				animation.addByPrefix('singUP', "BF FUCKING COMMITS DEATH", 24, false);
				animation.addByPrefix('firstDeath', "BF FUCKING COMMITS DEATH", 24, false);
				animation.addByPrefix('deathLoop', "BF DEATH LOOP", 24, true);
				animation.addByPrefix('deathConfirm', "BF WANTS TO KEEP DYING", 24, false);
                animation.play('firstDeath');

				playAnim('firstDeath');

				flipX = true;

			case 'mom-death-animation':
				var tex = Paths.getSparrowAtlas('Mom_Death');
                                  frames = tex;
				animation.addByPrefix('idle', "Mom dies", 24, false);
				animation.addByPrefix('singUP', "Mom dies", 24, false);
				animation.addByPrefix('firstDeath', "Mom dies", 24, false);
				animation.addByPrefix('deathLoop', "Mom dead loop", 24, true);
				animation.addByPrefix('deathConfirm', "mom dead corfirm", 24, false);
                animation.play('firstDeath');

				playAnim('firstDeath');

				flipX = true;

			case 'pico-death-animation':
				var tex = Paths.getSparrowAtlas('Pico_Death');
                                  frames = tex;
				animation.addByPrefix('idle', "PICO DEATH", 24, false);
				animation.addByPrefix('singUP', "PICO DEATH", 24, false);
				animation.addByPrefix('firstDeath', "PICO DEATH", 24, false);
				animation.addByPrefix('deathLoop', "PICO LOOP", 24, true);
				animation.addByPrefix('deathConfirm', "PICO RETRY", 24, false);
                animation.play('firstDeath');
				playAnim('firstDeath');

				flipX = true;

			case 'bf-deathmatch-bside':
				var tex = Paths.getSparrowAtlas('BSide/characters/BF-Week1Assets-BSIDE');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 20, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 20, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 20, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 20, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);


				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'fart':
				var tex = Paths.getSparrowAtlas('fart/fartfriend');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance istanza 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP istanza 10', 20, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT istanza 10', 20, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT istanza 10', 20, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN istanza 10', 20, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP istanza 10', 20, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT istanza 10', 20, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT istanza 10', 20, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN istanza 10', 20, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'oof':
				var tex = Paths.getSparrowAtlas('fart/YOUR MOTHER');
				frames = tex;
				animation.addByPrefix('idle', 'idle idfk aaaaaa fart', 24, false);
				animation.addByPrefix('singUP', 'idle idfk aaaaaa fart', 24, false);
				animation.addByPrefix('singRIGHT', 'idle idfk aaaaaa fart', 24, false);
				animation.addByPrefix('singLEFT', 'idle idfk aaaaaa fart', 24, false);
				animation.addByPrefix('singDOWN', 'idle idfk aaaaaa fart', 24, false);
				animation.addByPrefix('singUPmiss', 'idle idfk aaaaaa fart', 20, false);
				animation.addByPrefix('singLEFTmiss', 'idle idfk aaaaaa fart', 20, false);
				animation.addByPrefix('singRIGHTmiss', 'idle idfk aaaaaa fart', 20, false);
				animation.addByPrefix('singDOWNmiss', 'idle idfk aaaaaa fart', 20, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'pico-d1':
				tex = Paths.getSparrowAtlas('Pico_D1_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bside-pico-d1':
				tex = Paths.getSparrowAtlas('BSide/characters/BSIDE D1 PICO');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'yourmom':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('BSide/characters/D3 BSIDE DAD');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, true);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);

				loadOffsetFile(curCharacter);

			case 'pico-d2':
				tex = Paths.getSparrowAtlas('Pico_D2_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'pico-d3':
				tex = Paths.getSparrowAtlas('Pico_D3_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bsidepico-d3':
				tex = Paths.getSparrowAtlas('BSide/characters/Pico_D3_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-deathmatch-characters':
				tex = Paths.getSparrowAtlas('DEATHMATCH_BOYFRIEND_CHARACTERS');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, true);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('idle-pico', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP-pico', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT-pico', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singLEFT-pico', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN-pico', 'Pico Down Note0', 24, false);
				animation.addByPrefix('idle-spooky', 'spooky dance idle', 24, true);
				animation.addByPrefix('singUP-spooky', 'spooky UP NOTE0', 24, false);
				animation.addByPrefix('singRIGHT-spooky', 'SPOOKY RIGHT NTOE0', 24, false);
				animation.addByPrefix('singLEFT-spooky', 'spooky LEFT note0', 24, false);
				animation.addByPrefix('singDOWN-spooky', 'spooky DOWN note0', 24, false);
				animation.addByPrefix('idle-mom', 'Mom Idle', 24, true);
				animation.addByPrefix('singUP-mom', 'Mom Up Pose', 24, false);
				animation.addByPrefix('singRIGHT-mom', 'Mom Pose RIGHT0', 24, false);
				animation.addByPrefix('singLEFT-mom', 'MOM LEFT0', 24, false);
				animation.addByPrefix('singDOWN-mom', 'MOM DOWN POSE0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS0', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS0', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 24, false);
				animation.addByPrefix('singUPmiss-pico', 'pico mez u p0', 24, false);
				animation.addByPrefix('singRIGHTmiss-pico', 'right pkeo misz0', 24, false);
				animation.addByPrefix('singLEFTmiss-pico', 'peko mis lef t0', 24, false);
				animation.addByPrefix('singDOWNmiss-pico', 'pcio mizz note down0', 24, false);
				animation.addByPrefix('singUPmiss-spooky', 'spooky UP NOTE miss0', 24, false);
				animation.addByPrefix('singRIGHTmiss-spooky', 'spok right skill issue0', 24, false);
				animation.addByPrefix('singLEFTmiss-spooky', 'spooky LEFT miss0', 24, false);
				animation.addByPrefix('singDOWNmiss-spooky', 'spooky DOWN note miss0', 24, false);
				animation.addByPrefix('singUPmiss-mom', 'mom miss up', 24, false);
				animation.addByPrefix('singRIGHTmiss-mom', 'mom miss right0', 24, false);
				animation.addByPrefix('singLEFTmiss-mom', 'mom left miss0', 24, false);
				animation.addByPrefix('singDOWNmiss-mom', 'MOM MISS DOWN0', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bsidepico-d2':
				tex = Paths.getSparrowAtlas('BSide/characters/Pico_D2_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Pico Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-philly':
				var tex = Paths.getSparrowAtlas('BF_Philly_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "Ded", 24, false);
				animation.addByPrefix('deathLoop', "Ded", 24, true);
				animation.addByPrefix('deathConfirm', "Ded", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-bside-philly':
				var tex = Paths.getSparrowAtlas('BSide/characters/BF_Philly_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-alt':
				var tex = Paths.getSparrowAtlas('BF_Alt_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "Ded", 24, false);
				animation.addByPrefix('deathLoop', "Ded", 24, true);
				animation.addByPrefix('deathConfirm', "Ded", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-bside-alt':
				var tex = Paths.getSparrowAtlas('BSide/characters/BF_Alt_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('hey', "BF HEY!!", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-pixel-d1':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d1');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-pixel-d1-alt':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d1-alt');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-pixel-d3':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d3');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-pixel-d2':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d2');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-pixel-d4':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d4');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-bside-pixel-d4':
				frames = Paths.getSparrowAtlas('BSide/characters/bfPixel-d4');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-anim1':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d2-startAnim1');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-anim2':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d2-startAnim2');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-anim3':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-d2-startAnim3');
				animation.addByPrefix('idle', 'BF IDLE', 24, true);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('pixelAssets/bfPixel-DEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				loadOffsetFile(curCharacter);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('pixelAssets/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, true);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-worried':
				frames = Paths.getSparrowAtlas('pixelAssets/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, true);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-worried-unglitched':
				frames = Paths.getSparrowAtlas('pixelAssets/senpai-scared-unglitched');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, true);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'senpai-mad':
				frames = Paths.getSparrowAtlas('pixelAssets/senpai-mad');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, true);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'spirit':
				frames = Paths.getPackerAtlas('pixelAssets/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;
			case 'bsidespirit':
				frames = Paths.getPackerAtlas('BSide/characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;
			case 'bsidespirit-dies':
				frames = Paths.getPackerAtlas('BSide/characters/spirit-defeated');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;
			case 'spirit-defeated':
				frames = Paths.getPackerAtlas('pixelAssets/spirit-defeated');
				animation.addByPrefix('idle', "idle spirit_", 24, true);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;
			case 'gf-pixel-alt':
				tex = Paths.getSparrowAtlas('pixelAssets/gfPixel-alt');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
			case 'gf-pixel-redacted':
				tex = Paths.getSparrowAtlas('pixelAssets/gfPixel-redacted');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
			case 'gf-pixel-eye':
				tex = Paths.getSparrowAtlas('pixelAssets/gfPixel-eye');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;

			case 'evil-bf':
				tex = Paths.getSparrowAtlas('Soul_BF_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Soul BF Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'Soul BF Note Up', 24, false);
				animation.addByPrefix('singLEFT', 'Soul BF Left Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Soul BF Note Right', 24, false);
				animation.addByPrefix('singDOWN', 'Soul BF Note Down', 24, false);
				setGraphicSize(Std.int(width * 1.3));
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-evil-bf':
				tex = Paths.getSparrowAtlas('BSide/characters/BSIDESoul_BF_Assets normal');
				frames = tex;
				animation.addByPrefix('idle', 'Soul BF Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'Soul BF Note Up', 24, false);
				animation.addByPrefix('singLEFT', 'Soul BF Left Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Soul BF Note Right', 24, false);
				animation.addByPrefix('singDOWN', 'Soul BF Note Down', 24, false);
				setGraphicSize(Std.int(width * 1.3));
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'evil-bf-guitar-up':
				tex = Paths.getSparrowAtlas('dischargeAssets/UPFinal');
				frames = tex;
				animation.addByPrefix('idle', 'Guitar up istanza 1', 24, true);
				setGraphicSize(Std.int(width * 1.2));
				loadOffsetFile(curCharacter);
				playAnim('idle');

			case 'bf-guitar-up':
				tex = Paths.getSparrowAtlas('dischargeAssets/BoyFriend_UPFINAL');
				frames = tex;
				animation.addByPrefix('idle', 'BF NOTE UP istanza 1', 24, true);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);
				playAnim('idle');
                                  flipX = true;
			case 'evil-bf-poof':
				tex = Paths.getSparrowAtlas('dischargeAssets/Soul_BF_Discharge_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Evil Boyfriend Idle', 24, true);
				animation.addByPrefix('singUP', 'SING UP Evil BoyFriend', 24, false);
				animation.addByPrefix('singRIGHT', 'SING RIGHT Evil Boyfriend', 24, false);
				animation.addByPrefix('singDOWN', 'SING DOWN Evil BoyFriend', 24, false);
				animation.addByPrefix('singLEFT', 'SING LEFT Evil BoyFriend', 24, false);
				animation.addByPrefix('guitarEnter', 'Soul BF Play Guitar', 21, false);
				setGraphicSize(Std.int(width * 1.2));
				loadOffsetFile(curCharacter);
				playAnim('idle');

			case 'evil-bf-guitar-1':
				tex = Paths.getSparrowAtlas('dischargeAssets/Evil_BF_Guitar_1');
				frames = tex;
				animation.addByPrefix('idle', 'full animation 1', 22, true);
				setGraphicSize(Std.int(width * 1.2));
				addOffset('idle');
				playAnim('idle');
			case 'evil-bf-guitar-2':
				tex = Paths.getSparrowAtlas('dischargeAssets/Evil_BF_Guitar_2');
				frames = tex;
				animation.addByPrefix('idle', 'full animation 1', 21, true);
				setGraphicSize(Std.int(width * 1.2));
				addOffset('idle');
				playAnim('idle');

			case 'evil-bf-guitar-discharge':
				tex = Paths.getSparrowAtlas('dischargeAssets/Soul_BF_Guitar_Animations');
				frames = tex;
				animation.addByPrefix('idle', 'Animation guitar 10', 24, true);
				animation.addByPrefix('guitar1', 'Animation guitar 10', 24, true);
				animation.addByPrefix('guitar2', 'Animtion guitar 20', 24, true);
				animation.addByPrefix('guitar3', 'Animation guitar 30', 24, true);
				animation.addByPrefix('guitar4', 'GUITAR XD 20', 24, true);
				animation.addByPrefix('guitar5', 'Guitar down 0', 24, true);
				animation.addByPrefix('guitar6', 'Guitar up0', 24, true);
				animation.addByPrefix('guitar7', 'guitar xd 10', 24, true);
				animation.addByPrefix('guitar8', 'shred guitar', 24, true);
				animation.addByPrefix('guitar9', 'down guitar go vrrrrr', 24, false);
				animation.addByPrefix('guitar10', 'DKFHS', 24, true);
				animation.addByPrefix('guitarSmash', 'THROW GUITAR 1', 24, false);
				setGraphicSize(Std.int(width * 1.2));
				loadOffsetFile(curCharacter);
				playAnim('idle');
			case 'bf-soul-lol':
				tex = Paths.getSparrowAtlas('Soul_BF_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Soul BF idle dance', 24, true);
				animation.addByPrefix('singUP', 'Soul BF Sing Note UP', 24, false);
				animation.addByPrefix('singLEFT', 'Soul BF Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Soul BF Sing Note DOWN', 24, false);
				animation.addByPrefix('singRIGHT', 'Soul BF Sing Note LEFT', 24, false);
				animation.addByPrefix('singUPmiss', 'Soul BF Sing Note UP', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Soul BF Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Soul BF Sing Note DOWN', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Soul BF Sing Note LEFT', 24, false);
				setGraphicSize(Std.int(width * 1.2));
				loadOffsetFile(curCharacter);
				playAnim('idle');

			case 'demon-evil-bf':
				tex = Paths.getSparrowAtlas('Demon_Soul_BF_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Soul BF Idle Dance', 24, true);
				animation.addByPrefix('singUP', 'Soul BF Note Up', 24, false);
				animation.addByPrefix('singLEFT', 'Soul BF Left Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Soul BF Note Right', 24, false);
				animation.addByPrefix('singDOWN', 'Soul BF Note Down', 24, false);
				setGraphicSize(Std.int(width * 1.3));
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'soul-gar':
				tex = Paths.getSparrowAtlas('garello_real/SoulGarcello_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24, true);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24, false);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24, false);
				setGraphicSize(Std.int(width * 1.2));
				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'bf-gar':
				tex = Paths.getSparrowAtlas('garello_real/garcello_assets');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24, true);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note LEFT', 24, false);
				animation.addByPrefix('singLEFT', 'garcello Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24, false);
				setGraphicSize(Std.int(width * 1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'evil-bf-guitar':
				tex = Paths.getSparrowAtlas('Guitar_Soul_BF_Assets');
				frames = tex;
				animation.addByPrefix('guitar', 'Soul BF Guitar', 22, false);
				setGraphicSize(Std.int(width * 1.2));
				loadOffsetFile(curCharacter);
				playAnim('guitar');

			case 'moustaches':
				tex = Paths.getSparrowAtlas('bonus/Dancing-Moustache');
				frames = tex;
				animation.addByPrefix('idle', 'Dancing Moustache Dance Tralalalallaaallalalala', 25, true);
				setGraphicSize(Std.int(width * 3.5));
				loadOffsetFile(curCharacter);
				playAnim('idle');

				flipX = true;
			case 'bf-normal':
				var tex = Paths.getSparrowAtlas('BF_Normal_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, true);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-bside-mind':
				var tex = Paths.getSparrowAtlas('BSide/characters/BSide-BF-1');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, true);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-discharge':
				var tex = Paths.getSparrowAtlas('dischargeAssets/BF_Discharge_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 20, true);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				animation.addByPrefix('drugs', "that one anim", 24, false);
				animation.addByPrefix('cocaine', "BF ANIM 2", 24, false);
				animation.addByPrefix('ohSHIT', "bf gets a guitar in his fucking face", 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-normal-2':
				var tex = Paths.getSparrowAtlas('BF_Normal_Assets_2');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, true);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-normal-3':
				var tex = Paths.getSparrowAtlas('BF_Normal_Assets_3');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF Dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				setGraphicSize(Std.int(width * 1.1));
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('BF_Christmas_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('Parents_Christmas_Assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('GF_Christmas_Assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'dlc-spooky-d1':
				tex = Paths.getSparrowAtlas('dlc/week2/DLC_Spooky_D1_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				addOffset('idle');

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'dlc-spooky-d2':
				tex = Paths.getSparrowAtlas('dlc/week2/DLC_Spooky_D2_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				addOffset('idle');

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'dlc-spooky-d3':
				tex = Paths.getSparrowAtlas('dlc/week2/DLC_Spooky_D3_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, true);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('idle', 'spooky dance idle', 24, false);

				addOffset('idle');

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-parents':
				frames = Paths.getSparrowAtlas('BSide/characters/Parents_Christmas_Assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'bside-monster':
				var tex = Paths.getSparrowAtlas('BSide/characters/Monster_Christmas_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster Right note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster left note', 24, false);

				loadOffsetFile(curCharacter);

			case 'bf-christmas-bside':
				var tex = Paths.getSparrowAtlas('BSide/characters/BF_Christmas_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bside-gf-christmas':
				tex = Paths.getSparrowAtlas('BSide/characters/GF_Christmas_Assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');
			case 'gf-bside-lol':
				tex = Paths.getSparrowAtlas('BSide/characters/GF_Assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'bf-bside':
				var tex = Paths.getSparrowAtlas('BSide/characters/BF_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY!!', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'sonic':
				tex = Paths.getSparrowAtlas('sonic.exe/characters/SonicAssets');
				frames = tex;
				animation.addByPrefix('idle', 'SONICmoveIDLE', 24, true);
				animation.addByPrefix('singUP', 'SONICmoveUP', 24);
				animation.addByPrefix('singLEFT', 'SONICmoveLEFT', 24);
				animation.addByPrefix('singDOWN', 'SONICmoveDOWN', 24);
				animation.addByPrefix('singRIGHT', 'SONICmoveRIGHT', 24);															
				animation.addByPrefix('singDOWN-alt', 'SONIClaugh', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'sonicfun':

				tex = Paths.getSparrowAtlas('sonic.exe/characters/SonicFunAssets');
				frames = tex;
				animation.addByPrefix('idle', 'SONICFUNIDLE', 24);
				animation.addByPrefix('singUP', 'SONICFUNUP', 24);
				animation.addByPrefix('singRIGHT', 'SONICFUNRIGHT', 24);
				animation.addByPrefix('singDOWN', 'SONICFUNDOWN', 24);
				animation.addByPrefix('singLEFT', 'SONICFUNLEFT', 24);
	
				loadOffsetFile(curCharacter);
					
	
				playAnim('idle');
			case 'bf-real':
				var tex = Paths.getSparrowAtlas('sonic.exe/characters/BOYFRIEND');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

                animation.addByPrefix('dodge','boyfriend dodge', 24, false);
                
				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'gf-real':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('sonic.exe/characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');
				





		}

		dance();


		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'picoSpeaker':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('idle');
						else
							playAnim('idle');
					}

				case 'gf-tankman':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function loadOffsetFile(character:String)
	{
		var offset:Array<String> = CoolUtil.coolTextFile(Paths.txt('offsetsFiles/' + character + "Offsets"));

		for (i in 0...offset.length)
		{
			var data:Array<String> = offset[i].split(' ');
			addOffset(data[0], Std.parseInt(data[1]), Std.parseInt(data[2]));
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
