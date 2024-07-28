local rocks = require("rocks.api")

local rocks_dev = {}

function rocks_dev.setup(user_configuration)
    if not user_configuration or type(user_configuration) ~= "table" then
        return
    end

    local dev_path = user_configuration.dev and user_configuration.dev.path

    for _, data in pairs(user_configuration.plugins or {}) do
        local path
        if data.dir then
            path = vim.fn.expand(data.dir)
        elseif dev_path and data.dev then
            path = vim.fn.expand(vim.fs.joinpath(dev_path, data.name))
        end
        if path then
            vim.opt.runtimepath:append(path)

            -- NOTE: We can't support `opt` for dev plugins,
            -- as it doesn't integrate with `:Rocks packadd`
            require("rtp_nvim").source_rtp_dir(path)
        end
    end
end

rocks.register_rock_handler(require("rocks-dev.local-rock-handler"))

return rocks_dev
