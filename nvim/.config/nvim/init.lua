require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Enable autoread
vim.o.autoread = true

-- Trigger checktime to refresh buffers when Neovim gains focus or enters a buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "silent! checktime",
})
