local present, venv = pcall(require, "venv-selector")

if not present then
  return
end

venv.setup {
  auto_refresh == true,
  dap_enabled == true,
}
