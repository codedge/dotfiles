" ### Plugins

" Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'mbbill/undotree'              " Anzeigen von alten Revisionen
  Plug 'vim-scripts/SearchComplete'   " Autocompletion auch in der Suche aktivieren
  Plug 'itchyny/lightline.vim'        " Statuszeile mit mehr Informationen
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'junegunn/limelight.vim'       " Fokus auf aktuellen Absatz
  Plug 'junegunn/goyo.vim'            " Alles ausblenden
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown Preview
  Plug 'yegappan/mru'                 " Most Recently Used über :MRU 
  Plug 'justinmk/vim-sneak'           " Sehr schnelles springen im Code
  Plug 'preservim/nerdtree'           " Erweiterter Filebrowser
  Plug 'Xuyuanp/nerdtree-git-plugin'  " Erweiterung für Git
  Plug 'airblade/vim-gitgutter'       " Änderungen (Git) anzeigen
  Plug 'neoclide/coc.nvim'            " Umfangreiches Autocompletion und mehr
  Plug 'liuchengxu/vista.vim'         " Functions, Variablen anzeigen
call plug#end() " Plugins aktivieren

" Automatisch fehlende Plugins installieren
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" ### Darstellungsoptionen
syntax on           " Syntax Highlighting aktiveren
set number          " Line Numbers anzeigen
set relativenumber  " Relative Nummerierung anzeigen
set linebreak       " Ganze Wörter in neue Zeile umbrechen
set showmode        " Aktuellen Modus in Statuszeile anzeigen
set scrolloff=5     " Cursor bei Scroll weiter oben halten
set mouse=a         " Scrollen mit der Mouse in Console und tmux
set lazyredraw      " Weniger Redraws bei Macros und co.
set cursorline      " Aktive Zeile markieren
set updatetime=300  " Schellere Darstellung	/ Refresh
"set cc=80          " Markierung 80 Zeilen-Rand
set laststatus=2    " Statuszeile immer anzeigen
set cmdheight=2     " Mehr Platz für Statusmeldungen
set shortmess+=c    " Don't pass messages to |ins-completion-menu|
set nowrap          " Wrap standardmäßig abschalten. Mit Leader w an-/abschalten

" ##  Optik und Farben
if has('termguicolors')
    set termguicolors     " Wenn Farben nicht passen, dann die Zeile auskommentieren (z.B. macOS Terminal)	
endif
colorscheme catppuccin-frappe " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha



" ### Suche
set path+=**      " Damit kann mit :find alles, auch in Subfolder gefunden werden
set ignorecase    " Suche nicht Case-Sensentiv
set smartcase     " Aber wenn Großbuchstaben verwenden werden dann schon


" ### Sprache und Rechtschreibkorrektur
set helplang=de             " Deutsche Hilfe
set spelllang=de_de,en_us   " Deutsche und englische Rechtschreibung
"set spell                  " Rechtschreibkorrektur immer aktivieren
autocmd FileType markdown setlocal spell   " Spell bei Markdown aktivieren
autocmd FileType text setlocal spell       " Spell bei allgemeinen Textfiles aktivieren


" ### Verhalten für Backup, Swap und co.
if !isdirectory($HOME."/.local/share/nvim/undodir")
    call mkdir($HOME."/.local/share/nvim/undodir", "p", 0700)
endif
set undodir=~/.local/share/nvim/undodir     " Alle Veränderungen werden hier aufgezeichnet
set undofile		                            " Alle Änderungen werden endlos in oberen undodir protokolliert
if !isdirectory($HOME."/.local/share/nvim/swap")
    call mkdir($HOME."/.local/share/nvim/swap", "p", 0700)
endif
set directory=~/.local/share/nvim/swap      " Zentrale Ablage der Swap-Files
"set noswapfile     " Falls kein Swap-Files erstellen werden soll
set nobackup        " Backfile wird sofort wirder gelöscht, da Restores über Undofiles möglich
set hidden          " Wechsel von Buffern auch, wenn File nicht gespeichert


" ### Verhalten von TABs und Einrücken bei Code 
set tabstop=2 softtabstop=2	shiftwidth=2    " Nur zwei Tab-Stopp einfügen
set expandtab           " Tabs in Spaces wandeln
set formatoptions+=j    " Immer Spaces anstatt Tabs
"set clipboard=unnamed  " Standard-Register (yy, dd, etc) IMMER in Zwischenablage kopieren 


" ### Interner Filemanager (Explore, VExplore, SExplore) optimieren
let g:netrw_banner = 0        " Banner abschalten
let g:netrw_browse_split = 4  " im gleichen Fenster öffnen
let g:netrw_altv = 1          " Split rechts öffnen
let g:netrw_liststyle = 3     " Tree View
let g:netrw_winsize = 25      " Fenster schmälter machen
let g:netrw_list_hide = netrw_gitignore#Hide()    " Gits ausblenden	
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'     " Dotfiles ausblenden


