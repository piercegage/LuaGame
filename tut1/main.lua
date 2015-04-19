require "player"
require "missile"
require "enemy"


function love.load()
  -- Changed getBackgroundColor to setBackgroundColor. Now this will actually work.
	love.graphics.setBackgroundColor(255,255,255)
	background = love.graphics.newImage('background.png')
	missile.load()
	player.load()
end

function love.mousepressed(x, y, button)
  -- Changed "1" to "l". Proper mouse buttons are as follow: "l", "m", "r", "wu", "wd"
	if button == "l" then
		local strX = player.x + player.width / 2
		local strY = player.y - 3
		local mouseX = x
		local mouseY = y

		local angle = math.atan2((mouseY - strY), (mouseX - strX))
    
    -- Changed local missileDx and local missileDy to missile.dx and missile.dy.
    -- Change missileSpeed to missile.speed to actually work with what you wrote elsewhere.
		missile.dx = missile.speed * math.cos(angle)
		missile.dy = missile.speed * math.sin(angle)

    -- Changed missile to missiles
    -- Changed missileDx, missileDy, and missileImg to missile.dx, missile.dy, and missile.img
    -- It's important to keep your actual missiles in a different table from your missile variables.
		table.insert(missiles, {x = strX, y = strY, dx = missile.dx, dy = missile.dy, img = missile.img})
	end
end

function love.update(dt)
	UPDATE_MISSILE(dt)
	UPDATE_PLAYER(dt)
end

function love.draw()
	love.graphics.draw(background)
	DRAW_PLAYER()
	DRAW_MISSILE()
end

