local present, togglelspdiag = pcall(require, "toggle_lsp_diagnostics")

if not present then
  return
end

togglelspdiag.init {
  start_on = false,
}
