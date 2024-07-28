--[[
Example rocks.toml:
```toml
[plugins]
"neorg" = { version = "6.0.0", dir = "" }
```
--]]

if vim.g.rocks_dev_nvim_did_setup then
    return
end

local ok, api = pcall(require, "rocks.api")

if not ok then
    vim.notify("[rocks-dev.nvim]: rocks.nvim not found, aborting!", vim.log.levels.ERROR, {})
    return
end

local user_configuration = api.get_rocks_toml()
---@cast user_configuration rocks-dev.RocksToml

require("rocks-dev").setup(user_configuration)

vim.g.rocks_dev_nvim_did_setup = true
