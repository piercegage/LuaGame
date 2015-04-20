require "player"
require "missile"
require "enemy"
require "powerup"
require "menu"


score = 0
ammo = 0
timer = .5
rapidShoot = 0

function love.load()
	fontSize = love.graphics.newFont(30)
	gamestate = "menu"
	love.graphics.setBackgroundColor(255,255,255) --sets background to clear
	menu_background = love.graphics.newImage('menu_background.png')
	background = love.graphics.newImage('background.png') -- puts the background image
	missile.load()
	player.load()
	enemy.load()
	powerup.load()

 	music = love.audio.newSource("SpaceAtmosphere.mp3","stream") 
 	music:setVolume(0.3)
 	music:setLooping(true)
  	love.audio.play(music)

  	button_spawn(100, 200, "Start")
  	button_spawn(100, 240, "Quit")
end

function love.mousepressed(x,y)
	if gamestate == "menu" then
		button_click(x,y)
	end
	if gamestate == "end" then
		button_click(x,y)
	end
end


function love.update(dt) -- updates the functions
	if gamestate == "playing" then
		if love.keyboard.isDown(" ") and ammo >= timer then -- fires missile if space is hit
			if rapidShoot ~= 0 and rapidShoot > 0 then
				rapidShoot = rapidShoot - .05
			else
				rapidShoot = 0
				ammo = 0
			end
			missile.spawn(player.x, player.y)
			
		end
   			ammo = ammo + dt
   			 -- ammo comes back slowly

		UPDATE_MISSILE(dt)
		UPDATE_PLAYER(dt)
		UPDATE_ENEMY(dt)
		UPDATE_POWERUP(dt)
		score = score + 1  -- adds score every update 
	end
end

function love.draw() -- draws all objects/ textures
	if gamestate == "menu" then
		love.graphics.draw(menu_background)
		DRAW_MENU()
	end

	if gamestate == "playing" then	
		love.graphics.draw(background)

		love.graphics.setColor(255,0,0)
		love.graphics.print("Rapid Fire: ", 10,40)
		love.graphics.print(rapidShoot,170,40)

		love.graphics.setColor(0,255,0)
		love.graphics.print("Score: ", 10, 10)
		love.graphics.print(score, 110, 10)

		DRAW_PLAYER()
		DRAW_MISSILE()
		DRAW_ENEMY()
		DRAW_POWERUP()
	end

	if gamestate == "end" then
		DRAW_MENU()
		love.graphics.setColor(255,255,255)
		love.graphics.draw(background)
		love.graphics.setColor(0,0,255)
		love.graphics.print("Final Score: ", 120, 260)
		love.graphics.print(score, 300, 260)
		button_spawn(120, 330, "Quit")
		button_spawn(120, 370, "Restart")
		DRAW_MENU()
	end
end

