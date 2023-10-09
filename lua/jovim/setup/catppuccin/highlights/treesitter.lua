local C = require('jovim.setup.catppuccin.utils').palette

return {
    ["@keyword.return"] = { fg = C.mauve },
	["@constructor"] = { fg = C.blue },
	["@pyconstructor"] = { fg = C.sapphire },
	Type = { fg = C.text },
	["@classes"] = { fg = C.yellow },
	["@colon"] = { fg = C.teal },
	["@type.builtin"] = { fg = C.peach },
	["@pyliteral"] = { fg = C.mauve, style = {} },
}