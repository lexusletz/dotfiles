vim.wo.relativenumber = true
vim.o.number = true

--- Actualizar el tamaño de la tabulación
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.opt.conceallevel = 1

vim.diagnostic.config({
  virtual_text = true,
})

-- Mostrar la línea del cursor
vim.o.cursorline = true

-- Número de líneas a mostrar antes y después del cursor
vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'
vim.opt.colorcolumn = '80'

vim.opt.spelllang = { 'en', 'es' }
-- vim.opt.spell = true
