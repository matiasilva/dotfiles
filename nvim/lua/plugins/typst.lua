return {
  -- Enable LazyVim's Typst support: tinymist LSP, the typst treesitter parser,
  -- typstyle formatter, and typst-preview.nvim. Imported here (rather than via
  -- lazyvim.json) so this overlay file is self-contained on a fresh clone.
  { import = "lazyvim.plugins.extras.lang.typst" },

  -- Point tinymist at the vendored fonts so the live preview matches `just build`
  -- (the build injects `--font-path fonts` for New Computer Modern Sans, which
  -- Typst does not bundle). Deep-merged with the extra above, so
  -- formatterMode = "typstyle" from there is preserved.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            fontPaths = { "fonts" },
          },
        },
      },
    },
  },
}
