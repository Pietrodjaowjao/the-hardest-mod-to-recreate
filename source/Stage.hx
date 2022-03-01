package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Stage extends MusicBeatState
{
	public var curStage:String = '';
	public var camZoom:Float; // The zoom of the camera to have at the start of the game
	public var hideLastBG:Bool = false; // True = hide last BGs and show ones from slowBacks on certain step, False = Toggle visibility of BGs from SlowBacks on certain step
	// Use visible property to manage if BG would be visible or not at the start of the game
	public var tweenDuration:Float = 2; // How long will it tween hiding/showing BGs, variable above must be set to True for tween to activate
	public var toAdd:Array<Dynamic> = []; // Add BGs on stage startup, load BG in by using "toAdd.push(bgVar);"
	// Layering algorithm for noobs: Everything loads by the method of "On Top", example: You load wall first(Every other added BG layers on it), then you load road(comes on top of wall and doesn't clip through it), then loading street lights(comes on top of wall and road)
	public var swagBacks:Map<String,
		Dynamic> = []; // Store BGs here to use them later (for example with slowBacks, using your custom stage event or to adjust position in stage debug menu(press 8 while in PlayState with debug build of the game))
	public var swagGroup:Map<String, FlxTypedGroup<Dynamic>> = []; // Store Groups
	public var animatedBacks:Array<FlxSprite> = []; // Store animated backgrounds and make them play animation(Animation must be named Idle!! Else use swagGroup/swagBacks and script it in stepHit/beatHit function of this file!!)
	public var layInFront:Array<Array<FlxSprite>> = [[], [], []]; // BG layering, format: first [0] - in front of GF, second [1] - in front of opponent, third [2] - in front of boyfriend(and technically also opponent since Haxe layering moment)
	public var slowBacks:Map<Int,
		Array<FlxSprite>> = []; // Change/add/remove backgrounds mid song! Format: "slowBacks[StepToBeActivated] = [Sprites,To,Be,Changed,Or,Added];"

	var neurosesbg:FlxSprite;
	var neurosesbg2:FlxSprite;
	var neurosesbg3:FlxSprite;
	var neurosestv2:FlxSprite;
	var spikes:FlxSprite;
	var duskcut:FlxSprite;
    // shit for discharge
	var cave1:FlxSprite;
	var cave2:FlxSprite;
	var space:FlxSprite;
	var popup:FlxSprite;
	var cave3:FlxSprite;
	var guitarStrumline:FlxSprite;
    var cave1alt:FlxSprite;
    var cave2alt:FlxSprite;
    var cave3alt:FlxSprite;
	var crack1:FlxSprite;
	var crack2:FlxSprite;
	var crack3:FlxSprite;
	var funnyWhite:FlxSprite;
    var bfCrack1:FlxSprite;
	var bfCrack2:FlxSprite;
	var soulbfCrack1:FlxSprite;
	var soulbfCrack2:FlxSprite;
	var explode:FlxSprite;
    var zapEffect:FlxSprite;
    var portal1:FlxSprite;
    var portal2:FlxSprite;
	var missme:FlxSprite;
	var round2:FlxSprite;
	var keepup:FlxSprite;
	var remember:FlxSprite;
	var friends:FlxSprite;
	var planning:FlxSprite;
	var lmaoNo:FlxSprite;
	var ditch:FlxSprite;
	var mystyle:FlxSprite;
	var endthisShit:FlxSprite;
	var fuckingfocus:FlxSprite;
	var comeON:FlxSprite;
	var thePhoto:FlxSprite;
	var guitar:FlxSprite;
	// BGs still must be added by using toAdd Array for them to show in game after slowBacks take effect!!
	// BGs still must be added by using toAdd Array for them to show in game after slowBacks take effect!!
	// All of the above must be set or used in your stage case code block!!
	public var positions:Map<String, Map<String, Array<Int>>> = [
		// Assign your characters positions on stage here!
		'halloween' => ['spooky' => [100, 300], 'monster' => [100, 200]],
		'philly' => ['pico' => [100, 400]],
		'limo' => ['bf-car' => [1030, 230]],
		'mall' => ['bf-christmas' => [970, 450], 'parents-christmas' => [-400, 100]],
		'mallEvil' => ['bf-christmas' => [1090, 450], 'monster-christmas' => [100, 150]],
		'school' => [
			'gf-pixel' => [580, 430],
			'bf-pixel' => [970, 670],
			'senpai' => [250, 460],
			'senpai-angry' => [250, 460]
		],
		'schoolEvil' => ['gf-pixel' => [580, 430], 'bf-pixel' => [970, 670], 'spirit' => [-50, 200]]
	];

	public function new(daStage:String)
	{
		super();
		this.curStage = daStage;
		camZoom = 1.05; // Don't change zoom here, unless you want to change zoom of every stage that doesn't have custom one
		if (PlayStateChangeables.Optimize)
			return;

		switch (daStage)
		{
			case 'halloween':
				{
					var hallowTex = Paths.getSparrowAtlas('halloween_bg', 'week2');

					var halloweenBG = new FlxSprite(-200, -80);
					halloweenBG.frames = hallowTex;
					halloweenBG.animation.addByPrefix('idle', 'halloweem bg0');
					halloweenBG.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
					halloweenBG.animation.play('idle');
					halloweenBG.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['halloweenBG'] = halloweenBG;
					toAdd.push(halloweenBG);
				}
			case 'philly':
				{
					var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('philly/sky', 'week3'));
					bg.scrollFactor.set(0.1, 0.1);
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var city:FlxSprite = new FlxSprite(-10).loadGraphic(Paths.loadImage('philly/city', 'week3'));
					city.scrollFactor.set(0.3, 0.3);
					city.setGraphicSize(Std.int(city.width * 0.85));
					city.updateHitbox();
					swagBacks['city'] = city;
					toAdd.push(city);

					var phillyCityLights = new FlxTypedGroup<FlxSprite>();
					if (FlxG.save.data.distractions)
					{
						swagGroup['phillyCityLights'] = phillyCityLights;
						toAdd.push(phillyCityLights);
					}

					for (i in 0...5)
					{
						var light:FlxSprite = new FlxSprite(city.x).loadGraphic(Paths.loadImage('philly/win' + i, 'week3'));
						light.scrollFactor.set(0.3, 0.3);
						light.visible = false;
						light.setGraphicSize(Std.int(light.width * 0.85));
						light.updateHitbox();
						light.antialiasing = FlxG.save.data.antialiasing;
						phillyCityLights.toAdd.push(light);
					}

					var streetBehind:FlxSprite = new FlxSprite(-40, 50).loadGraphic(Paths.loadImage('philly/behindTrain', 'week3'));
					swagBacks['streetBehind'] = streetBehind;
					toAdd.push(streetBehind);

					var phillyTrain = new FlxSprite(2000, 360).loadGraphic(Paths.loadImage('philly/train', 'week3'));
					if (FlxG.save.data.distractions)
					{
						swagBacks['phillyTrain'] = phillyTrain;
						toAdd.push(phillyTrain);
					}

					trainSound = new FlxSound().loadEmbedded(Paths.sound('train_passes', 'shared'));
					FlxG.sound.list.toAdd.push(trainSound);

					// var cityLights:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.win0.png);

					var street:FlxSprite = new FlxSprite(-40, streetBehind.y).loadGraphic(Paths.loadImage('philly/street', 'week3'));
					swagBacks['street'] = street;
					toAdd.push(street);
				}
			case 'BFMind3':
				{

                          CamZoom = 0.85;

                          neurosesbg = new FlxSprite(-600, -125).loadGraphic(Paths.image('dischargeAssets/Discharge_End_BG'));
                          neurosesbg.updateHitbox();
                          neurosesbg.antialiasing = true;
                          neurosesbg.scrollFactor.set(0.9, 0.9);
                          neurosesbg.active = false;
                          toAdd.push(neurosesbg);

                          var funnytv:FlxSprite = new FlxSprite(215, 25);
                          funnytv.frames = Paths.getSparrowAtlas('dischargeAssets/Discharge_TV');
                          funnytv.animation.addByPrefix('idle', 'Discharge_TV', 24);
                          funnytv.animation.play('idle');
                          funnytv.scrollFactor.set(0.9, 0.9);
                          funnytv.setGraphicSize(Std.int(funnytv.width * 1));
                          toAdd.push(funnytv);

						funnyWhite = new FlxSprite(-850, -400).loadGraphic(Paths.image('dischargeAssets/leFunnyWhite'));
						funnyWhite.setGraphicSize(Std.int(funnyWhite.width * 9));
						funnyWhite.antialiasing = true;
						funnyWhite.scrollFactor.set(0.9, 0.9);
						funnyWhite.active = false;
						toAdd.push(funnyWhite);

						cave3 = new FlxSprite(-850, -400).loadGraphic(Paths.image('dischargeAssets/Discharge_Sky'));
						cave3.setGraphicSize(Std.int(cave3.width * 0.9));
						cave3.antialiasing = true;
						cave3.scrollFactor.set(0.9, 0.9);
						cave3.active = false;
						toAdd.push(cave3);

						cave2 = new FlxSprite(-600, 100).loadGraphic(Paths.image('dischargeAssets/Discharge_Mountains'));
						cave2.setGraphicSize(Std.int(cave2.width * 0.9));
						cave2.antialiasing = true;
						cave2.scrollFactor.set(0.9, 0.9);
						cave2.active = false;
						toAdd.push(cave2);

						cave1 = new FlxSprite(-960, -500).loadGraphic(Paths.image('dischargeAssets/Discharge_Floor'));
						cave1.setGraphicSize(Std.int(cave1.width * 0.9));
						cave1.antialiasing = true;
						cave1.scrollFactor.set(0.9, 0.9);
						cave1.active = false;
						toAdd.push(cave1);
                        
                        cave3alt = new FlxSprite(-850, -400).loadGraphic(Paths.image('dischargeAssets/Discharge_Sky_ALT'));
                        cave3alt.setGraphicSize(Std.int(cave3alt.width * 0.9));
                        cave3alt.antialiasing = true;
                        cave3alt.alpha = 0;
                        cave3alt.scrollFactor.set(0.9, 0.9);
                        cave3alt.active = false;
                        toAdd.push(cave3alt);

                        cave2alt = new FlxSprite(-600, 100).loadGraphic(Paths.image('dischargeAssets/Discharge_Mountains_ALT'));
                        cave2alt.setGraphicSize(Std.int(cave2alt.width * 0.9));
                        cave2alt.antialiasing = true;
                        cave2alt.alpha = 0;
                        cave2alt.scrollFactor.set(0.9, 0.9);
                        cave2alt.active = false;
                        toAdd.push(cave2alt);

                        cave1alt = new FlxSprite(-960, -500).loadGraphic(Paths.image('dischargeAssets/Discharge_Floor_ALT'));
                        cave1alt.setGraphicSize(Std.int(cave1alt.width * 0.9));
                        cave1alt.antialiasing = true;
                        cave1alt.alpha = 0;
                        cave1alt.scrollFactor.set(0.9, 0.9);
                        cave1alt.active = false;
                        toAdd.push(cave1alt);

							crack1 = new FlxSprite(0, 200);
							crack1.frames = Paths.getSparrowAtlas('dischargeAssets/Crack1');
							crack1.animation.addByPrefix('idle', 'Crack', 24, false);
							crack1.alpha = 0;
crack1.animation.play('idle');

							crack1.antialiasing = true;
							crack1.scrollFactor.set(0.9, 0.9);
							toAdd.push(crack1);

							crack2 = new FlxSprite(0, 200);
							crack2.frames = Paths.getSparrowAtlas('dischargeAssets/Crack2');
							crack2.animation.addByPrefix('idle', 'Crack2', 24, false);
							crack2.alpha = 0;
crack2.animation.play('idle');

							crack2.antialiasing = true;
							crack2.scrollFactor.set(0.9, 0.9);
							toAdd.push(crack2);

							crack3 = new FlxSprite(0, 200);
							crack3.frames = Paths.getSparrowAtlas('dischargeAssets/Crack3');
							crack3.animation.addByPrefix('idle', 'Crack3', 24, false);
							crack3.alpha = 0;
crack3.animation.play('idle');

							crack3.antialiasing = true;
							crack3.scrollFactor.set(0.9, 0.9);
							toAdd.push(crack3);

                        guitar = new FlxSprite(800, 700).loadGraphic(Paths.image('dischargeAssets/Guitar'));
                        guitar.antialiasing = true;
                        guitar.alpha = 0;
                        guitar.scrollFactor.set(0.9, 0.9);
                        guitar.active = false;
                        toAdd.push(guitar);

                        bfCrack1 = new FlxSprite(550, 300).loadGraphic(Paths.image('dischargeAssets/EndCrack_BF_1'));
                        bfCrack1.antialiasing = true;
                        bfCrack1.alpha = 0;
                        bfCrack1.scrollFactor.set(0.9, 0.9);
                        bfCrack1.active = false;
                        toAdd.push(bfCrack1);

                        bfCrack2 = new FlxSprite(550, 0).loadGraphic(Paths.image('dischargeAssets/EndCrack_BF_2'));
                        bfCrack2.antialiasing = true;
                        bfCrack2.alpha = 0;
                        bfCrack2.scrollFactor.set(0.9, 0.9);
                        bfCrack2.active = false;
                        toAdd.push(bfCrack2);

                        soulbfCrack1 = new FlxSprite(-250, 150).loadGraphic(Paths.image('dischargeAssets/EndCrack_SoulBF_1'));
                        soulbfCrack1.antialiasing = true;
                        soulbfCrack1.alpha = 0;
                        soulbfCrack1.scrollFactor.set(0.9, 0.9);
                        soulbfCrack1.active = false;
                        toAdd.push(soulbfCrack1);

                        soulbfCrack2 = new FlxSprite(-150, 150).loadGraphic(Paths.image('dischargeAssets/EndCrack_SoulBF_2'));
                        soulbfCrack2.antialiasing = true;
                        soulbfCrack2.alpha = 0;
                        soulbfCrack2.scrollFactor.set(0.9, 0.9);
                        soulbfCrack2.active = false;
                        toAdd.push(soulbfCrack2);

                        bfCrack2 = new FlxSprite(550, 300).loadGraphic(Paths.image('dischargeAssets/EndCrack_BF_2'));
                        bfCrack2.antialiasing = true;
                        bfCrack2.alpha = 0;
                        bfCrack2.scrollFactor.set(0.9, 0.9);
                        bfCrack2.active = false;
                        toAdd.push(bfCrack2);
                            
                            zapEffect = new FlxSprite(-300, -200);
                            zapEffect.frames = Paths.getSparrowAtlas('dischargeAssets/ZapEffect');
                            zapEffect.animation.addByPrefix('idle', 'Zap', 24, false);
                            zapEffect.alpha = 0;
                            zapEffect.setGraphicSize(Std.int(zapEffect.width * 1.5));
                            zapEffect.antialiasing = true;
                            zapEffect.scrollFactor.set(0.9, 0.9);
                            toAdd.push(zapEffect);
                            
                            portal1 = new FlxSprite(550, 350);
                            portal1.frames = Paths.getSparrowAtlas('dischargeAssets/BFPortal');
                            portal1.animation.addByPrefix('idle', 'Idle', 24);
                            portal1.animation.play('idle');
                            portal1.alpha = 0;
                            portal1.setGraphicSize(Std.int(portal1.width * 0.7));
                            portal1.antialiasing = true;
                            portal1.scrollFactor.set(0.9, 0.9);
                            toAdd.push(portal1);
                                                        
                            portal2 = new FlxSprite(-630, 120);
                            portal2.frames = Paths.getSparrowAtlas('dischargeAssets/SoulBFPortal');
                            portal2.animation.addByPrefix('idle', 'Idle', 24);
                            portal2.animation.play('idle');
                            portal2.alpha = 0;
                            portal2.setGraphicSize(Std.int(portal2.width * 1.5));
                            portal2.antialiasing = true;
                            portal2.scrollFactor.set(0.9, 0.9);
                            toAdd.push(portal2);
                            explode = new FlxSprite(-600, -200);
                            explode.frames = Paths.getSparrowAtlas('dischargeAssets/Discharge_BG_Break');
                            explode.animation.addByPrefix('idle', 'Break', 24, false);
                            explode.alpha = 0;
                            explode.antialiasing = true;
                            explode.scrollFactor.set(0.9, 0.9);
                            toAdd.push(explode);

                          missme = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/MissMe'));
                          missme.alpha = 0;
                          missme.cameras = [camHUD];
                          missme.setGraphicSize(Std.int(missme.width * 0.84));
                          toAdd.push(missme);
                          round2 = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/Round2'));
                          round2.alpha = 0;
                          round2.cameras = [camHUD];
                          round2.setGraphicSize(Std.int(round2.width * 0.84));
                          toAdd.push(round2);
                          keepup = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/KeepUp'));
                          keepup.alpha = 0;
                          keepup.cameras = [camHUD];
                          keepup.setGraphicSize(Std.int(keepup.width * 0.84));
                          toAdd.push(keepup);
                          remember = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/Remember'));
                          remember.alpha = 0;
                          remember.cameras = [camHUD];
                          remember.setGraphicSize(Std.int(remember.width * 0.84));
                          toAdd.push(remember);
                          friends = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/Friends'));
                          friends.alpha = 0;
                          friends.cameras = [camHUD];
                          friends.setGraphicSize(Std.int(friends.width * 0.84));
                          toAdd.push(friends);
                          planning = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/Planning'));
                          planning.alpha = 0;
                          planning.cameras = [camHUD];
                          planning.setGraphicSize(Std.int(planning.width * 0.84));
                          toAdd.push(planning);
                          lmaoNo = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/DidntThinkSo'));
                          lmaoNo.alpha = 0;
                          lmaoNo.cameras = [camHUD];
                          lmaoNo.setGraphicSize(Std.int(lmaoNo.width * 0.84));
                          toAdd.push(lmaoNo);
                          ditch = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/ReadyToDitch'));
                          ditch.alpha = 0;
                          ditch.cameras = [camHUD];
                          ditch.setGraphicSize(Std.int(ditch.width * 0.84));
                          toAdd.push(ditch);
                          mystyle = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/MoreMyStyle'));
                          mystyle.alpha = 0;
                          mystyle.cameras = [camHUD];
                          mystyle.setGraphicSize(Std.int(mystyle.width * 0.84));
                          toAdd.push(mystyle);
                          endthisShit = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/EndThis'));
                          endthisShit.alpha = 0;
                          endthisShit.cameras = [camHUD];
                          endthisShit.setGraphicSize(Std.int(endthisShit.width * 0.84));
                          toAdd.push(endthisShit);
                          fuckingfocus = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/Focus'));
                          fuckingfocus.alpha = 0;
                          fuckingfocus.cameras = [camHUD];
                          fuckingfocus.setGraphicSize(Std.int(fuckingfocus.width * 0.84));
                          toAdd.push(fuckingfocus);
                          comeON = new FlxSprite(-1050, -550).loadGraphic(Paths.image('dischargeAssets/SoulBFText/ComeOn'));
                          comeON.alpha = 0;
                          comeON.cameras = [camHUD];
                          comeON.setGraphicSize(Std.int(comeON.width * 0.84));
                          toAdd.push(comeON);

                            thePhoto = new FlxSprite(lmaoNo.x, lmaoNo.y);
                            thePhoto.frames = Paths.getSparrowAtlas('dischargeAssets/PhotoShit');
                            thePhoto.animation.addByPrefix('idle', 'ooooooo', 24, false);
                            thePhoto.setGraphicSize(Std.int(thePhoto.width * 0.54));
                            thePhoto.antialiasing = true;
                            thePhoto.alpha = 0;
                            thePhoto.scrollFactor.set(0.9, 0.9);
                            toAdd.push(thePhoto);
                               }
			case 'limo':
				{
					camZoom = 0.90;

					var skyBG:FlxSprite = new FlxSprite(-120, -50).loadGraphic(Paths.loadImage('limo/limoSunset', 'week4'));
					skyBG.scrollFactor.set(0.1, 0.1);
					skyBG.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['skyBG'] = skyBG;
					toAdd.push(skyBG);

					var bgLimo:FlxSprite = new FlxSprite(-200, 480);
					bgLimo.frames = Paths.getSparrowAtlas('limo/bgLimo', 'week4');
					bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
					bgLimo.animation.play('drive');
					bgLimo.scrollFactor.set(0.4, 0.4);
					bgLimo.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['bgLimo'] = bgLimo;
					toAdd.push(bgLimo);

					var fastCar:FlxSprite;
					fastCar = new FlxSprite(-300, 160).loadGraphic(Paths.loadImage('limo/fastCarLol', 'week4'));
					fastCar.antialiasing = FlxG.save.data.antialiasing;
					fastCar.visible = false;

					if (FlxG.save.data.distractions)
					{
						var grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();
						swagGroup['grpLimoDancers'] = grpLimoDancers;
						toAdd.push(grpLimoDancers);

						for (i in 0...5)
						{
							var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
							dancer.scrollFactor.set(0.4, 0.4);
							grpLimoDancers.toAdd.push(dancer);
							swagBacks['dancer' + i] = dancer;
						}

						swagBacks['fastCar'] = fastCar;
						layInFront[2].push(fastCar);
						resetFastCar();
					}

					var overlayShit:FlxSprite = new FlxSprite(-500, -600).loadGraphic(Paths.loadImage('limo/limoOverlay', 'week4'));
					overlayShit.alpha = 0.5;
					// toAdd.push(overlayShit);

					// var shaderBullshit = new BlendModeEffect(new OverlayShader(), FlxColor.RED);

					// FlxG.camera.setFilters([new ShaderFilter(cast shaderBullshit.shader)]);

					// overlayShit.shader = shaderBullshit;

					var limoTex = Paths.getSparrowAtlas('limo/limoDrive', 'week4');

					var limo = new FlxSprite(-120, 550);
					limo.frames = limoTex;
					limo.animation.addByPrefix('drive', "Limo stage", 24);
					limo.animation.play('drive');
					limo.antialiasing = FlxG.save.data.antialiasing;
					layInFront[0].push(limo);
					swagBacks['limo'] = limo;
				}
			case 'mall':
				{
					camZoom = 0.80;

					var bg:FlxSprite = new FlxSprite(-1000, -500).loadGraphic(Paths.loadImage('christmas/bgWalls', 'week5'));
					bg.antialiasing = FlxG.save.data.antialiasing;
					bg.scrollFactor.set(0.2, 0.2);
					bg.active = false;
					bg.setGraphicSize(Std.int(bg.width * 0.8));
					bg.updateHitbox();
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var upperBoppers = new FlxSprite(-240, -90);
					upperBoppers.frames = Paths.getSparrowAtlas('christmas/upperBop', 'week5');
					upperBoppers.animation.addByPrefix('idle', "Upper Crowd Bob", 24, false);
					upperBoppers.antialiasing = FlxG.save.data.antialiasing;
					upperBoppers.scrollFactor.set(0.33, 0.33);
					upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 0.85));
					upperBoppers.updateHitbox();
					if (FlxG.save.data.distractions)
					{
						swagBacks['upperBoppers'] = upperBoppers;
						toAdd.push(upperBoppers);
						animatedBacks.push(upperBoppers);
					}

					var bgEscalator:FlxSprite = new FlxSprite(-1100, -600).loadGraphic(Paths.loadImage('christmas/bgEscalator', 'week5'));
					bgEscalator.antialiasing = FlxG.save.data.antialiasing;
					bgEscalator.scrollFactor.set(0.3, 0.3);
					bgEscalator.active = false;
					bgEscalator.setGraphicSize(Std.int(bgEscalator.width * 0.9));
					bgEscalator.updateHitbox();
					swagBacks['bgEscalator'] = bgEscalator;
					toAdd.push(bgEscalator);

					var tree:FlxSprite = new FlxSprite(370, -250).loadGraphic(Paths.loadImage('christmas/christmasTree', 'week5'));
					tree.antialiasing = FlxG.save.data.antialiasing;
					tree.scrollFactor.set(0.40, 0.40);
					swagBacks['tree'] = tree;
					toAdd.push(tree);

					var bottomBoppers = new FlxSprite(-300, 140);
					bottomBoppers.frames = Paths.getSparrowAtlas('christmas/bottomBop', 'week5');
					bottomBoppers.animation.addByPrefix('idle', 'Bottom Level Boppers', 24, false);
					bottomBoppers.antialiasing = FlxG.save.data.antialiasing;
					bottomBoppers.scrollFactor.set(0.9, 0.9);
					bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
					bottomBoppers.updateHitbox();
					if (FlxG.save.data.distractions)
					{
						swagBacks['bottomBoppers'] = bottomBoppers;
						toAdd.push(bottomBoppers);
						animatedBacks.push(bottomBoppers);
					}

					var fgSnow:FlxSprite = new FlxSprite(-600, 700).loadGraphic(Paths.loadImage('christmas/fgSnow', 'week5'));
					fgSnow.active = false;
					fgSnow.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['fgSnow'] = fgSnow;
					toAdd.push(fgSnow);

					var santa = new FlxSprite(-840, 150);
					santa.frames = Paths.getSparrowAtlas('christmas/santa', 'week5');
					santa.animation.addByPrefix('idle', 'santa idle in fear', 24, false);
					santa.antialiasing = FlxG.save.data.antialiasing;
					if (FlxG.save.data.distractions)
					{
						swagBacks['santa'] = santa;
						toAdd.push(santa);
						animatedBacks.push(santa);
					}
				}
			case 'mallEvil':
				{
					var bg:FlxSprite = new FlxSprite(-400, -500).loadGraphic(Paths.loadImage('christmas/evilBG', 'week5'));
					bg.antialiasing = FlxG.save.data.antialiasing;
					bg.scrollFactor.set(0.2, 0.2);
					bg.active = false;
					bg.setGraphicSize(Std.int(bg.width * 0.8));
					bg.updateHitbox();
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var evilTree:FlxSprite = new FlxSprite(300, -300).loadGraphic(Paths.loadImage('christmas/evilTree', 'week5'));
					evilTree.antialiasing = FlxG.save.data.antialiasing;
					evilTree.scrollFactor.set(0.2, 0.2);
					swagBacks['evilTree'] = evilTree;
					toAdd.push(evilTree);

					var evilSnow:FlxSprite = new FlxSprite(-200, 700).loadGraphic(Paths.loadImage("christmas/evilSnow", 'week5'));
					evilSnow.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['evilSnow'] = evilSnow;
					toAdd.push(evilSnow);
				}
			case 'school':
				{
					// defaultCamZoom = 0.9;

					var bgSky = new FlxSprite().loadGraphic(Paths.loadImage('weeb/weebSky', 'week6'));
					bgSky.scrollFactor.set(0.1, 0.1);
					swagBacks['bgSky'] = bgSky;
					toAdd.push(bgSky);

					var repositionShit = -200;

					var bgSchool:FlxSprite = new FlxSprite(repositionShit, 0).loadGraphic(Paths.loadImage('weeb/weebSchool', 'week6'));
					bgSchool.scrollFactor.set(0.6, 0.90);
					swagBacks['bgSchool'] = bgSchool;
					toAdd.push(bgSchool);

					var bgStreet:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.loadImage('weeb/weebStreet', 'week6'));
					bgStreet.scrollFactor.set(0.95, 0.95);
					swagBacks['bgStreet'] = bgStreet;
					toAdd.push(bgStreet);

					var fgTrees:FlxSprite = new FlxSprite(repositionShit + 170, 130).loadGraphic(Paths.loadImage('weeb/weebTreesBack', 'week6'));
					fgTrees.scrollFactor.set(0.9, 0.9);
					swagBacks['fgTrees'] = fgTrees;
					toAdd.push(fgTrees);

					var bgTrees:FlxSprite = new FlxSprite(repositionShit - 380, -800);
					var treetex = Paths.getPackerAtlas('weeb/weebTrees', 'week6');
					bgTrees.frames = treetex;
					bgTrees.animation.toAdd.push('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
					bgTrees.animation.play('treeLoop');
					bgTrees.scrollFactor.set(0.85, 0.85);
					swagBacks['bgTrees'] = bgTrees;
					toAdd.push(bgTrees);

					var treeLeaves:FlxSprite = new FlxSprite(repositionShit, -40);
					treeLeaves.frames = Paths.getSparrowAtlas('weeb/petals', 'week6');
					treeLeaves.animation.addByPrefix('leaves', 'PETALS ALL', 24, true);
					treeLeaves.animation.play('leaves');
					treeLeaves.scrollFactor.set(0.85, 0.85);
					swagBacks['treeLeaves'] = treeLeaves;
					toAdd.push(treeLeaves);

					var widShit = Std.int(bgSky.width * 6);

					bgSky.setGraphicSize(widShit);
					bgSchool.setGraphicSize(widShit);
					bgStreet.setGraphicSize(widShit);
					bgTrees.setGraphicSize(Std.int(widShit * 1.4));
					fgTrees.setGraphicSize(Std.int(widShit * 0.8));
					treeLeaves.setGraphicSize(widShit);

					fgTrees.updateHitbox();
					bgSky.updateHitbox();
					bgSchool.updateHitbox();
					bgStreet.updateHitbox();
					bgTrees.updateHitbox();
					treeLeaves.updateHitbox();

					var bgGirls = new BackgroundGirls(-100, 190);
					bgGirls.scrollFactor.set(0.9, 0.9);

					// if (PlayState.SONG.songId.toLowerCase() == 'roses')
					if (GameplayCustomizeState.freeplaySong == 'roses')
					{
						if (FlxG.save.data.distractions)
							bgGirls.getScared();
					}

					bgGirls.setGraphicSize(Std.int(bgGirls.width * CoolUtil.daPixelZoom));
					bgGirls.updateHitbox();
					if (FlxG.save.data.distractions)
					{
						swagBacks['bgGirls'] = bgGirls;
						toAdd.push(bgGirls);
					}
				}
			case 'schoolEvil':
				{
					var waveEffectBG = new FlxWaveEffect(FlxWaveMode.ALL, 2, -1, 3, 2);
					var waveEffectFG = new FlxWaveEffect(FlxWaveMode.ALL, 2, -1, 5, 2);

					var posX = 400;
					var posY = 200;

					var bg:FlxSprite = new FlxSprite(posX, posY);
					bg.frames = Paths.getSparrowAtlas('weeb/animatedEvilSchool', 'week6');
					bg.animation.addByPrefix('idle', 'background 2', 24);
					bg.animation.play('idle');
					bg.scrollFactor.set(0.8, 0.9);
					bg.scale.set(6, 6);
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					/* 
						var bg:FlxSprite = new FlxSprite(posX, posY).loadGraphic(Paths.loadImage('weeb/evilSchoolBG'));
						bg.scale.set(6, 6);
						// bg.setGraphicSize(Std.int(bg.width * 6));
						// bg.updateHitbox();
						toAdd.push(bg);
						var fg:FlxSprite = new FlxSprite(posX, posY).loadGraphic(Paths.loadImage('weeb/evilSchoolFG'));
						fg.scale.set(6, 6);
						// fg.setGraphicSize(Std.int(fg.width * 6));
						// fg.updateHitbox();
						toAdd.push(fg);
						wiggleShit.effectType = WiggleEffectType.DREAMY;
						wiggleShit.waveAmplitude = 0.01;
						wiggleShit.waveFrequency = 60;
						wiggleShit.waveSpeed = 0.8;
					 */

					// bg.shader = wiggleShit.shader;
					// fg.shader = wiggleShit.shader;

					/* 
						var waveSprite = new FlxEffectSprite(bg, [waveEffectBG]);
						var waveSpriteFG = new FlxEffectSprite(fg, [waveEffectFG]);
						// Using scale since setGraphicSize() doesnt work???
						waveSprite.scale.set(6, 6);
						waveSpriteFG.scale.set(6, 6);
						waveSprite.setPosition(posX, posY);
						waveSpriteFG.setPosition(posX, posY);
						waveSprite.scrollFactor.set(0.7, 0.8);
						waveSpriteFG.scrollFactor.set(0.9, 0.8);
						// waveSprite.setGraphicSize(Std.int(waveSprite.width * 6));
						// waveSprite.updateHitbox();
						// waveSpriteFG.setGraphicSize(Std.int(fg.width * 6));
						// waveSpriteFG.updateHitbox();
						toAdd.push(waveSprite);
						toAdd.push(waveSpriteFG);
					 */
				}
			default:
				{
					camZoom = 0.9;
					curStage = 'stage';
					var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.loadImage('stageback', 'shared'));
					bg.antialiasing = FlxG.save.data.antialiasing;
					bg.scrollFactor.set(0.9, 0.9);
					bg.active = false;
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.loadImage('stagefront', 'shared'));
					stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
					stageFront.updateHitbox();
					stageFront.antialiasing = FlxG.save.data.antialiasing;
					stageFront.scrollFactor.set(0.9, 0.9);
					stageFront.active = false;
					swagBacks['stageFront'] = stageFront;
					toAdd.push(stageFront);

					var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.loadImage('stagecurtains', 'shared'));
					stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
					stageCurtains.updateHitbox();
					stageCurtains.antialiasing = FlxG.save.data.antialiasing;
					stageCurtains.scrollFactor.set(1.3, 1.3);
					stageCurtains.active = false;

					swagBacks['stageCurtains'] = stageCurtains;
					toAdd.push(stageCurtains);
				}
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (!PlayStateChangeables.Optimize)
		{
			switch (curStage)
			{
				case 'philly':
					if (trainMoving)
					{
						trainFrameTiming += elapsed;

						if (trainFrameTiming >= 1 / 24)
						{
							updateTrainPos();
							trainFrameTiming = 0;
						}
					}
					// phillyCityLights.members[curLight].alpha -= (Conductor.crochet / 1000) * FlxG.elapsed;
			}
		}
	}

	override function stepHit()
	{
		super.stepHit();

		if (!PlayStateChangeables.Optimize)
		{
			var array = slowBacks[curStep];
			if (array != null && array.length > 0)
			{
				if (hideLastBG)
				{
					for (bg in swagBacks)
					{
						if (!array.contains(bg))
						{
							var tween = FlxTween.tween(bg, {alpha: 0}, tweenDuration, {
								onComplete: function(tween:FlxTween):Void
								{
									bg.visible = false;
								}
							});
						}
					}
					for (bg in array)
					{
						bg.visible = true;
						FlxTween.tween(bg, {alpha: 1}, tweenDuration);
					}
				}
				else
				{
					for (bg in array)
						bg.visible = !bg.visible;
				}
			}
		}
	}

	override function beatHit()
	{
		super.beatHit();

		if (FlxG.save.data.distractions && animatedBacks.length > 0)
		{
			for (bg in animatedBacks)
				bg.animation.play('idle', true);
		}

		if (!PlayStateChangeables.Optimize)
		{
			switch (curStage)
			{
				case 'halloween':
					if (FlxG.random.bool(Conductor.bpm > 320 ? 100 : 10) && curBeat > lightningStrikeBeat + lightningOffset)
					{
						if (FlxG.save.data.distractions)
						{
							lightningStrikeShit();
							trace('spooky');
						}
					}
				case 'school':
					if (FlxG.save.data.distractions)
					{
						swagBacks['bgGirls'].dance();
					}
				case 'limo':
					if (FlxG.save.data.distractions)
					{
						swagGroup['grpLimoDancers'].forEach(function(dancer:BackgroundDancer)
						{
							dancer.dance();
						});

						if (FlxG.random.bool(10) && fastCarCanDrive)
							fastCarDrive();
					}
				case "philly":
					if (FlxG.save.data.distractions)
					{
						if (!trainMoving)
							trainCooldown += 1;

						if (curBeat % 4 == 0)
						{
							var phillyCityLights = swagGroup['phillyCityLights'];
							phillyCityLights.forEach(function(light:FlxSprite)
							{
								light.visible = false;
							});

							curLight = FlxG.random.int(0, phillyCityLights.length - 1);

							phillyCityLights.members[curLight].visible = true;
							// phillyCityLights.members[curLight].alpha = 1;
						}
					}

					if (curBeat % 8 == 4 && FlxG.random.bool(Conductor.bpm > 320 ? 150 : 30) && !trainMoving && trainCooldown > 8)
					{
						if (FlxG.save.data.distractions)
						{
							trainCooldown = FlxG.random.int(-4, 0);
							trainStart();
							trace('train');
						}
					}
			}
		}
	}

	// Variables and Functions for Stages
	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;
	var curLight:Int = 0;

	function lightningStrikeShit():Void
	{
		FlxG.sound.play(Paths.soundRandom('thunder_', 1, 2, 'shared'));
		swagBacks['halloweenBG'].animation.play('lightning');

		lightningStrikeBeat = curBeat;
		lightningOffset = FlxG.random.int(8, 24);

		if (PlayState.boyfriend != null)
		{
			PlayState.boyfriend.playAnim('scared', true);
			PlayState.gf.playAnim('scared', true);
		}
		else
		{
			GameplayCustomizeState.boyfriend.playAnim('scared', true);
			GameplayCustomizeState.gf.playAnim('scared', true);
		}
	}

	var trainMoving:Bool = false;
	var trainFrameTiming:Float = 0;

	var trainCars:Int = 8;
	var trainFinishing:Bool = false;
	var trainCooldown:Int = 0;
	var trainSound:FlxSound;

	function trainStart():Void
	{
		if (FlxG.save.data.distractions)
		{
			trainMoving = true;
			trainSound.play(true);
		}
	}

	var startedMoving:Bool = false;

	function updateTrainPos():Void
	{
		if (FlxG.save.data.distractions)
		{
			if (trainSound.time >= 4700)
			{
				startedMoving = true;

				if (PlayState.gf != null)
					PlayState.gf.playAnim('hairBlow');
				else
					GameplayCustomizeState.gf.playAnim('hairBlow');
			}

			if (startedMoving)
			{
				var phillyTrain = swagBacks['phillyTrain'];
				phillyTrain.x -= 400;

				if (phillyTrain.x < -2000 && !trainFinishing)
				{
					phillyTrain.x = -1150;
					trainCars -= 1;

					if (trainCars <= 0)
						trainFinishing = true;
				}

				if (phillyTrain.x < -4000 && trainFinishing)
					trainReset();
			}
		}
	}

	function trainReset():Void
	{
		if (FlxG.save.data.distractions)
		{
			if (PlayState.gf != null)
				PlayState.gf.playAnim('hairFall');
			else
				GameplayCustomizeState.gf.playAnim('hairFall');

			swagBacks['phillyTrain'].x = FlxG.width + 200;
			trainMoving = false;
			// trainSound.stop();
			// trainSound.time = 0;
			trainCars = 8;
			trainFinishing = false;
			startedMoving = false;
		}
	}

	var fastCarCanDrive:Bool = true;

	function resetFastCar():Void
	{
		if (FlxG.save.data.distractions)
		{
			var fastCar = swagBacks['fastCar'];
			fastCar.x = -12600;
			fastCar.y = FlxG.random.int(140, 250);
			fastCar.velocity.x = 0;
			fastCar.visible = false;
			fastCarCanDrive = true;
		}
	}

	function fastCarDrive()
	{
		if (FlxG.save.data.distractions)
		{
			FlxG.sound.play(Paths.soundRandom('carPass', 0, 1, 'shared'), 0.7);

			swagBacks['fastCar'].visible = true;
			swagBacks['fastCar'].velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
			fastCarCanDrive = false;
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				resetFastCar();
			});
		}
	}
}
