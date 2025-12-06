-- grandMA3 Label colors by Peramato
-- Reads Preset Pool 4 via GetPresetData, finds nearest color name, and runs: Label Preset 4.X "<Name>"

------------------------------------------------------------
-- Plugin paths helper
------------------------------------------------------------

local plugin_table = select(3, ...)
if type(plugin_table) ~= "table" then
    plugin_table = {}
end

-- Shared plugin table

------------------------------------------------------------
-- Basic color table
------------------------------------------------------------

local BASIC_COLORS = {
 {n="White",r=255,g=255,b=255},
 {n="Red",r=255,g=0,b=0},{n="Orange",r=255,g=127,b=0},{n="Yellow",r=255,g=255,b=0},
 {n="Fern Green",r=127,g=255,b=0},{n="Green",r=0,g=255,b=0},{n="Sea Green",r=0,g=255,b=127},
 {n="Cyan",r=0,g=255,b=255},{n="Lavender",r=0,g=127,b=255},{n="Blue",r=0,g=0,b=255},
 {n="Violet",r=127,g=0,b=255},{n="Magenta",r=255,g=0,b=255},{n="Pink",r=255,g=0,b=127},
 {n="Light Red",r=255,g=127,b=127},{n="Light Orange",r=255,g=191,b=127},{n="Light Yellow",r=255,g=255,b=127},
 {n="Light Fern Green",r=191,g=255,b=127},{n="Light Green",r=127,g=255,b=127},{n="Light Sea Green",r=127,g=255,b=191},
 {n="Light Cyan",r=127,g=255,b=255},{n="Light Lavender",r=127,g=191,b=255},{n="Light Blue",r=127,g=127,b=255},
 {n="Light Violet",r=191,g=127,b=255},{n="Light Magenta",r=255,g=127,b=255},{n="Light Pink",r=255,g=127,b=191}
}

------------------------------------------------------------
-- Color models registry
------------------------------------------------------------

local COLOR_MODELS = {}

local function load_color_models()
    COLOR_MODELS = {}

    table.insert(COLOR_MODELS, {
        id = "BASIC",
        label = "Basic colors",
        colors = BASIC_COLORS
    })

    if type(plugin_table.LabelColors_HTML) == "table" and #plugin_table.LabelColors_HTML > 0 then
        table.insert(COLOR_MODELS, {
            id = "HTML",
            label = "HTML colors",
            colors = plugin_table.LabelColors_HTML
        })
    end

    if type(plugin_table.LabelColors_ROSCO) == "table" and #plugin_table.LabelColors_ROSCO > 0 then
        table.insert(COLOR_MODELS, {
            id = "ROSCO",
            label = "Rosco filters",
            colors = plugin_table.LabelColors_ROSCO
        })
    end

    if type(plugin_table.LabelColors_LEE) == "table" and #plugin_table.LabelColors_LEE > 0 then
        table.insert(COLOR_MODELS, {
            id = "LEE",
            label = "LEE filters",
            colors = plugin_table.LabelColors_LEE
        })
    end

    if type(plugin_table.LabelColors_30K) == "table" and #plugin_table.LabelColors_30K > 0 then
        table.insert(COLOR_MODELS, {
            id = "30K",
            label = "Extended 30K colors",
            colors = plugin_table.LabelColors_30K
        })
    end
end

------------------------------------------------------------
-- Utilities
------------------------------------------------------------

local function norm255_from100(x)
    return math.floor((x or 0) * 2.55 + 0.5)
end

local function srgb_to_linear(c)
    if c <= 0.04045 then
        return c / 12.92
    else
        return ((c + 0.055) / 1.055) ^ 2.4
    end
end

local function nearest_name_from_table(tbl, r255, g255, b255)
    if type(tbl) ~= "table" or #tbl == 0 then
        return "Unnamed"
    end

    -- Clamp input just in case
    local rl = srgb_to_linear(math.max(0, math.min(255, r255)) / 255)
    local gl = srgb_to_linear(math.max(0, math.min(255, g255)) / 255)
    local bl = srgb_to_linear(math.max(0, math.min(255, b255)) / 255)

    local best_name = tbl[1].n or "Unnamed"
    local best_d = nil

    for i = 1, #tbl do
        local c = tbl[i]
        local cr = srgb_to_linear((c.r or 0) / 255)
        local cg = srgb_to_linear((c.g or 0) / 255)
        local cb = srgb_to_linear((c.b or 0) / 255)

        local dr = rl - cr
        local dg = gl - cg
        local db = bl - cb
        local d  = dr * dr + dg * dg + db * db  -- symmetric distance

        if not best_d or d < best_d then
            best_d = d
            best_name = c.n
        end
    end

    return best_name
