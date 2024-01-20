local present, hlchunk = pcall(require, "hlchunk")

if not present then
  return
end

hlchunk.setup {
  blank = { enable = false },
  indent = { enable = false },
  line_num = { enable = false },
}

