require "nvchad.mappings"
local terminal_win = nil
local terminal_buf = nil

function _G.toggle_floating_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    terminal_buf = nil
    return
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  terminal_buf = vim.api.nvim_create_buf(false, true)
  terminal_win = vim.api.nvim_open_win(terminal_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen(os.getenv("SHELL") .. " -i")
  vim.cmd("startinsert")
end

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
map('i', '<C-y>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true, desc="Copilot accept suggestion"})

-- Accept with Tab (often default, ensure it works with completion)
-- Make sure Tab is correctly configured if using nvim-cmp or similar
-- vim.keymap.set('i', '<Tab>', 'copilot#Accept("<Tab>")', { expr = true, silent = true, noremap = true })


-- Show suggestions in a split window
map('n', '<leader>cp', ':Copilot panel<CR>', { noremap = true, silent = true, desc = "Copilot Suggestions Panel" })

-- Dismiss suggestion
map('i', '<leader>cn', '<Plug>(copilot-dismiss)', { desc = "Copilot dismiss suggestion"}) -- Default is often Ctrl+]

-- Cycle through suggestions (if multiple are available)
-- Defaults are often Alt+[ and Alt+]
map('i', '<leader>cl', '<Plug>(copilot-previous)', { desc = "Copilot next suggestion"})
map('i', '<leader>ch', '<Plug>(copilot-next)', { desc = "Copilot previous suggestion"})


-- Exit terminal mode with Esc
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Toggle floating terminal from normal mode
map("n", "<leader>tt", toggle_floating_terminal, { desc = "Toggle floating terminal" })

-- (optional) close terminal from terminal mode using leader+tt (not necessary if you use Esc)
-- map("t", "<leader>tt", [[<C-\><C-n>:lua toggle_floating_terminal()<CR>]], { desc = "Close floating terminal" })
