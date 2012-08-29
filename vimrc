runtime! debian.vim
" runtime! syntax/syncolor.vim

" This option stops vim from behaving in a strongly vi -compatible way. 
" It should be at the start of any vimrc file as it can affect lots of other 
" options which you may want to override.
set nocompatible

"-----------------------------------------------------------------------------
" This being the 21st century, I use Unicode : LoL
"-----------------------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8

"-----------------------------------------------------------------------------
" Activer la coloration syntaxique
"-----------------------------------------------------------------------------
if has("syntax")
  syntax on
endif

"-----------------------------------------------------------------------------
" Enable mouse usage (all modes)
"-----------------------------------------------------------------------------
if has("mouse")
  set mouse=a
endif

"-----------------------------------------------------------------------------
" Source a global configuration file if available
"-----------------------------------------------------------------------------
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


set nofoldenable
set background=dark " This tells vim to use colors for dark background
set cmdheight=2     " The commandbar height
set number          " Pour avoir les numéros des lignes
set autoindent      " Pour avoir l'auto-indentation
set smartindent     " Indenttion intelligente 
set cindent         " C style indent
set showcmd         " Show (partial) command in status line
set showmode        " Show the current mode
set showmatch" Show matching brackets.
set ignorecase" Do case insensitive matching
set smartcase" Do smart case matching
set expandtab " Use spaces instead of tabs
set smarttab " Use spaces instead of tabs
set incsearch" Incremental search
set autowrite" Automatically save beefore commands like :next and :make
set history=500     " Taille de l'historique
set wildmenu        " Pour avoir un menu sous la forme d'une liste (beau)
set wildmode=longest,list
set title                   " Show title in title bar
set textwidth=0             " Don't wrap words by default
" Vim will move to the p/n line after reaching first/last character in the line
"set whichwrap+=<,>,h,l,[,] 
set browsedir=buffer        " :browse e starts in %:h, not in $PWD
set autoread                " Automatically reload files changed on disk
set nowrap                  " Do not wrap lines

if has("extra_search")
  set hlsearch              " highlight search matches
  nohlsearch                " but not initially
endif

"-----------------------------------------------------------------------------
" Terminal Color
"-----------------------------------------------------------------------------
set t_Co=256

"-----------------------------------------------------------------------------
" Met les fins de ligne du type UNIX. 
"-----------------------------------------------------------------------------
set fileformat=unix

"-----------------------------------------------------------------------------
" Make tabs be spaces instead                           
"-----------------------------------------------------------------------------
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

"-----------------------------------------------------------------------------
" More powerful backspacing
"-----------------------------------------------------------------------------
set backspace=indent,eol,start    

"-----------------------------------------------------------------------------
" Les folds                                                     
"-----------------------------------------------------------------------------
set foldmethod=indent
" Set commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"-----------------------------------------------------------------------------
" Silence                                                   
"-----------------------------------------------------------------------------
set noerrorbells                " don't beep!
set visualbell                  " don't beep!
set t_vb=                       " don't beep! (but also see below)

"-----------------------------------------------------------------------------
" When the page starts to scroll, 
" keep the cursor 8 lines from the top and 8 lines from the bottom
"-----------------------------------------------------------------------------
set scrolloff=8

"-----------------------------------------------------------------------------
"Colore la ligne courante
"-----------------------------------------------------------------------------
set nocursorline

"-----------------------------------------------------------------------------
" Les nouvelles fenetres
"-----------------------------------------------------------------------------
set splitbelow " Nouvelle fenetre en bas (:sp)
set splitright " Nouvelle fenetre a droite (:vsp)

"-----------------------------------------------------------------------------
" Toujours avoir la status line
"-----------------------------------------------------------------------------
set laststatus=2 

"-----------------------------------------------------------------------------
"Set the status line the way i like it
"-----------------------------------------------------------------------------
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

"-----------------------------------------------------------------------------
" Show the cursor position all the time
"-----------------------------------------------------------------------------
set ruler 

"-----------------------------------------------------------------------------
" When completing by tag, show the whole tag, not just the function name
"-----------------------------------------------------------------------------
set showfulltag

