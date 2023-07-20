-- Prevent to open terminal window in nvimtree
vim.api.nvim_buf_set_keymap(0, "n", "<a-t>h", "<nop>", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "<a-t>j", "<nop>", { noremap = true })