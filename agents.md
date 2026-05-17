# Agent Context: nvimfig

Quick-reference for AI agents working in this repo. Read this before touching files.

## File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point: lazy bootstrap, leader key, loads config.*
├── lazy-lock.json              # Plugin lockfile — update via :Lazy sync, commit result
├── lua/
│   ├── config/
│   │   ├── options.lua         # vim.opt settings (tabs, search, ui)
│   │   ├── keymaps.lua         # Global keymaps (leader mappings, window nav)
│   │   └── autocmds.lua        # Global autocmds (yank highlight)
│   └── plugins/
│       ├── claudecode.lua      # Claude Code sidebar integration
│       ├── colorscheme.lua     # rose-pine (moon, transparent)
│       ├── completion.lua      # blink.cmp
│       ├── formatting.lua      # conform.nvim (format-on-save)
│       ├── lsp.lua             # mason + nvim-lspconfig + mason-lspconfig
│       ├── markdown.lua        # render-markdown.nvim
│       ├── telescope.lua       # Fuzzy finder
│       ├── treesitter.lua      # nvim-treesitter (main branch)
│       └── typescript.lua      # typescript-tools.nvim
```

## Adding a Plugin

Create a new file in `lua/plugins/`. lazy.nvim auto-discovers all files in that directory.
Return a single plugin spec table or a list of tables. No registration needed elsewhere.

## LSP Setup Pattern

Uses Neovim 0.11+ native LSP API — **not** the old `lspconfig.setup({...})` pattern.

```lua
vim.lsp.config("server_name", { capabilities = ..., settings = { ... } })
vim.lsp.enable({ "server_name" })
```

Add new LSP servers in `lua/plugins/lsp.lua`:
1. Add to `mason-lspconfig` `ensure_installed` list
2. Call `vim.lsp.config(...)` with settings
3. Add to `vim.lsp.enable({...})`

Capabilities come from `require("blink.cmp").get_lsp_capabilities()` — pass to all servers.

## Treesitter Quirks

- Uses `branch = "main"` (incompatible with old `master` branch API)
- `lazy = false` — upstream docs state this plugin doesn't support lazy-loading
- Parser install requires `tree-sitter` CLI binary (not installed by default on this machine)
- Do **not** call `require("nvim-treesitter.install").install({...})` in config — it runs async on every startup and fails with "no such file or directory" if tree-sitter CLI is absent
- Parsers installed via `:TSInstall <lang>` go to `~/.local/share/nvim/site/parser/`
- Pre-existing parsers live in `~/.local/share/nvim/lazy/nvim-treesitter/parser/` (both on rtp)

## Formatting

`conform.nvim` handles format-on-save. Formatters per filetype in `lua/plugins/formatting.lua`.
Uses `prettierd` (preferred) → `prettier` fallback for web filetypes. `rustfmt` for Rust.
`lsp_fallback = true` so LSP formatting kicks in if no formatter is configured.

## Completion

`blink.cmp` replaces nvim-cmp. Sources: LSP, path, snippets, buffer.
Documentation auto-shows after 200ms. Preset keymap: `default`.

## Known Non-obvious Decisions

- `opt.guicursor = ""` — block cursor in all modes (personal preference)
- `opt.colorcolumn = "80"` — 80-char ruler
- `opt.undodir` points to `~/.vim/undodir` (shared with vim, not nvim stdpath)
- Diagnostics use `virtual_lines = { current_line = true }` — inline diag only on current line
- `typescript-tools.nvim` is `ft`-lazy-loaded; does not go through mason (uses project tsserver)
- `render-markdown.nvim` is `ft`-lazy-loaded for `markdown` only
