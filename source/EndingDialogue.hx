package;

import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class EndingDialogue extends MusicBeatState
{
    var bg:FlxSprite;
    var doof:DialogueBox;
    var storyWeek:Int;
    override public function create()
    {
        bg = new FlxSprite(0, 0).loadGraphic(Paths.image('dialogue/week' + PlayState.storyWeek));
        add(bg);
        var songLowercase = StringTools.replace(PlayState.SONG.song, " ", "-").toLowerCase();
		switch (songLowercase) {
			case 'dad-battle': songLowercase = 'dadbattle';
			case 'philly-nice': songLowercase = 'philly';
		}
        doof = new DialogueBox(false, CoolUtil.coolTextFile(Paths.txt(songLowercase + '/' + songLowercase + 'Ending')));
        doof.finishThing = goBack;
        super.create();
        new FlxTimer().start(0.3, function(tmr:FlxTimer)
        {
            add(doof);
        });
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    function goBack(){
        FlxG.sound.playMusic(Paths.music('freakyMenu'));
		FlxG.switchState(new MainMenuState());
    }
}