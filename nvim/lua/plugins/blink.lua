return {
  "saghen/blink.cmp",
  event = "VimEnter",
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
  },
  --- @module 'blink-cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      ['<Tab>'] = {},

      preset = "default"
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = {
        draw = function(opts)
          if opts.item and opts.item.documentation and opts.item.documentation.value then
            local out = require("pretty_hover.parser").parse(opts.item.documentation.value)
            opts.item.documentation.value = out:string()
          end

          opts.default_implementation(opts)
        end
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 }
      }
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  }
}
