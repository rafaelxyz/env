-- Commands

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- Swap folder
vim.cmd('command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap')
vim.cmd('command! CleanSwap !rm -rf ~/.local/share/nvim/swap/')

-- Create ctags
vim.cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')

-- Clean up left sidebar
vim.cmd('command! No set nonumber! | Gitsigns toggle_signs')

-- Remember last line position
vim.api.nvim_exec([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]], false)

-- Open URI
function OpenURIUnderCursor()
  local function open_uri(uri)
    if type(uri) ~= 'nil' then
      uri = string.gsub(uri, "#", "\\#") --double escapes any # signs
      uri = '"'..uri..'"'
      vim.cmd('!open '..uri..' > /dev/null')
      vim.cmd('mode')
      print(uri)
      return true
    else
      return false
    end
  end

  local word_under_cursor = vim.fn.expand("<cWORD>")

  -- any uri with a protocol segment
  local regex_protocol_uri = "%a*:%/%/[%a%d%#%[%]%-%%+:;!$@/?&=_.,~*()]*"
  if (open_uri(string.match(word_under_cursor, regex_protocol_uri))) then return end

  -- consider anything that looks like string/string a github link
  local regex_plugin_url = "[%a%d%-%.%_]*%/[%a%d%-%.%_]*"
  if (open_uri('https://github.com/'..string.match(word_under_cursor, regex_plugin_url))) then return end
end
vim.api.nvim_create_user_command('OpenURIUnderCursor', OpenURIUnderCursor, {})
