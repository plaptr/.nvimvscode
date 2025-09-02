return {
    { 'nvim-mini/mini.files', version = '*', config = function()
        require('mini.files').setup({
            -- Customization of shown content
            content = {
                -- Predicate for which file system entries to show
                filter = nil,
                -- What prefix to show to the left of file system entry
                prefix = nil,
                -- In which order to show file system entries
                sort = nil,
            },

            -- Module mappings created only inside explorer.
            -- Use `''` (empty string) to not create one.
            mappings = {
                close       = 'q',
                go_in       = 'l',
                go_in_plus  = '<CR>',
                go_out      = 'h',
                go_out_plus = 'H',
                mark_goto   = "'",
                mark_set    = 'm',
                reset       = '<BS>',
                reveal_cwd  = '@',
                show_help   = 'g?',
                synchronize = '=',
                trim_left   = '<',
                trim_right  = '>',
            },

            -- General options
            options = {
                -- Whether to delete permanently or move into module-specific trash
                permanent_delete = false,
                -- Whether to use for editing directories
                use_as_default_explorer = true,
            },

            -- Customization of explorer windows
            windows = {
                -- Maximum number of windows to show side by side
                max_number = math.huge,
                -- Whether to show preview of file/directory under cursor
                preview = false,
                -- Width of focused window
                width_focus = 50,
                -- Width of non-focused window
                width_nofocus = 15,
                -- Width of preview window
                width_preview = 25,
            },
        })
        vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>")
    end
},
{ 'nvim-mini/mini.pairs', version = '*', config = true },
{ 
    "echasnovski/mini.comment", 
    version = false, 
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("ts_context_commentstring").setup {
            enable_autocmd = false,
        }
        require("mini.comment").setup {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring({
                        key = 'commentstring'
                    }) or vim.bo.commentstring
                end
            }
        }
    end
},
}


