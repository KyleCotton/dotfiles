return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local comments = require("todo-comments")

        comments.setup {
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- keywords recognized as todo comments
            keywords = {
                TODO = { color = "error" },
                NOTE = { color = "hint" },
                PERF = { color = "warning" },
                HACK = { color = "warning" },
            },
            search = {
                command = "rg",
                args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--hidden" },
                -- regex that will be used to match keywords.
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
            },
        }

        vim.keymap.set("n", "]t", comments.jump_next, { desc = "Next todo comment" })
        vim.keymap.set("n", "[t", comments.jump_prev, { desc = "Previous todo comment" })
        vim.keymap.set('n', '<leader>ft', "<CMD>TodoTelescope<CR>", { desc = '[F]ind [T]odos' })
    end,
}
