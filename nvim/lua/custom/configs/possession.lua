local present, possession = pcall(require, "possession")

if not present then
  return
end

possession.setup {
  commands = {
    save = 'PossessionSave',
    close = 'PossessionClose',
    delete = 'PossessionDelete',
  },
}
