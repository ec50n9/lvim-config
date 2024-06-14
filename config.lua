-- 自定义配置
lvim.leader = "space"
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.cursorline = true   -- 高亮当前行
vim.opt.cursorcolumn = true -- 高亮当前列
vim.opt.background = 'dark' -- 背景色，可选 light/dark，部分主题同时支持深浅色

-- 主题相关
lvim.colorscheme = "tokyonight-storm"
lvim.transparent_window = false

-- 自动保存
lvim.format_on_save.enabled = false

-- 键位映射
lvim.lsp.buffer_mappings.normal_mode['gh'] = { vim.lsp.buf.hover, "Show documentation" }
lvim.keys.normal_mode['<S-h>'] = ":bprevious<CR>"
lvim.keys.normal_mode['<S-l>'] = ":bnext<CR>"
lvim.keys.normal_mode['<S-x>'] = ":BufferKill<CR>"

-- 状态栏
lvim.builtin.lualine.style = "lvim"

-- 插件
lvim.plugins = {
  -- 主题 https://vimcolorschemes.com/light/top/
  { "folke/tokyonight.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "morhetz/gruvbox" },

  -- dart 相关
  { "dart-lang/dart-vim-plugin" },
  { "thosakwe/vim-flutter" },

  -- 快捷跳转
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      local hop = require('hop')
      hop.setup {}

      local directions = require('hop.hint').HintDirection

      -- 行内后跳
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })

      -- 行内前跳
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })

      -- 后跳词首
      vim.keymap.set('', '<leader><leader>w', function()
        hop.hint_words({ direction = directions.AFTER_CURSOR })
      end, { remap = true })

      -- 前跳词首
      vim.keymap.set('', '<leader><leader>b', function()
        hop.hint_words({ direction = directions.BEFORE_CURSOR })
      end, { remap = true })

      -- 后跳词尾
      vim.keymap.set('', '<leader><leader>e', function()
        hop.hint_words({ direction = directions.AFTER_CURSOR })
        vim.api.nvim_feedkeys('e', 'n', false)
      end, { remap = true })

      -- 前跳词尾
      vim.keymap.set('', '<leader><leader>ge', function()
        hop.hint_words({ direction = directions.BEFORE_CURSOR })
        vim.api.nvim_feedkeys('e', 'n', false)
      end, { remap = true })
    end
  },
  -- 括号包含
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  }
}


-- volar 中开启 tsserver
local lspconfig = require "lspconfig"
lspconfig.volar.setup({
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'json' },
  init_options = {
    typescript = {
      tsdk = '/home/e9/.local/share/pnpm/global/5/node_modules/typescript/lib',
    },
  }
})
lspconfig.tsserver.setup({
  filetypes = { "javascript", "typescript", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/e9/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    }
  }
})

-- 提示器和格式化
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black" },
  {
    command = "prettier",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  }
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "flake8" },
  {
    command = "eslint",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
  }
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  { command = "proselint" }
})
