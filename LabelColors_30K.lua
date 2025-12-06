local plugin_table = select(3, ...)
if type(plugin_table) ~= "table" then
    plugin_table = {}
end

plugin_table.LabelColors_Extended = COLORS_30K

return function() end
