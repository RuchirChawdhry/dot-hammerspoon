require "lua_funcs"

menubar = hs.menubar.new()

function menu_temp()
    cpu_temps = firstThree( hs.execute("/usr/local/bin/osx-cpu-temp") )
    menubar:setTitle(cpu_temps)
end

menu_temp()
cpu_timer = hs.timer.doEvery(30, menu_temp)

-- local statsbar_init


