return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                char_actions = function() return { [";"] = "next", [","] = "prev" } end,
                search = { wrap = true },
                highlight = {
                    backdrop = false,
                    groups = {
                        match = "FlashCharMatch",
                        label = "FlashCharLabel"
                    }
                }
            }
        }

    },
    keys = {
        -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        -- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        -- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
}
