---@alias rock_name string
---@class RockSpec: { name: rock_name, version?: string, [string]: any }

local api = require("rocks.api")
local operations = require("rocks.operations")

local rock_handler = {}

---@param rock RockSpec
function rock_handler.get_sync_callback(rock)
    if rock.dir then
        return function()
            api.query_installed_rocks(function(rocks)
                if rocks[rock.name] then
                    operations.prune(rock.name)
                end
            end)
        end
    end
end

function rock_handler.get_prune_callback()
end

return rock_handler
