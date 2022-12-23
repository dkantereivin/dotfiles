-- KEYBINDS FOR AWESOME

MOD = {
    Windows = 'Mod4',
    Alt = 'Mod1',
    Shift = 'Shift',
    Ctrl = 'Control'
}

GROUP = {
    wm = 'awesome',
    core = 'core'
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

    -- core
    awful.key(
        {MOD.Windows}, 'Return',
        spawner(terminal),
        { group = GROUP.core, description = 'open terminal' }
    ),
    awful.key(
        {MOD.Windows}, 'space',
        spawner('rofi -show drun -modi drun,filebrowser'),
        { group = GROUP.core, description = 'rofi combi' }
    ),
    awful.key(
        {MOD.Windows}, 'r',
        spawner('rofi -show run'),
        { group = GROUP.core, description = 'rofi run' }
    ),
    awful.key(
        {MOD.Windows}, 'c',
        spawner('rofi -show calc -modi calc -no-show-match -no-sort'),
        { group = GROUP.core, description = 'rofi calc' }
    ),
    awful.key(
        {MOD.Alt}, 'Tab',
        spawner('skippy-xd-runner --toggle'),
        { group = GROUP.core, description = 'rofi window switch' }
    ),
    awful.key(
        {}, 'XF86AudioRaiseVolume',
        execute('pactl -- set-sink-volume 0 +2%'),
        { group = GROUP.core, description = 'volume += 2%' }
    ),
    awful.key(
        {}, 'XF86AudioLowerVolume',
        execute('pactl -- set-sink-volume 0 -2%'),
        { group = GROUP.core, description = 'volume -= 2%' }
    )
)

root.keys(keys_global)
