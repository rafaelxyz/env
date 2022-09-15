-- :h bufferline.vim

require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    show_buffer_close_icons = false,
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
        }
    },
  }
}
