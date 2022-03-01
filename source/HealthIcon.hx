package;

import flixel.FlxSprite;
import utils.AndroidData;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	var data:AndroidData = new AndroidData();

	public var iconScale:Float = 1;
	public var iconSize:Float;
	public var defaultIconScale:Float = 1;

	var pixelIcons:Array<String> = ["bf-pixel", "senpai", "senpai-angry", "spirit"];

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf-past', [48, 49], 0, false, isPlayer);
		animation.add('pastdad', [114, 115], 0, false, isPlayer);
		animation.add('project-dad-1', [112, 113], 0, false, isPlayer);
		animation.add('project-dad-2', [112, 113], 0, false, isPlayer);
		animation.add('project-dad-3', [122, 123], 0, false, isPlayer);
		animation.add('project-dad-4', [124, 125], 0, false, isPlayer);
		animation.add('bf-project', [110, 111], 0, false, isPlayer);
		animation.add('bf-spooky-project', [120, 121], 0, false, isPlayer);
		animation.add('bsidespooky-dm', [128, 129], 0, false, isPlayer);
		animation.add('soul-gar', [130, 130], 0, false, isPlayer);
		animation.add('bf-gar', [131, 132], 0, false, isPlayer);
		animation.add('bf-pico-project', [118, 119], 0, false, isPlayer);
		animation.add('bigmonika', [118, 119], 0, false, isPlayer);
		animation.add('bf-mom-project', [116, 117], 0, false, isPlayer);
		animation.add('bf-mom-project-2', [116, 117], 0, false, isPlayer);
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-deathmatch-characters', [0, 1], 0, false, isPlayer);
		animation.add('fart', [0, 1], 0, false, isPlayer);
		animation.add('bf-philly', [70, 71], 0, false, isPlayer);
		animation.add('bf-bside-philly', [67, 68], 0, false, isPlayer);
		animation.add('bf-alt', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [48, 49], 0, false, isPlayer);
		animation.add('bsidepico-d3', [51, 52], 0, false, isPlayer);
		animation.add('bsidepico-d2', [51, 50], 0, false, isPlayer);
		animation.add('bf-deathmatch', [0, 1], 0, false, isPlayer);
		animation.add('bf-deathmatch-bside', [65, 66], 0, false, isPlayer);
		animation.add('dad-deathmatch', [24, 25], 0, false, isPlayer);
		animation.add('dad-fartmatch', [24, 25], 0, false, isPlayer);
		animation.add('dad-hopeless', [24, 24], 0, false, isPlayer);
		animation.add('lament-dad', [14, 15], 0, false, isPlayer);
		animation.add('bsidelament-dad', [84, 85], 0, false, isPlayer);
		animation.add('bsidelament-dad-alt', [86, 87], 0, false, isPlayer);
		animation.add('lament-dad-alt', [16, 17], 0, false, isPlayer);
		animation.add('dusk-dad', [18, 19], 0, false, isPlayer);
		animation.add('dusk-dad-alt-3', [18, 19], 0, false, isPlayer);
		animation.add('dusk-dad-alt-4', [18, 19], 0, false, isPlayer);
		animation.add('dusk-dad-alt-4-redeyes', [20, 21], 0, false, isPlayer);
		animation.add('dusk-dad-alt', [20, 21], 0, false, isPlayer);
		animation.add('dusk-dad-alt-2', [20, 21], 0, false, isPlayer);
		animation.add('bsidedusk-dad', [88, 89], 0, false, isPlayer);
		animation.add('bsidedusk-dad-alt', [90, 91], 0, false, isPlayer);
		animation.add('dad-deathmatch-1', [26, 27], 0, false, isPlayer);
		animation.add('dad-deathmatch-2', [22, 23], 0, false, isPlayer);
		animation.add('dad-deathmatch-3', [22, 23], 0, false, isPlayer);
		animation.add('bsidedad-deathmatch-1', [96, 96], 0, false, isPlayer);
		animation.add('bsidedad-deathmatch-2', [92, 93], 0, false, isPlayer);
		animation.add('bsidedad-deathmatch-3', [92, 93], 0, false, isPlayer);
		animation.add('dad-fartmatch-1', [26, 27], 0, false, isPlayer);
		animation.add('dad-fartmatch-2', [22, 23], 0, false, isPlayer);
		animation.add('dad-fartmatch-3', [22, 23], 0, false, isPlayer);
		animation.add('bf-bside-pixel-d4', [62, 62], 0, false, isPlayer);
		animation.add('bsidespirit', [63, 64], 0, false, isPlayer);
		animation.add('bsidespirit-dies', [63, 64], 0, false, isPlayer);
		animation.add('spooky-dm', [12, 13], 0, false, isPlayer);
		animation.add('bf-bside-mind', [100, 101], 0, false, isPlayer);
		animation.add('bside-evil-bf', [72, 73], 0, false, isPlayer);
		animation.add('gnome', [12, 13], 0, false, isPlayer);
		animation.add('pico-deathmatch', [2, 3], 0, false, isPlayer);
		animation.add('what', [2, 3], 0, false, isPlayer);
		animation.add('bside-pico-d1', [51, 52], 0, false, isPlayer);
		animation.add('pico-d1', [41, 42], 0, false, isPlayer);
		animation.add('pico-d2', [41, 40], 0, false, isPlayer);
		animation.add('pico-d3', [41, 42], 0, false, isPlayer);
		animation.add('mom-deathmatch', [30, 31], 0, false, isPlayer);
		animation.add('bsidemom-deathmatch', [126, 127], 0, false, isPlayer);
		animation.add('oof', [30, 31], 0, false, isPlayer);
		animation.add('yourmom', [95, 95], 0, false, isPlayer);
		animation.add('bf-whitty-deathmatch', [106, 106], 0, false, isPlayer);
		animation.add('evil-bf-poof', [133, 133], 0, false, isPlayer);
		animation.add('spooky-d1', [6, 7], 0, false, isPlayer);
		animation.add('spooky-d2', [8, 9], 0, false, isPlayer);
		animation.add('spooky-d3', [10, 11], 0, false, isPlayer);
		animation.add('bside-spooky-d1', [54, 55], 0, false, isPlayer);
		animation.add('bside-spooky-d2', [56, 57], 0, false, isPlayer);
		animation.add('bside-spooky-d3', [58, 59], 0, false, isPlayer);
		animation.add('mom-d1', [34, 35], 0, false, isPlayer);
		animation.add('playable-gf', [34, 35], 0, false, isPlayer);
		animation.add('bside-mom-d1', [78, 79], 0, false, isPlayer);
		animation.add('mom-d2', [36, 37], 0, false, isPlayer);
		animation.add('mom-d3', [28, 29], 0, false, isPlayer);
		animation.add('moustaches', [99, 99], 0, false, isPlayer);
		animation.add('pico-car-alt', [4, 5], 0, false, isPlayer);
		animation.add('pico-car', [2, 3], 0, false, isPlayer);
		animation.add('senpai', [47, 47], 0, false, isPlayer);
		animation.add('senpai-worried', [47, 47], 0, false, isPlayer);
		animation.add('senpai-worried-unglitched', [47, 47], 0, false, isPlayer);
		animation.add('senpai-mad', [47, 47], 0, false, isPlayer);
		animation.add('bf-pixel-d1', [32, 33], 0, false, isPlayer);
		animation.add('bf-pixel-d1-alt', [32, 33], 0, false, isPlayer);
		animation.add('bf-pixel-d2', [32, 33], 0, false, isPlayer);
		animation.add('bf-pixel-d3', [32, 33], 0, false, isPlayer);
		animation.add('bf-pixel-d4', [45, 46], 0, false, isPlayer);
		animation.add('spirit', [43, 44], 0, false, isPlayer);
		animation.add('spirit-defeated', [43, 44], 0, false, isPlayer);
		animation.add('bf-normal', [48, 49], 0, false, isPlayer);
		animation.add('bf-discharge', [48, 49], 0, false, isPlayer);
		animation.add('bf-normal-2', [48, 49], 0, false, isPlayer);
		animation.add('bf-normal-3', [48, 49], 0, false, isPlayer);
		animation.add('evil-bf', [38, 39], 0, false, isPlayer);
		animation.add('soul2', [38, 39], 0, false, isPlayer);
		animation.add('demon-evil-bf', [38, 39], 0, false, isPlayer);
		animation.add('demon-evil-bf-overlay', [38, 39], 0, false, isPlayer);
		animation.add('monster', [104, 105], 0, false, isPlayer);
		animation.add('parents-christmas', [98, 98], 0, false, isPlayer);
		animation.add('bf-anim1', [32, 33], 0, false, isPlayer);
		animation.add('bf-anim2', [32, 33], 0, false, isPlayer);
		animation.add('bf-anim3', [32, 33], 0, false, isPlayer);
		animation.add('matricidal-pico', [2, 3], 0, false, isPlayer);
		animation.add('bf-bside-pico-matricidal', [80, 81], 0, false, isPlayer);
		animation.add('bside-parents', [53, 53], 0, false, isPlayer);
		animation.add('bf-christmas-bside', [100, 101], 0, false, isPlayer);
		animation.add('bf-bside', [65, 66], 0, false, isPlayer);
		animation.add('bf-bside-alt', [65, 66], 0, false, isPlayer);
		animation.add('bside-monster', [102, 103], 0, false, isPlayer);
		animation.add('sonic', [108, 109], 0, false, isPlayer);
		animation.add('sonicfun', [69, 69], 0, false, isPlayer);
		animation.add('bf-real', [48, 49], 0, false, isPlayer);
		animation.add('bf_404', [48, 49], 0, false, isPlayer);
		animation.add('robot', [24, 25], 0, false, isPlayer);
		animation.add('robot_404', [24, 25], 0, false, isPlayer); //Just in case;
		animation.add('robot_404-TERMINATION', [24, 25], 0, false, isPlayer); //Just in case;
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		setGraphicSize(Std.int(iconSize * iconScale));
		updateHitbox();

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
