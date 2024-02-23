--[[
Example rocks.toml:
```toml
[plugins]
"neorg" = { version = "6.0.0", dir = "" }
```
--]]

local ok, api = pcall(require, "rocks.api")

if not ok then
    vim.notify("[rocks-dev.nvim]: rocks.nvim not found, aborting!", vim.log.levels.ERROR, {})
    return
end

local user_configuration = api.get_rocks_toml()

require("rocks-dev").setup(user_configuration)
