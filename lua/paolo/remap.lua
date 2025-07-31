vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-h>", "<C-u>zz")
-- This is a hack to make the cursor stay in the middle of the screen in vscode-nvim
delay = 20 -- Delay in ms between cursor movement and screen update
vim.keymap.set("n", "<C-d>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
        print("zz")
    end, delay)
end)
vim.keymap.set("n", "<C-u>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-u>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
        print("zz")
    end, delay)
end)
-- greatest hack ever btw

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("i", "<C-d>", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]])
