require("paolo.set")
require("paolo.lazy")
if vim.g.vscode ~= nil and vim.g.vscode then
    require("paolo.vscode-remap")
else
    require("paolo.remap")
end