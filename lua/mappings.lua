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
