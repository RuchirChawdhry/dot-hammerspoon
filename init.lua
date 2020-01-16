require "usb"
require "wifi"
require "lua_funcs"


-- suppress warnings
hs.luaSkinLog.setLogLevel("warning")
hs.hotkey.setLogLevel("warning")
hs.window.filter.setLogLevel("error")

-- hyper
hyper = {'shift', 'ctrl', 'alt', 'cmd'}

-- even though the app is named iTerm2, iterm is the correct name
-- hs.hotkey.bind({"alt"}, "H", chrome_active_tab_with_name("HipChat"))

-- bind application hotkeys
hs.fnutils.each({
    { key = "a", app = "Visual Studio Code" },
    { key = "s", app = "Google Chrome" },
    { key = "]", app = "System Preferences" },
    { key = "e", app = "Sublime Text" },
    { key = "i", app = "IINA" },
    { key = "t", app = "TickTick" },
	{ key = "z", app = "iTerm" },
  }, function(item)

    local appActivation = function()
      hs.application.launchOrFocus(item.app)

      local app = hs.appfinder.appFromName(item.app)
      if app then
        app:activate()
        app:unhide()
      end
    end

    hs.hotkey.bind(hyper, item.key, appActivation)
  end)


local menubar = hs.menubar.new()
    function menu_temp()
        cpu_temps = firstThree( hs.execute("/usr/local/bin/osx-cpu-temp") )
        menubar:setTitle(cpu_temps)
    end

hs.alert.show("Config loaded 👍")

menu_temp()
hs.timer.doEvery(30,menu_temp)

