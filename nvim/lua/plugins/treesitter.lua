return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {"bufReadPost", "bufNewFile"},
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
          "bash", "c", "cpp", "lua", "python", "javascript", "typescript", "ruby", "go", "rust", "java",
          "html", "css", "scss", "json", "yaml", "toml", "tsx", "vue", "vim", "vimdoc", "query", "elixir",
          "heex", "haskell", "clojure", "markdown", "markdown_inline", "dockerfile", "make", "sql", "gitcommit", "regex"
      },
--      auto_install = true, -- automatically installs parsers whenever it encounters new language
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
