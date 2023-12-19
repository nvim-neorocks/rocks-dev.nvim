local ok, rocks = pcall(require, "rocks.api")

assert(ok, rocks)

local rocks_dev = {}

function rocks_dev.setup(user_configuration)
    if not user_configuration or type(user_configuration) ~= "table" then
        return
    end

    for _, data in pairs(user_configuration.plugins or {}) do
        if not data.dir then
            goto continue
        end

        vim.opt.runtimepath:append(vim.fn.expand(data.dir))

        ::continue::
    end
end

rocks.register_rock_handler(require("rocks-dev.local-rock-handler"))

return rocks_dev
