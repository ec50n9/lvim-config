-- 自定义配置
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.cursorline = true   -- 高亮当前行
vim.opt.cursorcolumn = true -- 高亮当前列
vim.opt.background = 'dark' -- 背景色，可选 light/dark，部分主题同时支持深浅色

lvim.plugins = {
  -- 主题 https://vimcolorschemes.com/light/top/
  { "folke/tokyonight.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },

  -- dart 相关
  { "dart-lang/dart-vim-plugin" },
  { "thosakwe/vim-flutter" },

  -- 快捷跳转
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "<leader>s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>S", ":HopWord<cr>", { silent = true })
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

-- 主题相关
lvim.colorscheme = "oxocarbon"
lvim.transparent_window = false

-- 自动保存
lvim.format_on_save.enabled = true

-- 键位映射
lvim.lsp.buffer_mappings.normal_mode['gh'] = { vim.lsp.buf.hover, "Show documentation" }
lvim.keys.normal_mode['<S-h>'] = ":bprevious<CR>"
lvim.keys.normal_mode['<S-l>'] = ":bnext<CR>"
lvim.keys.normal_mode['<S-x>'] = ":BufferKill<CR>"

-- volar 中开启 tsserver
local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/ec50n9/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    }
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
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
