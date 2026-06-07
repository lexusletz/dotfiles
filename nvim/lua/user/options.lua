vim.wo.relativenumber = true
vim.o.number = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.opt.conceallevel = 1

vim.diagnostic.config({
  virtual_text = true,
})

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'
vim.opt.colorcolumn = '80'

vim.opt.wrap = false
