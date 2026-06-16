return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').install { 'go', 'lua' }

    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldenable = true
    vim.wo.foldlevel = 99

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'go' },
      callback = function() vim.treesitter.start() end,
    })
  end
}
