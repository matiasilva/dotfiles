return {
  -- Enable LazyVim's Typst support: tinymist LSP, the typst treesitter parser,
  -- typstyle formatter, and typst-preview.nvim. Imported here (rather than via
  -- lazyvim.json) so this overlay file is self-contained on a fresh clone.
  --
  -- Font paths are intentionally NOT set here — they're project-specific. Each
  -- project supplies its own via the TYPST_FONT_PATHS env var (e.g. a `just edit`
  -- recipe), which tinymist honours for both the LSP and the preview process.
  { import = "lazyvim.plugins.extras.lang.typst" },
}
