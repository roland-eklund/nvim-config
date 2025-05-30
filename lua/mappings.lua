require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Map <leader>tn to go to the next tab
map("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab", noremap = true, silent = true })

-- Map <leader>tp to go to the previous tab
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab", noremap = true, silent = true })

-- Map <leader>to to open a new tab
map("n", "<leader>to", ":tabnew<CR>", { desc = "New tab", noremap = true, silent = true })

-- Map <leader>tc to close the current tab
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", noremap = true, silent = true })

-- Open md preview
map("n", "<leader>md", ":MarkdownPreview<CR>", { desc = "Open MarkdownPreview", noremap = true, silent = true })

-- Copliot keys
-- Example keymaps (place in your general keymap setup)
-- Ensure these don't conflict with other mappings (like completion plugins)

-- Accept suggestion (using Enter - careful with conflicts!)
-- vim.keymap.set('i', '<CR>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })

-- Or accept with Ctrl+Enter
vim.keymap.set('i', '<C-y>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true, desc="Copilot accept suggestion"})

-- Accept with Tab (often default, ensure it works with completion)
-- Make sure Tab is correctly configured if using nvim-cmp or similar
-- vim.keymap.set('i', '<Tab>', 'copilot#Accept("<Tab>")', { expr = true, silent = true, noremap = true })


-- Show suggestions in a split window
vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { noremap = true, silent = true, desc = "Copilot Suggestions Panel" })

-- Dismiss suggestion
vim.keymap.set('i', '<leader>cn', '<Plug>(copilot-dismiss)', { desc = "Copilot dismiss suggestion"}) -- Default is often Ctrl+]

-- Cycle through suggestions (if multiple are available)
-- Defaults are often Alt+[ and Alt+]
vim.keymap.set('i', '<leader>cl', '<Plug>(copilot-previous)', { desc = "Copilot next suggestion"})
vim.keymap.set('i', '<leader>ch', '<Plug>(copilot-next)', { desc = "Copilot previous suggestion"})

-- example custom mapping
vim.keymap.set('n', '<leader>tt', ':lua require("nvchad.term").toggle { pos = "float", id = "floatTerm", size = {width = 0.7}}<CR>', {desc = "Toggle floating terminal"})
vim.keymap.set('t', '<leader>tt', 'exit<CR>', {desc = "Toggle floating terminal"})

