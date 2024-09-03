local api = require("rocks.api")
local rockspec = require("rocks-dev.rockspec")
local nio = require("nio")

local rock_handler = {}

---@class rocks-dev.DevRockSpec: RockSpec
---@field name string Name of the plugin.
---@field dir string

local ROCKS_DEV_VERSION = "rocksdev"

---@param rock RockSpec
---@return async fun(on_progress: fun(message: string), on_error: fun(message: string), on_success?: fun(opts: rock_handler.on_success.Opts)) | nil
function rock_handler.get_sync_callback(rock)
    local user_configuration = api.get_rocks_toml()
    if rock.dir or (rock.dev and user_configuration.dev.path) then
        ---@cast rock rocks-dev.DevRockSpec
        ---@param on_progress fun(message: string)
        ---@param _ fun(message: string) on_error
        ---@param on_success? fun(opts: rock_handler.on_success.Opts)
        return nio.create(function(on_progress, _, on_success)
            local future = nio.control.future()
            api.query_installed_rocks(function(rocks)
                local installed_rock = rocks[rock.name]
                if installed_rock and installed_rock.version ~= ROCKS_DEV_VERSION then
                    future.set(true)
                else
                    future.set(false)
                end
            end)

            local hotswapped = future.wait()

            if type(on_success) == "function" then
                on_success({
                    action = "install",
                    rock = {
                        name = rock.name,
                        version = ROCKS_DEV_VERSION,
                    },
                    dependencies = rockspec.get_dependencies(rock),
                })
            end

            if hotswapped then
                on_progress(("rocks-dev: Hotswapped %s"):format(rock.name))
            end
        end, 3)
    end
end

function rock_handler.get_prune_callback() end

return rock_handler
