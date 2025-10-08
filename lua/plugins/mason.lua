return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })


            require("config.mason_ensure").setup({
                "lua-language-server",
                "svelte-language-server",
                "rust-analyzer",
                "codelldb",
                "taplo",
                "prettierd",
                "prettier"
            })
        end,
    },
}
