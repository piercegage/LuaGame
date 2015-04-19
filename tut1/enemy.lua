enemies = {}
enemy = {}

enemy.timer = 0
enemy.timerLim = math.random(0.1,0.4)
enemy.amount = math.random(1,2)

function enemy.load()
	love.graphics.setColor(255,255,255)
	enemy.img = love.graphics.newImage('boulder.png')
	enemy.speed = math.random(100,250)
	enemy.width = 16
	enemy.height = 16
	enemy.health = 2
	enemy.x = math.random(20, 580)
	enemy.y = 0
end

function enemy.generate(dt)
	enemy.timer = enemy.timer + dt
	if enemy.timer > enemy.timerLim then

		for i = 1, enemy.amount do 
			enemy.spawn(math.random(20,580), 0)
			enemy.speed = math.random(100,150)
		end
		enemy.amount = math.random(1,2)
		enemy.timerLim = math.random(0.1,0.9)
		enemy.timer = 0
	end
end

function enemy.spawn(x,y)
	table.insert(enemies, {x = x, y = y, enemy.width, enemy.height, enemy.img, enemy.speed, enemy.health})
end

function enemy.missile_hit()
	for i,v in ipairs(enemies) do
		for ia,va in ipairs(missiles) do
			if va.x + 8 > v.x and 
			va.x < v.x + 20 and 
			va.y + 8 > v.y and
			va.y < v.y + 20 then
				if v.health == 1 then
					table.remove(enemies,i)
					table.remove(missiles,ia)
				else
					table.remove(missiles,ia)
					v.health = 1
				end
			end
		end
	end
end



function enemy.draw(x, y)
	love.graphics.setColor(255,255,255)
	for i,v in ipairs(enemies) do
		love.graphics.draw(enemy.img, v.x, v.y)
	end
end	

function enemy.move(dt)
	for i,v in ipairs(enemies) do
		v.y = v.y + (enemy.speed * dt)
		if v.y > 600 then
			table.remove(enemies, i)
		end
	end
end

function DRAW_ENEMY()
	enemy.draw()
end
function UPDATE_ENEMY(dt)
	enemy.move(dt)
	enemy.generate(dt)
	enemy.missile_hit()
end