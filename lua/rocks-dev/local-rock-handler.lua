---@alias rock_name string
---@class RockSpec: { name: rock_name, version?: string, [string]: any }

local rock_handler = {}

---@param rock RockSpec
function rock_handler.get_sync_callback(rock)
    if rock.dir then
        return function(...)
        end
    end
end

---@param rock RockSpec
function rock_handler.get_prune_callback(rock)
    if rock.dir then
        return function(...)
        end
    end
end

return rock_handler
