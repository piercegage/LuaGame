
player = {}

function player.load()
	player.x = 600
	player.y = 500 --870
	player.xvel = 0
	player.friction = 7
	player.speed = 2000
	player.width = 30
	player.height = 30
	player.health = 100
end 

function player.draw()
	love.graphics.setColor(0,0,255)
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function player.physics(dt)
	player.x = player.x + player.xvel * dt
	player.xvel = player.xvel * (1- math.min(dt * player.friction, 1))
end

function player.shoot(key)
	if love.keyboard.isDown('space') then
		missle.spawn(player.x + player.width / 2 - missle.width / 2, player.y - missle.height)
	end
end

function player.move(dt)
	if love.keyboard.isDown('d') and 
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
	end
	if love.keyboard.isDown('a') and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end
end

function player.boundary()
	if player.x < 0  then 
		player.x = 0
		player.xvel = 0
	end
end


function UPDATE_PLAYER(dt)
	player.physics(dt)
	player.move(dt)
	player.boundary()
end
function DRAW_PLAYER()
	player.draw()
end