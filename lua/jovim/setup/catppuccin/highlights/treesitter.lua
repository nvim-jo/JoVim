local C = require('jovim.setup.catppuccin.utils').palette

return {
	-- Python only
	["@type.python"] = { fg = C.yellow },
	["@type.builtin.python"] = { fg = C.peach },
	["@type.definition.python"] = { fg = C.yellow },
	["@property.python"] = { fg = C.blue },
	["@field.python"] = { fg = C.text },
	["@classes"] = { fg = C.yellow },
	["@colon"] = { fg = C.teal },
	["@pyliteral"] = { fg = C.mauve, style = {} },

	["@constructor.python"] = { fg = C.blue },
	["@pyargs"] = { fg = C.red },
	["@pybuiltin"] = { fg = C.text },
	["@pyconstructor"] = { fg = C.sapphire },
	["@pyor"] = { fg = C.yellow },
	["@pyarrow"] = { fg = C.text },
	-- ["@parameter.reference"] = { fg = C.blue },
	-- Type = { fg = C.text },
	

	["@keyword.return"] = { fg = C.mauve },
}