filetype on
filetype plugin on

"-----------------------------------------------------------------------------
" La completion intelligente                                                
"-----------------------------------------------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" set Ctrl+j in insert mode, like VS.Net
imap <C-j> <C-X><C-O>
" :inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
" set completeopt as don't show menu and preview
set completeopt=menuone
" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black


"-----------------------------------------------------------------------------
" Fermer NERDTreeClose et TListClose à la fermeture de vim
"-----------------------------------------------------------------------------
"autocmd VimLeave * call NERDTreeClose()
"autocmd VimLeave * call TListClose()
"autocmd VimEnter * call NERDTreeClose()
"autocmd VimEnter * call TListClose()

"-----------------------------------------------------------------------------
" Supprimer automatiquement les espaces en fin de ligne
"-----------------------------------------------------------------------------
autocmd BufWritePre :1,$s/[ \t]*$//

"-----------------------------------------------------------------------------
" Ne pas perdre le folding
"-----------------------------------------------------------------------------
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"-----------------------------------------------------------------------------
" Pouvoir se balader partout avec le curseur
"-----------------------------------------------------------------------------
"set virtualedit=all                        
  
"-----------------------------------------------------------------------------
" Le thème par défaut
"-----------------------------------------------------------------------------
colorscheme symfony

"-----------------------------------------------------------------------------
" GUI Options
"-----------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=T   " Get rid of toolbar
set guioptions-=R
set guioptions-=L
    set guifont=Inconsolata\ 10
    "set guifont=Terminus\ 10
set guioptions-=r   " Get rid of the scrollbar on the right
    set guioptions-=m   " Get rid of menu
    " Turn on a horizontal scrollbar (displayed at the bottom of the window)
    "set guioptions+=b   
    "set mousehide
endif

"-----------------------------------------------------------------------------
" Backup files                                                  
"-----------------------------------------------------------------------------
"set backup              " make backups
set nobackup

"set backupdir=/tmp      " but don't clutter $PWD with them
"    if $USER == "root"
"        " 'sudo vi' on certain machines cannot write to ~/tmp (NFS root-squash)
"        set backupdir=/root/tmp
"    endif

"    if !isdirectory(&backupdir)
"    " create the backup directory if it doesn't already exist
"    exec "silent !mkdir -p " . &backupdir
"    endif

"-----------------------------------------------------------------------------
" Buffers / Fenetres / Tabs                                             
"-----------------------------------------------------------------------------
set hidden          " Pour pouvoir changer de buffer sans sauvegarder
set wmh=0           " Nombre minimal de lignes pour une fenetre
"     if has("linebreak")
"       let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped line
"     endif

"-----------------------------------------------------------------------------
" With a map leader it's possible to do extra key combinations
"-----------------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","

"-----------------------------------------------------------------------------
" Select all ... so usefull
"-----------------------------------------------------------------------------
map <c-a> ggVG

"-----------------------------------------------------------------------------
" Ouvre l'explorateur de fichiers en split en bas
"-----------------------------------------------------------------------------
map <Leader>xx :Sexplore<cr>

"-----------------------------------------------------------------------------
" Make shift-insert work like in Xterm - WOW !!!
"-----------------------------------------------------------------------------
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"-----------------------------------------------------------------------------
" Fast saving
"-----------------------------------------------------------------------------
nmap <leader>w :w!<cr>

"-----------------------------------------------------------------------------
" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
"-----------------------------------------------------------------------------
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

"-----------------------------------------------------------------------------
" Let's try something else fun -- pas mal, pour insérer le nom du fichier ;)
"-----------------------------------------------------------------------------
imap ,fn <c-r>=expand('%:t:r')<cr>
                          
"-----------------------------------------------------------------------------
" Make the current file executable - pas mal
"-----------------------------------------------------------------------------
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

"-----------------------------------------------------------------------------
" Add a GUID to the current line
"-----------------------------------------------------------------------------
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

"-----------------------------------------------------------------------------
" Make horizontal scrolling easier
"-----------------------------------------------------------------------------
nmap <silent> <C-S>o 10zl
nmap <silent> <C-S>i 10zh

