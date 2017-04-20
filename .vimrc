set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" NERD tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Devicons
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Powerline
Plugin 'powerline/powerline'
" Syntax check on save
Plugin 'scrooloose/syntastic'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Auto-complete
Plugin 'Valloric/YouCompleteMe'
" Super Search
Plugin 'ctrlpvim/ctrlp.vim'
" Smart fold
Plugin 'tmhedberg/SimpylFold'
" PEP8 check
Plugin 'nvie/vim-flake8'
" Python indent
Plugin 'vim-scripts/indentpython.vim'
" PHP
Plugin 'jwalton512/vim-blade'
" syntax highlighting and improved indentation for javascript
Plugin 'pangloss/vim-javascript'
" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Vimtex
Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" utf-8
set encoding=utf-8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim

" Always show statusline
set laststatus=2

" Use 256 colours
set t_Co=256

" line-numbering
set nu

" NerdTreeIgnore
let NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__', '.egg-info[[dir]]']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Enable docstrings on folded code
let g:SimpylFold_docstring_preview=1

" Python syntax
let python_highlight_all=1
syntax on

" Python PEP8 indentation
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix |

" Js, html, css indentation
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |

" PHP indentation
au BufNewFile,BufRead *.php
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |

" LaTeX indentation
au BufNewFile,BufRead *.tex
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |

" Extraneous whitespaces (this gives E20: mark not set)
"highlight BadWhiteSpace ctermbg=red guibg=darkred
"au BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhiteSpace /\s\+$/

" Python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" Color schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

" Enable vimtex with YouCompleteMe
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
  let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\usepackage(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
    \ ]

let g:airline_powerline_fonts = 1
