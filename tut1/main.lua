require "player"
require "missile"
require "enemy"


function love.load()
	love.graphics.setBackgroundColor(255,255,255)
	background = love.graphics.newImage('background.png')
	missile.load()
	player.load()
	enemy.load()
end

function love.mousepressed(x, y, button)

	if button == "l" then
		local strX = player.x + player.width / 2
		local strY = player.y - 3
		local mouseX = x
		local mouseY = y

		local angle = math.atan2((mouseY - strY), (mouseX - strX))
    

		missile.dx = missile.speed * math.cos(angle)
		missile.dy = missile.speed * math.sin(angle)

		table.insert(missiles, {x = strX, y = strY, dx = missile.dx, dy = missile.dy, img = missile.img})
	end
end

function love.update(dt)
	UPDATE_MISSILE(dt)
	UPDATE_PLAYER(dt)
	UPDATE_ENEMY(dt)
end

function love.draw()
	love.graphics.draw(background)
	DRAW_PLAYER()
	DRAW_MISSILE()
	DRAW_ENEMY()
end

