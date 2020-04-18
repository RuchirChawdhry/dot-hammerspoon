helpers = require "lua_funcs"

usbDeviceCallback = function(data)
  local usb = {
    helpers.titleCase(data.eventType), 
    data.productName, 
    data.vendorName
  }
  local message = table.concat(usb, " ")

  -- print("usbDeviceCallback: " .. hs.inspect(data))

  hs.alert.show("🖴 " .. message)

  hs.notify.new({
    title = "USB Event", 
    informativeText = message
  }):send()
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()

-- Modified version of: 
-- https://github.com/NavePnow/Hammerspoon/blob/master/usb/usb.lua
