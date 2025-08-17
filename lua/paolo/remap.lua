vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- BETTER HIGHLIGHT SEARCH
vim.keymap.set("x", "/", function()
    vim.api.nvim_feedkeys("y", "x", true)
    vim.api.nvim_feedkeys("/", "n", true)
    vim.api.nvim_feedkeys("\\V", "n", true)

    local escaped_search = vim.fn.escape(vim.fn.getreg('"'), '/\\.*$^~[]')
    vim.fn.setreg('"', escaped_search)

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-r>"', true, true, true), "n", true)
end, { noremap = true, silent = true, desc = "Auto insert search text" })

-- This is a hack to make the cursor stay in the middle of the screen in vscode-nvim
delay = 10 -- Delay in ms between cursor movement and screen update

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

-- vim.keymap.set("n", "<C-h>", "<C-u>zz")
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

-- This is a hack to make the cursor stay in the middle of the screen while searching
-- idk if i like it
-- vim.keymap.set('c', '<CR>', function()
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', true)
--     if vim.fn.getcmdtype() == "/" then
--         vim.defer_fn(function()
--             vim.cmd.normal("zz")
--         end, 20)
--     end
-- end)


vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("i", "<C-d>", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]])



-- ?PLUGIN SECTION
local is_vscode = vim.g.vscode ~= nil and vim.g.vscode

--* vscode-multi-cursor

vim.keymap.set({ "n", "x", "i" }, "<C-S-d>", function()
    if(is_vscode) then
        require("vscode-multi-cursor").addSelectionToNextFindMatch()
    end
end)