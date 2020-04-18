-- lua basics:
--    - http://tylerneylon.com/a/learn-lua/
--    - http://luatut.com/crash_course.html
--    - https://ebens.me/post/lua-for-programmers-part-1/
--    - https://ebens.me/post/lua-for-programmers-part-2/
--    - https://ebens.me/post/lua-for-programmers-part-4/
--    - https://somedudesays.com/2019/07/lua-tutorial-basics/

require "usb"
require "wifi"
require "menus"

-- suppress warnings
hs.luaSkinLog.setLogLevel("warning")
hs.hotkey.setLogLevel("warning")
hs.window.filter.setLogLevel("error")

-- hyper key
hyper = { 'shift', 'ctrl', 'alt', 'cmd' }

-- application hotkeys
hs.fnutils.each({
    { key = "a", app = "Visual Studio Code" }, 
    { key = "s", app = "Google Chrome" }, 
    { key = "]", app = "System Preferences" },
    { key = "e", app = "Sublime Text" },
    { key = "f", app = "Finder" },
    { key = "g", app = "Fork" }, -- git
    { key = "i", app = "IINA" }, -- video viewer
    { key = "m", app = "Marta" }, -- finder alt.
    { key = "t", app = "Todoist" },
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
