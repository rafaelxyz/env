" Startify

" Show [e] and [q] options
let g:startify_enable_special = 1

" Change directory when opening file using Startify
let g:startify_change_to_dir  = 1  " This is the default value

" Add bashrc and nvim config files
let g:startify_bookmarks = [
  \ {'b': '~/.bash_aliases'},
  \ {'i': '~/.config/nvim/init.lua'},
  \ {'p': '~/.config/nvim/lua/plugins.lua'},
  \ {'m': '~/.config/nvim/lua/keymaps.lua'},
  \ {'o': '~/.config/nvim/lua/options.lua'},
  \ {'s': '~/.config/nvim/lua/plugins/startify.vim'},
  \ {'w': '~/.config/nvim/lua/plugins/which-key.lua'},
  \ {'~': '~/env/'},
  \ ]

" Change list order
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   Recent Files']            },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

" Make sessions save on quit and SLoad
let g:startify_session_persistence = 0
