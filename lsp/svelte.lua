return {
    cmd = { "svelteserver", "--stdio" }, -- installed by Mason
    filetypes = { "svelte" },
    root_markers = {
        "svelte.config.js", "svelte.config.cjs", "svelte.config.mjs", "svelte.config.ts",
        "package.json", ".git",
    },
    settings = {
        svelte = {
            plugin = {
                typescript = { diagnostics = { enable = true } },
            },
        },
    },
}
