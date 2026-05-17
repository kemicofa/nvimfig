# nvimfig

Personal Neovim configuration. Requires Neovim 0.12+.

## Requirements

- Neovim >= 0.12
- `git`, `curl`, `tar`
- A C compiler (`gcc` / `clang`) — for treesitter
- `tree-sitter` CLI — for installing/compiling new parsers (`pacman -S tree-sitter` or `cargo install tree-sitter-cli`)
- `prettierd` or `prettier` — JS/TS/CSS/HTML/Markdown/YAML formatting
- `rustfmt` — Rust formatting
- A [Nerd Font](https://www.nerdfonts.com/) (mono variant)

## Installation

```sh
git clone git@github.com:kemicofa/nvimfig.git ~/.config/nvim
nvim  # lazy.nvim bootstraps and installs plugins on first launch
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [rose-pine](https://github.com/rose-pine/neovim) | Colorscheme (moon variant, transparent) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting + indent (`main` branch) |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + mason-lspconfig | LSP setup (lua_ls, rust_analyzer) |
| [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | TypeScript/JavaScript LSP |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Rendered Markdown in buffer |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |

## Keymaps

Leader key: `<Space>`

### General

| Key | Action |
|-----|--------|
| `<leader>pv` | Open netrw (file explorer) |
| `<leader>f` | Format buffer (conform) |
| `<leader>y` | Yank to system clipboard |
| `<leader>p` | Paste without overwriting register |
| `<leader>d` | Delete to void register |

### Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |
| `<C-d>` / `<C-u>` | Scroll half-page, cursor centred |
| `n` / `N` | Next/prev search result, cursor centred |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>gf` | Git files |

### LSP (on attach)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Implementation |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `[d` / `]d` | Prev/next diagnostic |
| `<leader>e` | Diagnostic float |

### Claude Code

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude sidebar |
| `<leader>as` | Send selection to Claude (visual) |
| `<leader>af` | Send file to Claude |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Reject diff |

### Visual Mode

| Key | Action |
|-----|--------|
| `J` / `K` | Move selected lines down/up |

## Treesitter Notes

Uses the `main` branch, which requires `tree-sitter` CLI for installing parsers.
Parsers are **not** auto-installed on startup. To install parsers manually:

```
:TSInstall lua vim vimdoc javascript typescript tsx rust json yaml toml bash markdown
```
