return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        return 'make install_jsregexp'
      end)(),
      dependencies = {

      },
      opts = {},
    },
    'folke/lazydev.nvim',
    { 'echasnovski/mini.icons', opts = {} }
  },
  opts = {
    keymap = {
      ['<Tab>'] = {},

      preset = "default"
    },
    appearance = {
      nerd_font_variant = 'mono',
      use_nvim_cmp_as_default = true,
    },
    completion = {
      keyword = { range = "full" },
      ghost_text = { enabled = true },

      menu = {
        border = "rounded",
        cmdline_position = function()
          if vim.fn.getcmdtype() == '/' or vim.fn.getcmdtype() == '?' then
            return { vim.fn.winline() - 2, 0 }
          end

          return { vim.fn.winline() + 1, 0 }
        end,
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        draw = {
          padding = 1,
          gap = 2,
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind",              gap = 1 },
          }
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets' },
      providers = {
        lsp = { async = true },
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100, fallbacks = { "lsp" } }
      }
    },
    snippets = { preset = 'luasnip' },
    signature = { enabled = true, window = { border = "rounded" } },
  }
}
