pcall(require, 'luarocks.loader')

local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')

local beautiful = require('beautiful')
local naughty = require('naughty')

local hotkeys_popup = require("awful.hotkeys_popup")

-- Startup Error Handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = 'Awesome: Critical Startup Errors!',
        text = awesome.startup_errors
    })
end

-- Runtime Errors
do
    local in_error = false
    awesome.connect_signal('debug::error', function (err)
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = 'Awesome: Critical Startup Errors!',
            text = awesome.startup_errors
        })
        in_error = false
    end)
end

-- Variables
terminal = os.getenv('TERMINAL') or 'kitty'
editor = os.getenv('EDITOR') or 'nvim'
editor_cmd = terminal .. ' -e ' .. editor

theme_path = gears.filesystem.get_themes_dir() .. 'default/theme.lua'

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile
}

-- Keybindings
MOD = {
    Windows = 'Mod4',
    Alt = 'Mod1',
    Shift = 'Shift',
    Ctrl = 'Control'
}

GROUP = {
    wm = 'awesome',
    launcher = 'launcher'
}

function spawner(command)
    return function()
        awful.spawn(command)
    end
end

function execute(command)
    return function()
        os.execute(command)
    end
end

keys_global = gears.table.join(
    -- awesome
    awful.key(
        {MOD.Windows}, 's',
        hotkeys_popup.show_help,
        { group = GROUP.wm, description = 'show keybinds' }
    ),
    awful.key(
        {MOD.Ctrl, MOD.Windows}, 'r',
        awesome.restart,
        { group = GROUP.wm, description = 'restart awesome' }
    ),
    awful.key(
        {MOD.Ctrl, MOD.Windows}, 'q',
        awesome.quit,
        { group = GROUP.wm, description = 'quit awesome' }
    ),

    -- launcher
    awful.key(
        {MOD.Windows}, 'enter',
        spawner(terminal),
        { group = GROUP.launcher, description = 'open terminal' }
    ),
    awful.key(
        {MOD.Control}, 'space',
        spawner('rofi -show combi -modi drun,filebrowser'),
        { group = GROUP.launcher, description = 'rofi combi' }
    ),
    awful.key(
        {MOD.Windows}, 'r',
        spawner('rofi -show run'),
        { group = GROUP.launcher, description = 'rofi run' }
    ),
    awful.key(
        {MOD.Windows}, 'c',
        spawner('rofi -show calc -modi calc -no-show-match -no-sort'),
        { group = GROUP.launcher, description = 'rofi calc' }
    )
)

root.keys(keys_global)


-- Beautiful
beautiful.init(theme_path)

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, screen, true)
    end
end

local function set_screen(s)
    set_wallpaper(s)

end


client.connect_signal('manage', function (c)
    if awesome.startup
        and not c.size_hints
