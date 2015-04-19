powerup = {}
powerups_score = {}
powerups_ammo = {}

function powerup.load()
	powerup.speed = 100
end

function powerup.spawn(x,y,type) -- spawns power up (calls differnt powerup depending of type)
	if type == 1 then
		table.insert(powerups_ammo, {x = x, y = y, powerup.speed})
		else
		table.insert(powerups_score, {x = x, y = y, powerup.speed})
	end

end

function powerup.draw_ammo() -- draws the power ups after being called from player.lua
	love.graphics.setColor(0,255,0)
	for i,v in ipairs(powerups_ammo) do 
		love.graphics.rectangle('fill', v.x, v.y, 10, 10)
	end
end
function powerup.draw_score() -- draws the power ups after being called from player.lua
	love.graphics.setColor(0,0,255)
	for i,v in ipairs(powerups_score) do 
		love.graphics.rectangle('fill', v.x, v.y, 10, 10)
	end
end
function powerup.move_ammo(dt) -- moves powerup every frame
		for i,v in ipairs(powerups_ammo) do
		v.y = v.y + (powerup.speed * dt)
		if v.y > 600 then
			table.remove(powerups_ammo, i) -- removes powerup if it goes off screen to reduce lag
		end
	end
end
function powerup.move_score(dt)
		for i,v in ipairs(powerups_score) do
		v.y = v.y + (powerup.speed * dt)
		if v.y > 600 then
			table.remove(powerups_score, i) -- removes powerup if it goes off screen to reduce lag
		end
	end
end

function DRAW_POWERUP()
	powerup.draw_ammo()
	powerup.draw_score()
end 

function UPDATE_POWERUP(dt)
	powerup.move_ammo(dt)
	powerup.move_score(dt)
end