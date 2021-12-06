with import <nixpkgs> {};

vim_configurable.customize {
  name = "myvim";
  vimrcConfig.customRC = ''
    set hidden
    set colorcolumn=80 

    set nocompatible
    set backspace=indent,eol,start

    set laststatus=2 
    set statusline=
    set statusline+=%-10.3n
    set statusline+=%f
    set statusline+=%h%m%r%w
    set statusline+=\[%{strlen(&ft)?&ft:'none'}]
    set statusline+=%=
    "set statusline+=0x%-8B
    set statusline+=%-14(%l,%c%V%)
    set statusline+=%<%P

    syntax on
    filetype on
    set expandtab
    set tabstop=2
    set shiftwidth=2
    set autoindent
    set smartindent
    set smartcase
    set nowrap
    set encoding=utf-8
    set background=black
    set linenumber
    set modeline
    set ruler

    let mapleader = ","

   " File finder
    nmap <Leader>t :fzf<CR>
    nmap <Leader>h :rg<CR>      

  " Visual mode pressing * or # searches for the current selection
  " Super useful! From an idea by Michael Naumann
   vnoremap <silent> * :call VisualSelection('f')<CR>
   vnoremap <silent> # :call VisualSelection('b')<CR>
    
    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>

    " press enter to hide search highligts
    nnoremap <silent> <CR> :nohlsearch<CR><CR>

    map Y y$ 

    #colorscheme desert

    "set cursorline
    " highligt Cursor ctremfg=white ctermbg=Yellow cterm=bold 
    "set cursorcolumn
    "highlight CursorLine guifg=red guibg=blue
    " Default Colors for CursorLine
    "highlight  CursorLine ctermbg=None ctermfg=None
    " Change Color when entering Insert Mode
    "autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=White
    " Revert Color to default when leaving Insert Mode
    "autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None
    
    " Make vim use system clipboard instead of it's own
    set clipboard=unnamed
    
    " FINDING FILES
    " Search down into subfolders
    " Provides tab-completion for all file-related tasks
    " set path +=**
    " Displaying all matching files when we tab complete
    set wildmenu
    " NOW WE CAN
    " - Hit tab to find by substring match 
    " - Use * to make it fuzzy
    " THINGS TO CONSIDER:
    " - :b lets you autocomplete any open buffer
    # 	" Vim with all enhancements
    # 	" source $VIMRUNTIME/vimrc_example.vim
  '';
}
