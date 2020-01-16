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

hs.timer.doAt("0:00","1m", function() 
  local d = hs.execute("/Users/ruchir/bin/osx-cpu-temp -f"):gsub("[\r\n]","")
  menu_bar:setTitle(d)
end)
    local menu_bar = hs.menubar.new()
    menu_bar:setTitle(d)

hs.alert.show("Config loaded 👍")

