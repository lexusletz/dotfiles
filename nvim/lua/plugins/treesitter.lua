return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.config",
  opts = {
    ensure_installed = { "go", "lua", "vim", "bash", "dart" },
    highlight = { enable = true },
    indent = { enable = true },
  },
  init = function()
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldenable = true
    vim.wo.foldlevel = 99

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'go'},
      callback = function() vim.treesitter.start() end,
    })
  end
}
