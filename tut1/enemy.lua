enemies = {}
enemy = {}

function enemy.load()
	enemy.img = love.graphics.newImage('boulder.png')
	enemy.friction = 7
	enemy.speed = 1200
	enemy.xvel = 0
	enemy.width = 16
	enemy.height = 16
	enemy.health = 100
	enemy.x = math.random(20, 580)
	enemy.y = 0
end

function enemy.draw(x, y)
	love.graphics.setColor(255,255,255)
	love.graphics.draw('boulder.png')
end	

function enemy.move(dt)
	for i.v in ipairs(enemies) do
		v.y = v.y + (speed * dt)
		if v.y > 600 then
			table.remove(enemies, i)
		end
	end
end