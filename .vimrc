" vim: set sw=4 ts=4 sts=4 et tw=78

" General {

	autocmd! bufwritepost .vimrc source %	"Automatic reloading of .vimrc

	set nospell
	set nocompatible	" be iMproved, required
	set history=700		" Number of things to remember in history.
	set autowrite		" writes on shell/make commands
	set autoread
	set timeoutlen=250	" Time to wait after ESC
	set hidden          " don't abandon buffer on closing of a file but put it in background

	set swapfile        " use swapfiles
	set dir=~/tmp       " and store them in a central directory
	set confirm         " require confirmation if a file is modified
	set pastetoggle=<F2>	" toggle paste/insert mode

	set guifont=Inconsolata-g\ for\ Powerline\ Nerd\ Font\ Comlete:h16

	set clipboard+=unnamed
	set encoding=utf8
	set fileencoding=utf-8
    	set fileformat=unix
    	set fileformats=unix,dos
	set tags=./tags;$HOME   " walk directory tree up to $HOME looking for tags
	set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
	filetype plugin indent on

	let g:tex_flavor = "latex"

" }
" Mappings {
"
	" allow uppercase commands
	command! W w
	command! Wq wq
	command! WQ wq
	command! Q q

	nmap <C-s> :w<CR>
	nmap <C-q> :qa<CR>
	nmap <C-t> :tabnew<CR>
	nnoremap <C-L> :nohl<CR><C-L>   " Disable search highlighting
	map <leader>. :Sexplore<cr>
	map <leader>yt :ls<cr>
	map <leader>yd :bufdo bd<cr>

	" Open TODOs and FIXMEs found recursively in all files of the current
	" directory in a QuickFix window
	command! Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
" }

" Formatting {
    set fo+=o           " Automatically insert the current comment leader
                        " after hitting 'o' or 'O' in Normal mode
    set fo-=r           " Don't automatically insert a comment leader after an enter

    " Wrapping {
        set nowrap          " Don't wrap automatically on load
        "set fo-=t           " don't wrap automatically on typing
        set textwidth=80    " Document width (used by gd)
	autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
        set colorcolumn=80  " Adds a vertical column at pos 80
    " }


    " Show whitespace
    " MUST be inserted BEFORE the colorscheme command
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/

    set wildmode=longest,full       " At command line, complete longest common
    set wildmenu                    " autocomplete for vim commands
                                    " string, then list alternatives
    set backspace=indent,eol,start  " more powerful backspacing
    set nostartofline               " Prevent the cursor from changing the current column 
                                    " when jumping to other lines within the
                                    " window
    let g:netrw_liststyle=3

    " Indentation {

    	set tabstop=8
	set softtabstop=8
	set shiftwidth=8
	set noexpandtab
	set smarttab

        set autoindent
        set cindent
        set cinoptions=:s,ps,ts,cs
        set cinwords=if,else,while,do,for,switch,case

        vnoremap < <gv  " easier moving of code blocks
        vnoremap > >gv  " visual mode, then press < or > several times
    " }

    syntax on       " enable syntax
    filetype off    " required

" }
" Visual {
    set number
    autocmd InsertEnter * :set number           " Line numbers on
    autocmd InsertLeave * :set relativenumber   " Line numbers on
    set showmatch       " Show matching brackets
    set matchtime=5     " Bracket blinking
    set novisualbell    " No blinking
    set noerrorbells    " No noise
    set laststatus=2    " Always show status line
    set visualbell t_vb=    " disable any beeps or flashes on error
        au GuiEnter * set visualbell t_vb=
    set ruler           " Show ruler
    set showcmd         " Display an incomplete command in the lower right
                        " corner of the Vim window
    set shortmess=atI   " Shortens messages
    set cmdheight=2     " Set the line height of the command line
    set nolist          " Display unprintable characters f12 - switches
    set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«
                        " Unprintable chars mapping
    set cursorline      " highlight current line

    set scrolloff=10    " start scrolling when there are 10 lines left at the bottom

    " Folding {
        set foldenable          " Turn on folding
        set foldmethod=marker   " Fold on the marker
        set foldmethod=syntax
        set foldlevel=20        " no autofold
        set foldopen=block,hor,mark,percent,quickfix,tag    " what movements open folds
    " }

    set mouse=a         " Enable mouse
    set mousehide       " Hide mouse after chars typed

    " Searching {
	set incsearch       " Incremental searches as you type
        set hlsearch        " Highlight search patterns
        set ignorecase      " Make search case insensitive
        set smartcase       " Make search case sensitive when a capital letter is part of the pattern
    " }

    set splitbelow
    set splitright

    " Color Scheme for non gvim {
        set t_Co=256
        if !has('gui_running')
            color smyck
	    highlight ColorColumn ctermbg=233   " must be set after color scheme
        endif
    " }
