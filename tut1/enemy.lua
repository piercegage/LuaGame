enemies = {}
enemy = {}

enemy.timer = 0
enemy.timerLim = math.random(0.1,0.4)
enemy.amount = math.random(1,2)

function enemy.load()
	love.graphics.setColor(255,255,255) -- sets clear background so image is visible
	enemy.img = love.graphics.newImage('boulder.png')
	enemy.speed = math.random(100,250) 
	enemy.width = 16
	enemy.height = 16
	enemy.health = 10
end

function enemy.generate(dt) -- spawns new enemies
	enemy.timer = enemy.timer + dt
	if enemy.timer > enemy.timerLim then
		for i = 1, enemy.amount do 
			enemy.spawn(math.random(20,580), -20) -- random x for enemy spawn
			enemy.speed = math.random(150,200) -- random speed to keep enemy movement varied
		end
		enemy.amount = math.random(1,2) --can spawn either one or two enemys per spawn
		enemy.timerLim = math.random(0.1,0.9) -- sets the timer limit for when new enemys spawn
		enemy.timer = 0 -- resets timer
	end
end

function enemy.spawn(x,y)-- spawns enemies by inserting a new entry into the enemy table(called in enemy.generate)
	table.insert(enemies, {x = x, y = y, enemy.width, enemy.height, enemy.img, enemy.speed, enemy.health})
end

function enemy.missile_hit()
	for i,v in ipairs(enemies) do -- for loops go through all of the missles and enemies to see if any hit
		for ia,va in ipairs(missiles) do
			if va.x + 5 >= v.x and -- if statement tells if missle hits enemies     
			va.x <= v.x + 60 and 
			va.y + 5 >= v.y and
			va.y <= v.y + 60 then
				if v.health == 1 then
        			if muted == false then
        				rockshatter = love.audio.newSource("rockshatter.mp3","static") 
        				rockshatter:setVolume(0.1)
        				love.audio.play(rockshatter)
        			end
					powerup.spawn(v.x, v.y, math.random(1,2)) -- generates powerup at location of dead enemy
					table.remove(enemies,i) -- removes enemy that has been destroyed by missle
					table.remove(missiles,ia) -- removes missle that hit the enemy
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