local proc = nil
local base_address = 0
local local_player = 0
local entity_list_address = 0x619BAA8
local view_render_address = 0x3CBCDA8
local view_matrix = 0x11A350
local font = 0
local aimbot_enable = false
local esp_enable = false
local aim_fov = 50.0
local aim_smooth = 0.5
local last_mouse_x, last_mouse_y = 0, 0
local view_address = 0x1FAC
local bone_matrix = 0xFE8
local m_vecAbsOrigin = 0x17C
local m_iHealth = 0x324
local m_shieldHealth = 0x1A0
local m_iTeamNum = 0x334
local m_localAngles = 0x0378

function main()
    Log ("Loading Apex Cheat...")
    proc = ref_process("r5apex.exe")
    if proc == nil then
        log_error("Apex is not running")
        return -1
    end
    base_address = proc:base_address()
    local_player = proc:read_u64(base_address + 0x26BCDA8)
    font = create_font_file("Arial.ttf", 12, true, false)
    return 1

local subtab = ui.create_subtab(0, "Apex Cheat")
local panel = subtab:add_panel("Features", false)
local cb_aim = panel:add_checkbox("Enable Aimbot", false)
local sl_fov = panel:add_slider_double("Aimbot FOV", "°", aim_fov, 1.0, 180.0, 1.0)
local sl_smooth = panel:add_slider_double("Aimbot Smoothing", "", aim_smooth, 0.0, 1.0, 0.1)
local cb_esp = panel:add_checkbox("Enable ESP", false)
end

function on_frame()
esp_enable = cb_esp:get()
aimbot_enable = cb_aim:get()
aim_fov = sl_fov:get()
aim_smooth = sl_smooth:get()

if local_player == 0 then return end
local local_team = proc:readi32(local_player + m_iTeamNum)
local local_pos = {x=proc:read_float(local_player + m_vecAbsOrigin), y=proc:read_float(local_player + m_vecAbsOrigin + 4), z=proc:read_float(local_player + m_vecAbsOrigin + 8)}
local view_info = unreal_engine.read_minimal_view_info(proc, local_player + view_address)
if view_info == nil then log_error("view info failed") return end
local view_matrix_address = proc:read_u64(view_render_address + view_matrix)

local entity_list = unreal_engine.read_tarray(proc, base_address + entity_list_address, 100)
local closest_distance = math.huge
local closest_target = nil

for _, ent in ipairs(entity_list) do
    if ent == 0 or ent == local_player then goto continue end


end

function on_unload()
    if proc == nil then deref_process(proc) end
    log("Apex Cheat Unloaded")
end

