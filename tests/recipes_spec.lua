-- Mock the DST mod environment; verify registration independently of game runtime.
local modes = {"disabled", "easy", "normal", "hard"}
for _, station in ipairs(modes) do
    for _, fragments in ipairs(modes) do
        local recipes, defs = {}, {}
        local env = setmetatable({}, {__index = _G})
        env.GLOBAL = {
            Ingredient = function(name, amount) return {name=name, amount=amount} end,
            TECH = {MAGIC_TWO=2, MAGIC_THREE=3},
            STRINGS = {NAMES={}, RECIPE_DESC={}, CHARACTERS={GENERIC={DESCRIBE={}}}},
            tostring=tostring, ipairs=ipairs, AllRecipes=recipes, print=function() end,
        }
        env.GetModConfigData = function(key)
            return ({AncientStation=station, ThuleciteFragments=fragments, debug_logging=false})[key]
        end
        env.Asset = function() end
        env.AddMinimapAtlas = function() end
        env.RegisterInventoryItemAtlas = function() end
        env.AddPrototyperDef = function(name) defs[name]=true end
        env.AddRecipe2 = function(name, ingredients, tech, config, filters)
            recipes[name]={ingredients=ingredients, tech=tech, product=config and config.product or name, config=config}
        end
        local chunk=assert(loadfile("modmain.lua"))
        setfenv(chunk,env)
        chunk()
        assert(defs.altar and defs.altar_broken and env.PrefabFiles[1]=="altar")
        local id=station=="easy" and "altar" or "altar_broken"
        local recipe=recipes[id]
        if station=="disabled" then
            assert(not recipes.altar and not recipes.altar_broken)
        else
            assert(recipe and recipe.product=="ancient_"..id)
            local expected=({easy={2,1,3},normal={6,2,6},hard={10,4,16}})[station]
            for i, name in ipairs({"moonrocknugget","purplegem","thulecite_pieces"}) do
                assert(recipe.ingredients[i].name==name and recipe.ingredients[i].amount==expected[i])
            end
            assert(recipe.tech==(station=="easy" and 2 or 3))
            assert(recipe.config.placer==id.."_placer")
            assert(not recipes[id=="altar" and "altar_broken" or "altar"])
        end
        local f=recipes.thulecite_pieces
        if fragments=="disabled" then assert(not f) else
            assert(f and f.product=="thulecite_pieces")
            assert(f.ingredients[1].name==(fragments=="easy" and "goldnugget" or "transistor"))
            assert(f.ingredients[2].name=="nightmarefuel")
            for i=1,2 do assert(f.ingredients[i].amount==(fragments=="hard" and 2 or 1)) end
            assert(f.tech==(fragments=="easy" and 2 or 3))
        end
        assert(env.GLOBAL.c_as==env.GLOBAL.ANCIENT_STATION_DEBUG)
        env.GLOBAL.c_as()
    end
end
print("16 recipe configuration combinations passed")
