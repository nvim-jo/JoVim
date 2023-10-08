-- This file is automatically loaded by jovim.config.init
local Util = require("jovim.util")
local wk = require("which-key")
local get_icon = Util.get_icon

local map = Util.safe_keymap_set

local function which_map(mode, mappings, opts)
  wk.register(mappings, {
    mode = mode,
    opts
  })
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "<C-S-j>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<C-S-k>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<C-PageUp>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<C-PageDown>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<C-S-j>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<C-S-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<C-x>", function() require("mini.bufremove").delete(0, false) end, { desc = "Delete Buffer"})
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = get_icon("Switch", 1, true).."Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = get_icon("Switch", 1, true).."Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- --keywordprg
-- map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>li", "<cmd>Lazy<cr>", { desc = "Info Lazy" })
map("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "Synchronize Lazy" })

-- new file
map("n", "<leader>n", "<cmd>enew<cr>", { desc = get_icon("FileNew", 1, true).."New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- lazygit
map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- JoVim Changelog
map("n", "<leader>ju", "<cmd>JoVimUpdate<cr>", {desc = "Update JoVim"})

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root(), border = "rounded" }) end
map("n", "<c-/>", lazyterm, { desc = get_icon("Terminal", 1, true).."Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = get_icon("SplitHorizontal", 1, true).."Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = get_icon("SplitVertical", 1, true).."Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = get_icon("SplitHorizontal", 1, true).."Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = get_icon("SplitVertical", 1, true).."Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


-- toggle
map("n", "<leader>tt", lazyterm, { desc = get_icon("Terminal", 1, true).."Terminal (root dir)" })
map("n", "<leader>tT", function() Util.float_term(nil, { border = "rounded" }) end, { desc = get_icon("Terminal", 1, true).."Terminal (cwd)" })
map("n", "<leader>tn", "<cmd>Notepad<cr>", { desc = get_icon("Note", 1, true).."Notepad" })
map("n", "<leader>tc", function() require('conceal').toggle_conceal() end, { desc = get_icon("Conceal", 1, true).."Conceal", silent = true })
map("n", "<leader>tf", require("jovim.plugins.lsp.format").toggle, { desc = get_icon("Format", 1, true).."Format on Save" })
map("n", "<leader>ts", function() Util.toggle("spell") end, { desc = get_icon("Spellcheck", 1, true).."Spelling" })
map("n", "<leader>tw", function() Util.toggle("wrap") end, { desc = get_icon("WordWrap", 1, true).."Word Wrap" })
map("n", "<leader>tl", function() Util.toggle_number() end, { desc = get_icon("LineNumber", 1, true).."Line Numbers" })
map("n", "<leader>td", Util.toggle_diagnostics, { desc = get_icon("Diagnostic", 1, true).."Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>tC", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = get_icon("Conceal", 1, true).."Conceal (base)" })
if vim.lsp.inlay_hint then
  map("n", "<leader>th", function() vim.lsp.inlay_hint(0, nil) end, { desc = get_icon("Bulb", 1, true).."Inlay Hints" })
end

-- file manager
map("n", "<leader>o", function()
  require("fm").toggle_float()
end, { desc = get_icon("FileCabinet", 1, true).."File Manager"})

-- file explorer
map("n", "<leader>e", function()
  require("jo-tree.command").execute({ toggle = true, dir = require("jovim.util").get_root() })
end, { desc = get_icon("FileTree", 1, true).."File Explorer", remap = true })

-- file browser
-- map("n", "<leader>E", function()
--   require "telescope".extensions.file_browser.file_browser()
-- end, { desc = get_icon("Path", 1, true).."File Browser", noremap = true})

which_map({"n", "v"}, {
  ["<leader><tab>"] = { name = get_icon("Tab", 1, true).."Tabs" },
  ["<leader>b"] = { name = get_icon("Buffer", 1, true).."Buffer" },
  ["<leader>c"] = { name = get_icon("Code", 1, true).."Code" },
  ["<leader>f"] = { name = get_icon("Find", 1, true).."Find" },
  ["<leader>g"] = { name = get_icon("Git", 1, true).."Git" },
  ["<leader>gh"] = { name = "+hunks" },
  ["<leader>q"] = { name = get_icon("Session", 1, true).."Session" },
  ["<leader>s"] = { name = get_icon("Search", 1, true).."Search" },
  ["<leader>u"] = { name = get_icon("UI", 1, true).."UI" },
  ["<leader>w"] = { name = get_icon("Window", 1, true).."Windows" },
  ["<leader>x"] = { name = get_icon("Diagnostic", 1, true).."Diagnostics" },
  ["<leader>j"] = { name = get_icon("Vim", 1, true).."JoVim" },
  ["<leader>l"] = { name = get_icon("Lazy", 1, true).."Lazy" },
  ["<leader>t"] = { name = get_icon("Toggle", 1, true).."Toggle"}
}, {})