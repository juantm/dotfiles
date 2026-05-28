local M = {}

local SETTINGS_PATH = vim.fn.expand("~/.config/noctalia/settings.json")

function M.sync()
    local f = io.open(SETTINGS_PATH, "r")
    if not f then
        vim.notify("Noctalia settings file not found: " .. SETTINGS_PATH, vim.log.levels.ERROR)
        return
    end

    local content = f:read("*all")
    f:close()

    local ok, json = pcall(vim.json.decode, content)
    if not ok then
        vim.notify("Failed to parse Noctalia settings JSON", vim.log.levels.ERROR)
        return
    end

    local is_dark = json.darkMode
    local theme = is_dark and "catppuccin-mocha" or "catppuccin-latte"

    -- Wrap in pcall to avoid blocking startup if Catppuccin isn't loaded yet
    local success, err = pcall(function()
        vim.cmd.colorscheme(theme)
    end)

    if not success then
        vim.notify("Failed to set colorscheme " .. theme .. ": " .. tostring(err), vim.log.levels.WARN)
    end
end

return M
