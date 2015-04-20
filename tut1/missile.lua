missile = {}
missleImg = nil

missiles = {}

function missile.load()
	missile.img = love.graphics.newImage('bullet.png')
	missile.width = 5
	missile.height = 5
	missile.speed = 300
 	missile.dx = 0
 end
function missile.draw()
	love.graphics.setColor(255,255,255) -- sets background to be black so that img can be seen
	for i,v in ipairs(missiles) do
		love.graphics.draw(missile.img,v.x + 5,v.y) -- draws missle img at the correct x and y corrdinates
	end
end
function missile.spawn(x,y,type)
  	missileSound = love.audio.newSource("gunsound.mp3","static")
  	if type == "Normal" then 
    	if muted == false then
    		missileSound:setVolume(0.3)
    		love.audio.play(missileSound)
		end
		table.insert(missiles, {x = x, y = y, img = missile.img })
	else
		if muted == false then
			missileSound:setVolume(0.1)
			love.audio.play(missileSound)
		end
		table.insert(missiles, {x = x, y = y, img = missile.img })
	end

end

function missile.move(dt)
	for i,v in ipairs(missiles) do -- moves the missiles each frame
		v.y = v.y - (missile.speed * dt)
		--v.x = v.x + (v.dx * dt)
		if v.x < 0 or v.x > 600 or v.y < 0 or v.y > 600 then -- removes offscreen missiles
			table.remove(missiles, i)
		end
	end
end

function DRAW_MISSILE()
	missile.draw()
end
function UPDATE_MISSILE(dt)
	missile.move(dt)
end