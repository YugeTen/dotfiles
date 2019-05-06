""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using Vim-Plug for plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Vim plugin, provides insert mode a uto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" ➕ Show a diff using Vim its sign column.
Plug 'mhinz/vim-signify'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" 🔗  The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" 🔣 Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" Extra syntax and highlight for nerdtree files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vastly improved Javascript indentation and syntax support in Vim. https://www.vim.org/scripts/script.php?script_id=4452
Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" 🌠 Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" vim syntax file for plantuml
Plug 'aklt/plantuml-syntax'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the Leader key , instead of the default \
let mapleader=","

syntax enable
syntax on
let base16colorspace=256

if (has("termguicolors"))
 set termguicolors
endif

set background=dark " for the dark version
colorscheme gruvbox



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT VARIABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight the current cursor line
set cursorline

" Wrap text on the screen appropriately (don't wrap in the middle of the word)
set linebreak

" Shows line numbers by default when opening files
set number

" Shows relative line numbers
set relativenumber

" Don't wrap lines by default
set nowrap

" Displays the special characters like eol, indents etc
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
" set listchars=tab:\|\ ,
" set listchars=tab:•\ ,eol:¬
set listchars=tab:•\ ,
set list

" Hide the default mode indicator. Do so because airline will show the current mode
set noshowmode

" Display vim airline at the botom of the window
set laststatus=2

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

" Use utf8 as the encoding format for files
set encoding=utf8

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" ****************** Tabs VS Spaces ********************
" Set the tab stop to 4
set tabstop=4

" Helps with autoindenting when using =
set shiftwidth=4

" Indent with TABS instead of spaces
" set noexpandtab

" Indent with SPACES instead of tabs
set expandtab
" ****************************************************************



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode
nnoremap <Leader>a :set paste!<CR>

" Toggle wrap mode
nnoremap <Leader>wr :set wrap!<CR>

" Toggle highlighting of search results
nnoremap <Leader>hl :set hlsearch!<CR>

" Toggle cursor line highlight
nnoremap <Leader>cll :set cursorline!<CR>

" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>


" SETTINGS FOR THE BUFFER
" Create a new buffer
nnoremap <Leader>b :enew<cr>

" Move to the next buffer
nnoremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status --> Unnecessary since I am displaying open buffers at the top using airline
" nnoremap <Leader>bl :ls<CR>

" Split the curent window vertically or horizontally (Useful when you want to have the same file open at two different locations at the same time)
nnoremap <Leader>vsp :vsplit<CR>
nnoremap <Leader>hsp :split<CR>

" Vertically and horizontally resize a window
nnoremap <Leader>vrs :vertical resize +
nnoremap <Leader>hrs :resize +

" Use tt to togle the tagbar open and close
nnoremap tt :TagbarToggle<CR>

" Opens fzf window without toggling NERDTree
nnoremap ff :FZF<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

nnoremap <Leader>pwf :!ls %:p<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ########################
" ###### DeoPlete
" ########################
let g:deoplete#enable_at_startup = 1

" Allow cyclying through autocomplete options with tab key
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"


" #########################
" ###### NERDTree
" ########################

" Toggle NERDTree
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree<CR>


" Choose the arrow character NERDTree will use
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▿'
" Have NERDTree be open automatically when vim starts --> Handled by cmd for use with startify
" autocmd VimEnter * NERDTree


" #########################
" ###### NerdCommenter
" ########################
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" #########################
" ###### Airline
" ########################

" Using the font Meslo LG S Regular for Powerline which can be found here:
" https://github.com/powerline/fonts/tree/master/Meslo
" Currently using DejaVu Sans Mono for Powerline
" It is also installed on my computer
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='molokai'
let g:airline_symbols.branch = ""
let g:airline_symbols.paste = "Þ"
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"
let g:airline_left_sep=""
let g:airline_right_sep=""

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Hide whitespace errors
let g:airline#extensions#whitespace#enabled = 0

" Display only the filename in section c
let g:airline_section_c = airline#section#create(['%t'])

" Display the file type in section x
let g:airline_section_x = airline#section#create('%y')

" Display only the file encoding in section y
let g:airline_section_y = airline#section#create("%{strlen(&fenc)?&fenc:'none'}")

" Display only the line and column information in section z
let g:airline_section_z = airline#section#create(['Line %03l/%03L (%02p%%) Col:%03c'])

let g:airline_section_error = airline#section#create('')
let g:airline_section_warning = airline#section#create ('')

" EXAMPLES FROM :help airline
" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic, eclim)
" let g:airline_section_warning (ycm_warning_count, whitespace)


" #########################
" ###### Startify
" ########################

" When opening a file or bookmark, seek and change to the root directory of the
" VCS (if there is one).
let g:startify_change_to_vcs_root = 2

" Open Startify and NERDTree when starting vim
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Custom message to display in startify menu
let g:startify_custom_header = [
            \ '                                                                            ',
            \ '    o             o  o----o  o       o-----o  o-----o  o       o  o----o    ',
            \ '     \     o     /   |       |       |        |     |  | \   / |  |         ',
            \ '      \   / \   /    |----o  |       |        |     |  |  \ /  |  |----o    ',
            \ '       \ /   \ /     |       |       |        |     |  |   o   |  |         ',
            \ '        o     o      o----o  o----o  o-----o  o-----o  o       o  o----o    ',
            \ '                                                                            ',
            \ '                       o---o   o-----o  o-----o  o   o                      ',
            \ '                       |   |   |     |  |        |  /                       ',
            \ '                       o---o   |-----|  |        |--                        ',
            \ '                       |    \  |     |  |        |  \                       ',
            \ '                       o----o  o     o  o-----o  o   o                      ',
            \ ]



" #########################
" ###### Ale
" ########################
" Use the quickfix list to display linting errors
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Open the list
let g:ale_open_list = 1

" Wait n ms before linting after text is changed
let g:ale_lint_delay = 700

nnoremap <Leader>tl :ALEToggle<CR>

" Fix files with ESLint.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:ale_linters = {
            \	'javascript': ['eslint'],
            \	'SCSS': ['styleint'],
            \}



" #########################
" ###### Vim Devicons
" ########################

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '


" #########################
" ####### Vim Javascript
" #########################

let g:javascript_plugin_jsdoc = 1
