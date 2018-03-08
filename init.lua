--[[
    请在使用前仔细阅读Readme文件！
    Please read the Readme file carefully before starting!
]]
-- configuration space
ssid = "Transformer"
pwd = "Carman2017"

-- workspace
print("--Launching")
require("skrn-launcher")
require("wifi-controller")
-- wifi connect
wf.conn(ssid, pwd)
skrn.reset()