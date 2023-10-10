local C = require('jovim.setup.catppuccin.utils').palette

return {
    ["@keyword.return"] = { fg = C.mauve },
	["@constructor"] = { fg = C.blue },
	["@pyargs"] = { fg = C.red },
	["@pybuiltin"] = { fg = C.text },
	["@pyconstructor"] = { fg = C.sapphire },
	["@pyor"] = { fg = C.yellow },
	["@pyarrow"] = { fg = C.text },
	["@parameter.reference"] = { fg = C.blue },
	-- Type = { fg = C.text },
	["@classes"] = { fg = C.yellow },
	["@colon"] = { fg = C.teal },
	["@type.builtin"] = { fg = C.peach },
	["@pyliteral"] = { fg = C.mauve, style = {} },
	["@include.python"] = { fg = C.text },
	["@odp.import_module.python"] = { fg = C.text },
    ["@odp.keyword.class.python"] = { fg = C.blue },
}