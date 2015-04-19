player = {}



function player.load() -- loads player with set variables
	playerImg = love.graphics.newImage('userShip.png')
	player.x = 300
	player.y = 560
	player.xvel = 0
	player.friction = 7
	player.speed = 2000
	player.width = 30
	player.height = 30
	player.health = 100
end 

function player.draw() -- draws the player
	love.graphics.setColor(255,255,255)
	love.graphics.draw(playerImg, player.x, player.y)
end

function player.physics(dt)
	player.x = player.x + player.xvel * dt
	player.xvel = player.xvel * (1- math.min(dt * player.friction, 1))
end


function player.move(dt) -- 
	if love.keyboard.isDown('d') and 
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
	end
	if love.keyboard.isDown('a') and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end
end

function player.boundary() -- stops the player from going off screen ( left side )
	if player.x < 0  then 
		player.x = 600
	end
	if player.x > 600 then
		player.x = 0
	end
end


function UPDATE_PLAYER(dt) -- compiles the needed update functions for player into
	player.physics(dt)		-- one area to keep main clean
	player.move(dt)
	player.boundary()
end
function DRAW_PLAYER()
	player.draw()
end