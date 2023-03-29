set nocompatible
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'markonm/traces.vim'

Plug 'vimwiki/vimwiki'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'jcorbin/darkula'
Plug 'morhetz/gruvbox'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'puremourning/vimspector'

Plug 'ziglang/zig.vim'
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
set encoding=utf-8

set viminfo='100,<50,s10,h,n~/.vim/.viminfo

let mapleader=","
set showcmd

set tabstop=4
set expandtab
set shiftwidth=4

set cursorline
packadd! cfilter

set undofile
set undodir=~/.vim/undo

" second causes caps query to only match caps
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap \\ :noh<return>

" lets mouse interact with vim from terminal
set mouse=a

set number

filetype plugin on
set termguicolors
set background=dark
colorscheme gruvbox
" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ '^xterm'
" normal mode
let &t_EI .= "\<Esc>[0 q"
" insert mode
let &t_SI .= "\<Esc>[6 q"
endif

" Provides text object editing backwards
nnoremap cI" 2F"ci"
nnoremap cA" 2F"ca"
nnoremap cI' 2F'ci'
nnoremap cA' 2F'ca'
nnoremap cI` 2F`ci`
nnoremap cA` 2F`ca`

nnoremap cI{ :let old=@/<CR>?}<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci{
nnoremap cI} :let old=@/<CR>?}<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci{
nnoremap cA{ :let old=@/<CR>?}<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca{
nnoremap cA} :let old=@/<CR>?}<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca{

nnoremap cI( :let old=@/<CR>?)<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci(
nnoremap cI) :let old=@/<CR>?)<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci(
nnoremap cA( :let old=@/<CR>?)<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca(
nnoremap cA) :let old=@/<CR>?)<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca(

nnoremap cI[ :let old=@/<CR>?]<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci[
nnoremap cI] :let old=@/<CR>?]<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci[
nnoremap cA[ :let old=@/<CR>?]<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca[
nnoremap cA] :let old=@/<CR>?]<CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca[

nnoremap cI< :let old=@/<CR>?><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci<
nnoremap cI> :let old=@/<CR>?><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci<
nnoremap cA< :let old=@/<CR>?><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca<
nnoremap cA> :let old=@/<CR>?><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca<

nnoremap <leader><tab> :NERDTreeToggle<CR>
" To get the below to work in future, reference: https://stackoverflow.com/a/2179779
" For now, we can't  use the above because vim sees C-S-x as C-x. So, instead
" we just have Windows Terminal send a similar unicode sequence and hope no
" conflicts occur! 灛 = \u705b /shrug
nnoremap 灛 :Rg<CR>
nnoremap <C-f> :FZF<CR>

" Ctrl-S to save, only doing because there's no other binding currently
inoremap <C-s> <Esc>:w<CR>a

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" VimSpector
let g:vimspector_enable_mappings = 'HUMAN'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <Leader><F11> <Plug>VimspectorUpFrame
nmap <Leader><F12> <Plug>VimspectorDownFrame
nmap <Leader>B     <Plug>VimspectorBreakpoints
nmap <Leader>D     <Plug>VimspectorDisassemble
" Stop debugging with F5
nnoremap <Leader><F5>  <Plug>VimspectorReset

" Suggested coc settings follow 
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackSpace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col-1] =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-j> and <C-f> to scroll float windows/popups
" Also remap digraph to <C-l> in insert
inoremap <C-l> <C-k>
nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
