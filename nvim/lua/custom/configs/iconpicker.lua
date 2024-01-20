local present, iconpicker = pcall(require, "icon-picker")

if not present then
  return
end

iconpicker.setup {
  disable_legacy_commands = true,
}
