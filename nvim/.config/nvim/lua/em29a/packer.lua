return require("packer").startup(

    function(use)
        use "wbthomason/packer.nvim" -- Package manager

        use("nvim-lua/plenary.nvim") -- All the lua functions I don't want to write twice.
        use("nvim-lua/popup.nvim") -- [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
        use("nvim-tree/nvim-web-devicons")
        use 'junegunn/fzf' --, { 'do': { -> fzf#install() } }
        use 'junegunn/fzf.vim'
        -- Fuzzy Finder (files, lsp, etc)
        use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

        use("onsails/lspkind-nvim")
        use("nvim-lua/lsp_extensions.nvim")
        use("glepnir/lspsaga.nvim")
        use("simrat39/symbols-outline.nvim")
        use("jose-elias-alvarez/null-ls.nvim")

        -- Primeagen doesn"t create lodash
        --use("ThePrimeagen/git-worktree.nvim")
        use("ThePrimeagen/harpoon")
        --use("ThePrimeagen/refactoring.nvim")

        use("mbbill/undotree")

        use("mfussenegger/nvim-dap")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")


        use { "stevearc/aerial.nvim", config = function() require('aerial').setup() end }

        use { "folke/trouble.nvim" } --,
        --requires = "kyazdani42/nvim-web-devicons",
        -- }
        use("folke/lsp-colors.nvim")

        use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

        use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
        use { "numToStr/Comment.nvim" } -- ⚡ Smart and Powerful commenting plugin for neovim ⚡
        use { "JoosepAlviste/nvim-ts-context-commentstring" } -- A Neovim plugin for setting the
        -- commentstring option based on the cursor location in the file. The location is checked via treesitter queries.

        use { "akinsho/bufferline.nvim" } -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
        use { "nvim-lualine/lualine.nvim" } -- A blazing fast and easy to configure Neovim statusline written in Lua.
        use { "akinsho/toggleterm.nvim" } -- A neovim plugin to persist and toggle multiple terminals during an editing session
        use { "ahmedkhalf/project.nvim" } -- project.nvim is an all in one neovim plugin written
        -- in lua that provides superior project management.

        use { "lewis6991/impatient.nvim" } -- Speed up loading Lua modules in Neovim to improve startup time.
        use { "lukas-reineke/indent-blankline.nvim" } -- This plugin adds indentation guides to all lines (including empty lines).
        use { "goolord/alpha-nvim" } -- alpha is a fast and fully programmable greeter for neovim.
        use { "RRethy/vim-illuminate" } -- Vim plugin for automatically highlighting other uses of
        -- the word under the cursor using either LSP, Tree-sitter, or regex matching.


        -- Colorschemes
        use { "lunarvim/darkplus.nvim" }
        use("gruvbox-community/gruvbox")
        use("folke/tokyonight.nvim")
        use({ "catppuccin/nvim", as = "catppuccin" })
        use({ 'rose-pine/neovim', as = 'rose-pine' })
        use("Mofiqul/vscode.nvim")
        use("tomasiser/vim-code-dark")

        --------------------------------------------------------

        -- LSP Configuration & Plugins
        use { 'williamboman/mason.nvim' }
        use { 'williamboman/mason-lspconfig.nvim' }
        use { 'j-hui/fidget.nvim' }
        use { 'neovim/nvim-lspconfig',
            requires = {
                -- Automatically install LSPs to stdpath for neovim
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',

                -- Useful status updates for LSP
                'j-hui/fidget.nvim',
            },
        }
        -- Autocompletion
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-path' }
        use { 'saadparwaiz1/cmp_luasnip' }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-nvim-lua' }
        use { 'hrsh7th/nvim-cmp',
            requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }
        }
        -- Snippets
        use { 'L3MON4D3/LuaSnip' }
        use { 'rafamadriz/friendly-snippets' }

        use("folke/zen-mode.nvim")
        use("github/copilot.vim")
        use('rust-lang/rust.vim')
        use('simrat39/inlay-hints.nvim')
        use('simrat39/rust-tools.nvim')

        ---------------------------------------------------------------------------------------------
        ---------------------------------------------------------------------------------------------

        use { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            run = function()
                pcall(require('nvim-treesitter.install').update { with_sync = true })
            end,
        }
        use("nvim-treesitter/playground")
        use("romgrk/nvim-treesitter-context")

        use { -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        }

        -- Git related plugins
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'lewis6991/gitsigns.nvim'
        ---------------------------------------------------------------------------------------------
        use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically


        ---------------------------------------------------------------------------------------------
        ---------------------------------------------------------------------------------------------

    end)
