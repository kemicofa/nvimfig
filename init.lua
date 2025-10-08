print("Kemicofa NVIM setup")

require("config.globals")
require("config.keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins/*
require("lazy").setup("plugins",
    { ui = { border = "rounded" }, install = { missing = true }, checker = { enabled = true } })

-- Enable native LSP servers AFTER plugins are ready
-- (VeryLazy fires once Lazy finishes lazy-loading core stuff)
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        -- Matches the filenames in lua/lsp/*.lua
        vim.lsp.enable({ "lua_ls", "svelte", "rust_analyzer" })
        require("config.autocmd")
        require("config.lsp")
        require("config.options")
    end,
})
