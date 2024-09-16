-- if true then return end

local gui          = require "gui"
local task_manager = require "core.task_manager"
local settings     = require "core.settings"

local local_player, player_position
local patterns = { "^HarvestNode", "Chest", "Clicky", "Cairn", "Break", "LooseStone", "Corpse" }
local interacted_objects_blacklist = {}

local function matchesAnyPattern(skin_name, extra)
    for _, pattern in ipairs(patterns) do
        if not extra and skin_name:match(pattern) or extra and (skin_name:match(pattern) or skin_name:match("Shrine")) then
            return true
        end
    end
    return false
end

local function update_locals()
    local_player = get_local_player()
    player_position = local_player and local_player:get_position()
    if not local_player then
        return;
    end
    local playerPos = local_player:get_position();
    local objects = actors_manager.get_ally_actors()
    -- clear table if too big
    if #interacted_objects_blacklist > 200 then
        interacted_objects_blacklist = {}
    end
    local function shouldInteract(skin_name, position)
        local distanceThreshold = 1 -- Default
        if skin_name:match("Shrine") then
            distanceThreshold = 2.5
        elseif skin_name:match("Gate") or skin_name:match("Door")  then
            distanceThreshold = 1.5
        elseif not matchesAnyPattern(skin_name) then
            return false -- early break
        end
        return position:dist_to(playerPos) < distanceThreshold
    end

    for i, obj in ipairs(objects) do
        local obj_id = obj:get_id()
        if not interacted_objects_blacklist[obj_id] then
            local position = obj:get_position();
            local skin_name = obj:get_skin_name()
            if skin_name and shouldInteract(skin_name, position) and not obj:can_not_interact() then
                interact_object(obj)
                interacted_objects_blacklist[obj_id] = true
            end
        end
    end

end

local function main_pulse()

    settings:update_settings()
    if not local_player or not settings.enabled then return end
    task_manager.execute_tasks()
end

local function render_pulse()
    if not local_player or not settings.enabled then return end
    local current_task = task_manager.get_current_task()
    if current_task then
        local px, py, pz = player_position:x(), player_position:y(), player_position:z()
        local draw_pos = vec3:new(px, py - 2, pz + 3)
        graphics.text_3d("Current Task: " .. current_task.name, draw_pos, 14, color_white(255))
    end
    local objects = actors_manager.get_ally_actors()
    for i, obj in ipairs(objects) do
        local obj_id = obj:get_id()
        if not interacted_objects_blacklist[obj_id] then
            local position = obj:get_position();
            local skin_name = obj:get_skin_name()
            if skin_name and matchesAnyPattern(skin_name, true) then
                graphics.circle_3d(position, 1, color_white(100));
                graphics.text_3d("Open", position, 15, color_white(255));
            end
        end
    end
end

on_update(function()
    update_locals()
    main_pulse()
end)

on_render_menu(gui.render)
on_render(render_pulse)