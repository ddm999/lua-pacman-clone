require("game")

function love.load()
	bigfont = love.graphics.setNewFont( 48 )
	font = love.graphics.setNewFont( 24 )

	current = "menu"
	currentoption = 1
	game.love.load()
end

function love.keypressed(key)
	if key == "kp4" then
		love.window.setMode(480, 360)
		scale = 0.75
	elseif key == "kp5" then
		love.window.setMode(640, 480)
		scale = 1
	elseif key == "kp6" then
		love.window.setMode(800, 600)
		scale = 1.25
	elseif key == "kp7" then
		love.window.setMode(960, 720)
		scale = 1.5
	elseif key == "kp8" then
		love.window.setMode(1120, 840)
		scale = 1.75
	elseif key == "kp9" then
		love.window.setMode(1280, 960)
		scale = 2
	end
	if current == "game" then
		game.love.keypressed(key)
	elseif current == "menu" then
		if key == "up" then
			currentoption = currentoption - 1
		elseif key == "down" then
			currentoption = currentoption + 1
		end
		if currentoption == 0 then
			currentoption = 3
		elseif currentoption == 4 then
			currentoption = 1
		end
		if key == "return" then
			if currentoption == 1 then
				current = "menu_game1"
			elseif currentoption == 2 then
				-- current = "options_main"
			elseif currentoption == 3 then
				love.event.quit()
			end
			currentoption = 1
		end
	elseif current == "menu_game1" then
		if key == "up" then
			currentoption = currentoption - 1
		elseif key == "down" then
			currentoption = currentoption + 1
		end
		if currentoption == 0 then
			currentoption = 5
		elseif currentoption == 6 then
			currentoption = 1
		end
		if key == "return" then
			if currentoption == 1 then
				currentmap = "alpha"
			elseif currentoption == 2 then
				currentmap = "beta"
			elseif currentoption == 3 then
				currentmap = "char"
			elseif currentoption == 4 then
				currentmap = "delta"
			elseif currentoption == 5 then
				currentmap = "epsil"
			end
			current = "game"
			currentoption = 1
		end
	end
end

function love.update(dt)
	if current == "game" then
		game.love.update(dt)
	end
end

function love.draw()
	if current == "game" then
		love.graphics.setFont(font)
		game.love.draw()
	elseif current == "menu" then
		love.graphics.setColor( 32/255, 32/255, 64/255 )
		love.graphics.rectangle("fill", 208, 60, 224, 28)
		love.graphics.setColor( 64/255, 64/255, 0/255 )
		love.graphics.rectangle("fill", 208, 88, 224, 28)
		
		love.graphics.setFont(bigfont)
		love.graphics.setColor( 192/255, 192/255, 192/255 )
		love.graphics.print("8charact", 212, 64)
		
		love.graphics.setFont(font)
		love.graphics.print("Play Game", 276, 256)
		love.graphics.print("Options", 276, 320)
		love.graphics.print("Exit", 276, 384)
		
		love.graphics.print(">", 212, (192+(64*currentoption)))
	elseif current == "menu_game1" then		
		love.graphics.setFont(font)
		love.graphics.print("Alpha", 276, 128)
		love.graphics.print("Beta", 276, 192)
		love.graphics.print("Char", 276, 256)
		love.graphics.print("Delta", 276, 320)
		love.graphics.print("Epsil", 276, 384)
		
		love.graphics.print(">", 212, (64+(64*currentoption)))
	end
end
