" vim_off_: set fdm=marker fmr={{{,}}}:
":SignifyDisable | ALEDisable | set nonumber

let mapleader="\<tab>"

"" Plugins {{{
    call plug#begin('~/.config/nvim/plugged')
        " Must have
        Plug 'romainl/apprentice' " colorscheme
        Plug 'endel/vim-github-colorscheme'
        Plug 'altercation/vim-colors-solarized'
        Plug 'raimondi/delimitmate' " autoclose braces etc.
        Plug 'ntpeters/vim-better-whitespace' " show and :StripWhitespace
        Plug 'christoomey/vim-tmux-navigator' " seamless navigation between tmux and vim windows
        Plug 'tpope/vim-fugitive' " git
        Plug 'mhinz/vim-signify', " show modified lines, for git etc
        let g:signify_vcs_list = [ 'git' ]
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        nmap <leader>z :FZF<cr>
        Plug 'derekwyatt/vim-fswitch' " header/source switcher
        au! bufenter *.c,*.cc let b:fswitchdst = 'hh,h'
        au! bufenter *.h,*.hh let b:fswitchdst = 'cc,c,cpp'
        nmap <leader>s :FSHere<CR>
        Plug 'ludovicchabant/vim-gutentags'
        let g:gutentags_project_root = ['.git']
        Plug 'majutsushi/tagbar' " tagbar on the right
        nmap <leader>t :TagbarToggle<cr>
        " Extras
        Plug 'octol/vim-cpp-enhanced-highlight' " ?
        Plug 'ryanoasis/vim-devicons'
        Plug 'rafaelxyz/vim-msgcolor', " color for syslog
        Plug 'machakann/vim-highlightedyank' " colormark yanked section
        Plug 'itchyny/lightline.vim' " nice status line
        let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': { 'left': [ [ 'mode', 'paste' ], ['fugitive', 'readonly', 'filename', 'modified' ] ] },
            \ 'component': { 'lineinfo': '%3l:%-2v' },
            \ 'component_function': { 'fugitive': 'LightlineFugitive', 'readonly': 'LightlineReadonly' },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
        set laststatus=2 " show lightline
        set noshowmode " hide -- INSERT --
        function! LightlineReadonly()
            return &readonly ? '' : ''
        endfunction
        function! LightlineFugitive()
            if exists('*fugitive#head')
                let branch = fugitive#head()
                return branch !=# '' ? ''.branch : ''
            endif
            return ''
        endfunction
        Plug 'w0rp/ale'  " linting
        Plug 'mizuchi/vim-ranger'
        nnoremap <leader>r :tabe %:p:h<cr>
        Plug 'neomake/neomake' " Run Neomake to syntax check
        Plug 'sbdchd/neoformat'
        Plug 'roxma/vim-tmux-clipboard'
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    call plug#end()
" }}}

" Settings {{{
    syntax on
    set background=light
    colorscheme solarized
    set autoindent softtabstop=4 shiftwidth=4 expandtab
    "set inccommand=split
    set number " line numbers on
    set grepprg=grep\ -nIir
    let g:xml_syntax_folding=1
" }}}

" Keyboard mapping {{{
    " use C-v in insert mode to grab correct keycode
    nmap <leader>1 :tjump <C-R><C-W> <CR>
    nmap <leader>2 :tselect <C-R><C-W> <CR>
    nmap <space> :
    nmap <silent> <bslash> :silent noh<bar>echo<cr>
    nmap è :bp<cr>
    nmap ì :bn<cr>
    nmap ê :tabp<cr>
    nmap ë :tabn<cr>
    map <F8> :set invpaste<CR>
    set pastetoggle=<F8>
    " special keys
    nmap ! :bd<cr>
    map § :wincmd q<cr>
    map ä <c-d>
    map å <c-u>
    map ° :qa <cr>
    imap ö <esc>
    vmap ö <esc>
    nmap ö :w<cr>
    " leader keys
    nmap <leader>w <C-w>v<C-w>l :bp<cr>
    nmap <leader>v :e $MYVIMRC<cr>
    nmap <leader>V :so $MYVIMRC<cr>
    " indent entire section after a paste
    nmap <leader>< '[<lt>']|nmap <leader>> '[>']
    nmap <leader>h :set list! <cr>
    " use the same commands to step items for both quickfix and location list
    nmap <leader>n :silent! lnext \| silent! cnext <cr>
    nmap <leader>p :silent! lprevious \| silent! cprevious <cr>
    " Short version of window switching
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
" }}}

" Functions {{{
" }}}

" Autocommands {{{
    au filetype xml setlocal foldmethod=syntax foldlevel=999 tabstop=2 shiftwidth=2
    au filetype groovy setlocal syntax=off
    au filetype text setlocal textwidth=78
    au filetype cpp setlocal softtabstop=2 shiftwidth=2
    au filetype * set fo-=c fo-=r fo-=o " Removes comment auto formating, must be after filetype
    au bufreadpost syslog* SyslogSed
    au bufreadpost syslog* set ft=messages
    au bufreadpost messages* set ft=messages
    " set previous line position when opening a file
    au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" }}}

" Colors {{{
    " fix clashing colors with the std namespace, cppSTLnamespace is from vim-cpp-enhanced-highlight
    "hi link cppstlnamespace typedef
    "hi easymotiontarget ctermbg=none ctermfg=green
    "hi easymotionshade  ctermbg=none ctermfg=blue
" }}}
