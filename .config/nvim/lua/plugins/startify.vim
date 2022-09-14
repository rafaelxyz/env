" Startify

" Show [e] and [q] options
let g:startify_enable_special = 1

" Change directory when opening file using Startify
let g:startify_change_to_dir  = 1  " This is the default value

" Add bashrc and nvim config files
let g:startify_bookmarks = [
  \ {'b': '~/env/config/bashrc'},
  \ {'i': '~/env/config/init.lua'},
  \ {'p': '~/env/nvim/lua/plugins.lua'},
  \ {'m': '~/env/nvim/lua/keymaps.lua'},
  \ {'o': '~/env/nvim/lua/options.lua'},
  \ {'s': '~/env/nvim/lua/plugins/startify.vim'},
  \ {'w': '~/env/nvim/lua/plugins/which-key.lua'},
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
