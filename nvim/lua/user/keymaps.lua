local builtin_telescope = require("telescope.builtin")
local buffers_utils = require("utils.buffers")

-- Remove previous <Space> map
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

-- vim.keymap.set("n", "<Leader>e", ":Explore<CR>")

--- Telescope Mappings
vim.keymap.set("n", "<Leader>ff", builtin_telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>fg", builtin_telescope.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<Leader>fp", builtin_telescope.diagnostics, { desc = "Telescope find errors" })
vim.keymap.set("n", "<Leader>lg", builtin_telescope.live_grep, { desc = "Telescope live grep" })

--- Formatter Mappings
vim.keymap.set("n", "<Leader>f", ":Format<CR>", { silent = true })
vim.keymap.set("n", "<Leader>F", ":FormatWrite<CR>", { silent = true })

--- LSP Code Actions
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })

--- Harpoon Mappings
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end)

--- Copilot Mappings
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- Modified Buffers Mappings
vim.keymap.set("n", "<leader>fm", function()
  buffers_utils.show_modified_buffers()
end)

-- Search ("/")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Oil Mappings
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file explorer" })

-- Error Mappings
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
