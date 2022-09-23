-- :h bufferline.vim

require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = { '|', '|' },
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
        }
    },
  },
}
