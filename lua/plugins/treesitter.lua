return {
        "nvim-treesitter/nvim-treesitter",

        opts = {
            dependencies = { },
            autotag = { enable = true },
            autopairs = { enable = true },
            ensure_installed = {
                "vim",
                "vimdoc",
                "html",
                "css",
                "bash",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "cpp",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    }
