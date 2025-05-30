return {
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    { "nvchad/volt", lazy = true },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "eslint-lsp",
                "lua-language-server",
                "tailwindcss-language-server",
                "typescript-language-server",
                "stylua",
                "clangd",
                "gopls",
                "html-lsp",
                "css-lsp",
                "prettierd",
            },
        },
    },



    { "terrortylor/nvim-comment" },

    { "mfussenegger/nvim-dap" },

    {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async'
    },

    { 'wbthomason/packer.nvim' },

}
