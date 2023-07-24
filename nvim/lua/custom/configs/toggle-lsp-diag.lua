local present, togglelspdiag = pcall(require, "toggle_lsp_diagnostics")

if not present then
  return
end

togglelspdiag.init({
  underline = false,
  virtual_text = false,
})
