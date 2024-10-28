print("Script started, Let's Fish!")
local API = require("api")
local UTILS = require("utils")
local player = API.GetLocalPlayerName()

local function idleCheck()
    local timeDiff = os.difftime(os.time(), afk)
    local randomTime = math.random(180, 280)
    if timeDiff > randomTime then
        API.DoRandomEvents()
        API.PIdle2()
        afk = os.time()
    end
end

local function run_to_tile(x, y, z)
    local tile = WPOINT.new(x, y, z)

    API.DoAction_Tile(tile)

    while API.Read_LoopyLoop() and API.Math_DistanceW(API.PlayerCoord(), tile) > 5 do
        API.RandomSleep2(100, 200, 200)

        idleCheck()
    end
end

local NPCS = {
    CRAYFISH = 14907,
    TROUT = 328,
    TUNA = 321,
    GHOST_SOLE = 30285,
    SHARK = 322
}

-- START at the spot you want to fish at, bot will handle the rest

--Set for type of fish
local crayfish = true      -- lv1+
local trout_salmon = false -- lvl 30+
local tuna = false         -- lvl 35/50+
local ghost_sole = false   -- lvl 66+
local shark = false        -- lvl 76+

local function Fish()
    if crayfish == true then
        if not API.IsPlayerAnimating_(player, 40) then
            print("Fishing crayfish")
            API.DoAction_NPC(0x3c, API.OFF_ACT_InteractNPC_route, { NPCS.CRAYFISH }, 50)
        end
    end

    if trout_salmon == true then
        if not API.IsPlayerAnimating_(player, 40) then
            print("Fishing trout/salmon")
            API.DoAction_NPC(0x3c, API.OFF_ACT_InteractNPC_route, { NPCS.TROUT }, 50)
        end
    end

    if tuna == true then
        if not API.IsPlayerAnimating_(player, 40) then
            print("Fishing tuna/swordfish")
            API.DoAction_NPC(0x3c, API.OFF_ACT_InteractNPC_route2, { NPCS.TUNA }, 50)
        end
    end

    if ghost_sole == true then
        if not API.IsPlayerAnimating_(player, 40) then
            print("Fishing ghostly soles")
            API.DoAction_NPC(0x3c, API.OFF_ACT_InteractNPC_route, { NPCS.GHOST_SOLE }, 50)
        end
    end

    if shark == true then
        if not API.IsPlayerAnimating_(player, 40) then
            print("Fishing sharks")
            API.DoAction_NPC(0x3c, API.OFF_ACT_InteractNPC_route2, { NPCS.SHARK }, 50)
        end
    end
end

local function Bank()
    if crayfish == true then
        run_to_tile(2893, 3496, 0)
        run_to_tile(2892, 3529, 0)
        API.DoAction_Object1(0x5, API.OFF_ACT_GeneralObject_route1, { 25688 }, 50)                         -- open bank burthorpe
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 517, 39, -1, API.OFF_ACT_GeneralInterface_route) -- deposit all
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 306, -1, API.OFF_ACT_GeneralInterface_route)      -- close bank (x) button
        UTILS.randomSleep(2400)
        run_to_tile(2893, 3495, 0)
        run_to_tile(2898, 3473, 0)
        print("Back to fish some more")
        UTILS.randomSleep(1200)
    end

    if trout_salmon == true then
        --[[run_to_tile(3094,3460,0)
        run_to_tile(3089,3490,0)
        API.DoAction_Object1(0x5,API.OFF_ACT_GeneralObject_route1,{ 42217 },50) -- open bank edgeville
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0xffffffff,0xffffffff,1,517,39,-1,API.OFF_ACT_GeneralInterface_route) -- deposit all
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24,0xffffffff,1,517,119,1,API.OFF_ACT_GeneralInterface_route) -- preset 1
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24,0xffffffff,1,517,306,-1,API.OFF_ACT_GeneralInterface_route) -- close bank (x) button
        UTILS.randomSleep(2400)
        run_to_tile(3096,3454,0)
        run_to_tile(3107,3435,0)
        print("Back to fish some more")
        UTILS.randomSleep(1200)]]
        while API.Invfreecount_() <= 15 do
            API.KeyboardPress2(56, 300, 50)
            API.KeyboardPress2(57, 300, 50)
        end
    end

    if tuna == true then
        run_to_tile(2820, 3435, 0)
        run_to_tile(2795, 3440, 0)
        API.DoAction_Object1(0x5, API.OFF_ACT_GeneralObject_route1, { 24914 }, 50)                         -- open bank edgeville
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 517, 39, -1, API.OFF_ACT_GeneralInterface_route) -- deposit all
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 119, 1, API.OFF_ACT_GeneralInterface_route)       -- preset 1
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 306, -1, API.OFF_ACT_GeneralInterface_route)      -- close bank (x) button
        UTILS.randomSleep(2400)
        run_to_tile(2827, 3435, 0)
        run_to_tile(2842, 3432, 0)
        print("Back to fish some more")
        UTILS.randomSleep(1200)
    end

    if ghost_sole == true then
        run_to_tile(1108, 1741, 0)
        API.DoAction_Object1(0x5, API.OFF_ACT_GeneralObject_route1, { 126506 }, 50)                        -- open bank City Of Um
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 517, 39, -1, API.OFF_ACT_GeneralInterface_route) -- deposit all
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 119, 1, API.OFF_ACT_GeneralInterface_route)       -- preset 1
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 306, -1, API.OFF_ACT_GeneralInterface_route)      -- close bank (x) button
        UTILS.randomSleep(2400)
        run_to_tile(1134, 1725, 0)
        print("Back to fish some more")
        UTILS.randomSleep(1200)
    end

    if shark == true then
        run_to_tile(2820, 3435, 0)
        run_to_tile(2795, 3440, 0)
        API.DoAction_Object1(0x5, API.OFF_ACT_GeneralObject_route1, { 24914 }, 50)                         -- open bank edgeville
        UTILS.randomSleep(2400)
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 517, 39, -1, API.OFF_ACT_GeneralInterface_route) -- deposit all
        UTILS.randomSleep(2400)
        --API.DoAction_Interface(0x24,0xffffffff,1,517,119,1,API.OFF_ACT_GeneralInterface_route) -- preset 1
        --UTILS.randomSleep(2400)
        API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 306, -1, API.OFF_ACT_GeneralInterface_route) -- close bank (x) button
        UTILS.randomSleep(2400)
        run_to_tile(2827, 3435, 0)
        run_to_tile(2842, 3432, 0)
        print("Back to fish some more")
        UTILS.randomSleep(1200)
    end
end

API.GetTrackedSkills()

while API.Read_LoopyLoop() do
    API.SetDrawTrackedSkills(true)

    if API.Invfreecount_() <= math.random(1, 3) then
        print("Inventory full, banking")
        Bank()
    end
    Fish()
    UTILS.randomSleep(2400)
end
