button = {}

function button_spawn(x,y,text)
	table.insert(button, {x = x, y = y, text = text})
end

function button_draw()
	for i,v in ipairs(button) do
		love.graphics.setFont(fontSize)
		love.graphics.print(v.text, v.x, v.y)
	end
end

function button_click(x,y)
	for i,v in ipairs(button) do
		if
			x > v.x and
			x < v.x + fontSize:getWidth(v.text) and
			y > v.y and
			y < v.y + fontSize:getHeight(v.text) then
				if v.text == "Quit" then
					love.event.push("quit")
				end
				if v.text == "Start" then
					for i,v in ipairs(button) do
						table.remove(button, i)
					end
					for i,v in ipairs(button) do
						table.remove(button, i)
					end
					gamestate = "playing"
				end
				if v.text == "Restart" then
					score = 0
					ammo = 1
					for i,v in ipairs(missiles) do
						table.remove(missiles, i)
					end	
					for i,v in ipairs(powerups_ammo) do
						table.remove(powerups_ammo, i)
					end
					for i,v in ipairs(powerups_score) do
						table.remove(powerups_score, i)
					end
					gamestate = "playing"
				end
		end
	end	
end

function DRAW_MENU()
	button_draw()
end
