require "lua_funcs"

function usbDeviceCallback(data)
  print("usbDeviceCallback: "..hs.inspect(data))
  title=string.format("%s %s",hs.inspect(data.eventType),hs.inspect(data.productName))
  end_title = string.gsub(title, "\"", "")
  title_case = titleCase(end_title)
  -- hs.notify.new({title="USB event", informativeText=hs.inspect(data.eventType,data.productName)}):send()
    hs.alert.show("🖴 "..title_case)
    hs.notify.new({title="USB event", informativeText=end_title}):send()
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()

-- slightly modified version of: 
-- https://github.com/NavePnow/Hammerspoon/blob/master/usb/usb.lua
