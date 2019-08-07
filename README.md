# NodeMCU Screen Controller

NodeMCU 屏幕控制模块

Author: Jokin

Email: 327928971@qq.com

---

![NodeMCU](https://raw.githubusercontent.com/jokin1999/NodeMCU-ScreenController/master/sc.jpg)

---

## 前言

此模块提供了NodeMCU 0.96吋（128*64）oled屏幕SPI方式的简单控制API，暂不支持中文。

`skrn`命名由`screen`音译而来。

此模块提供了`5`行文本的操作。

请自行使用`require()`引入模块文件，教程中所有案例均以此为前提。

如果需要测试，请修改`init.lua`文件中的`ssid`和`pwd`以便显示wifi控制与屏幕结合的案例效果，注意需要将 **所有文件** 提交到NodeMCU中才可以正常进行测试！

无需测试的情况下，请仅提交`skrn.lua`文件并在合适的地方引入即可按下方APIs进行操作！

## 文件

- `skrn.lua` 模块核心
- `skrn-launcher.lua` 测试依赖
- `init.lua` 测试驱动 （全文件依赖）
- `wifi-controller.lua` 测试依赖 （wifi控制与屏幕显示结合）
- `nodemcu-xxx.bin` 配置完成的固件

## 警告

此模块无 **任何** 屏幕保护措施，请在不需要的时候自行关闭屏幕以避免损坏硬件！

## APIs

- 初始化`skrn.init()`
- 快速显示字符串`skrn.qstr(line, str)`
- 建立设置
  ```
  -- 将line替换为行数
  -- x的值决定了文字左边的留空距离
  -- str的值就是文字的内容
  launch_text = {
      [line] = {
          ["x"] = 0,
          ["str"] = "line 1"
      },
  }
  ```
- 提交设置
  ```
  cfg = skrn.str(launch_text)
  ```
- 递交屏幕（显示）
  ```
  -- cfg可以是建立的设置，也可以是skrn.str的返回值
  skrn.draw(cfg)
  ```
- 批量设置显示字符
  ```
  launch_text = {
      [1] = {
          ["x"] = 0,
          ["str"] = "line 1"
      },
      [2] = {
          ["x"] = 0,
          ["str"] = "line 2"
      },
      [3] = {
          ["x"] = 0,
          ["str"] = "line 3"
      },
      [4] = {
          ["x"] = 0,
          ["str"] = "line 4"
      },
      [5] = {
          ["x"] = 0,
          ["str"] = "line 5"
      }
  }
  skrn.str(launch_text)
  skrn.draw(launch_text)
  ```
- 清除第一行外的所有内容`skrn.reset()`
- 清除所有内容`skrn.resetAll()`
- 清除指定行`skrn.resetPos(line)`

## 线路连接

|Screen|NodeMCU|
|:-:|:-:|
|GND|GND|
|VCC|3V3|
|SCK|HSCLK(D5)|
|SDA|HMOSI(D7)|
|RES|D0|
|DC|D2|
|CS|HCS(D8)|
