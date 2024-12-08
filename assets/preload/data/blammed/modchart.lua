local move1 = false
local move2 = false
local crazy = false
local sway = false

function start(song) -- do nothing

end

function update(elapsed)
    -- take the l i just yoinked this from strung up
    if move1 then
        local currentBeat = (songPos / 1000)*(bpm/170)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 4 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end
	if move2 then
        local currentBeat = (songPos / 1000)*(bpm/170)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end
	if crazy then
        local currentBeat = (songPos / 1000)*(bpm/170)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 36 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 26 * math.cos((currentBeat + i*0.31) * math.pi), i)
        end
    end
    if sway then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 6 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.10) * math.pi), i)
        end
    end 
end

function returnCam()
    tweemCameraZoom(1, 0.1)
end

function beatHit(beat) -- do nothing

end

function stepHit(step) -- do nothing
    if step == 128 then
        sway = true
    end
    if step == 256 then
        sway = false
        move1 = true
    end
    if step == 384 then
        move1 = false
        sway = true
    end
    if step == 510 then
    tweenFadeOut('dad', 0.0, 0.5)
        tweenFadeOut('girlfriend', 0.0, 0.5)
        setActorAlpha(0.0, 'city')
        setActorAlpha(0.0, 'street')
        setActorAlpha(0.0, 'bg')
    end
    if step == 511 then
        sway = false
        move2 = true
        for i = 0, 3 do
            tweenFadeOut(i, 0, 0.3)
        end
        for i = 4, 7 do -- go to the center
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.3, 'setDefault')
        end
    end
    if step == 575 then
    tweenFadeOut('dad', 1, 0.3)
    end
    if step == 591 then
    tweenFadeOut('girlfriend', 1, 0.3)
    end
    if step == 623 then
        tweenCameraZoom(1.5, 1.54, 'returnCam')
    end
    if step == 640 then
        move2 = false
        crazy = true
        changeDadCharacter('pico-glow')
        setActorAlpha(0.0, 'city')
        setActorAlpha(0.0, 'street')
        setActorAlpha(0.0, 'bg')
        setActorAlpha(1.0, 'cityDark')
        setActorAlpha(1.0, 'streetDark')
        setActorAlpha(1.0, 'bgLight')
        for i = 0, 3 do
            tweenFadeIn(i, 1, 0.4)
        end
    end
    if step == 896 then
        crazy = false
        sway = true
        changeDadCharacter('pico')
        setActorAlpha(1.0, 'city')
        setActorAlpha(1.0, 'street')
        setActorAlpha(1.0, 'bg')
        setActorAlpha(0.0, 'cityDark')
        setActorAlpha(0.0, 'streetDark')
        setActorAlpha(0.0, 'bgLight')
    end
end

function playerTwoTurn()

end

function playerOneTurn()

end