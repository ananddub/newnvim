-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls","gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end


-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        require("conform").format {
            timeout_ms = 500,
            lsp_fallback = true,
        }
    end,
})
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }
vim.g.loaded_node_provider = 1
vim.g.loaded_python3_provider = 1
-- vim.g.loaded_ruby_provider = 1
-- vim.g.loaded_perl_provider = 1
-- vim.g:python3_host_prog = '/usr/bin/python3'

-- Transparent background ke liye settings false then
require("nvim_comment").setup()

require("nvim-treesitter.configs").setup {
    refactor = {
        highlight_definitions = {
            enable = true,
        },
        highlight_current_scope = {
            enable = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
}


local on_attachc = function(client, bufnr)
    client.server_capabilities.server_capabilities = false
    on_attach(client, bufnr)
end

local capabilitiesc = vim.lsp.protocol.make_client_capabilities()

lspconfig.clangd.setup {
    on_attach = on_attachc,
    capabilities = capabilities,
}
lspconfig.pyright.setup {
    on_attach = on_attachc,
    capabilities = capabilities,
}

require('nvim-ts-autotag').setup({
    opts = {
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    per_filetype = {
        ["html"] = {
            eenable_rename = true,
            enable_close_on_slash = false,
            nable_close = false
        },
        ["jsx"] = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = false
        },
        ["tsx"] = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = false
        },
    }
})


require("flutter-tools").setup {
    widget_guides = {
        enabled = true,
    },

}




