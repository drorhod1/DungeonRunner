local gui = require "gui"
local settings = {
    enabled = false,
    elites_only = false,
    pit_level = 1,
    salvage = false,
    path_angle = 10,
    reset_time = 1,
    selected_chest_type = nil,
    failover_chest_type = nil,
    greater_affix_count = 0,
}

function settings:update_settings()
    settings.enabled = gui.elements.main_toggle:get()
    settings.salvage = gui.elements.salvage_toggle:get() -- Change this line
    settings.loot_mothers_gift = gui.elements.loot_mothers_gift:get()
    settings.open_chest_delay = gui.elements.open_chest_delay:get()
    settings.chest_move_attempts = gui.elements.chest_move_attempts:get()
    settings.use_salvage_filter_toggle = gui.elements.use_salvage_filter_toggle:get()
    settings.affix_salvage_count = gui.elements.affix_salvage_count:get()
    settings.greater_affix_count = gui.elements.greater_affix_count:get()
end

return settings