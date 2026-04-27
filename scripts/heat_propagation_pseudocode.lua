-- Mine the Honey: Heat Propagation Pseudocode
-- This is design pseudocode, not final production Roblox code.

local GRID_WIDTH = 12
local GRID_HEIGHT = 8

local AMBIENT_HEAT = 22
local HEAT_DECAY = 0.92
local NEIGHBOR_TRANSFER = 0.18
local OVERHEAT_TEMP = 85
local CRITICAL_TEMP = 100

function updateHiveHeat(hive, deltaTime)
	for x = 1, GRID_WIDTH do
		for y = 1, GRID_HEIGHT do
			local slot = hive.grid[x][y]

			slot.nextHeat = AMBIENT_HEAT + ((slot.heat - AMBIENT_HEAT) * HEAT_DECAY)

			if slot.type == "Miner" then
				local miner = slot.item
				local overclockMultiplier = miner.overclock or 1.0

				local generatedHeat =
					miner.baseHeat *
					overclockMultiplier *
					(miner.powerDraw / miner.efficiency)

				slot.nextHeat += generatedHeat * deltaTime
			end

			if slot.type == "Cooler" then
				applyCoolingRadius(hive, x, y, slot.item.coolingPower, slot.item.radius, deltaTime)
			end
		end
	end

	for x = 1, GRID_WIDTH do
		for y = 1, GRID_HEIGHT do
			local slot = hive.grid[x][y]
			local neighbors = getNeighbors(hive, x, y)

			for _, neighbor in ipairs(neighbors) do
				local heatDiff = slot.heat - neighbor.heat
				if heatDiff > 0 then
					local transfer = heatDiff * NEIGHBOR_TRANSFER * deltaTime
					slot.nextHeat -= transfer
					neighbor.nextHeat += transfer
				end
			end
		end
	end

	for x = 1, GRID_WIDTH do
		for y = 1, GRID_HEIGHT do
			local slot = hive.grid[x][y]
			slot.heat = math.max(AMBIENT_HEAT, slot.nextHeat)

			if slot.type == "Miner" then
				updateMinerState(slot.item, slot.heat)
			end
		end
	end
end

function applyCoolingRadius(hive, cx, cy, coolingPower, radius, deltaTime)
	for x = cx - radius, cx + radius do
		for y = cy - radius, cy + radius do
			if hive.grid[x] and hive.grid[x][y] then
				local distance = math.sqrt((x - cx)^2 + (y - cy)^2)
				if distance <= radius then
					local strength = coolingPower * (1 - distance / (radius + 1))
					hive.grid[x][y].nextHeat -= strength * deltaTime
				end
			end
		end
	end
end

function updateMinerState(miner, heat)
	if heat >= CRITICAL_TEMP then
		miner.state = "Propolis"
		miner.hashMultiplier = 0
	elseif heat >= OVERHEAT_TEMP then
		miner.state = "Throttled"
		miner.hashMultiplier = 0.45
	elseif heat >= 75 then
		miner.state = "Hot"
		miner.hashMultiplier = 0.75
	else
		miner.state = "Stable"
		miner.hashMultiplier = 1.0
	end
end
