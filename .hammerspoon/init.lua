local window = require "hs.window"
local spaces = require "hs.spaces"
local l = require "hs.logger"
local log = l.new("logger", "debug")

local open_terminal = function()
    local appName = "WezTerm"
    local app = hs.application.get(appName)

    if app == nil or app:isHidden() or not(app:isFrontmost()) then
        hs.application.launchOrFocus(appName)
        local winNum = window.focusedWindow()
        -- log.d(winNum)
        local curSpaceId = spaces.activeSpaceOnScreen()
        -- log.d(curSpaceId)
        spaces.moveWindowToSpace(winNum, curSpaceId)
    else
        app:hide()
    end
end

ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.timeFrame = 2
ctrlDoublePress.action = function()
    open_terminal()
end

