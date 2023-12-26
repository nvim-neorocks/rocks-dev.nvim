---@alias rock_name string
---@class RockSpec: { name: rock_name, version?: string, [string]: any }

local api = require("rocks.api")
local operations = require("rocks.operations")

local rock_handler = {}

---@param rock RockSpec
function rock_handler.get_sync_callback(rock)
    if rock.dir then
        return function(report_progress, report_error)
            api.query_installed_rocks(function(rocks)
                if rocks[rock.name] then
                    local ok = pcall(operations.remove(rock.name, report_progress).wait)

                    if not ok then
                        report_error(("rocks-dev: Failed to remove %s"):format(rock.name))
                        return
                    end

                    report_progress(("rocks-dev: Hotswapped %s"):format(rock.name))
                end
            end)
        end
    end
end

function rock_handler.get_prune_callback()
end

return rock_handler
