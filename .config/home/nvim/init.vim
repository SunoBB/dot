" init.vim NeoVim Configuration File

" Basic Neovim configurations. 
set mouse=a
set syntax=on
set number
set nowrap 
filetype plugin indent on 

" Making 256 color ranges work through Alacritty.
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Sourcing my vim plugins, see .config/nvim/vim-plug/plugins.vim.
source $HOME/.config/nvim/vim-plug/plugins.vim

" Setting onedark configurations.
let g:onedark_termcolors = 256 
let g:onedark_terminal_italics = 1 

" Setting the colorscheme.
colorscheme onedark

" Setting Configurations for Airline.
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Setting colors and seperators. 
let g:airline_theme = 'onedark'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Haskell language configurations.
let g:haskell_indent_if = 2
let g:haskell_indent_let = 2 
let g:haskell_indent_where = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_if = 2 

" Haskell syntax configurations.
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords