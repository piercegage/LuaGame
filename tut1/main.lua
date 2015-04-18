require "player"
require "missle"

function love.load()
	love.graphics.getBackgroundColor(255,255,255)

	
	player.load()
end

function love.keypressed(key)
	player.shoot(key)
end

function love.update(dt)
	UPDATE_PLAYER(dt)
	UPDATE_MISSLE(dt)

end

function love.draw()
	DRAW_PLAYER()
	DRAW_MISSLE()
end

