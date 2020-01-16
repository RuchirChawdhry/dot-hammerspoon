local menuItem = hs.menubar.new(true)
local time = ""
local battery = {
    rem = hs.battery.percentage(),
    source = hs.battery.powerSource(),
    --icon = imagePath ..'battery-charging.pdf',
    title =  "Battery Status",
    --sound = "Sosumi",
    min = 50,
    showPercentage = true
}

-- notify when battery is less than battery.min
function notifyWhenBatteryLow()
    local currentPercentage = hs.battery.percentage()
    if currentPercentage <= battery.min and battery.rem ~= currentPercentage and (currentPercentage % 5 == 0 ) then
        battery.rem = currentPercentage
        hs.notify.new({
          title        = battery.title,
          informativeText     = 'Battery left: '..battery.rem.."%\nPower Source: "..battery.source,
          contentImage = battery.icon,
           soundName    = battery.sound
        }):send()
    end
end

-- start watching
hs.battery.watcher.new(watchBattery):start()

hs.timer.doEvery(60,getBatteryState)
