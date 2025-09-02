local vscode = require("vscode")
vim.g.mapleader = " "

-- This is a hack to make the cursor stay in the middle of the screen in vscode-nvim
delay = 10 -- Delay in ms between cursor movement and screen update

vim.keymap.set("n", "<C-d>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

vim.keymap.set("n", "<C-u>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-u>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

-- vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "n", function()
    vim.api.nvim_feedkeys("n", "n", true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

-- vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "N", function()
    vim.api.nvim_feedkeys("N", "n", true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)
-- greatest hack ever btw


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set({ "n", "x", "i" }, "<C-S-d>", function()
    require("vscode-multi-cursor").addSelectionToNextFindMatch()
end)

vim.keymap.set({"n", "x"}, "r", "<NOP>")
vim.keymap.set({"n", "x"}, "gr", function()
    vscode.action("editor.action.referenceSearch.trigger")
end)




