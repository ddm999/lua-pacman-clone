love.graphics.push()

game = {love = {}}

function game.love.load()
	-- graphical setup
	playerImage = love.graphics.newImage("graphics/player.png")

	mapnamedisp1 = "A"
	mapnamedisp2 = "L"
	mapnamedisp3 = "P"
	mapnamedisp4 = "H"
	mapnamedisp5 = "A"
	-- variable setup
	if highscore == nil then highscore = 0 end

	score = 0
	newhighscore = false

	if currentmap == nil then currentmap = "alpha" end

	displayscore = "0"
	displayhighscore = "0" 

	if gamespeed == nil then gamespeed = 1 end

	if scale == nil then scale = 1 end

	debugtextalpha = ""
	debugtextbeta = ""

    player = {
        grid_x = 320,
        grid_y = 256,
        act_x = 304,
        act_y = 256,
        speed = 6,
		tick = 0,
		tickspeed = 0.4,
		allowmove = false,
		facing = 0
    }

	ghostAlpha = {
        grid_x = 288,
        grid_y = 192,
        act_x = 288,
        act_y = 192,
        speed = 6,
		tick = 0,
		tickspeed = 0.4,
		allowmove = false,
		freeze = 0
    }
	
	ghostBeta = {
        grid_x = 320,
        grid_y = 192,
        act_x = 320,
        act_y = 192,
        speed = 6,
		tick = 0,
		tickspeed = 0.4,
		allowmove = false,
		freeze = 0
    }
	
	mapAlpha = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1 },
        { 1, 0, 0, 0, 0, 1, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 1, 2, 2, 1, 0, 0, 0, 1, 1, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1 },
        { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1 },
        { 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1 },
        { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
    mapBeta = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1 },
        { 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 1, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1 },
        { 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1 },
        { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
	mapChar = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1 },
        { 1, 0, 0, 0, 1, 1, 0, 1, 2, 2, 1, 0, 1, 1, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 0, 1, 0, 2, 2, 2, 2, 0, 1, 0, 0, 1, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1 },
        { 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
        { 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1 },
        { 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
	mapDelta = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
	mapEpsil = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
	
	--[[
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    ]]--
	
	olddir = nil
	newdir = "right"
	ghostAlphadir = "up"
	ghostBetadir = "up"
	pause = true
	
	freezepower = 0
	freezeGrids = {}
	freezeGrids[1] = {
		enabled = false,
		grid_x = 0,
		grid_y = 0,
		timedown = 0
	}
	freezeGrids[2] = {
		enabled = false,
		grid_x = 0,
		grid_y = 0,
		timedown = 0
	}
	freezeGrids[3] = {
		enabled = false,
		grid_x = 0,
		grid_y = 0,
		timedown = 0
	}
	
	pickup = {
		nomnom = true,
		position = nil,
		position_old = nil,
		x = 0,
		y = 0
	}
	
	powerup = {
		enabled = false,
		nomnom = false,
		type = "speed",
		color_fill = {128, 32, 32},
		color_outline = {255, 64, 64},
		pickups_left = 5,
		starttime = nil
	}
	
	defaultspeed = 6
	defaulttickspeed = 0.4
	
	scoretick = 5
end

function game.love.update(dt)
	if not love.window.hasFocus() then
		pause = true
	end
	
	if score > highscore then
		highscore = score
		newhighscore = true
	end
	
	if currentmap == "alpha" then
		mapnamedisp1 = "A"
		mapnamedisp2 = "L"
		mapnamedisp3 = "P"
		mapnamedisp4 = "H"
		mapnamedisp5 = "A"
	elseif currentmap == "beta" then
		mapnamedisp1 = "B"
		mapnamedisp2 = "E"
		mapnamedisp3 = "T"
		mapnamedisp4 = "A"
		mapnamedisp5 = ""
	elseif currentmap == "char" then
		mapnamedisp1 = "C"
		mapnamedisp2 = "H"
		mapnamedisp3 = "A"
		mapnamedisp4 = "R"
		mapnamedisp5 = ""
	elseif currentmap == "delta" then
		mapnamedisp1 = "D"
		mapnamedisp2 = "E"
		mapnamedisp3 = "L"
		mapnamedisp4 = "T"
		mapnamedisp5 = "A"
	elseif currentmap == "epsil" then
		mapnamedisp1 = "E"
		mapnamedisp2 = "P"
		mapnamedisp3 = "S"
		mapnamedisp4 = "I"
		mapnamedisp5 = "L"
	end
	
	if string.len(tostring(score)) == 1 then
		displayscore = "00000"..tostring(score)
	elseif string.len(tostring(score)) == 2 then
		displayscore = "0000"..tostring(score)
	elseif string.len(tostring(score)) == 3 then
		displayscore = "000"..tostring(score)
	elseif string.len(tostring(score)) == 4 then
		displayscore = "00"..tostring(score)
	elseif string.len(tostring(score)) == 5 then
		displayscore = "0"..tostring(score)
	else
		displayscore = tostring(score)
	end
	
	if string.len(tostring(highscore)) == 1 then
		displayhighscore = "00000"..tostring(highscore)
	elseif string.len(tostring(highscore)) == 2 then
		displayhighscore = "0000"..tostring(highscore)
	elseif string.len(tostring(highscore)) == 3 then
		displayhighscore = "000"..tostring(highscore)
	elseif string.len(tostring(highscore)) == 4 then
		displayhighscore = "00"..tostring(highscore)
	elseif string.len(tostring(highscore)) == 5 then
		displayhighscore = "0"..tostring(highscore)
	else
		displayhighscore = tostring(highscore)
	end

	if powerup.nomnom == true then
		powerup.enabled = false
		powerup.starttime = love.timer.getTime()
		if powerup.type == "speed" then
			player.tickspeed = 0.2
			player.speed = 10
		elseif powerup.type == "freeze" then
			freezepower = 3
		end
		powerup.nomnom = false
	end
	
	if powerup.starttime then
		if powerup.starttime < (love.timer.getTime() - 10) then
			powerup.starttime = nil
			if powerup.type == "speed" then
				player.speed = defaultspeed -- reset to default
				player.tickspeed = defaulttickspeed
			end
		end
	end
	
	if pickup.nomnom == true then
		pickup.position_old = pickup.position
		pickup.position = math.floor(love.math.random(1,5))
		if pickup.position == 5 then
			pickup.position = 4
		end
		if pickup.position == pickup.position_old then
			pickup.position = pickup.position_old - 1
			if pickup.position == 0 then
				pickup.position = 4
			end
		end
		if pickup.position == 1 then
			pickup.x = 64
			pickup.y = 64
		elseif pickup.position == 2 then
			pickup.x = 544
			pickup.y = 64
		elseif pickup.position == 3 then
			pickup.x = 544
			pickup.y = 384
		elseif pickup.position == 4 then
			pickup.x = 64
			pickup.y = 384
		end
		pickup.nomnom = false
	end
	
	if pause == true then return end
	
	if player.grid_x == pickup.x and player.grid_y == pickup.y then
		pickup.nomnom = true
		if powerup.enabled == false then
			powerup.pickups_left = powerup.pickups_left - 1
		end
		score = score + 10
		if powerup.pickups_left == 0 then
			powerup.enabled = 1
			powerup.pickups_left = 5
			
			powerup.typenum = math.floor(love.math.random(1,3))
			if powerup.typenum == 3 then
				powerup.typenum = 2
			end
			if powerup.typenum == 1 then

			powerup.type = "speed"
			
			elseif powerup.typenum == 2 then powerup.type = "freeze"
			end
		end
	end
	
	if powerup.enabled and (player.grid_x == 288 or player.grid_x == 320 ) and player.grid_y == 256 then
		powerup.nomnom = true
		score = score + 50
	end
	
	if ((ghostAlpha.act_x + 32 > player.act_x) and (ghostAlpha.act_x < player.act_x + 32)) and ((ghostAlpha.act_y + 32 > player.act_y) and (ghostAlpha.act_y < player.act_y + 32)) then
		game.love.load()
	elseif ((ghostBeta.act_x + 32 > player.act_x) and (ghostBeta.act_x < player.act_x + 32)) and ((ghostBeta.act_y + 32 > player.act_y) and (ghostBeta.act_y < player.act_y + 32)) then
		game.love.load()
	end
	
	player.tick = player.tick + (dt * gamespeed)
	if player.tick > player.tickspeed then
		player.allowmove = true
		player.tick = 0
	end
	
	scoretick = scoretick - (dt*gamespeed)
	if scoretick < 0 then
		scoretick = 5
		score = score + 1
	end
	
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * (player.speed * gamespeed) * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * (player.speed * gamespeed) * dt)
	
    ghostAlpha.act_y = ghostAlpha.act_y - ((ghostAlpha.act_y - ghostAlpha.grid_y) * (ghostAlpha.speed * gamespeed) * dt)
    ghostAlpha.act_x = ghostAlpha.act_x - ((ghostAlpha.act_x - ghostAlpha.grid_x) * (ghostAlpha.speed * gamespeed) * dt)
	
    ghostBeta.act_y = ghostBeta.act_y - ((ghostBeta.act_y - ghostBeta.grid_y) * (ghostBeta.speed * gamespeed) * dt)
    ghostBeta.act_x = ghostBeta.act_x - ((ghostBeta.act_x - ghostBeta.grid_x) * (ghostBeta.speed * gamespeed) * dt)
	
	playerMove(dt)
	ghostAlphaMove(dt)
	ghostBetaMove(dt)
	
	if freezeGrids[1].timedown < 0 then freezeGrids[1].timedown = 0 end
	if freezeGrids[2].timedown < 0 then freezeGrids[2].timedown = 0 end
	if freezeGrids[3].timedown < 0 then freezeGrids[3].timedown = 0 end
	
	if freezeGrids[1].timedown > 0 then
		freezeGrids[1].timedown = freezeGrids[1].timedown - dt
	end
	if freezeGrids[2].timedown > 0 then
		freezeGrids[2].timedown = freezeGrids[1].timedown - dt
	end
	if freezeGrids[3].timedown > 0 then
		freezeGrids[3].timedown = freezeGrids[1].timedown - dt
	end
end

function playerMove(dt)
	if player.allowmove ~= true then return end
	player.allowmove = false
	
	if newdir == "up" then
		if testMap(0, -1) then
            player.grid_y = player.grid_y - 32
        end
	elseif newdir == "right" then
	    if testMap(1, 0) then
            player.grid_x = player.grid_x + 32
        end
	elseif newdir == "down" then
	    if testMap(0, 1) then
            player.grid_y = player.grid_y + 32
        end
	elseif newdir == "left" then
        if testMap(-1, 0) then
            player.grid_x = player.grid_x - 32
        end
	else
		player.allowmove = true
	end
end

function ghostTestFreeze( ghostNum )
	if ghostNum == 1 then
		if ghostAlpha.grid_x == freezeGrids[1].grid_x and ghostAlpha.grid_y == freezeGrids[1].grid_y then
			ghostAlpha.freeze = 3
		elseif ghostAlpha.grid_x == freezeGrids[2].grid_x and ghostAlpha.grid_y == freezeGrids[2].grid_y then
			ghostAlpha.freeze = 3
		elseif ghostAlpha.grid_x == freezeGrids[3].grid_x and ghostAlpha.grid_y == freezeGrids[3].grid_y then
			ghostAlpha.freeze = 3
		end
	elseif ghostNum == 2 then
		if ghostBeta.grid_x == freezeGrids[1].grid_x and ghostBeta.grid_y == freezeGrids[1].grid_y then
			ghostBeta.freeze = 3
		elseif ghostBeta.grid_x == freezeGrids[2].grid_x and ghostBeta.grid_y == freezeGrids[2].grid_y then
			ghostBeta.freeze = 3
		elseif ghostBeta.grid_x == freezeGrids[3].grid_x and ghostBeta.grid_y == freezeGrids[3].grid_y then
			ghostBeta.freeze = 3
		end
	end
end

function ghostAlphaAIWhileLoop()
	while true do
		ghostAlpha_testdir = math.floor(love.math.random(1,5))
		if ghostAlpha_testdir == 5 then
			ghostAlpha_testdir = 4
		end
		if ghostAlpha_testdir == 1 then ghostAlpha_testdirname = "up" elseif ghostAlpha_testdir == 2 then ghostAlpha_testdirname = "right" elseif ghostAlpha_testdir == 3 then ghostAlpha_testdirname = "down" elseif ghostAlpha_testdir == 4 then ghostAlpha_testdirname = "left" end
		if ghostAlpha_testdirname == "up" and testMapghostAlpha(0, -1) then
			if ghostAlphadir ~= "down" then
				ghostAlphadir = "up"
				debugtextalpha = "ghostAlphaAI_changeToUp"
			end
			break
		elseif ghostAlpha_testdirname == "right" and testMapghostAlpha(1, 0) then
			if ghostAlphadir ~= "left" then
				ghostAlphadir = "right"
				debugtextalpha = "ghostAlphaAI_changeToRight"
			end
			break
		elseif ghostAlpha_testdirname == "down" and testMapghostAlpha(0, 1) then
			if ghostAlphadir ~= "up" then
				ghostAlphadir = "down"
				debugtextalpha = "ghostAlphaAI_changeToDown"
			end
			break
		elseif ghostAlpha_testdirname == "left" and testMapghostAlpha(-1, 0) then
			if ghostAlphadir ~= "right" then
				ghostAlphadir = "left"
				debugtextalpha = "ghostAlphaAI_changeToLeft"
			end
			break
		end
	end
end

function ghostAlphaMove(dt)
	if ghostAlpha.freeze > 0 then
		ghostAlpha.freeze = ghostAlpha.freeze - dt
		return
	end
	if ghostAlpha.freeze < 0 then ghostAlpha.freeze = 0 end
	
	ghostAlpha.tick = ghostAlpha.tick + (dt * gamespeed)
	if ghostAlpha.tick > ghostAlpha.tickspeed then
		ghostAlpha.allowmove = true
		ghostAlpha.tick = 0
		debugtextalpha = "ghostAlphaTickPassed"
	end
	
	if ghostAlpha.allowmove ~= true then return end
	ghostAlpha.allowmove = false
	
	if ghostAlphadir == "up" or ghostAlphadir == "right" or ghostAlphadir == "down" or ghostAlphadir == "left" then
		ghostAlpha_testchange = math.floor(love.math.random(1,3))
		if ghostAlpha_testchange == 3 then
			ghostAlpha_testchange = 2
		end
		if ghostAlpha_testchange == 2 then
			debugtextalpha = "ghostAlphaAIWhileLoop"
			ghostAlphaAIWhileLoop()
		end
		if ghostAlphadir == "up" then
			if testMapghostAlpha(0, -1) then
				debugtextalpha = "ghostAlphaMoveUp"
				ghostAlpha.grid_y = ghostAlpha.grid_y - 32
			end
		elseif ghostAlphadir == "right" then
			if testMapghostAlpha(1, 0) then
				debugtextalpha = "ghostAlphaMoveRight"
				ghostAlpha.grid_x = ghostAlpha.grid_x + 32
			end
		elseif ghostAlphadir == "down" then
			if testMapghostAlpha(0, 1) then
				debugtextalpha = "ghostAlphaMoveDown"
				ghostAlpha.grid_y = ghostAlpha.grid_y + 32
			end
		elseif ghostAlphadir == "left" then
			if testMapghostAlpha(-1, 0) then
				debugtextalpha = "ghostAlphaMoveLeft"
				ghostAlpha.grid_x = ghostAlpha.grid_x - 32
			end
		end
		ghostTestFreeze(1)
	else
		ghostAlpha.allowmove = true
	end
end

function ghostBetaAIWhileLoop()
	while true do
		ghostBeta_testdir = math.floor(love.math.random(1,5))
		if ghostBeta_testdir == 5 then
			ghostBeta_testdir = 4
		end
		if ghostBeta_testdir == 1 then ghostBeta_testdirname = "up" elseif ghostBeta_testdir == 2 then ghostBeta_testdirname = "right" elseif ghostBeta_testdir == 3 then ghostBeta_testdirname = "down" elseif ghostBeta_testdir == 4 then ghostBeta_testdirname = "left" end
		if ghostBeta_testdirname == "up" and testMapghostBeta(0, -1) then
			if ghostBetadir ~= "down" then
				ghostBetadir = "up"
				debugtextbeta = "ghostBetaAI_changeToUp"
			end
			break
		elseif ghostBeta_testdirname == "right" and testMapghostBeta(1, 0) then
			if ghostBetadir ~= "left" then
				ghostBetadir = "right"
				debugtextbeta = "ghostBetaAI_changeToRight"
			end
			break
		elseif ghostBeta_testdirname == "down" and testMapghostBeta(0, 1) then
			if ghostBetadir ~= "up" then
				ghostBetadir = "down"
				debugtextbeta = "ghostBetaAI_changeToDown"
			end
			break
		elseif ghostBeta_testdirname == "left" and testMapghostBeta(-1, 0) then
			if ghostBetadir ~= "right" then
				ghostBetadir = "left"
				debugtextbeta = "ghostBetaAI_changeToLeft"
			end
			break
		end
	end
end

function ghostBetaMove(dt)
	if ghostBeta.freeze > 0 then
		ghostBeta.freeze = ghostAlpha.freeze - dt
		return
	end
	if ghostBeta.freeze < 0 then ghostBeta.freeze = 0 end
	
	ghostBeta.tick = ghostBeta.tick + (dt * gamespeed)
	if ghostBeta.tick > ghostBeta.tickspeed then
		ghostBeta.allowmove = true
		ghostBeta.tick = 0
		debugtextbeta = "ghostBetaTickPassed"
	end
	
	if ghostBeta.allowmove ~= true then return end
	ghostBeta.allowmove = false
	
	if ghostBetadir == "up" or ghostBetadir == "right" or ghostBetadir == "down" or ghostBetadir == "left" then
		ghostBeta_testchange = math.floor(love.math.random(1,3))
		if ghostBeta_testchange == 3 then
			ghostBeta_testchange = 2
		end
		if ghostBeta_testchange == 2 then
			debugtextbeta = "ghostBetaAIWhileLoop"
			ghostBetaAIWhileLoop()
		end
		if ghostBetadir == "up" then
			if testMapghostBeta(0, -1) then
				debugtextbeta = "ghostBetaMoveUp"
				ghostBeta.grid_y = ghostBeta.grid_y - 32
			end
		elseif ghostBetadir == "right" then
			if testMapghostBeta(1, 0) then
				debugtextbeta = "ghostBetaMoveRight"
				ghostBeta.grid_x = ghostBeta.grid_x + 32
			end
		elseif ghostBetadir == "down" then
			if testMapghostBeta(0, 1) then
				debugtextbeta = "ghostBetaMoveDown"
				ghostBeta.grid_y = ghostBeta.grid_y + 32
			end
		elseif ghostBetadir == "left" then
			if testMapghostBeta(-1, 0) then
				debugtextbeta = "ghostBetaMoveLeft"
				ghostBeta.grid_x = ghostBeta.grid_x - 32
			end
		end
		ghostTestFreeze(2)
	else
		ghostBeta.allowmove = true
	end
end

function game.love.draw()
	love.graphics.pop()
	love.graphics.push()
	love.graphics.scale(scale)

	love.graphics.setColor( 32, 32, 64 )
	love.graphics.rectangle("fill", 18, 2, 174, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.rectangle("line", 18, 2, 174, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.print("Score: "..displayscore, 18, 2)
	love.graphics.setColor( 32, 32, 64 )
	love.graphics.rectangle("fill", 450, 2, 174, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.rectangle("line", 450, 2, 174, 28)
	love.graphics.setColor( 192, 192, 192 )
	if pause then love.graphics.print("Game Paused", 458, 2) end
	love.graphics.setColor( 32, 32, 64 )
	love.graphics.rectangle("fill", 34, 450, 574, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.rectangle("line", 34, 450, 574, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.print(debugtextalpha, 34, 450)
	love.graphics.print(debugtextbeta, 322, 450)
	
	love.graphics.setColor( 64, 64, 0 )
	love.graphics.rectangle("fill", 194, 2, 254, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.rectangle("line", 194, 2, 254, 28)
	if newhighscore then
		love.graphics.setColor( 192, 192, 64 )
	else
		love.graphics.setColor( 192, 192, 192 )
	end
	love.graphics.print("Highscore: "..displayhighscore, 210, 2)
	
	love.graphics.setColor( 32, 32, 64 )
	love.graphics.rectangle("fill", 2, 64, 14, 160)
	love.graphics.setColor( 64, 64, 0 )
	love.graphics.rectangle("fill", 16, 64, 14, 160)
	love.graphics.setColor( 160, 160, 160 )
	love.graphics.rectangle("line", 2, 64, 28, 160)
	love.graphics.print(mapnamedisp1, 8, 66)
	love.graphics.print(mapnamedisp2, 8, 98)
	love.graphics.print(mapnamedisp3, 8, 130)
	love.graphics.print(mapnamedisp4, 8, 162)
	love.graphics.print(mapnamedisp5, 8, 194)
	
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.draw(playerImage, player.act_x+16, player.act_y+16, math.rad(player.facing*90), 1, 1, 14, 14)
	
	love.graphics.setColor( 64, 64, 192 )
	love.graphics.rectangle("fill", pickup.x+2, pickup.y+2, 28, 28)
	love.graphics.setColor( 192, 192, 192 )
	love.graphics.rectangle("line", pickup.x+2, pickup.y+2, 28, 28)
	
	if powerup.enabled then
		love.graphics.setColor( powerup.color_fill )
		love.graphics.rectangle("fill", 290, 258, 60, 28)
		love.graphics.setColor( powerup.color_outline )
		love.graphics.rectangle("line", 290, 258, 60, 28)
	end
	
	love.graphics.setColor( 128, 128, 128 )
    love.graphics.rectangle("fill", ghostAlpha.act_x+2, ghostAlpha.act_y+2, 28, 28)
	love.graphics.setColor( 256, 256, 256 )
    love.graphics.rectangle("line", ghostAlpha.act_x+2, ghostAlpha.act_y+2, 28, 28)
	
	love.graphics.setColor( 128, 128, 128 )
    love.graphics.rectangle("fill", ghostBeta.act_x+2, ghostBeta.act_y+2, 28, 28)
	love.graphics.setColor( 256, 256, 256 )
    love.graphics.rectangle("line", ghostBeta.act_x+2, ghostBeta.act_y+2, 28, 28)
	
	if freezeGrids[1].enabled then
		love.graphics.setColor( 32, 32, 255 )
		love.graphics.rectangle("fill", freezeGrids[1].grid_x+4, freezeGrids[1].grid_y+4, 24, 24)
		love.graphics.setColor( 64, 64, 64 )
		love.graphics.rectangle("line", freezeGrids[1].grid_x+4, freezeGrids[1].grid_y+4, 24, 24)
	end
	if freezeGrids[2].enabled then
		love.graphics.setColor( 32, 32, 255 )
		love.graphics.rectangle("fill", freezeGrids[2].grid_x+4, freezeGrids[2].grid_y+4, 24, 24)
		love.graphics.setColor( 64, 64, 64 )
		love.graphics.rectangle("line", freezeGrids[2].grid_x+4, freezeGrids[2].grid_y+4, 24, 24)
	end
	if freezeGrids[3].enabled then
		love.graphics.setColor( 32, 32, 255 )
		love.graphics.rectangle("fill", freezeGrids[3].grid_x+4, freezeGrids[3].grid_y+4, 24, 24)
		love.graphics.setColor( 64, 64, 64 )
		love.graphics.rectangle("line", freezeGrids[3].grid_x+4, freezeGrids[3].grid_y+4, 24, 24)
	end
	
	if powerup.starttime ~= nil and powerup.type == "speed" then
		love.graphics.setColor( powerup.color_outline )
		printTimer = 10 - (math.floor((love.timer.getTime() - powerup.starttime)*10)/10)
		if printTimer == 10 then
			printTimer = "9.9"
		elseif printTimer == math.floor(printTimer) then
			printTimer = tostring(printTimer)..".0"
		else
			printTimer = tostring(printTimer)
		end
		love.graphics.print( printTimer, 300, 322 )
	end
	
	if currentmap == "alpha" then
    for y=1, #mapAlpha do
        for x=1, #mapAlpha[y] do
            if mapAlpha[y][x] == 1 then
				love.graphics.setColor( 64, 64, 128 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
			if mapAlpha[y][x] == 2 then
				love.graphics.setColor( 128, 64, 64 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
        end
    end
	elseif currentmap == "beta" then
    for y=1, #mapBeta do
        for x=1, #mapBeta[y] do
            if mapBeta[y][x] == 1 then
				love.graphics.setColor( 64, 64, 128 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
			if mapBeta[y][x] == 2 then
				love.graphics.setColor( 128, 64, 64 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
        end
    end
	elseif currentmap == "char" then
    for y=1, #mapChar do
        for x=1, #mapChar[y] do
            if mapChar[y][x] == 1 then
				love.graphics.setColor( 64, 64, 128 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
			if mapChar[y][x] == 2 then
				love.graphics.setColor( 128, 64, 64 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
        end
    end
	elseif currentmap == "delta" then
    for y=1, #mapDelta do
        for x=1, #mapDelta[y] do
            if mapDelta[y][x] == 1 then
				love.graphics.setColor( 64, 64, 128 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
			if mapDelta[y][x] == 2 then
				love.graphics.setColor( 128, 64, 64 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
        end
    end
	elseif currentmap == "epsil" then
    for y=1, #mapEpsil do
        for x=1, #mapEpsil[y] do
            if mapEpsil[y][x] == 1 then
				love.graphics.setColor( 64, 64, 128 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
			if mapEpsil[y][x] == 2 then
				love.graphics.setColor( 128, 64, 64 )
                love.graphics.rectangle("line", (x * 32)+2, (y * 32)+2, 28, 28)
            end
        end
    end
	end
end

function game.love.keypressed(key)
	-- goes through pause
	if key == "return" then
		pause = not pause
	end
	if key == "1" then
		gamespeed = 0.6
	elseif key == "2" then
		gamespeed = 0.8
	elseif key == "3" then
		gamespeed = 1
	elseif key == "4" then
		gamespeed = 1.2
	elseif key == "5" then
		gamespeed = 1.6
	elseif key == "6" then
		gamespeed = 2
	elseif key == "7" then
		gamespeed = 2.4
	elseif key == "8" then
		gamespeed = 2.7
	elseif key == "9" then
		gamespeed = 12
	end
	if key == "[" then
		if currentmap == "alpha" then currentmap = "epsil"
		elseif currentmap == "epsil" then currentmap = "delta"
		elseif currentmap == "delta" then currentmap = "char"
		elseif currentmap == "char" then currentmap = "beta"
		elseif currentmap == "beta" then currentmap = "alpha"
		end
		game.love.load()
	elseif key == "]" then
		if currentmap == "delta" then currentmap = "epsil"
		elseif currentmap == "char" then currentmap = "delta"
		elseif currentmap == "beta" then currentmap = "char"
		elseif currentmap == "alpha" then currentmap = "beta"
		elseif currentmap == "epsil" then currentmap = "alpha"
		end
		game.love.load()
	end
	
	
	if pause == true then return end
	-- doesnt go through pause
    if key == "up" or key == "right" or key == "down" or key == "left" then
		olddir = newdir
		if key == "up" then
			if testMap(0, -1) and olddir ~= "down" then
				newdir = key
				player.facing = 3
			end
		elseif key == "right" then
			if testMap(1, 0) and olddir ~= "left" then
				newdir = key
				player.facing = 0
			end
		elseif key == "down" then
			if testMap(0, 1) and olddir ~= "up" then
				newdir = key
				player.facing = 1
			end
		elseif key == "left" then
			if testMap(-1, 0) and olddir ~= "right" then
				newdir = key
				player.facing = 2
			end
		end
    end
	if key == " " then
		if freezepower > 0 then
			if freezepower == 3 then
				freezeGrids[1].enabled = true
				freezeGrids[1].grid_x = player.grid_x
				freezeGrids[1].grid_y = player.grid_y
				freezeGrids[1].timedown = 3
			end
			if freezepower == 2 then
				freezeGrids[2].enabled = true
				freezeGrids[2].grid_x = player.grid_x
				freezeGrids[2].grid_y = player.grid_y
				freezeGrids[2].timedown = 3
			end
			if freezepower == 1 then
				freezeGrids[3].enabled = true
				freezeGrids[3].grid_x = player.grid_x
				freezeGrids[3].grid_y = player.grid_y
				freezeGrids[3].timedown = 3
			end
			freezepower = freezepower - 1
		end
	end
	if key == "kp1" then
		pickup.nomnom = true
		if powerup.enabled == false then
			powerup.pickups_left = powerup.pickups_left - 1
		end
		score = score + 10
		if powerup.pickups_left == 0 then
			powerup.enabled = 1
			powerup.pickups_left = 5
			
			powerup.typenum = math.floor(love.math.random(1,3))
			if powerup.typenum == 3 then
				powerup.typenum = 2
			end
			if powerup.typenum == 1 then
			
			powerup.type = "speed"
			
			elseif powerup.typenum == 2 then powerup.type = "freeze"
			end
		end
	end
end

function testMap(x, y)
	if currentmap == "alpha" then
    if mapAlpha[(player.grid_y / 32) + y][(player.grid_x / 32) + x] ~= 0 then
        return false
    end
    return true
	elseif currentmap == "beta" then
    if mapBeta[(player.grid_y / 32) + y][(player.grid_x / 32) + x] ~= 0 then
        return false
    end
    return true
	elseif currentmap == "char" then
    if mapChar[(player.grid_y / 32) + y][(player.grid_x / 32) + x] ~= 0 then
        return false
    end
    return true
	elseif currentmap == "delta" then
    if mapDelta[(player.grid_y / 32) + y][(player.grid_x / 32) + x] ~= 0 then
        return false
    end
    return true
	elseif currentmap == "epsil" then
    if mapEpsil[(player.grid_y / 32) + y][(player.grid_x / 32) + x] ~= 0 then
        return false
    end
    return true
	end
end

function testMapghostAlpha(x, y)
	if currentmap == "alpha" then
    if mapAlpha[(ghostAlpha.grid_y / 32) + y][(ghostAlpha.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "beta" then
    if mapBeta[(ghostAlpha.grid_y / 32) + y][(ghostAlpha.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "char" then
    if mapChar[(ghostAlpha.grid_y / 32) + y][(ghostAlpha.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "delta" then
    if mapDelta[(ghostAlpha.grid_y / 32) + y][(ghostAlpha.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "epsil" then
    if mapEpsil[(ghostAlpha.grid_y / 32) + y][(ghostAlpha.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	end
end

function testMapghostBeta(x, y)
	if currentmap == "alpha" then
    if mapAlpha[(ghostBeta.grid_y / 32) + y][(ghostBeta.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "beta" then
    if mapBeta[(ghostBeta.grid_y / 32) + y][(ghostBeta.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "char" then
    if mapChar[(ghostBeta.grid_y / 32) + y][(ghostBeta.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "delta" then
    if mapDelta[(ghostBeta.grid_y / 32) + y][(ghostBeta.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	elseif currentmap == "epsil" then
    if mapEpsil[(ghostBeta.grid_y / 32) + y][(ghostBeta.grid_x / 32) + x] == 1 then
        return false
    end
    return true
	end
end