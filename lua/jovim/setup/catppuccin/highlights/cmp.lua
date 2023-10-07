local C = require('jovim.setup.catppuccin.utils').palette

return {
	CmpBorder = {
		fg = C.blue,
		bg = C.none,
	},

    CmpDoc = { link = "NormalFloat" },
	CmpDocBorder = {
		fg = C.surface2,
		bg = C.none,
	},
    CmpItemAbbr = { fg = C.text },
    CmpItemAbbrDeprecated = { fg = C.overlay0, style = { "strikethrough" } },
    CmpItemKind = { fg = C.blue },
    CmpItemMenu = { fg = C.text },
    CmpItemAbbrMatch = { fg = C.blue, style = { "bold" } },
    CmpItemAbbrMatchFuzzy = { fg = C.blue, style = { "bold" } },

    -- kind support
    CmpItemKindSnippet = { fg = C.mauve },
    CmpItemKindKeyword = { fg = C.red },
    CmpItemKindText = { fg = C.teal },
    CmpItemKindMethod = { fg = C.blue },
    CmpItemKindConstructor = { fg = C.blue },
    CmpItemKindFunction = { fg = C.blue },
    CmpItemKindFolder = { fg = C.blue },
    CmpItemKindModule = { fg = C.blue },
    CmpItemKindConstant = { fg = C.peach },
    CmpItemKindField = { fg = C.green },
    CmpItemKindProperty = { fg = C.green },
    CmpItemKindEnum = { fg = C.green },
    CmpItemKindUnit = { fg = C.green },
    CmpItemKindClass = { fg = C.yellow },
    CmpItemKindVariable = { fg = C.flamingo },
    CmpItemKindFile = { fg = C.blue },
    CmpItemKindInterface = { fg = C.yellow },
    CmpItemKindColor = { fg = C.red },
    CmpItemKindReference = { fg = C.red },
    CmpItemKindEnumMember = { fg = C.red },
    CmpItemKindStruct = { fg = C.blue },
    CmpItemKindValue = { fg = C.peach },
    CmpItemKindEvent = { fg = C.blue },
    CmpItemKindOperator = { fg = C.blue },
    CmpItemKindTypeParameter = { fg = C.blue },
    CmpItemKindCopilot = { fg = C.teal },
}