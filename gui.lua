local gui = {}
local plugin_label = "Dungeon Runner - Letrico Edition"

local function create_checkbox(key)
    return checkbox:new(false, get_hash(plugin_label .. "_" .. key))
end

gui.elements = {
    main_tree = tree_node:new(0),
    main_toggle = create_checkbox("main_toggle"),
    settings_tree = tree_node:new(1),
    salvage_toggle = create_checkbox("salvage_toggle"),
    path_angle_slider = slider_int:new(0, 360, 10, get_hash("path_angle_slider")), -- 10 is a default value
    always_open_ga_chest = create_checkbox("always_open_ga_chest"),
    loot_mothers_gift = create_checkbox("loot_mothers_gift"),
    open_chest_delay = slider_float:new(1.0, 3.0, 1.5, get_hash("open_chest_delay")), -- 1.0 is the default value
    chest_move_attempts = slider_int:new(20, 400, 40, get_hash("chest_move_attempts")), -- 20 is a default value
    use_salvage_filter_toggle = checkbox:new(false, get_hash("use_salvage_filter_toggle")),
    greater_affix_count = slider_int:new(0, 3, 0, get_hash("greater_affix_count")), -- 0 is the default value
    affix_salvage_count = slider_int:new(1, 3, 1, get_hash("affix_salvage_count")), -- 1 is a default value
    movement_spell_to_objective = checkbox:new(false, get_hash("movement_spell_to_objective")),
}

function gui.render()
    if not gui.elements.main_tree:push("Dungeon Runner - Letrico Edition") then return end

    gui.elements.main_toggle:render("Enable", "Enable the bot")
    
    -- if gui.elements.settings_tree:push("Settings") then
    --     gui.elements.movement_spell_to_objective:render("Attempt to use movement spell for objective", "Will attempt to use movement spell towards objective")
    --     gui.elements.salvage_toggle:render("Salvage", "Enable salvaging items")
    --     if gui.elements.salvage_toggle:get() then
    --         gui.elements.use_salvage_filter_toggle:render("Use salvage filter logic (update filter.lua)", "Salvage based on filter logic. Update filter.lua") 
    --         if gui.elements.salvage_toggle:get() and gui.elements.use_salvage_filter_toggle:get() then
    --             gui.elements.greater_affix_count:render("Min Greater Affixes to Keep", "Select minimum number of Greater Affixes to keep an item (0-3, 0 = off)")
    --             gui.elements.affix_salvage_count:render("Min No. affixes to keep", "Minimum number of matching affixes to keep")
    --         end
    --     end
    --     gui.elements.loot_mothers_gift:render("Loot Mother's Gift", "Toggle to loot Mother's Gift")
    --     gui.elements.open_chest_delay:render("Chest open delay", "Adjust delay for the chest opening (1.0-3.0)", 2)
    --     gui.elements.chest_move_attempts:render("Chest move attempts", "Adjust the amount of times it tries to reach a chest (20-400)")
        
    --     gui.elements.settings_tree:pop()
    -- end

    gui.elements.main_tree:pop()
end

return gui