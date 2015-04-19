missile = {}
missleImg = nil

missiles = {}

function missile.load()
	missile.img = love.graphics.newImage('bullet.png')
	missile.width = 5
	missile.height = 5
	missile.speed = 200
 	missile.dx = 0
 	missile.dy = 0
end
function missile.draw()
	love.graphics.setColor(255,255,255) -- sets background to be black so that img can be seen
	for i,v in ipairs(missiles) do
		love.graphics.draw(missile.img,v.x,v.y) -- draws missle img at the correct x and y corrdinates
	end
end

function missile.move(dt)
	for i,v in ipairs(missiles) do -- moves the missiles each frame
		v.y = v.y + (v.dy * dt)
		v.x = v.x + (v.dx * dt)
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