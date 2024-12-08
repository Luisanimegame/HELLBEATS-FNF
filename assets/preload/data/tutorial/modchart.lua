local sway = false
local normal = true

function start(song) -- do nothing
	_G['showOnlyStrums'] = false
end

function update (elapsed)
	if sway then
		local currentBeat = (songPos / 1000)*(bpm/45)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 6 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.10) * math.pi), i)
		end
	if normal then
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'],i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
			    end
        	end
    	end
end

function beatHit(beat) -- do nothing

end

function stepHit(step) -- do nothing
	if step == 63 then
		tweenFadeOut('bg', 0.8, 0.3);
		tweenFadeOut('stageFront', 0.8, 0.3);
		tweenFadeOut('stageCurtains', 0.8, 0.3);
		end
	if step == 383 then
		sway = false
		normal = true
		_G['showOnlyStrums'] = true
		_G['strumLine1Visible'] = false
		tweenFadeOut('dad', 0, 0.3);
		tweenFadeOut('bg', 0, 0.3);
		tweenFadeOut('stageFront', 0, 0.3);
		tweenFadeOut('stageCurtains', 0, 0.3);
		for i = 4, 7 do -- go to the center
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.3, 'setDefault')
		end
		sway = true
		normal = false
	end
	if step == 448 then
		sway = false
		normal = true
		_G['showOnlyStrums'] = false
		tweenFadeIn('dad', 1, 0.3);
		tweenFadeIn('bg', 1, 0.3);
		tweenFadeIn('stageFront', 1, 0.3);
		tweenFadeIn('stageCurtains', 1, 0.3);
		for i = 4, 7 do -- go to the center
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 275,getActorAngle(i) + 360, 0.3, 'setDefault')
		end
	end
end

function playerTwoTurn()
    tweenCameraZoom(1.3,(crochet * 4) / 1000)
end

function playerOneTurn()
    tweenCameraZoom(1,(crochet * 4) / 1000)
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end