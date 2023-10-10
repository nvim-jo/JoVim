local Util = require('jovim.util')

Util.safe_keymap_set("n", "<leader>cv", function() require('selenv.api').pick_venv() end, { desc = "Select Virtual Environment", buffer = true })
Util.safe_keymap_set("n", "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format", buffer = true })