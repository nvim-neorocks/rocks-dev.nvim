local api = require("rocks.api")
local nio = require("nio")

--- HACK: This is not part of the public rocks.nvim API!
--- Instead of accessing this directly, we should expose it via rocks.api
local operations = require("rocks.operations.helpers")

local rock_handler = {}

---@class DevRockSpec: RockSpec
---@field name string Name of the plugin.
---@field dir string

---@param rock RockSpec
---@return async fun(report_progress: fun(message: string), report_error: fun(message: string)) | nil
function rock_handler.get_sync_callback(rock)
    if rock.dir then
        ---@cast rock DevRockSpec
        ---@param report_progress fun(message: string)
        ---@param report_error fun(message: string)
        return nio.create(function(report_progress, report_error)
            api.query_installed_rocks(function(rocks)
                if rocks[rock.name] then
                    local ok = pcall(operations.remove(rock.name).wait)

                    if not ok then
                        report_error(("rocks-dev: Failed to remove %s"):format(rock.name))
                        return
                    end

                    report_progress(("rocks-dev: Hotswapped %s"):format(rock.name))
                end
            end)
        end, 2)
    end
end

function rock_handler.get_prune_callback() end

return rock_handler
