return {
    cmd = { "rust-analyzer" }, -- Mason provides this binary
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json", ".git" },

    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
                buildScripts = { enable = true },
            },
            check = {
                command = "clippy", -- needs `rustup component add clippy`
            },
            inlayHints = { enable = true },
            procMacro = { enable = true },
        },
    },
}
