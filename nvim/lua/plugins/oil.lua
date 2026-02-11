return {
  'stevearc/oil.nvim',
  opts = {
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup()
  end,
  view_options = {
    show_hidden = true,

    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, '.')
    end,

    is_always_hidden = function(name, bufnr)
      return false
    end,

    natural_order = false,
  }
}
