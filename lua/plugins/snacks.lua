
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
    },
    keys = {
        {"<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
        {"<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
        {"<leader>es", function() require("snacks").explorer() end, desc = "Open Snacks Explorer" },
        {"<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
        {"<leader>q", function() require("snacks").bufdelete() end, desc = "Delete or Close Buffer (Confirm)" },

        -- Snacks Picker
        {"<leader>pf", function() require("snacks").picker.files() end, desc = "Find file (Snacks Picker)" },
        {"<leader>pc", function() require("snacks").picker.files({cwd = vim.fn.stdpath("config")}) end, desc = "Find Config File" },
        {"<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep word" },
        {"<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search Visual selection or Word", mode = {"n", "x"}},
        {"<leader>pk", function() require("snacks").picker.keymaps() end, desc = "Search Keymaps (Snack Picker)"},

        {"<leader>gbr", function() require("snacks").picker.git_branches({layout = "select"}) end, desc = "Pick and Switch Git Branches"},
        {"<leader>th", function() require("snacks").picker.colorschemes({layout = "ivy"}) end, desc = "Pick Color Schemes"},
        {"<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages"},

    }
}
