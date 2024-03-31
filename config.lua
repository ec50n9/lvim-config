-- 自定义配置
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.cursorline = true   -- 高亮当前行
vim.opt.cursorcolumn = true -- 高亮当前列

lvim.plugins = {
  -- 主题
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- dart 相关
  { "dart-lang/dart-vim-plugin" },
  { "thosakwe/vim-flutter" },
}
lvim.colorscheme = "tokyonight-storm"
lvim.transparent_window = false
lvim.format_on_save.enabled = true

-- 键位映射
lvim.lsp.buffer_mappings.normal_mode['gh'] = { vim.lsp.buf.hover, "Show documentation" }
lvim.keys.normal_mode['<S-h>'] = ":bprevious<CR>"
lvim.keys.normal_mode['<S-l>'] = ":bnext<CR>"
lvim.keys.normal_mode['<S-x>'] = ":BufferKill<CR>"

-- volar 中开启 tsserver
require('lspconfig')['tsserver'].setup({
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
