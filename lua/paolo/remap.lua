local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "-", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Paste without replacing clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true }) -- clears search highlights

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "x", '"_x', opts) -- prevents deleted characters from copying to clipboard





vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
--

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })


-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)

vim.keymap.set("n", "<C-S-l>", ":rightbelow vsplit<CR>", { desc = "Split panel right" })
vim.keymap.set("n", "<C-S-h>", ":leftabove vsplit<CR>", { desc = "Split panel left" })
vim.keymap.set("n", "<C-S-j>", ":belowright split<CR>", { desc = "Split panel down" })
vim.keymap.set("n", "<C-S-k>", ":aboveleft split<CR>", { desc = "Split panel up" })


vim.keymap.set("n", "<leader><leader>l", "<C-w>L", { desc = "Swap panel right" })
vim.keymap.set("n", "<leader><leader>h", "<C-w>H", { desc = "Swap panel left" })
vim.keymap.set("n", "<leader><leader>j", "<C-w>J", { desc = "Swap panel down" })
vim.keymap.set("n", "<leader><leader>k", "<C-w>K", { desc = "Swap panel up" })
