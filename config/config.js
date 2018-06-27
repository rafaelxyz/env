let map = (shortcuts, command, custom=false) => {
  vimfx.set(`${custom ? 'custom.' : ''}mode.normal.${command}`, shortcuts)
}

map('ä', 'scroll_half_page_down')
map('å', 'scroll_half_page_up')
map('§', 'tab_close')
map('<c-o>', 'history_back')
