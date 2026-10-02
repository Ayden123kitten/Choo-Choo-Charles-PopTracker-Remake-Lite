ENABLE_DEBUG_LOG = true
local variant = Tracker.ActiveVariantUID

ScriptHost:LoadScript("scripts/utils.lua")

ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic/logic_helper.lua")

Tracker:AddMaps("maps/maps.jsonc")

ScriptHost:LoadScript("scripts/autotracking.lua")
ScriptHost:LoadScript("scripts/locations.lua")

Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/maps/maps_no_notes.jsonc")
Tracker:AddLayouts("layouts/goal_no_fog.jsonc")
Tracker:AddLayouts("layouts/lockpicks_keys.jsonc")
Tracker:AddLayouts("layouts/quest.jsonc")
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")
Tracker:AddLayouts("layouts/fogbane_relics/fog_grid_off.jsonc")
Tracker:AddLayouts("layouts/track_switch/track_switch_off.jsonc")
Tracker:AddLayouts("layouts/upgrades/upgrades_disabled.jsonc")
Tracker:AddLayouts("layouts/weapons/weapons_off.jsonc")
