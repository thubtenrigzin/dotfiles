local present, copilot = pcall(require, "copilot")

if not present then
  return
end

copilot.setup {
  --[[panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "<A-c>h",
      jump_next = "<A-c>l",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<A-c>j",
      accept_word = false,
      accept_line = false,
      next = "<A-c>m",
      prev = "<A-c>g",
      dismiss = "<C-k>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},]]
}
--vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#83a598" })
--vim.api.nvim_set_hl(0, "CopilotAnnotation", { fg = "#03a598" })