"-----------------------------------------------------------------------------
" Map space to / (search) and c-space to ? (backgwards search)
"-----------------------------------------------------------------------------
map <space> /
map <c-space> ?
                           
"-----------------------------------------------------------------------------
"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"-----------------------------------------------------------------------------
"nmap <c-M-j> mz:m+<cr>`z
"nmap <c-M-k> mz:m-2<cr>`z
"vmap <c-M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <c-M-k> :m'<-2<cr>`>my`<mzgv`yo`z"

"-----------------------------------------------------------------------------
" Deplacement entre les fenetres                                         
"-----------------------------------------------------------------------------
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

"-----------------------------------------------------------------------------
" Fermer une fenetre
"-----------------------------------------------------------------------------
map <leader>q :q<CR>

"-----------------------------------------------------------------------------
" Close all the buffers
"-----------------------------------------------------------------------------
map ,ba :1,300 bd!<cr>

"-----------------------------------------------------------------------------
" Use the arrows to something usefull
"-----------------------------------------------------------------------------
map <right> :bn<cr>
map <left> :bp<cr>

"-----------------------------------------------------------------------------
" Buffer precedent/suivant - fonctionne seulement sous GVim
"-----------------------------------------------------------------------------
noremap <C-tab> :bn!<cr>
noremap <C-S-tab> :bp!<cr>

"-----------------------------------------------------------------------------
" Lancer depuis vim firefox sur la page de recherche 
" google du mot sur le  curseur/rechercher le mot sur wikipedia
"-----------------------------------------------------------------------------
vmap ;goo :<C-U>!firefox "http://www.google.fr/search?hl=fr&q=<cword>" > & /dev/null<CR><CR>
vmap ;wiki :<C-U>!firefox "http://fr.wikipedia.org/wiki/<cword>" > & /dev/null<CR><CR>
vmap ;url :<c-u>!firefox "<cfile>" >& /dev/null<CR><CR>

