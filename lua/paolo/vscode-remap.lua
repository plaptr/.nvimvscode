local vscode = require("vscode")
local map = vim.keymap.set
vim.g.mapleader = " "

-- This is a hack to make the cursor stay in the middle of the screen in vscode-nvim
delay = 10 -- Delay in ms between cursor movement and screen update

map("n", "<C-d>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

map("n", "<C-u>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-u>', true, true, true), 'n', true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

-- map("n", "n", "nzz")
map("n", "n", function()
    vim.api.nvim_feedkeys("n", "n", true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)

-- map("n", "N", "Nzz")
map("n", "N", function()
    vim.api.nvim_feedkeys("N", "n", true)
    vim.defer_fn(function()
        vim.cmd.normal("zz")
    end, delay)
end)
-- greatest hack ever btw


map("n", "J", "mzJ`z")
map("x", "<leader>p", [["_dP]])

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

map({ "n", "x", "i" }, '<C-S-d>', 'mciw*<Cmd>nohl<CR>', { remap = true })


map({"n", "x"}, "r", "<NOP>")
map({"n", "x"}, "gr", function()
    vscode.action("editor.action.referenceSearch.trigger")
end)

vim.api.nvim_create_autocmd({ "VimEnter", "ModeChanged" }, {
    callback = function(args)
        vscode.call("setContext", {
            args = { "neovim.fullMode", vim.fn.mode(1) },
        })
    end,
})


function create_motion_pending_automation(mode, trigger)
    map(mode, trigger, function()
        vscode.call("setContext", {
            args = { "neovim.motionPending", true },
        })
        vim.api.nvim_feedkeys(trigger, mode, true)
    end)
end

create_motion_pending_automation("n", "f")
create_motion_pending_automation("n", "F")
create_motion_pending_automation("n", "t")
create_motion_pending_automation("n", "T")

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
    callback = function()
        vscode.call("setContext", {
            args = { "neovim.motionPending", false },
        })
    end,
})


map("n", "gr", function()
    vscode.action("editor.action.referenceSearch.trigger")
end)