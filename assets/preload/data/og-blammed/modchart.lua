local sway1 = false
local sway2 = false

function start(song) -- do nothing

end

function update(elapsed)
    if sway1 then
        local currentBeat = (songPos / 1000)*(bpm/165)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 10 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 0 * math.cos((currentBeat + i*0.25) * math.pi), i)
	if sway2 then
        local currentBeat = (songPos / 1000)*(bpm/165)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 30 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 0 * math.cos((currentBeat + i*0.25) * math.pi), i)
			    end
			end
		end
    end
end

function beatHit(beat) -- do nothing

end

function stepHit(step) -- do nothing
if step == 63 then
sway1 = true
for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 360, getActorAngle(i) + 360, 0.3, 'setDefault')
end
end
if step == 128 then
sway2 = true
end
if step == 383 then
sway2 = false
wave1 = true
end
if step == 511 then
sway2 = true
for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 360, getActorAngle(i) + 360, 0.2, 'setDefault')
end
end
if step == 767 then
sway2 = false
end
if step == 1088 then
sway1 = false
for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 0, getActorAngle(i) + 360, 0.2, 'setDefault')
end
end
end

function playerTwoTurn()

end

function playerOneTurn()

end