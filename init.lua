require "usb"
require "wifi"
require "lua_funcs"
require "menu_cpu_temp"


-- suppress warnings
hs.luaSkinLog.setLogLevel("warning")
hs.hotkey.setLogLevel("warning")
hs.window.filter.setLogLevel("error")

-- hyper
hyper = {'shift', 'ctrl', 'alt', 'cmd'}

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

hs.alert.show("Config loaded 👍")

localsnapshot = function()
    hs.execute('tmutil localsnapshot')
    end

-- timers
snapshopt_timer = hs.timer.new(hs.timer.minutes(120), localsnapshot)
snapshopt_timer:start()
