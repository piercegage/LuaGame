player = {}



function player.load() -- loads player with set variables
	playerImg = love.graphics.newImage('userShip.png')
	player.x = 300
	player.y = 560
	player.xvel = 0
	player.friction = 7
	player.speed = 2000
	player.width = 20
	player.height = 20
	player.health = 100
end 

function player.draw() -- draws the player
	love.graphics.setColor(255,255,255)
	love.graphics.draw(playerImg, player.x, player.y)
end

function player.physics(dt) -- makes the player not stop instanly
	player.x = player.x + player.xvel * dt
	player.xvel = player.xvel * (1- math.min(dt * player.friction, 1)) 
end

function player.move(dt) -- moves player left or right depending on user input
	if love.keyboard.isDown('d','right') and 
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt -- when holding the button increases speed every update untill max speed is met
	end
	if love.keyboard.isDown('a','left') and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end
end

function player.enemy_hit() -- if enemy hits player exits game/ shows exit screen
	for i,v in ipairs(enemies) do 
		if player.x + 18 >= v.x and
		player.x <= v.x + 58 and
		player.y + 20 >= v.y and
		player.y <= v.y + 60 then
			gamestate = "end"
		end
	end
end
function player.powerup_hit() -- if player hits powerup increases ammo and deletes the powerup
	for i,v in ipairs(powerups_ammo) do
		if player.x + 20 >= v.x and
		player.x <= v.x + 16 and
		player.y + 20 >= v.y and
		player.y <= v.y + 16 then
			rapidShoot = rapidShoot + 2
			table.remove(powerups_ammo, i) -- removes powerup from the table
		end
	end
	for i,v in ipairs(powerups_score) do -- if player hits powerup increases score and deletes powerup
		if player.x + 20 >= v.x and
		player.x <= v.x + 16 and
		player.y + 20 >= v.y and
		player.y <= v.y + 16 then
			score = score + 500
			table.remove(powerups_score, i) -- removes powerup from the table
		end
	end
end

function player.boundary() -- if player hits side of screen this moves them to the other side
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
	player.enemy_hit()
	player.powerup_hit()
end
function DRAW_PLAYER()
	player.draw()
end