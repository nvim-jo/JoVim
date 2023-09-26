local M = {}

M.icons = {
    typescript = "󰛦",
    javascript = "",
    env = "",
    packagejson = "",
    json = "ﬥ",
    yaml = "",
    markdown = "",
    gitignore = "",
    python = "",
    toml = "",
    lock = "",
    txt = ""
}

M.setup = function()
    require 'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
            ["ts"] = {
                icon = M.icons.typescript,
                color = "#89B4FA",
                cterm_color = "74",
                name = "Ts",
            },
            ["js"] = {
                icon = M.icons.javascript,
                color = "#f9e2af",
                cterm_color = "220",
                name = "Js",
            },
            [".env"] = {
                icon = M.icons.env,
                color = "#fab387",
                cterm_color = "227",
                name = "Env"
            },
            ["package.json"] = {
                icon = M.icons.packagejson,
                color = "#a6e3a1",
                name = "PackageJson"
            },
            ["json"] = {
                icon = M.icons.json,
                color = "#f9e2af",
                name = "Json"
            },
            ["md"] = {
                icon = M.icons.markdown,
                color = "#94e2d5",
                cterm_color = "75",
                name = "Md",
            },
            [".gitignore"] = {
                icon = M.icons.gitignore,
                color = "#fab387",
                cterm_color = "166",
                name = "GitIgnore",
            },
            ["py"] = {
                icon = M.icons.python,
                color = "#f9e2af",
                cterm_color = "214",
                name = "Py"
            },
            ["lock"] = {
                icon = M.icons.lock,
                color = "#f38ba8",
                cterm_color = "221",
                name = "Lock",
            },
            ["txt"] = {
                icon = M.icons.txt,
                color = "#CDD6F4",
                cterm_color = "113",
                name = "Txt",
            },
        },
        default = true,
        strict = true,
        override_by_filename = {
            ["requirements.txt"] = {
                icon = "",
                color = "#CDD6F4",
                name = "RequirementsTxt"
            }
        },
        override_by_extension = {
            ["yaml"] = {
                icon = M.icons.yaml,
                color = "#f38ba8",
                name = "Yaml",
            },
            ["yml"] = {
                icon = M.icons.yaml,
                color = "#f38ba8",
                name = "Yml",
            },
            ["toml"] = {
                icon = M.icons.toml,
                color = "#f5c2e7",
                name = "Toml",
            },
            ["mp4"] = {
                icon = "",
                color = "#cba6f7",
                name = "Mp4"
            },
            ["jpg"] = {
                icon = "",
                color = "#b4befe",
                name = "Jpg",
            },
            ["png"] = {
                icon = "",
                color = "#b4befe",
                name = "Png",
            },
        }
    }

    require('nvim-web-devicons').set_default_icon('󰈔', '#89b4fa', 65)
end

return M