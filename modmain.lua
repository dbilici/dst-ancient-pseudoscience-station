local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS
local tostring = GLOBAL.tostring

local VERSION = "1.1.1"
local CANCIENTALTAR = GetModConfigData("AncientStation")
local CTHULECITEFRAGMENTS = GetModConfigData("ThuleciteFragments")
local DEBUG_ENABLED = GetModConfigData("debug_logging") == true

local function GetRuntimeSide()
    if GLOBAL.TheNet == nil then
        return "NO_NET"
    elseif GLOBAL.TheNet.IsDedicated ~= nil and GLOBAL.TheNet:IsDedicated() then
        return "DEDICATED_SERVER"
    elseif GLOBAL.TheNet.GetIsServer ~= nil and GLOBAL.TheNet:GetIsServer() then
        return "HOST_SERVER"
    end
    return "CLIENT"
end

local function WriteLog(message)
    if GLOBAL.print ~= nil then
        GLOBAL.print("[Ancient Station " .. VERSION .. "][" .. GetRuntimeSide() .. "] " .. tostring(message))
    end
end

local function DebugLog(message)
    if DEBUG_ENABLED then
        WriteLog(message)
    end
end

PrefabFiles = {
    "altar",
}

Assets = {
    Asset("ATLAS", "images/inventoryimages/altar.xml"),
    Asset("IMAGE", "images/inventoryimages/altar.tex"),
    Asset("ATLAS", "images/inventoryimages/altar_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/altar_broken.tex"),
}

AddMinimapAtlas("images/inventoryimages/altar.xml")
AddMinimapAtlas("images/inventoryimages/altar_broken.xml")

-- Make the inventory/crafting icons available before the prefab is spawned.
if RegisterInventoryItemAtlas ~= nil then
    RegisterInventoryItemAtlas("images/inventoryimages/altar.xml", "altar.tex")
    RegisterInventoryItemAtlas("images/inventoryimages/altar_broken.xml", "altar_broken.tex")
end

-- March 2022 crafting menu support:
-- These custom prefabs use the old names altar/altar_broken, while DST only knows
-- the vanilla station prefabs ancient_altar/ancient_altar_broken by default.
local function RegisterAncientStationDef(prefabname)
    if AddPrototyperDef ~= nil then
        AddPrototyperDef(prefabname, {
            icon_atlas = GLOBAL.CRAFTING_ICONS_ATLAS,
            icon_image = "station_crafting_table.tex",
            is_crafting_station = true,
            filter_text = STRINGS.UI ~= nil
                and STRINGS.UI.CRAFTING_STATION_FILTERS ~= nil
                and STRINGS.UI.CRAFTING_STATION_FILTERS.ANCIENT
                or "Ancient Pseudoscience",
        })
    end
end

RegisterAncientStationDef("altar")
RegisterAncientStationDef("altar_broken")

local function AddCompatRecipe(name, ingredients, tech, config, filters)
    if AddRecipe2 ~= nil then
        AddRecipe2(name, ingredients, tech, config, filters)
        DebugLog("registered recipe=" .. tostring(name) .. " API=AddRecipe2")
    else
        -- Backwards compatibility for very old builds; current DST should use AddRecipe2.
        AddRecipe(
            name,
            ingredients,
            RECIPETABS.SCIENCE,
            tech,
            config ~= nil and config.placer or nil,
            config ~= nil and config.min_spacing or nil,
            config ~= nil and config.nounlock or nil,
            config ~= nil and config.numtogive or nil,
            config ~= nil and config.builder_tag or nil,
            config ~= nil and config.atlas or nil,
            config ~= nil and config.image or nil
        )
        DebugLog("registered recipe=" .. tostring(name) .. " API=AddRecipe")
    end
end

if CANCIENTALTAR ~= "disabled" then
    if CANCIENTALTAR == "easy" then
        AddCompatRecipe(
            "altar",
            {Ingredient("moonrocknugget", 2), Ingredient("purplegem", 1), Ingredient("thulecite_pieces", 3)},
            TECH.MAGIC_TWO,
            {
                placer = "altar_placer",
                atlas = "images/inventoryimages/altar.xml",
                image = "altar.tex",
            },
            {"STRUCTURES", "MAGIC"}
        )
    elseif CANCIENTALTAR == "normal" then
        AddCompatRecipe(
            "altar_broken",
            {Ingredient("moonrocknugget", 6), Ingredient("purplegem", 2), Ingredient("thulecite_pieces", 6)},
            TECH.MAGIC_THREE,
            {
                placer = "altar_broken_placer",
                atlas = "images/inventoryimages/altar_broken.xml",
                image = "altar_broken.tex",
            },
            {"STRUCTURES", "MAGIC"}
        )
    else
        AddCompatRecipe(
            "altar_broken",
            {Ingredient("moonrocknugget", 10), Ingredient("purplegem", 4), Ingredient("thulecite_pieces", 16)},
            TECH.MAGIC_THREE,
            {
                placer = "altar_broken_placer",
                atlas = "images/inventoryimages/altar_broken.xml",
                image = "altar_broken.tex",
            },
            {"STRUCTURES", "MAGIC"}
        )
    end
end

if CTHULECITEFRAGMENTS ~= "disabled" then
    if CTHULECITEFRAGMENTS == "easy" then
        AddCompatRecipe(
            "thulecite_pieces",
            {Ingredient("goldnugget", 1), Ingredient("nightmarefuel", 1)},
            TECH.MAGIC_TWO,
            nil,
            {"REFINE", "MAGIC"}
        )
    elseif CTHULECITEFRAGMENTS == "normal" then
        AddCompatRecipe(
            "thulecite_pieces",
            {Ingredient("transistor", 1), Ingredient("nightmarefuel", 1)},
            TECH.MAGIC_THREE,
            nil,
            {"REFINE", "MAGIC"}
        )
    else
        AddCompatRecipe(
            "thulecite_pieces",
            {Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)},
            TECH.MAGIC_THREE,
            nil,
            {"REFINE", "MAGIC"}
        )
    end
end

STRINGS.NAMES.ALTAR = "Ancient Station"
STRINGS.RECIPE_DESC.ALTAR = "Build the wonders of a lost age."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ALTAR = "An ancient and mysterious structure."

STRINGS.NAMES.ALTAR_BROKEN = "Small Station"
STRINGS.RECIPE_DESC.ALTAR_BROKEN = "Build some of the wonders of a lost age."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ALTAR_BROKEN = "It is missing some pieces, but it still hums with power."

STRINGS.RECIPE_DESC.THULECITE_PIECES = "The precious material of the ancients."

GLOBAL.ANCIENT_STATION_DEBUG = function()
    WriteLog(
        "status: station_mode=" .. tostring(CANCIENTALTAR)
        .. ", fragments_mode=" .. tostring(CTHULECITEFRAGMENTS)
        .. ", debug_logging=" .. tostring(DEBUG_ENABLED)
    )

    local recipes = GLOBAL.AllRecipes
    for _, recipe_name in GLOBAL.ipairs({"altar", "altar_broken", "thulecite_pieces"}) do
        WriteLog(
            "recipe=" .. recipe_name
            .. ", registered=" .. tostring(recipes ~= nil and recipes[recipe_name] ~= nil)
        )
    end
end

DebugLog(
    "loaded: station_mode=" .. tostring(CANCIENTALTAR)
    .. ", fragments_mode=" .. tostring(CTHULECITEFRAGMENTS)
)