end

-- Find absolute values for ColorRGB_R/G/B (0..100) inside the nested preset table
local function extract_rgb_table(t, path, rgb)
    if type(t) ~= "table" then return end
    path = path or ""
    rgb = rgb or {r=nil,g=nil,b=nil}
    for k,v in pairs(t) do
        local kp = (path=="" and tostring(k)) or (path.."/"..tostring(k))
        if type(v)=="table" then
            extract_rgb_table(v, kp, rgb)
        elseif k=="absolute" and type(v)=="number" then
            local lkp = kp:lower()
            if lkp:find("/colorrgb_r/") then rgb.r = v end
            if lkp:find("/colorrgb_g/") then rgb.g = v end
            if lkp:find("/colorrgb_b/") then rgb.b = v end
        end
    end
    return rgb
end

------------------------------------------------------------
-- Color model selector
------------------------------------------------------------

local function name_for_rgb(table_choice, r255, g255, b255)
    local model = COLOR_MODELS[table_choice]
    local tbl = BASIC_COLORS

    if model and type(model.colors) == "table" then
        tbl = model.colors
    end

    if not tbl or #tbl == 0 then
        tbl = BASIC_COLORS
    end

    return nearest_name_from_table(tbl, r255, g255, b255)
end

------------------------------------------------------------
-- Per-preset processing
------------------------------------------------------------

local function process_preset(idx, table_choice)
    local h = DataPool().PresetPools[4][idx]
    if not h then
        Printf("Preset 4."..tostring(idx)..": empty.")
        return
    end

    local ok, content = pcall(function() return GetPresetData(h) end)
    if not ok or type(content) ~= "table" then
        Printf("Preset 4."..tostring(idx)..": GetPresetData failed.")
        return
    end

    local rgb = extract_rgb_table(content)
    if rgb and rgb.r and rgb.g and rgb.b then
        local r = norm255_from100(rgb.r)
        local g = norm255_from100(rgb.g)
        local b = norm255_from100(rgb.b)

        local name = name_for_rgb(table_choice, r, g, b)

        Printf("Preset 4."..tostring(idx).." => RGB("..r..","..g..","..b..") ≈ "..name)
        Cmd('Label Preset 4.'..tostring(idx)..' "'..name..'"')
    else
        Printf("Preset 4."..tostring(idx)..": RGB not found.")
    end
end

------------------------------------------------------------
-- UI + main
------------------------------------------------------------

local function main()
    load_color_models()

    local inputs = {
        {name = "First Preset", value = "1",  whiteFilter = "0123456789"},
        {name = "Last Preset",  value = "50", whiteFilter = "0123456789"}
    }

    local selectorValues = {}
    local defaultIndex = 1

    for idx, model in ipairs(COLOR_MODELS) do
        selectorValues[model.label] = idx
        if model.id == "BASIC" then
            defaultIndex = idx
        end
    end

    local selectors = {
        {
            name = "Color table",
            selectedValue = defaultIndex,
            values = selectorValues,
            type = 1
        }
    }

    local resultTable = MessageBox({
        title = "Label colors",
        message = "Select first and last color preset to rename. Don´t use preset prefix (4.).",
        message_align_h = Enums.AlignmentH.Left,
        message_align_v = Enums.AlignmentV.Top,
        commands = {{value = 1, name = "Ok"}, {value = 0, name = "Cancel"}},
        inputs = inputs,
        selectors = selectors,
        backColor = "Global.Default",
        icon = "logo_small",
			messageTextColor = "Global.Text",
        autoCloseOnInput = true
    })

    if not resultTable or resultTable.result ~= 1 then
        Printf("Canceled.")
        return
    end

    local first = tonumber(resultTable.inputs["First Preset"]) or 1
    local last  = tonumber(resultTable.inputs["Last Preset"]) or first
    if last < first then
        Printf("Invalid range.")
        return
    end

    local table_choice = defaultIndex
    if resultTable.selectors and resultTable.selectors["Color table"] then
        table_choice = tonumber(resultTable.selectors["Color table"]) or defaultIndex
    end

    for i = first, last do
        process_preset(i, table_choice)
    end
end

return main
