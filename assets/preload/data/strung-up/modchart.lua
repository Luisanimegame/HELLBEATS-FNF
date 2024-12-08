local move1 = false
local move2 = false
local crazy1 = false
local crazy2 = false

function start(song) -- do nothing

end

function update(elapsed)
    if move1 then
        local currentBeat = (songPos / 1000)*(bpm/170)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 4 * math.cos((currentBeat + i*0.25) * math.pi), i)
	if move2 then
        local currentBeat = (songPos / 1000)*(bpm/150)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*0.25) * math.pi), i)
	if crazy1 then
        local currentBeat = (songPos / 1000)*(bpm/130)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 48 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.30) * math.pi), i)
	if crazy2 then
        local currentBeat = (songPos / 1000)*(bpm/110)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 68 * math.sin((currentBeat + i*0.05) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 20 * math.cos((currentBeat + i*0.31) * math.pi), i)
			                    end
			                end
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
if step == 239 then
tweenCameraZoom(1.2, 1.40, 'returnCam')
end
if step == 255 then
move1 = true
move2 = true
end
if step == 383 then
move2 = false
end
if step == 511 then
move2 = true
end
if step == 575 then
crazy1 = true
end
if step == 639 then
crazy2 = true
end
if step == 768 then
crazy1 = false
crazy2 = false
end
if step == 895 then
crazy1 = true
end
if step == 1024 then
move1 = false
move2 = false
crazy1 = false
end
end

function playerTwoTurn()

end

function playerOneTurn()

end