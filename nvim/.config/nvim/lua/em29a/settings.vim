"colorscheme torte
set mouse=
highlight LineNr guifg=#2B91AF
set guicursor=n-v-c:block,i-ci-ve:ver10,r-cr:hor20,o:hor50
			\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
			\,sm:block-blinkwait175-blinkoff150-blinkon175
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=10
"set nofoldenable
"let rust_fold=99         " Rust 
"Lexplore
"autocmd VimEnter * Lexplore

"autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()

