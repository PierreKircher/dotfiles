nnoremap <silent><SPACE> <nop>
let mapleader=" "
"
"  --------------- Plugins ------------------------------
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autload/plug.vim
else
  set encoding=utf8
  set nocompatible
  filetype off
  call plug#begin('~/.config/nvim/plugged')
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'godlygeek/tabular'
  Plug 'gabrielelana/vim-markdown'
  Plug 'tpope/vim-commentary'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'edkolev/tmuxline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'dmdque/solidity.vim'
  Plug 'elixir-editors/vim-elixir'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tomlion/vim-solidity'
  Plug 'vim-latex/vim-latex'
  Plug 'rhysd/vim-grammarous', { 'for': 'markdown' } " show grammar mistakes
  Plug 'reedes/vim-wordy' " Verify quality of writting (see :Wordy)
  Plug 'reedes/vim-lexical' " Dictionnary, thesaurus...
  Plug 'arcticicestudio/nord-vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'blindFS/vim-taskwarrior'
  Plug 'LukeSmithxyz/vimling'
  call plug#end()
   filetype indent plugin on
  map <silent><leader>pi :PlugInstall<CR>
  map <silent><leader>pu :PlugInstall<CR>
  map <silent><leader>pc :PlugClean<CR>
end


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

set autowrite
" ---- syntax stuff -------------
"set background=dark
set termguicolors
"colorscheme gruvbox
colorscheme nord
let g:molokai_original = 1
"let g:airline_theme='gruvbox'
"let g:airline_theme='wombat'
"let g:airline_theme='base16_spacemacs'


" set background transparent
hi Normal guibg=NONE ctermbg=NONE


tnoremap <Esc> <C-\><C-n><CR>


let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%a'],
      \'z'    : '#H'}

let g:tmuxline_theme  = 'iceberg'
let g:tmuxline_powerline_separators = 0

highlight clear SignColumn
highlight GitGutterAdd          guibg=#7db669
highlight GitGutterChange       guibg=#c77089
highlight GitGutterDelete       guibg=#f73028
highlight GitGutterChangeDelte  guibg=#f73028
highlight DiffAdd    guibg=#669933
highlight DiffDelete guibg=#336699
highlight DiffChange guibg=#993366
highlight DiffText  guibg=#CCCCCC
set clipboard+=unnamedplus

"Syntax off
" -------------------------------
"

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make nested copen
augroup END

"set foldmethod=syntax
"set foldleve time until bg calls after typing
set timeout! " Disable keybind timeout
set ttimeout! " Disable keybind timeout
set lazyredraw " whether to redraw screen after macros
set mat=2 " how fast to blink matched brackets
set textwidth=0 " very annoying warning
set backspace=2 " allow backspace to go over new lines

set laststatus=0 " Disable bottom status line / statusbar
set noshowcmd " don't print the last run command
set ch=1 " get rid of the wasted line at the bottom

set number
set relativenumber

let s:color_column_old = 72

function! s:ToggleColorColumn()
  if s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    set colorcolumn=0
  else
    let &colorcolumn=s:color_column_old
    let s:color_column_old = 0
  endif
endfunction

" --- tabs ----------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " soft tab creation / deletion
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " match indents on new lines.
set smartindent
" --------------------

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list


"GOLANG

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will h

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')




" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}




" Use <C-l> for trigger snippet expand.
imap <C-i> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-n> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-n>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-e>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-n> <Plug>(coc-snippets-expand-jump)
" Using CocList
" Show all diagnostics
nnoremap <silent> ,a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> ,x  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> ,c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> ,o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> ,s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> ,n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> ,e  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> ,p  :<C-u>CocListResume<CR>


map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_def_mapping_enabled = 0

nnoremap <silent> <F6> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map ,h :NERDTreeToggle<CR>
nnoremap <silent> ,v :NERDTreeFind<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1


map <silent><leader>w :w<CR>
map <silent><leader>q :q<CR>

map <leader>mdp :MarkdownPreview<CR>
map <leader>mdt MarkdownPreviewToggle<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

      let g:ranger_map_keys = 0
    nnoremap <silent><leader>r :Ranger<CR>

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" When shortcut files are updated, renew bash and vifm configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Navigating with guides
	inoremap ,, <Esc>/<++><Enter>"_c4l
	vnoremap ,, <Esc>/<++><Enter>"_c4l
	map ,, <Esc>/<++><Enter>"_c4l

 nmap <silent><leader>c :Commentary<CR>

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
map <silent><leader>ln :set number! relativenumber!<cr>
nnoremap <silent><leader>ll :call <SID>ToggleColorColumn()<cr>

" vimling:
	nm ,.d :call ToggleDeadKeys()<CR>
	imap ,.d <esc>:call ToggleDeadKeys()<CR>a
	nm ,.i :call ToggleIPA()<CR>
	imap ,.i <esc>:call ToggleIPA()<CR>a
	nm ,.q :call ToggleProse()<CR>


" Check file in shellcheck:
	map ,.s :!clear && shellcheck %<CR>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

autocmd FileType go nmap <leader>gt :GoDeclsDir<cr>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1

let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"


nnoremap <Leader>b :b 
nnoremap <Leader>W :w<CR>
map <silent><C-k> :bnext<CR>
map <silent><C-j> :bprev<CR>
map <silent><C-d> :bd<cr>
map <silent>tn :bnext<CR>
map <silent>te :bprev<CR>
map <silent>td :bd<cr>


if has('nvim')
    function! s:Ranger(...)
        let path = a:0 ? a:1 : getcwd()

        if !isdirectory(path)
            echom 'Not a directory: ' . path
            return
        endif

        let s:ranger_tempfile = tempname()
        let opts = ' --cmd="set viewmode multipane"'
        let opts .= ' --choosefiles=' . shellescape(s:ranger_tempfile)
        if a:0 > 1
            let opts .= ' --selectfile='. shellescape(a:2)
        else
            let opts .= ' ' . shellescape(path)
        endif
        let rangerCallback = {}

        function! rangerCallback.on_exit(id, code, _event)
            " Open previous buffer or new buffer *before* deleting the terminal
            " buffer. This ensures that splits don't break if ranger is opened in
            " a split window.
            if w:_ranger_del_buf != w:_ranger_prev_buf
                " Restore previous buffer
                exec 'silent! buffer! '. w:_ranger_prev_buf
            else
                " Previous buffer was empty
                enew
            endif

            " Delete terminal buffer
            exec 'silent! bdelete! ' . w:_ranger_del_buf

            unlet! w:_ranger_prev_buf w:_ranger_del_buf

            let names = ''
            if filereadable(s:ranger_tempfile)
                let names = readfile(s:ranger_tempfile)
            endif
            if empty(names)
                return
            endif
            for name in names
                exec 'edit ' . fnameescape(name)
                doautocmd BufRead
            endfor
        endfunction

        " Store previous buffer number and the terminal buffer number
        let w:_ranger_prev_buf = bufnr('%')
        enew
        let w:_ranger_del_buf = bufnr('%')

        " Open ranger in nvim terminal
        call termopen('ranger ' . opts, rangerCallback)
        startinsert
    endfunction

    let g:loaded_netrwPlugin = 'disable'
    augroup ReplaceNetrwWithRanger
        autocmd StdinReadPre * let s:std_in = 1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | call s:Ranger(argv()[0]) | endif
    augroup END

    command! -complete=dir -nargs=* Ranger :call <SID>Ranger(<f-args>)
endif



"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
