package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var bgFade:FlxSprite;

	var nameLeft:FlxText;
	var nameRight:FlxText;
	var skipDialogue:FlxText;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			default:
				// put something here if u want to
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		nameLeft = new FlxText(185, 436, 0, '', 38);
		nameLeft.scrollFactor.set();
		nameLeft.font = Paths.font('vcr.ttf');
		nameLeft.color = FlxColor.BLACK;
		nameLeft.setBorderStyle(OUTLINE, FlxColor.BLACK, 0.5);
		nameLeft.visible = false;

		nameRight = new FlxText(1010, 438, 0, '', 38);
		nameRight.scrollFactor.set();
		nameRight.font = Paths.font('vcr.ttf');
		nameRight.color = FlxColor.BLACK;
		nameRight.setBorderStyle(OUTLINE, FlxColor.BLACK, 0.5);
		nameRight.visible = false;

		skipDialogue = new FlxText(0, 680, 0, 'Press Z to skip dialogue.', 32);
		skipDialogue.scrollFactor.set();
		skipDialogue.font = Paths.font('vcr.ttf');
		skipDialogue.color = FlxColor.WHITE;
		skipDialogue.setBorderStyle(OUTLINE, FlxColor.BLACK, 0.5);
		skipDialogue.visible = true;

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				box = new FlxSprite(-20, 45);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
			case 'roses':
				box = new FlxSprite(-20, 45);
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));

			case 'thorns':
				box = new FlxSprite(-20, 45);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			default:
				trace('text is gucci!');
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialoguexd', 'shared');
				box.animation.addByPrefix('dad', 'bf');
				box.animation.addByPrefix('gf', 'bf');
				box.animation.addByPrefix('bf', 'dad');
				// oops i switched them arround, accident :troll:
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		switch(PlayState.SONG.song.toLowerCase()){
			case 'senpai' | 'roses' | 'thorns':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
				portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

				portraitRight = new FlxSprite(0, 40);
				portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
				portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
				portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;
		}
		
		box.updateHitbox();
		add(box);
		switch(PlayState.SONG.song.toLowerCase()){
			case 'senpai' | 'roses' | 'thorns':
				//e
			default:
				add(nameRight);
				add(nameLeft);
		}

		box.screenCenter(X);
		if(PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
			portraitLeft.screenCenter(X);

		if (!talkingRight)
		{
			// box.flipX = true;
		}
		
		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		switch(PlayState.SONG.song.toLowerCase()){
			case 'senpai' | 'roses' | 'thorns':
				swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
				swagDialogue.font = 'Pixel Arial 11 Bold';
				swagDialogue.color = 0xFF3F2021;
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				add(swagDialogue);
			default:
				swagDialogue = new FlxTypeText(84, 521, 1100, "", 35);
				swagDialogue.font = Paths.font('vcr.ttf');
				swagDialogue.color = 0xFF3F2021;
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				swagDialogue.setBorderStyle(OUTLINE, FlxColor.BLACK, 0.5);
				add(swagDialogue);
		}
		nameRight.x += 7;

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);

		add(skipDialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		switch(PlayState.SONG.song.toLowerCase()){
			case 'roses':
				portraitLeft.visible = false;
			case 'thorns':
				portraitLeft.color = FlxColor.BLACK;
				swagDialogue.color = FlxColor.WHITE;
				dropText.color = FlxColor.BLACK;
			default:
				swagDialogue.color = FlxColor.BLACK;
				dropText.visible = false;
		}

		dropText.text = swagDialogue.text;

		if(FlxG.keys.justPressed.Z #if android || FlxG.android.justReleased.BACK #end && !isEnding){
			isEnding = true;
			FlxG.sound.music.fadeOut(2.2, 0);

			new FlxTimer().start(0.2, function(tmr:FlxTimer)
			{
				box.alpha -= 1 / 5;
				bgFade.alpha -= 1 / 5 * 0.7;
				if(PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns'){
					portraitLeft.visible = false;
					portraitRight.visible = false;
				}
				skipDialogue.visible = false;
				swagDialogue.alpha -= 1 / 5;
				dropText.alpha = swagDialogue.alpha;
			}, 5);

			new FlxTimer().start(1.2, function(tmr:FlxTimer)
			{
				finishThing();
				kill();
			});
		}

		if(PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns'){
			if (box.animation.curAnim != null)
			{
				if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
				{
					box.animation.play('normal');
					dialogueOpened = true;
				}
			}
		} else {
			dialogueOpened = true;
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}
		
		#if mobile
        var jusTouched:Bool = false;

        for (touch in FlxG.touches.list)
          if (touch.justPressed)
            jusTouched = true;
        #end

		if (PlayerSettings.player1.controls.ACCEPT #if mobile || jusTouched #end && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						if(PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns'){
							portraitLeft.visible = false;
							portraitRight.visible = false;
						}
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				nameLeft.visible = true;
				nameRight.visible = false;
				switch(PlayState.storyWeek){
					case 1:
						nameLeft.text = 'Dad';
					case 3:
						nameLeft.text = 'Pico';
				}
				box.animation.play('dad');
			case 'bf':
				nameLeft.visible = false;
				nameRight.visible = true;
				nameRight.text = 'BF';
				box.animation.play('bf');
			case 'gf':
				nameLeft.visible = false;
				nameRight.visible = true;
				nameRight.text = 'GF';
				box.animation.play('bf');
			case 'gf2':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameRight.text = 'GF';
				box.animation.play('dad');
			case 'bf&gf':
				nameLeft.visible = false;
				nameRight.visible = true;
				nameRight.text = 'Bf/Gf';
				box.animation.play('bf');
			case 'skid':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = 'Skid';
				box.animation.play('dad');
			case 'pump':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = 'Pump';
				box.animation.play('dad');
			case 'skid&pump':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = 'Skid/Pump';
				box.animation.play('dad');
			case '???':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = '???';
				box.animation.play('dad');
			case '???2':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = '???2';
				box.animation.play('dad');
			case '???&???2':
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = '???/???2';
				box.animation.play('dad');
			default:
				nameLeft.visible = true;
				nameRight.visible = false;
				nameLeft.text = curCharacter;
				box.animation.play('dad');
			
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}