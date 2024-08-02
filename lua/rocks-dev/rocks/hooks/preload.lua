---@type rocks.hooks.RockSpecModifier
return {
    type = "RockSpecModifier",
    ---@param rock rocks-dev.RockSpec
    hook = function(rock)
        if rock.dev or rock.dir then
            -- this prevents rocks.nvim/rocks-config.nvim
            -- from trying to load the plugin and its configs, respectively.
            -- rocks-dev.nvim invokes rocks-config's `configure` API before loading a rock.
            rock.opt = true
        end
        return rock
    end,
}
