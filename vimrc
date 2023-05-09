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

Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'markonm/traces.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'jcorbin/darkula'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Plug 'vimwiki/vimwiki'
Plug 'ziglang/zig.vim'
Plug 'madox2/vim-ai'
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
nnoremap <C-l> :noh<return><C-l>

" lets mouse interact with vim from terminal in normal and visual
" insertion excluded so we can still select text for copying
set mouse=nv

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

nnoremap ci< :let old=@/<CR>/><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci<
nnoremap ci> :let old=@/<CR>/><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ci<
nnoremap ca< :let old=@/<CR>/><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca<
nnoremap ca> :let old=@/<CR>/><CR>:noh<bar>call histdel('/', -1)<bar>let @/ = old<CR>ca<


nnoremap <Leader><Tab> :NERDTreeToggle<CR>
nnoremap <Leader>f  :NERDTreeFind<CR>
" To get the below to work in future, reference: https://stackoverflow.com/a/2179779
" For now, we can't  use the above because vim sees C-S-x as C-x. So, instead
" we just have Windows Terminal send a similar unicode sequence and hope no
" conflicts occur! 灛 = \u705b /shrug
nnoremap 灛 :Rg<CR>
nnoremap <C-f> :GFiles<CR>
inoremap 灛 <Esc>:Rg<CR>
inoremap <C-f> <Esc>:GFiles<CR>
nnoremap <C-t> :tabe<CR>
" Once again, C-; is not mappable, so we do windows terminal stuff
" 火 = \u706b
imap 火 <ESC>A;<CR>
" 灻 = \u707b
imap 灻 <ESC>A;<CR>

" Ctrl-S to save, only doing because there's no other binding currently
inoremap <C-s> <Esc>:w<CR>a

function! SaveSessionIfGit()
    if isdirectory(getcwd() . '/.git')
        execute 'mksession! ' getcwd() . '/.session.vim'
    endif
endfunction

function! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

" Session file
au VimLeavePre * call SaveSessionIfGit()
au VimEnter * nested call RestoreSess()

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" GitGutter
" Remember: <Leader>hu/hs = hunk undo/hunk stage
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

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

nmap <Leader>drn   <Plug>VimspectorContinue
nmap <Leader>dst   <Plug>VimspectorStop
nmap <Leader>dq    <Leader>dst:tabc<CR>gT
nmap <Leader>drt   <Plug>VimspectorRunToCursor
nmap <Leader>dsi   <Plug>VimspectorStepInto
nmap <Leader>dso   <Plug>VimspectorStepOut
nmap <Leader>dss   <Plug>VimspectorStepOver

nmap <Leader>dbn   <Plug>VimspectorToggleBreakpoint
nmap <Leader>dbc   <Plug>VimspectorToggleConditionalBreakpoint

" Suggested coc settings follow 
let  g:coc_global_extensions = [
        \'coc-clangd',
        \'coc-cmake',
        \'coc-jedi',
        \'coc-json',
        \'coc-snippets',
        \'coc-vimlsp',
        \'coc-zig',
        \'coc-zls'
        \]
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

nmap <silent> [h <Plug>(coc-diagnostic-prev)
nmap <silent> ]h <Plug>(coc-diagnostic-next)

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
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <Leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<Leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <Leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <Leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <Leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <Leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <Leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <Leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <Leader>cl  <Plug>(coc-codelens-action)

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
