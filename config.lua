-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- 自定义配置
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.cursorline = true   -- 高亮当前行
vim.opt.cursorcolumn = true -- 高亮当前列

lvim.plugins = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
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
