local tempdir = vim.fn.tempname()
vim.env.HOME = tempdir
vim.system({ "rm", "-r", tempdir }):wait()
vim.system({ "mkdir", "-p", tempdir .. "/Projects/foo.nvim/plugin" }):wait()
vim.g.rocks_nvim = {
    rocks_path = tempdir,
    config_path = vim.fs.joinpath(tempdir, "rocks.toml"),
}

describe("rocks-dev", function()
    ---Assert that a plugin "foo.nvim" is loaded by the given configuration
    local function assert_loaded(config_content)
        local fh = assert(io.open(vim.g.rocks_nvim.config_path, "w"), "Could not open rocks.toml for writing")
        fh:write(config_content)
        fh:close()
        local plugin_content = "vim.g.foo_nvim_loaded = true"
        fh = assert(
            io.open(vim.fs.joinpath(tempdir, "Projects", "foo.nvim", "plugin", "foo.lua"), "w"),
            "Could not open config file for writing"
        )
        fh:write(plugin_content)
        fh:close()
        local rocks_dev = require("rocks-dev")
        local user_configuration = require("rocks.api").get_rocks_toml()
        rocks_dev.setup(user_configuration)
        assert.True(vim.g.foo_nvim_loaded)

        -- reset the variable so that subsequent tests are not affected
        vim.g.foo_nvim_loaded = nil
    end

    it("can load local plugins with path alias", function()
        local config_content = [[
[plugins]
"foo.nvim" = { dir = "~/Projects/foo.nvim" }
]]
        assert_loaded(config_content)
    end)

    it("can load local plugins when `dev.path` is set", function()
        local config_content = [[
[dev]
path = "~/Projects"

[plugins]
"foo.nvim" = { dev = true }
]]

        assert_loaded(config_content)
    end)
end)
