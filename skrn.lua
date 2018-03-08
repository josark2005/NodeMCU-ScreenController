-- The module for screen display
--[[
   skrn.init()
   local exp = {
    [1] = {
        ["x"] = 0,
        ["str"] = "This is an example!"
    },
   }
   local temp = skrn.str(exp)
   skrn.draw(temp)
]]
skrn = {}
skrn.cs = 8
skrn.dc = 2
skrn.res = 0
skrn.string = {}

function skrn.init()
    spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 8, 8)
    gpio.mode(skrn.cs, gpio.INPUT, gpio.PULLUP)
    skrn.disp = u8g.ssd1306_128x64_hw_spi(skrn.cs, skrn.dc, skrn.res)
    skrn.disp:setFont(u8g.font_6x10)
end

function skrn.str(args, ctrl)
    ctrl = ctrl or false
    -- print "--drawStr"
    -- update str data
    for k,v in pairs(args) do
        if (ctrl == false) then
            print ("--insert str line:"..k)
        end
        skrn.string[k] = {
            ["x"] = v.x,
            ["str"] = v.str
        }
    end
    for k,v in pairs(skrn.string) do
        skrn.disp:drawStr(v.x, k*10+6, v.str)
    end
    return args
end

function skrn.qstr(pos, str)
    skrn.string[pos] = {
        ["x"] = 0,
        ["str"] = str
    }
    local temp = skrn.str(skrn.string)
    skrn.draw(temp)
end

function skrn.draw(args)
    print "--drawing"
    skrn.disp:firstPage()
    while (skrn.disp:nextPage())
    do
        skrn.str(args, true)
    end
end

function skrn.reset()
    local launch_text = {
            [2] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [3] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [4] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [5] = {
                ["x"] = 0,
                ["str"] = ""
            }
        }
    skrn.str(launch_text)
    skrn.draw(launch_text)
end
function skrn.resetAll()
    local launch_text = {
            [1] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [2] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [3] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [4] = {
                ["x"] = 0,
                ["str"] = ""
            },
            [5] = {
                ["x"] = 0,
                ["str"] = ""
            }
        }
    skrn.str(launch_text)
    skrn.draw(launch_text)
end
function skrn.resetPos(ekey)
    local launch_text = {
            [ekey] = {
                ["x"] = 0,
                ["str"] = ""
            },
        }
    skrn.str(launch_text)
    skrn.draw(launch_text)
end