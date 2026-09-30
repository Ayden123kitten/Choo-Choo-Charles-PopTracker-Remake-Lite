-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
-- IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Choo Choo Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic/logic_helper.lua")

-- Custom Items
--ScriptHost:LoadScript("scripts/custom_items/class.lua")
--ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
--ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")
Tracker:AddItems("items/item_settings.jsonc")

Tracker:AddMaps("maps/maps.jsonc")

ScriptHost:LoadScript("scripts/locations.lua")

-- Layout
Tracker:AddLayouts("layouts/unlock.jsonc")
Tracker:AddLayouts("layouts/quest.jsonc")
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/maps/maps_no_notes.jsonc")
Tracker:AddLayouts("layouts/goal_no_fog.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")
Tracker:AddLayouts("layouts/fogbane_relics/fog_grid_off.jsonc")
Tracker:AddLayouts("layouts/track_switch/track_switch_off.jsonc")
Tracker:AddLayouts("layouts/upgrades/upgrades_disabled.jsonc")
Tracker:AddLayouts("layouts/weapons/weapons_off.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
