require "player"
require "missile"
require "enemy"
require "powerup"

score = 0
ammo = 5

function love.load()
	love.graphics.setBackgroundColor(255,255,255) --sets background to clear
	background = love.graphics.newImage('background.png') -- puts the background image
	missile.load()
	player.load()
	enemy.load()
	powerup.load()
end

--[[function love.mousepressed(x, y, button) -- on left mouse click spawns a new missile
	if button == "l" then
		if ammo == 0 then -- if no ammo it doesn't fire
		else
			ammo = ammo - 1 --reduces ammo
			local strX = player.x + player.width / 2
			local strY = player.y - 3
			local mouseX = x
			local mouseY = y

			local angle = math.atan2((mouseY - strY), (mouseX - strX)) -- finds the angle or slope of fire
    

			missile.dx = missile.speed * math.cos(angle) -- finds x movement 
			missile.dy = missile.speed * math.sin(angle) -- finds y movement

			table.insert(missiles, {x = strX, y = strY, dx = missile.dx, dy = missile.dy, img = missile.img })
			-- table.insert makes new missile in the missiles table
		end
	end
end
--]]

function love.update(dt) -- updates the functions
	
	if love.keyboard.isDown(" ") and ammo >= 1  then -- fires missile is space is hit
		ammo = ammo - 1
		missile.spawn(player.x, player.y)
	end
    ammo = ammo + 0.05 -- ammo comes back slowly

	UPDATE_MISSILE(dt)
	UPDATE_PLAYER(dt)
	UPDATE_ENEMY(dt)
	UPDATE_POWERUP(dt)
	score = score + 10 * dt -- adds score every update 
end

function love.draw() -- draws all objects/ textures
	love.graphics.draw(background)
	DRAW_PLAYER()
	DRAW_MISSILE()
	DRAW_ENEMY()
	DRAW_POWERUP()
end

