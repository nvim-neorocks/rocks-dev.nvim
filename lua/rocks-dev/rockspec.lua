---@mod rocks-dev.rockspec
---
---@brief [[
---
---Get dependencies from a rockspec in the repository root
---
---@brief ]]

-- Copyright (C) 2024 Neorocks Org.
--
-- License:    GPLv3
-- Created:    03 Sep 2024
-- Updated:    03 Sep 2024
-- Homepage:   https://github.com/nvim-neorocks/rocks-git.nvim
-- Maintainer: mrcjkb <marc@jakobi.dev>

local log = require("rocks.log")

-- NOTE: This module shares code with rocks-git.nvim
-- It's too soon to abstract it out, but it could potentially become part
-- of the rocks.nvim API.
local rockspec = {}

---@param rock_spec rocks-dev.DevRockSpec
---@return string[]
function rockspec.get_dependencies(rock_spec)
    local rockspec_paths = vim.fs.find(function(name, path)
        return rock_spec.dir == path
            and vim
                .iter({ "scm", "dev", "git" })
                ---@param specrev string
                :map(function(specrev)
                    return rock_spec.name .. "%-" .. specrev .. "%-%d.rockspec"
                end)
                ---@param pattern string
                :any(function(pattern)
                    return name:match(pattern) ~= nil
                end)
    end, {
        path = rock_spec.dir,
        upward = false,
    })
    if vim.tbl_isempty(rockspec_paths) then
        return {}
    end
    local rockspec_path = rockspec_paths[1]
    local rockspec_tbl = {}
    xpcall(function()
        loadfile(rockspec_path, "t", rockspec_tbl)()
    end, function(err)
        log.error("rocks-git: Could not load rockspec: " .. err)
    end)
    return rockspec_tbl.dependencies or {}
end

return rockspec
