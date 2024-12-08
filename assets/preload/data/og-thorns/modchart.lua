local sway1 = false
local sway2 = false
local bigsway = false
function start(song) -- do nothing

end

function update(elapsed)
    if sway1 then
        local currentBeat = (songPos / 1000)*(bpm/95)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 10 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)

	if sway2 then
        local currentBeat = (songPos / 1000)*(bpm/95)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.55) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 24 * math.cos((currentBeat + i*0.65) * math.pi), i)
	if bigsway then
	local currentBeat = (songPos / 1000)*(bpm/65)
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 20 * math.sin((currentBeat + i*0.65) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 28 * math.cos((currentBeat + i*0.75) * math.pi), i)
						end
					end
			    end
			end
		end
    end
end

function returnCam()
    tweemCameraZoom(1, 0.1)
end

function beatHit(beat) -- do nothing

end

function stepHit(step) -- do nothing
if step == 256 then
sway1 = true
end
if step == 366 then
tweenCameraZoom(1.6, 1.40, 'returnCam')
end
if step == 382 then
sway2 = true
showOnlyStrums = true
tweenFadeOut('bg', 0.8, 0.3)
end
if step == 445 then
tweenFadeOut('dad', 0.4, 0.2)
end
if step == 448 then
tweenFadeIn('dad', 1.0, 0.2)
end
if step == 845 then
tweenFadeOut('dad', 0.4, 0.2)
end
if step == 847 then
tweenFadeIn('dad', 1.0, 0.2)
end
if step == 895 then
sway2 = false
tweenFadeIn('bg', 1.0, 0.2)
end
if step == 1022 then
tweenFadeOut('bg', 0.8, 0.2)
end
if step == 1023 then
sway2 = true
end
if step == 1229 then
tweenFadeOut('dad', 0.4, 0.2)
end
if step == 1232 then
tweenFadeIn('dad', 1.0, 0.2)
end
if step == 1276 then
tweenFadeOut('bg', 0.5, 0.2)
tweenFadeOut('girlfriend', 0.0, 0.2)
end
if step == 1278 then
bigsway = true
end
if step == 1407 then
bigsway = false
sway2 = false
tweenFadeIn('bg', 0.8, 0.2)
tweenFadeIn('girlfriend', 1.0, 0.2)
tweenFadeIn('dad', 0.6, 0.2)
end
if step == 1535 then
sway2 = true
tweenFadeOut('bg', 0.5, 0.3)
end
if step == 1536 then
bigsway = true
end
if step == 1660 then
sway1 = false
sway2 = false
bigsway = false
showOnlyStrums = false
tweenFadeIn('bg', 1.0, 0.2)
end
if step == 1714 then
tweenFadeOut('dad', 0.0, 1.2)
end
if step == 1742 then
tweenFadeOut('dad', 0.0, 0.3)
end
end

function playerTwoTurn()

end

function playerOneTurn()

end

print('Very advance modcharting by RevenantDude')