"-----------------------------------------------------------------------------
"Reouvrir le fichier avec le curseur positionné là où il était quand on l’a fer
"-----------------------------------------------------------------------------
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"-----------------------------------------------------------------------------
" Automatically append closing characters                       
"-----------------------------------------------------------------------------
inoremap {      {}<Left> 
inoremap {<CR>  {<CR>}<Esc>O 
inoremap {{     {
inoremap {}     {}

"-----------------------------------------------------------------------------
"How do you stop your­self from spending too much time in insert mode? 
"-----------------------------------------------------------------------------
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

"-----------------------------------------------------------------------------
" Undo in insert mode then <ESC>u will undo just the ^W/^U, and not the whole I
" This is documented in :help ins-special-special, a few pages down
"-----------------------------------------------------------------------------
inoremap <C-W> <C-G>u<C-W> 
inoremap <C-U> <C-G>u<C-U>

"-----------------------------------------------------------------------------
" .vimrc editing                                                
"-----------------------------------------------------------------------------
set wildcharm=<C-Z>
map ,e :e $HOME/.vimrc<CR>
map ,s :source $HOME/.vimrc<CR>

"-----------------------------------------------------------------------------
" Changer de répertoire en fonction du fichier ouvert
"-----------------------------------------------------------------------------
"set autochdir

"-----------------------------------------------------------------------------
" Where am I ? : current line underlined in insert mode         
"-----------------------------------------------------------------------------
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"-----------------------------------------------------------------------------
" Ouvre un fichier avec le répertoire de travail déjà rempli, 
" donc vous devez spécifier uniquement le nom de fichier
"-----------------------------------------------------------------------------
map ;e :e <C-R>=expand("%:p:h") . "/" <CR> 

"-----------------------------------------------------------------------------
" Changer le répertoire courant vers le répertoire que le fichier que vous êtes
" en cours d'édition
"-----------------------------------------------------------------------------
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

"-----------------------------------------------------------------------------
" Turn off that stupid highlight search
"-----------------------------------------------------------------------------
"nmap <silent> ,n :nohls<CR>

"-----------------------------------------------------------------------------
" Les fenetres : agrandir/diminuer taille
"-----------------------------------------------------------------------------
map <C-+> <C-w>+
map <C--> <C-w>-
map <C-S-+> <C-w>>
map <C-S--> <C-w><

"-----------------------------------------------------------------------------
 "Vertical split then hop to new buffer
"-----------------------------------------------------------------------------
noremap ,v :vsp<CR>
noremap ,h :split<CR>

"-----------------------------------------------------------------------------
"Make current window the only one
"-----------------------------------------------------------------------------
map ,O :only<CR>

"-----------------------------------------------------------------------------
" Pour les lignes très longues : se déplacer verticalement, même en mode I
"-----------------------------------------------------------------------------
noremap <Up> gk
noremap <Down> gj

"-----------------------------------------------------------------------------
" Tabulation
"-----------------------------------------------------------------------------
" nmap <tab> v>
" nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

"-----------------------------------------------------------------------------
" Cope
"-----------------------------------------------------------------------------
"map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"-----------------------------------------------------------------------------
" Yank from the cursor to the end of the line, to be consistent with C and D.
"-----------------------------------------------------------------------------
" nnoremap Y y$

"-----------------------------------------------------------------------------
" visual shifting (does not exit Visual mode)
"-----------------------------------------------------------------------------
vnoremap < <gv
vnoremap > >gv 

"-----------------------------------------------------------------------------
" La correction orthographique, c'est très très bien
"-----------------------------------------------------------------------------
" map ,C :!aspell -c %<CR>

"-----------------------------------------------------------------------------
" Turn off that stupid highlight search
"-----------------------------------------------------------------------------
nmap <silent> <leader>n :nohls<CR>

"-----------------------------------------------------------------------------
" Close the current buffer
"-----------------------------------------------------------------------------
map <leader>bd :Bclose<cr>

"-----------------------------------------------------------------------------
" <F1> et <F2> Movement between tabs OR buffers (selon historique)
"-----------------------------------------------------------------------------
nmap <F1> :BufSurfBack<CR>
nmap <F2> :BufSurfForward<CR>

"-----------------------------------------------------------------------------
" <F3> Save buffer
"-----------------------------------------------------------------------------
map <F3> :w!<CR>
imap <F3> <C-O><F3>

"-----------------------------------------------------------------------------
" <F4> Settings NERDTree
"-----------------------------------------------------------------------------
map <F4> :NERDTreeToggle<CR>

"-----------------------------------------------------------------------------
" <F5> Paste and No Paste
"-----------------------------------------------------------------------------
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

"-----------------------------------------------------------------------------
" <F5> No highlight
"-----------------------------------------------------------------------------
nmap <silent> <F5> :nohls<CR>

"-----------------------------------------------------------------------------
" <F5> Symfony plugin (switch between action and template)
"-----------------------------------------------------------------------------
"silent map <F5> :SfSwitchView <CR> 

"-----------------------------------------------------------------------------
" <F6> Buffer List
"-----------------------------------------------------------------------------
nmap <F6> :FufBuffer<cr>

"-----------------------------------------------------------------------------
" <F7> = Taglist Pluggin                                    
"-----------------------------------------------------------------------------
nmap <F7> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let list_Display_Prototype = 1
let Tlist_Show_One_File = 1

"-----------------------------------------------------------------------------
" Compilation
"-----------------------------------------------------------------------------
" nmap <F8> :make<CR> 

"-----------------------------------------------------------------------------
" Exécution
"-----------------------------------------------------------------------------
" nmap <F9> :!./executable<CR>

"-----------------------------------------------------------------------------
" <F9> = YankRing Plugin                                    
"-----------------------------------------------------------------------------
nnoremap <silent> <F9> :YRShow<CR> 

"-----------------------------------------------------------------------------
" Sessionman Plugin
"-----------------------------------------------------------------------------
map <leader>ss :SessionSave<CR>
map <leader>ssa :SessionSaveAs<CR>
map <leader>so :SessionOpen 
map <leader>sol :SessionOpenLast 
map <leader>ssl :SessionShowLast 

"-----------------------------------------------------------------------------
"vim-php-namespace
"-----------------------------------------------------------------------------
map <Leader>u :call PhpInsertUse()<CR>

"-----------------------------------------------------------------------------
"IncBufSwitch Plugin
"-----------------------------------------------------------------------------
map <C-F> :IncBufSwitch<CR>

"-----------------------------------------------------------------------------
" Plugin FuzzyFinder
"-----------------------------------------------------------------------------
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|class|meta|lock|orig|jar|swp)$|/test/data\.|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_splitPathMatching = 0
let g:fuf_maxMenuWidth = 110
let g:fuf_timeFormat = ''
nmap <silent> ,fv :FufFile ~/.vim/<cr>
nmap <silent> ,fb :FufBuffer<cr>
nmap <silent> ,ff :FufFile<cr>
nmap <silent> ,fc :FufMruCmd<cr>
nmap <silent> ,fm :FufMruFile<cr>
nmap <silent> ,fp :FufFile ~/git/*<cr>

"-----------------------------------------------------------------------------
" Color current line
"-----------------------------------------------------------------------------
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! 

"-----------------------------------------------------------------------------
" Super tab Plugin
"-----------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Create tags with '\1' command
function! Phptags()   
    let cmd = '!ctags -f tags -h ".php" -R --exclude="\.svn" --exclude="./var" --exclude="./temp" --totals=yes --tag-relative=yes .'
    exec cmd
    set tags =/home/tudor/Public/Symfony/tags
endfunction
map <C-F12> :call Phptags()<CR>

" Update ctags
"let cmd2 = 'ctags -a -f tags -h ".php" -R --exclude="\.svn" --exclude="./var" --exclude="./temp" --totals=yes --tag-relative=yes .'
"autocmd BufWritePost * silent! exec system(cmd2)

"-----------------------------------------------------------------------------
" Grep GNU command
"-----------------------------------------------------------------------------
"map <leader>gp : grep -R --exclude="" "" .

"-----------------------------------------------------------------------------
" Grep Plugin
"-----------------------------------------------------------------------------
nnoremap <silent>,gp :Grep<CR>
nnoremap <silent>,rgp :Rgrep<CR>
nnoremap <silent>,bgp :Bgrep<CR>
nnoremap <silent>,co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

"Grep          - Search for the specified pattern in the specified files 
"GrepAdd       - Same as ":Grep" but adds the results to the current results 
"Rgrep         - Run recursive grep 
"RgrepAdd      - Same as ":Rgrep" but adds the results to the current results 
"GrepBuffer    - Search for a pattern on all open buffers 
"GrepBufferAdd - Same as ":GrepBuffer" but adds the results to the current 
                "results 
"Bgrep         - Same as :GrepBuffer 
"BgrepAdd      - Same as :GrepBufferAdd 
"GrepArgs      - Search for a pattern on all the Vim argument 
                "filenames (:args) 
"GrepArgsAdd   - Same as ":GrepArgs" but adds the results to the current 
                "results 
"Fgrep         - Run fgrep 
"FgrepAdd      - Same as ":Fgrep" but adds the results to the current 
                "results 
"Rfgrep        - Run recursive fgrep 
"RfgrepAdd     - Same as ":Rfgrep" but adds the results to the current 
                "results 
"Egrep         - Run egrep 
"EgrepAdd      - Same as ":Egrep" but adds the results to the current 
                "results 
"Regrep        - Run recursive egrep 
"RegrepAdd     - Same as ":Regrep" but adds the results to the current 
                "results 
"Agrep         - Run agrep 
"AgrepAdd      - Same as ":Agrep" but adds the results to the current 
                "results 
"Ragrep        - Run recursive agrep 
"RagrepAdd     - Same as ":Ragrep" but adds the results to the current 
                 "results 
"Grep   [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Rgrep  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Fgrep  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Rfgrep [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Egrep  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Regrep [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Agrep  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"Ragrep [<grep_options>] [<search_pattern> [<file_name(s)>]] 

"GrepAdd   [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"RgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"FgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"RfgrepAdd [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"EgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"RegrepAdd [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"AgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]] 
"RagrepAdd [<grep_options>] [<search_pattern> [<file_name(s)>]] 

"GrepBuffer [<grep_options>] [<search_pattern>] 
"Bgrep [<grep_options>] [<search_pattern>] 
"GrepArgs [<grep_options>] [<search_pattern>] 

"GrepBufferAdd [<grep_options>] [<search_pattern>] 
"BgrepAdd [<grep_options>] [<search_pattern>] 
"GrepArgsAdd [<grep_options>] [<search_pattern>] 

"-----------------------------------------------------------------------------
" bufExplorer plugin
"-----------------------------------------------------------------------------
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
nmap ç :BufExplorer<cr>
let g:bufExplorerSortBy = "mru"
"'\be' (normal open)  or 
"'\bs' (force horizontal split open)  or 
"'\bv' (force vertical split open) 

"-----------------------------------------------------------------------------
" MRU plugin
"-----------------------------------------------------------------------------
let MRU_Max_Entries = 30
map <leader>m :MRU<CR>

"-----------------------------------------------------------------------------
" Ignore from search CTRL + P (ctrlp Plugin)
"-----------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip   " Linux/MacOSX
set wildignore+=tmp\*,*.swp,*.zip,*.exe    " Windows
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"-----------------------------------------------------------------------------
" Pluggin MiniBuffer _ Extra functionality
"-----------------------------------------------------------------------------
"let g:miniBufExplVSplit = 20   " column width in chars
"let g:miniBufExplMaxSize = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>mb :TMiniBufExplorer<cr>
let g:miniBufExplMaxSize = 4
let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.

"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

"-----------------------------------------------------------------------------
" Plugin Project
"-----------------------------------------------------------------------------
map <leader>pro :Project<CR>

"-----------------------------------------------------------------------------
" Configuration - Sparkup Plugin
"-----------------------------------------------------------------------------
" 
"   https://github.com/rstacruz/sparkup
"
"   g:sparkup (Default: 'sparkup') -
"     Location of the sparkup executable. You shouldn't need to change this
"     setting if you used the install option above.
" 
"   g:sparkupArgs (Default: '--no-last-newline') -
"     Additional args passed to sparkup.
" 
"   g:sparkupExecuteMapping (Default: '<c-e>') -
"     Mapping used to execute sparkup.
" 
"   g:sparkupNextMapping (Default: '<c-n>') -
"     Mapping used to jump to the next empty tag/attribute.


"-----------------------------------------------------------------------------
" Plugin ShowMarks
"-----------------------------------------------------------------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
"highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
"" For marks A-Z
"highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
"" For all other marks
"highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
"" For multiple marks on the same line.
"highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

"-----------------------------------------------------------------------------
" Plugin Dyoxygen Commentaires ! 
"-----------------------------------------------------------------------------
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
"let g:DoxygenToolkit_paramTag_pre="@Param " 
"let g:DoxygenToolkit_returnTag="@Returns   " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Tudor Luchiancenco" 
let g:DoxygenToolkit_licenseTag="My own license"  
let g:DoxygenToolkit_versionString="1.0"  

" Commentaires Dyoxygen
"map <leader>c :DoxAuthor<CR>
"map <leader>f :Dox<CR>

"-----------------------------------------------------------------------------
" EasyMotion Plugin
"-----------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Leader><Leader>'

"-----------------------------------------------------------------------------
" Tabs configuration
"-----------------------------------------------------------------------------
"set showtabline=2 "show tabs even when there are no tabs
"set guitablabel=%N/\ %t\ %M
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
inoremap <leader>tn :<ESC>tabnew<CR>
nnoremap <leader>tn :tabnew<CR>
inoremap <leader>tc :<ESC>tabclose<CR>
nnoremap <leader>tc :tabclose<CR>
set switchbuf=useopen

" replace in all tabs foo by bar
" tabdo %s/foo/bar/g
" navigation

"-----------------------------------------------------------------------------
" Mettre en surbrillance les tabs et les fin de ligne vides
"-----------------------------------------------------------------------------
"highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
"match NoSpacesEOL / \+$/
"highlight NoTabs ctermbg=red ctermfg=white guibg=#592929
"match NoTabs /\t/
"Longueur maximum d'une ligne
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

"-----------------------------------------------------------------------------
" OmniCppComplete Plugin
"-----------------------------------------------------------------------------
" let OmniCpp_NamespaceSearch = 0
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"-----------------------------------------------------------------------------
" automatically open and close the popup menu / preview window
"-----------------------------------------------------------------------------
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,longest,menu,preview

"-----------------------------------------------------------------------------
" Limit popup menu height
"-----------------------------------------------------------------------------
"set pumheight=15

"-----------------------------------------------------------------------------
" Add highlighting for function definition in C++
"function! EnhanceCppSyntax()
""-----------------------------------------------------------------------------
  "syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  "hi def link cppFuncDef Special
"endfunction
"autocmd Syntax cpp call EnhanceCppSyntax()

"-----------------------------------------------------------------------------
" Jump to next/previous method  - CPP
"-----------------------------------------------------------------------------
"nnoremap <M-J> /\v^(\w+\s+)?\w+::\w+\(.*\)
"nnoremap <M-K> ?\v^(\w+\s+)?\w+::\w+\(.*\)

"-----------------------------------------------------------------------------
" Disable automatic comment insertion
"-----------------------------------------------------------------------------
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"-----------------------------------------------------------------------------
" Clang_complete Plugin
"-----------------------------------------------------------------------------
" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 0
" " Show clang errors in the quickfix window
"let g:clang_complete_copen = 0

"-----------------------------------------------------------------------------
" NerdTree Plugin 
"-----------------------------------------------------------------------------
"map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"map <leader>e :NERDTreeFind<CR>
"nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=2
" let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
"let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=33

"-----------------------------------------------------------------------------
" php-doc  Plugin 
"-----------------------------------------------------------------------------
source ~/.vim/php-doc.vim 
inoremap <leader>p <ESC>:call PhpDocSingle()<CR> 
nnoremap <leader>p :call PhpDocSingle()<CR> 
vnoremap <leader>p :call PhpDocRange()<CR>>
" Default values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Author = "Tudor Luchiancenco <tudorluchy@gmail.com>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""
let g:pdv_cfg_ReturnVal = "void"

"-----------------------------------------------------------------------------
" Check syntax PHP
"-----------------------------------------------------------------------------
map ,l :!/usr/bin/php -l %<CR>

"-----------------------------------------------------------------------------
" PHP : Colore le html et sql                                                      
"-----------------------------------------------------------------------------
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
let php_asp_tags = 1
let php_folding = 1

"-----------------------------------------------------------------------------
" TAGS
"-----------------------------------------------------------------------------
"set tags+=~/.vim/tags/cpp set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q

"-----------------------------------------------------------------------------
" Quicklist
"-----------------------------------------------------------------------------
map <leader>cw :botright cw 10<cr>
map cn :cn<cr>
map cp :cp<cr>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

"-----------------------------------------------------------------------------
" FONCTIONS 
"-----------------------------------------------------------------------------

" first set path
set path+=**

"-----------------------------------------------------------------------------
" jump to a twig view in symfony
"-----------------------------------------------------------------------------
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

"-----------------------------------------------------------------------------
" create a mapping only in a Controller file
"-----------------------------------------------------------------------------
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>

"-----------------------------------------------------------------------------
" BClose
"-----------------------------------------------------------------------------
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
com! BClose call <SID>BufcloseCloseIt()


"-----------------------------------------------------------------------------
" MyNext() and MyPrev(): Movement between tabs OR buffers
"-----------------------------------------------------------------------------
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

"-----------------------------------------------------------------------------
" CloseHiddenBuffers
"-----------------------------------------------------------------------------
function! CloseHiddenBuffers()
    " Tableau pour memoriser la visibilite des buffers
    let visible = {}
    " Pour chaque onglet...
    for t in range(1, tabpagenr('$'))
        " Et pour chacune de ses fenetres...
        for b in tabpagebuflist(t)
            " On indique que le buffer est visible.
            let visible[b] = 1
        endfor
    endfor
    " Pour chaque numero de buffer possible...
    for b in range(1, bufnr('$'))
        " Si b est un numero de buffer valide et qu'il n'est pas visible, on le
        " supprime.
        if bufexists(b) && !has_key(visible, b)
            " On ferme donc tous les buffers qui ne valent pas 1 dans le tableau et qui
            " sont pourtant charges en memoire.
            execute 'bwipeout' b
        endif
    endfor
endfun
com! CloseHiddenBuffers call CloseHiddenBuffers()

"-----------------------------------------------------------------------------
" VisualSelection CloseHiddenBuffers
"-----------------------------------------------------------------------------
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"-----------------------------------------------------------------------------
" Source Explorer Plugin
"-----------------------------------------------------------------------------

"Below key mappings can replace the Vim feature for jumping to previously visited locations via jump list. 

"nmap <C-I> <C-W>j:call g:SrcExpl_Jump()<CR> 
"nmap <C-O> :call g:SrcExpl_GoBack()<CR> 

""The typical actions using srcexpl.vim are: 

""a\ Move the cursor onto a symbol word. 
""b\ As soon as the definition of the word is displayed on the preview window, we type <Ctrl-j> to jump into the previw window. 
""c\ Type the SrcExpl_jumpKey(<ENTER> as default) to jump to the exact context of its definition. 
""d\ Type the SrcExpl_gobackKey(<SPACE> as default) to go back to the previous position of the symbol word. 

""There are some screenshots on the website: http://srcexpl.blogspot.com/
 
""install details
""1\ Copy this srcexpl.vim script file to the plugin directory of Vimfiles, such as ~/.vim/plugin/ 

""2\ Add the followings in your .vimrc or _vimrc and change them by yourself 

"" // The switch of the Source Explorer 
"nmap <F8> :SrcExplToggle<CR> 
"" // Set the height of Source Explorer window 
"let g:SrcExpl_winHeight = 8 
"" // Set 100 ms for refreshing the Source Explorer 
"let g:SrcExpl_refreshTime = 1000
"" // Set "Enter" key to jump into the exact definition context 
"let g:SrcExpl_jumpKey = "<ENTER>" 
"" // Set "Space" key for back from the definition context 
"let g:SrcExpl_gobackKey = "<BS>" 
"" // In order to Avoid conflicts, the Source Explorer should know what plugins 
"" // are using buffers. And you need add their bufname into the list below 
"" // according to the command ":buffers!" 
"let g:SrcExpl_pluginList = [ 
"        \ "__Tag_List__", 
"        \ "_NERD_tree_", 
"        \ "Source_Explorer" 
"    \ ] 
"" // Enable/Disable the local definition searching, and note that this is not 
"" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
"" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1 
"" // Do not let the Source Explorer update the tags file when opening 
"let g:SrcExpl_isUpdateTags = 0 
"" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
"" //  create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
"" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 


"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------

iab Acheive    Achieve
iab acheive    achieve
iab Alos       Also
iab alos       also
iab Aslo       Also
iab aslo       also
iab Becuase    Because
iab becuase    because
iab Bianries   Binaries
iab bianries   binaries
iab Bianry     Binary
iab bianry     binary
iab Charcter   Character
iab charcter   character
iab Charcters  Characters
iab charcters  characters
iab Exmaple    Example
iab exmaple    example
iab Exmaples   Examples
iab exmaples   examples
iab Fone       Phone
iab fone       phone
iab Lifecycle  Life-cycle
iab lifecycle  life-cycle
iab Lifecycles Life-cycles
iab lifecycles life-cycles
iab Seperate   Separate
iab seperate   separate
iab Seureth    Suereth
iab seureth    suereth
iab Shoudl     Should
iab shoudl     should
iab Taht       That
iab taht       that
iab Teh        The
iab teh        the

ab #d #define
ab #i #include
ab #b /************************************************
ab #e ************************************************/
ab #l /*----------------------------------------------*/


if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
endif

 "Disable all blinking:
set guicursor+=a:blinkon0
" Remove previous setting:
set guicursor-=a:blinkon0
" Restore default setting:
set guicursor&

set formatoptions+=or
