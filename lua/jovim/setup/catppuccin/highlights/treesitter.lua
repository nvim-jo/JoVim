local C = require('jovim.setup.catppuccin.utils').palette

return {
    ["@keyword.return"] = { fg = C.mauve },
	["@constructor"] = { fg = C.blue },
	["@pyconstructor"] = { fg = C.sapphire },
	Type = { fg = C.text },
	["@classes"] = { fg = C.yellow },
	["@colon"] = { fg = C.teal },
	["@boolean"] = { fg = C.mauve, style = {} },
	["@type.builtin"] = { fg = C.peach },
}