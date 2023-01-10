-- This module contains all keymaps each new plugin should add its keymaps here as a function.
local AllKeymaps = {}

  function AllKeymaps.setup()
	vim.g.mapleader = " "
	vim.cmd([[
		" command! -range -nargs=1 Comment :execute "'<,'>normal! <C-v>0I" . <f-args> . "<Esc><Esc>"
		nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
		nnoremap <Space> <Nop>
		nnoremap <C-c> <Nop>
		vnoremap <C-c> <Nop>
		" nmap <C-k><C-c> gcc
		" nmap <C-k><C-u> gcic
		" vmap <C-k><C-c> gc
		" vmap <C-k><C-u> gcic
		nmap <C-k><C-l> yy<Plug>(comment_toggle_linewise_current)<cr>kp

		vnoremap <A-j> :m '>+1<CR>gv=gv
		vnoremap <A-k> :m '<-2<CR>gv=gv

		vnoremap <a-h>  "zdh"zPgvhoho
		vnoremap  <a-l> "zd"zpgvolol
		
		vnoremap > >gv
		vnoremap < <gv
        ]])

	local opts = { noremap = true, silent = true }
	vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", opts)
	vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", opts)
	vim.keymap.set({ "n", "v" }, "<leader>t", "<cmd>Lexplore<cr>", opts)
	vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', opts)
	vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', opts)
	vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
	vim.keymap.set({ "n", "v" }, "<leader>Y", 'gg"+yG', opts)
	vim.keymap.set({ "n", "v" }, "<leader>h", '<cmd>bprevious<cr>', opts)
	vim.keymap.set({ "n", "v" }, "<leader>l", '<cmd>bnext<cr>', opts)
	vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)
	vim.keymap.set("n", "<leader>T", "<cmd>TroubleToggle<cr>", opts)
	vim.keymap.set("n", "<leader>A", "<cmd>AerialToggle<cr>", opts)
	--vim.keymap.set("n", "<cmd>E<cr>", "<cmd>Lexplore<cr>", opts)
	-- vim.keymap.set("n", "<C-k><C-i>", "gcc", opts)
	-- vim.keymap.set("n", "<C-k><C-c>","gcc"  ,{ noremap = false, silent = false})
	--
	local api = require('Comment.api')
	local config = require('Comment.config'):get()


	vim.keymap.set("n", "<C-k><C-c>", api.comment.linewise.current, opts)
	vim.keymap.set("n", "<C-k><C-u>", api.uncomment.linewise.current, opts)
	vim.keymap.set('v', '<C-k><C-c>', api.call('comment.linewise', 'g@'), { expr = true })
	vim.keymap.set('v', '<C-k><C-u>', api.call('uncomment.linewise', 'g@'), { expr = true })

end

function AllKeymaps.diagnostic()
	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	--vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	--vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	--vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end

function AllKeymaps.lsp(bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<f12>", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<C-k><C-i>", vim.lsp.buf.hover, bufopts)
	--vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	--vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	--vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>.", "<cmd>CodeActionMenu<cr>", bufopts)
	--vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	--Shift+f12 --> f24
	vim.keymap.set("n", "<f24>", vim.lsp.buf.references, bufopts)
	--vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set({ "n", "i", "v" }, "<C-k><C-d>", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, bufopts)
	--vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	--vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	--vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	--vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	--vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	--vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end

function AllKeymaps.cmp(cmp)
	local mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				return
			end
			fallback()
		end, { "i", "c" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
				return
			end
			fallback()
		end, { "i", "c" }),
	}
	return mapping
end

function AllKeymaps.LspSaga()
	local keymap = vim.keymap.set
	-- Lsp finder find the symbol definition implement reference
	-- if there is no implement it will hide
	-- when you use action in finder like open vsplit then you can
	-- use <C-t> to jump back
	keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

	-- Code action
	keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

	-- Rename
	--keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
	keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })

	-- Peek Definition
	-- you can edit the definition file in this flaotwindow
	-- also support open/vsplit/etc operation check definition_action_keys
	-- support tagstack C-t jump back
	keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

	-- Show line diagnostics
	keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

	-- Show cursor diagnostics
	keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

	-- Diagnostic jump can use `<c-o>` to jump back
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

	-- Only jump to error
	keymap("n", "[E", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })

	keymap("n", "]E", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })

	-- Outline
	keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

	-- Hover Doc
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

	-- Float terminal
	keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>clear<CR>", { silent = true })
	-- if you want to pass some cli command into a terminal you can do it like this
	-- open lazygit in lspsaga float terminal
	--keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
	-- close floaterm
	keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
end

return AllKeymaps
