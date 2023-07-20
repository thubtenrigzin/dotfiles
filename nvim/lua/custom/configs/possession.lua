local present, possession = pcall(require, "possession")

if not present then
  return
end

require('telescope').load_extension('possession')

possession.setup {
  commands = {
    save = 'PossessionSave',
    close = 'PossessionClose',
    delete = 'PossessionDelete',
  },
}
