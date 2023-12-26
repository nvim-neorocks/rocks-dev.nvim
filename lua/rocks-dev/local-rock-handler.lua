---@alias rock_name string
---@class RockSpec: { name: rock_name, version?: string, [string]: any }

local operations = require("rocks.operations")

local rock_handler = {}

---@param rock RockSpec
function rock_handler.get_sync_callback(rock)
    if rock.dir then
        return function()
            return operations.prune(rock.name)
        end
    end
end

---@param rock RockSpec
function rock_handler.get_prune_callback(rock)
    if rock.dir then
        return operations.prune(rock.name)
    end
end

return rock_handler
