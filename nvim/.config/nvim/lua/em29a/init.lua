-------------------------------------------------------------------------
require("em29a.settings")
require("em29a.AllKeymaps").setup()
require("em29a.packer")

require("em29a.lspconfig")
require("em29a.nvim-cmp")
require("em29a.null-ls")
require("em29a.LspSaga")
require("em29a.lsp-zero")
require("em29a.mason")

require("em29a.comment")
require("em29a.trouble")
require("em29a.autopairs")
require("em29a.aerial")

require("em29a.vscode") -- colorscheme
require("em29a.alpha") -- start screen (run nvim whithout argument)
require("em29a.bufferline") -- above buffer
require("em29a.lualine") -- below buffer
--require("em29a.rust-tools") -- 
--require("em29a.inlay-hints") -- 


vim.cmd(":so $HOME/.config/nvim/lua/em29a/settings.vim")
