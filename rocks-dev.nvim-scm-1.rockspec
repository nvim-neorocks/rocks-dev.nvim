local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-dev.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "rocks.nvim >= 2.15.0",
    "rtp.nvim",
}

test_dependencies = {
    "rocks.nvim >= 2.15.0",
    "rtp.nvim",
    "nlua",
}

source = {
    url = "git://github.com/nvim-neorocks/" .. package,
}

build = {
    type = "builtin",
    copy_directories = {
        "plugin",
    },
}
