ACCESS_NONE = AccessibilityLevel.None
ACCESS_PARTIAL = AccessibilityLevel.Partial
ACCESS_INSPECT = AccessibilityLevel.Inspect
ACCESS_SEQUENCEBREAK = AccessibilityLevel.SequenceBreak
ACCESS_NORMAL = AccessibilityLevel.Normal
ACCESS_CLEARED = AccessibilityLevel.Cleared

local bool_to_accesslvl = {
    [true] = ACCESS_NORMAL,
    [false] = ACCESS_NONE
}

function A(result)
    if result then
        return ACCESS_NORMAL
    end
    return ACCESS_NONE
end

function ALL(...)
    local args = { ... }
    local min = ACCESS_NORMAL
    for _, v in ipairs(args) do
        if type(v) == "function" then
            v = v()
        elseif type(v) == "string" then
            v = Has(v)
        end
        if type(v) == "boolean" then
            v = bool_to_accesslvl[v]
        end
        if v < min then
            if v == ACCESS_NONE then
                return ACCESS_NONE
            end
            min = v
        end
    end
    return min
end

function ANY(...)
    local args = { ... }
    local max = ACCESS_NONE
    for _, v in ipairs(args) do
        if type(v) == "function" then
            v = v()
        elseif type(v) == "string" then
            v = Has(v)
        end
        if type(v) == "boolean" then
            v = bool_to_accesslvl[v]
        end
        if v > max then
            if v == ACCESS_NORMAL then
                return ACCESS_NORMAL
            end
            max = v
        end
    end
    return max
end

function Has(item, amount, amountInLogic)
    local count = Tracker:ProviderCountForCode(item)

    if amountInLogic then
        if count >= amountInLogic then
            return ACCESS_NORMAL
        elseif count >= amount then
            return ACCESS_SEQUENCEBREAK
        end
        return ACCESS_NONE
    end
    if not amount then
        if count > 0 then
            return ACCESS_NORMAL
        end
        return ACCESS_NONE
    else
        if count >= amount then
            return ACCESS_SEQUENCEBREAK
        end
        return ACCESS_NONE
    end
end

function OnChangeFogbaneRelic()
local mode = Tracker:FindObjectForCode("cursed_fogs_toggle")
if mode.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/fogbane_relics/fog_grid_off.jsonc")
        Tracker:AddLayouts("layouts/goal_no_fog.jsonc")
    elseif mode.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/fogbane_relics/fog_grid_pack.jsonc")
    else
        Tracker:AddLayouts("layouts/fogbane_relics/fog_grid_on.jsonc")
    end
end

function OnChangeTrackSwitch()
local mode = Tracker:FindObjectForCode("track_switch_toggle")
if mode.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/track_switch/track_switch_off.jsonc")
    elseif mode.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/track_switch/track_switch_pack.jsonc")
    else
        Tracker:AddLayouts("layouts/track_switch/track_switch_on.jsonc")
    end
end

function OnChangeWeapons()
local mode = Tracker:FindObjectForCode("weapons_toggle")
if mode.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/weapons/weapons_off.jsonc")
    else
        Tracker:AddLayouts("layouts/weapons/weapons_on.jsonc")
    end
end

function OnChangeUpgrade()
local armor = Tracker:FindObjectForCode("armor_toggle")
local speed = Tracker:FindObjectForCode("speed_toggle")
local damage = Tracker:FindObjectForCode("damage_toggle")
if  speed.CurrentStage == 0 and damage.CurrentStage == 0 and armor.CurrentStage == 0 then
    Tracker:AddLayouts("layouts/upgrades/upgrades_disabled.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 0 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_au.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 0 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_al.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 1 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_du.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 1 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_du_au.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 1 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_du_al.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 2 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_dl.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 2 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_dl_au.jsonc")
    elseif  speed.CurrentStage == 0 and damage.CurrentStage == 2 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_dl_al.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 0 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 0 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_au.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 0 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_al.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 1 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_du.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 1 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_du_au.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 1 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_du_al.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 2 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_dl.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 2 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_dl_au.jsonc")
    elseif  speed.CurrentStage == 1 and damage.CurrentStage == 2 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_su_dl_al.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 0 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 0 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_au.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 0 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_al.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 1 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_du.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 1 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_du_au.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 1 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_du_al.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 2 and armor.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_dl.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 2 and armor.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_dl_au.jsonc")
    elseif  speed.CurrentStage == 2 and damage.CurrentStage == 2 and armor.CurrentStage == 2 then
        Tracker:AddLayouts("layouts/upgrades/upgrades_sl_dl_al.jsonc")
    end
end

function OnChangeMaps()
local scraps = Tracker:FindObjectForCode("scraps_toggle")
local paint = Tracker:FindObjectForCode("paint_cans_toggle")
local notes = Tracker:FindObjectForCode("notes_toggle")
if scraps.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/maps/maps_no_scraps.jsonc")
        Tracker:AddLayouts("layouts/maps/worldmap_no_notes.jsonc")
    elseif notes.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/maps/maps_no_notes.jsonc")
        Tracker:AddLayouts("layouts/maps/worldmap_no_notes.jsonc")
    elseif scraps.CurrentStage == 0 and paint.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/maps/maps_no_paint_or_scraps.jsonc")
        Tracker:AddLayouts("layouts/maps/worldmap.jsonc")
    elseif scraps.CurrentStage == 0 and paint.CurrentStage == 0 and notes.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/maps/maps_no_paint_or_scraps_or_notes.jsonc")
        Tracker:AddLayouts("layouts/maps/worldmap_no_notes.jsonc")
    elseif scraps.CurrentStage == 0 and notes.CurrentStage == 0 then
        Tracker:AddLayouts("layouts/maps/maps_no_notes_or_scraps.jsonc")
        Tracker:AddLayouts("layouts/maps/worldmap.jsonc")
    elseif scraps.CurrentStage == 1 and notes.CurrentStage == 1 and paint.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/maps/maps.jsonc")
       Tracker:AddLayouts("layouts/maps/worldmap.jsonc")
     end
end

function OnChangeCore()
local mode = Tracker:FindObjectForCode("core_toggle")
if mode.CurrentStage == 0 then
        ScriptHost:AddScript("scripts/autotracking/location_mapping.lua")
    elseif mode.CurrentStage == 1 then
        ScriptHost:AddScript("scripts/autotracking/location_mapping_core.lua")
    end
end

ScriptHost:AddWatchForCode("scraps layout handler", "scraps_toggle", OnChangeMaps)
ScriptHost:AddWatchForCode("paint cans layout handler", "paint_cans_toggle", OnChangeMaps)
ScriptHost:AddWatchForCode("weapons layout handler", "weapons_toggle", OnChangeWeapons)
ScriptHost:AddWatchForCode("fogbane relic layout handler", "cursed_fogs_toggle", OnChangeFogbaneRelic)
ScriptHost:AddWatchForCode("track switch layout handler", "track_switch_toggle", OnChangeTrackSwitch)
ScriptHost:AddWatchForCode("speed layout handler", "speed_toggle", OnChangeUpgrade)
ScriptHost:AddWatchForCode("damage layout handler", "damage_toggle", OnChangeUpgrade)
ScriptHost:AddWatchForCode("armor layout handler", "armor_toggle", OnChangeUpgrade)
ScriptHost:AddWatchForCode("notes layout handler", "notes_toggle", OnChangeMaps)
ScriptHost:AddWatchForCode("core layout handler", "core_toggle", OnChangeCore)