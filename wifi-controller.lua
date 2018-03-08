-- wifi module
print "-- wifi module has loaded"
wf = {}
function wf.conn(ssid, pwd)
    print "--start wifi connection"
    local wifi_text = {
        [1] = {
            ["x"] = 0,
            ["str"] = "WiFi: #"..ssid
        }
    }
    local temp = skrn.str(wifi_text)
    skrn.draw(temp)
    wifi.setmode(wifi.STATION, false)
    local cfg = {}
    cfg.ssid = ssid
    cfg.pwd = pwd
    cfg.auto = auto
    wifi.sta.config(cfg)
end
-- listen
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED,function(t)
    local wifi_ssid = wifi.sta.getconfig()
    local wifi_text = {
        [1] = {
            ["x"] = 0,
            ["str"] = "WiFi: "..wifi_ssid
        }
    }
    local temp = skrn.str(wifi_text)
    skrn.draw(temp)
end)
