function usbDeviceCallback(data)
  -- Switch to Dvorak when Kinesis is plugged in
    if (data["productName"] == "Kinesis Keyboard Hub") then
        if (data["eventType"] == "added") then
          hs.keycodes.setLayout("Dvorak")
        elseif (data["eventType"] == "removed") then
          hs.keycodes.setLayout("British")
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
