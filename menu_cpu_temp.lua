require "lua_funcs"

function menu_temp()
    cpu_temps = firstThree( hs.execute("/usr/local/bin/osx-cpu-temp") )
    menubar:setTitle(cpu_temps)
end

menu_temp()
hs.timer.doEvery(30,menu_temp)


