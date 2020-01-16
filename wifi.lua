function ssidChangedCallback()
    ssid = hs.wifi.currentNetwork()
    if (ssid ~= nil) then
        print("ssid = "..(ssid))
        hs.alert.show("🖧 "..ssid)
        hs.notify.new({title="Wifi event", informativeText=ssid}):send()
    end
end


wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

-- slightly modified version of:
-- https://github.com/NavePnow/Hammerspoon/blob/master/wifi/wifi.lua
