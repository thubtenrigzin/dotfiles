local status, codeium = pcall(require, "codeium")

if not status then
  return
end

codeium.setup {
  enable_chat = True,
}
