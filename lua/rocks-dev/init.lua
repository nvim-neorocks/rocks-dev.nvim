local rocks = require("rocks.api")

local rocks_dev = {}

-- TODO: Do we want to support [rocks] entries too?

---@class rocks-dev.RocksToml: RocksToml
---@field plugins? table<rock_name, rocks-dev.RockSpec[]> The `[plugins]` entries
---@field dev rocks-dev.Config

---@class rocks-dev.Config
---@field path string Path to install rocks with `dev` = true

---@class rocks-dev.RockSpec: RockSpec
---@field dir? string The install directory
---@field dev? boolean

---@param user_configuration rocks-dev.RocksToml
function rocks_dev.setup(user_configuration)
    if not user_configuration or type(user_configuration) ~= "table" then
        return
    end

    local has_rocks_config, rocks_config = pcall(require, "rocks-config")
    local config_hook = has_rocks_config and type(rocks_config.configure) == "function" and rocks_config.configure
        or function(_) end

    local dev_path = user_configuration.dev and user_configuration.dev.path

    for _, rock_spec in pairs(user_configuration.plugins or {}) do
        ---@cast rock_spec rocks-dev.RockSpec
        local path
        if rock_spec.dir then
            path = vim.fn.expand(rock_spec.dir)
        elseif dev_path and rock_spec.dev then
            path = vim.fn.expand(vim.fs.joinpath(dev_path, rock_spec.name))
        end
        if path then
            vim.opt.runtimepath:append(path)
            config_hook(rock_spec.name)

            -- NOTE: We can't support `opt` for dev plugins,
            -- as it doesn't integrate with `:packadd`
            require("rtp_nvim").source_rtp_dir(path)
        end
    end
end

rocks.register_rock_handler(require("rocks-dev.local-rock-handler"))

return rocks_dev