" }

" Skeletons {
    if has("autocmd")
	augroup templates
	    au!
	    autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")
	    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
	augroup END
    endif

" }

" Vundle {
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " General Plugins
    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'junegunn/goyo.vim'
    Plugin 'junegunn/limelight.vim'
    Plugin 'cyplo/vim-colors-solarized'
    Plugin 'konfekt/fastfold'
    Plugin 'tpope/vim-surround'
    Plugin 'raimondi/delimitmate'
    Plugin 'chrisbra/colorizer'
    Plugin 'junegunn/vim-easy-align'
    Plugin 'mtth/scratch.vim'
    Plugin 'ajh17/VimCompletesMe'
    Plugin 'brendonrapp/smyck-vim'
    Plugin 'ryanoasis/vim-devicons'

    " Git
    Plugin 'airblade/vim-gitgutter'
    Plugin 'tpope/vim-fugitive.git'
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    " Language specific Plugins
    " Go
    Plugin 'fatih/vim-go'

    " Web-Development
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'pangloss/vim-javascript'
    Plugin 'maksimr/vim-jsbeautify'
    Plugin 'Shutnik/jshint2.vim'
    Plugin 'mattn/emmet-vim'
"    Plugin 'skammer/vim-css-color'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'joukevandermaas/vim-ember-hbs'
    Plugin 'alexlafroscia/vim-ember-cli'
    Plugin 'udalov/kotlin-vim'
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
" }

" Plugin settings {
    " Airline {
        let g:airline_powerline_fonts=1
        let g:Powerline_symbols='fancy'
    " }
    " NERDTree {
        let g:nerdtree_tabs_open_on_console_startup=0
        map <F7> :NERDTreeTabsToggle<CR>
        let g:NERDTreeDirAllows=0
        let NERDTreeChDirMode=2
    " }
    " Tagbar {
        map <F8> :TagbarToggle<CR>
    " }
    " VIM-Go {
        " This trigger takes advantage of the fact that the qucikfix window
        " can be easily distinguished by its file-type, qf. The wincmd J
        " command is equivalent to the Ctrl+W, Shift+J shortcut telling Vim to
        " move a window to the very bottom (see :help :wincmd and :help ^WJ).
        autocmd FileType qf wincmd J

        " run current file with ctrl+return
        au FileType go nmap <C-CR> <Plug>(go-run)

        let g:go_fmt_command = "goimports"
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
    " }
    " DelimitMate {
        inoremap {<CR> {<CR>}<C-o>O
    " }

    " GitGutter {
	let g:gitgutter_enabled=1
	let g:gitgutter_eager=0
	set signcolumn=yes
	highlight clear SignColumn
        nmap <F6> :GitGutterLineHighlightsToggle<CR>
        set updatetime=100
    " }
    " CtrlP {
	let g:ctrlp_show_hidden=1
	let g:ctrlp_working_path_mode=0
	let g:ctrlp_max_height=30
	let g:ctrlp_arg_map=1
        let g:ctrlp_cmd = 'CtrlPMRU'
    " }
    " Emmet {
        let g:user_emmet_leader_key = '<c-e>'
    " }
    " JsBeautify {
        "autocmd BufWritePost *.js silent :call JsBeautify() | :JSHint
    " }
    " JsHint2 {
        "autocmd BufWritePost *.js silent :JSHint
    " }
    " Mustache Handlebars {
        let g:mustache_abbreviations = 1
    " }
    " EasyAlign {
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
    " }

"}

let mapleader = "," " set leader key
