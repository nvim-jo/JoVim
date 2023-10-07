local C = require('jovim.setup.catppuccin.utils').palette

local active_bg = C.mantle
local inactive_bg = C.base

return {
    JoTreeDirectoryName = { fg = C.blue },
    JoTreeDirectoryIcon = { fg = C.blue },
    JoTreeExpander = { fg = C.overlay0 },
    JoTreeSymbolicLinkTarget = { fg = C.pink },

    JoTreeGitAdded = { fg = C.green },
    JoTreeGitConflict = { fg = C.red },
    JoTreeGitDeleted = { fg = C.red },
    JoTreeGitIgnored = { fg = C.overlay0 },
    JoTreeGitModified = { fg = C.yellow },
    JoTreeGitUnstaged = { fg = C.red },
    JoTreeGitUntracked = { fg = C.blue },
    JoTreeGitStaged = { fg = C.green },

    JoTreeFloatBorder = { link = "FloatBorder" },
    JoTreeFloatTitle = { link = "FloatTitle" },

    JoTreeFileNameOpened = { fg = C.pink },
    JoTreeDimText = { fg = C.overlay1 },
    JoTreeFilterTerm = { fg = C.green, style = { "bold" } },
    JoTreeTabActive = { bg = active_bg, fg = C.lavender, style = { "bold" } },
    JoTreeTabInactive = { bg = inactive_bg, fg = C.overlay0 },
    JoTreeTabSeparatorActive = { fg = active_bg, bg = active_bg },
    JoTreeTabSeparatorInactive = { fg = inactive_bg, bg = inactive_bg },
    JoTreeVertSplit = { fg = C.base, bg = inactive_bg },
    JoTreeStatusLineNC = { fg = C.mantle, bg = C.mantle },

    JoTreeRootName = { fg = C.lavender, style = { "bold" } },
    JoTreeNormal = { fg = C.text, bg = C.none },
    JoTreeNormalNC = { fg = C.text, bg = C.mantle },
    -- JoTreeTabActive = { bg = C.mantle, fg = C.lavender, style = { "bold" } },
    -- JoTreeTabInactive = { bg = C.base, fg = C.overlay0 },
    JoTreeIndentMarker = { fg = C.blue },
}