local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<cmd>:NvimTreeToggle<CR>", "NvimTree" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["N"] = { "<cmd>Non<cr>", "Clear left sidebar" },
  ["n"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Diagnostic next" },
  ["p"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Diagnostic prev" },
  ["P"] = { '"+p', "Paste from system clippboard" },
  ["r"] = { "<cmd>RangerCurrentDirectoryNewTab<CR>", "Ranger" },
  ["R"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["v"] = { "<cmd>vert diffsplit |bp|windo diffthis<cr>", 'Diff current and next buffer', },
  ["w"] = { "<cmd>w<CR>", "Save" },
  ["s"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" },
  ["c"] = { "<cmd>wincmd c<CR>", "Close window" },
  ["C"] = { "<cmd>Bclose<CR>", "Close buffer" },
  ["q"] = { "<cmd>qa<CR>", "Quit all windows" },
  ["m"] = { "<cmd>MinimapToggle<CR>", "Toggle minimap" },

  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files find_command=rg,--files<cr>", "Find files", },
    F = { "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<cr>", "Find files [no-ignore,hidden]", },
    r = { "<cmd>Telescope live_grep<cr>", "Find Text (ripgrep)" },
    G = { "<cmd>Telescope git_files<cr>", "Git files" },
    g = { "<cmd>Telescope git_files show_untracked=false recurse_submodules=true use_git_root=true<cr>", "Git files + submodules" },
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
  },

  g = {
    name = "Git",
    g = { "<cmd>Git<cr>", "Fugitive" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  o = {
    name = "Org",
    o = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch header/source" },
  },

  l = {
    name = "LSP",
    K = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "* Hover inspect" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "*g Goto definition" },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "*g Goto declaration" },
    i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "*g Goto implementation" },
    o = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "*g Goto type definition" },
    r = { "<Cmd>lua vim.lsp.buf.references()<CR>", "*g List references, quickfix" },
    k = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "*Ctrl Signature info, floating" },
    R = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename all references" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action at position" },

    E = { "<cmd>Telescope lsp_references<CR>", "List symbol uses, Telescope" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    g = { "<cmd>lua vim.diagnostic.show()<CR>", "Show Diagnostic" },
    G = { "<cmd>lua vim.diagnostic.hide()<CR>", "Hide Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    Q = { "<Cmd>lua vim.diagnostic.setqflist()<CR>", "Open all project diagnostics in quickfix list" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
  },

  t= {
    name = "TeleScope",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  T = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  a = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    C = { "<cmd>PackerClean<cr>", "Clean" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  u = {
    name = "Substitute",
    l = { ":s//g<Left><Left>", "Line" },
    F = { ":%s//g<Left><Left>", "File, no confirm" },
    f = { ":%s//gc<Left><Left><Left>", "File, confirm" },
    -- map('v', '<leader>s', ':s//g<Left><Left>', { desc = 'Populate substitution' })
    -- map('v', '<leader><A-s>', ':%s//g<Left><Left>', { desc = 'Populate substitution' })
    -- map('v', '<leader>S', ':%s//gc<Left><Left><Left>', { desc = 'Populate substitution' })
  },
}

local vmappings = {
  ["y"] = { '"+y', "Copy to system clippboard" },
  ["p"] = { '"+p', "Paste from system clippboard" },
  u = {
    name = "Substitute",
    l = { ":s//g<Left><Left>", "Line" },
    f = { ":%s//g<Left><Left>", "File, no confirm" },
    s = { ":%s//gc<Left><Left><Left>", "File" },
  },
}

-- which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)

-- vim: sw=2 ts=2 sts=2 nowrap
