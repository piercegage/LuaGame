
missle = {}
missle.width = 59
missle.height = 59
missle.speed = 500


function missle.spawn(x, y)
	table.insert(missle, {x = x, y = y})
end
function missle.draw()
	for i,v in ipairs(missle) do
		love.graphics.setColor(0,255,0)
		love.graphics.rectangle("fill", v.x, v.y, missle.width, missle.height)
	end
end

function missle.move(dt)
	for i,v in ipairs(missle) do
		v.y = v.y - missle.speed * dt
	end
end

function DRAW_MISSLE()
	missle.draw()
end
function UPDATE_MISSLE(dt)
	missle.move(dt)
end