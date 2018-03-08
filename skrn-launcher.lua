-- Screen-launcher
-- 5 lines in all
require("skrn")
skrn.init()
local launch_text = {
    [1] = {
        ["x"] = 0,
        ["str"] = "WiFi: waiting"
    },
    [2] = {
        ["x"] = 0,
        ["str"] = "Welcome to use!"
    },
    [3] = {
        ["x"] = 0,
        ["str"] = "Powered by Jokin"
    }
}
local temp = skrn.str(launch_text)
skrn.draw(temp)