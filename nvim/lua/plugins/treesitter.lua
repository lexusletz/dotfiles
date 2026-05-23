return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter",
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
  end
}
