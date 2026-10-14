-- Open a URL (or owner/repo GitHub shorthand) under the cursor without a shell.
local function open_uri(uri)
  if not uri or uri == "" then
    return false
  end

  local _, err = vim.ui.open(uri)
  if err then
    vim.notify("Unable to open " .. uri .. ": " .. tostring(err), vim.log.levels.ERROR)
  end
  return true
end

function OpenURIUnderCursor()
  local word = vim.fn.expand("<cWORD>")

  -- Accept a full URL, including query strings and anchors.
  local uri = word:match("[%a][%w+%.%-]*://[^%s<>\"']+")
  if open_uri(uri) then
    return
  end

  -- Also accept GitHub shorthand: owner/repository.
  local owner, repo = word:match("^([%w_.%-]+)/([%w_.%-]+)")
  if owner and repo then
    open_uri("https://github.com/" .. owner .. "/" .. repo)
  end
end

vim.api.nvim_create_user_command("OpenURIUnderCursor", OpenURIUnderCursor, {})
