local menus = {}

-- CPU Temperature Display
menus.menuTemp = function()
    local degreeSymbol = utf8.char(0176)
    local CPUTemp = (hs.execute("/usr/local/bin/osx-cpu-temp")):sub(1, 2)

    if not menubar then
        menubar = hs.menubar.new():setTitle('CPU')
    else
        menubar:setTitle(CPUTemp .. degreeSymbol)
    end
end

-- Refresh Menu Timers
tempMenuTimer = hs.timer.doEvery(20, menus.menuTemp)

return menus
