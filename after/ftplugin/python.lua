local Util = require("jovim.util")

local map = Util.safe_buf_keymap_set

map("n", "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format code" })