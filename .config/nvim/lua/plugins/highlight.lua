-- Code highlighting

return {
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "mrjones2014/nvim-ts-rainbow",
    },
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "bash",
        "clojure",
        "help",
        "html",
        "javascript",
        "json",
        "go",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
    require("nvim-treesitter.configs").setup({
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
    }),
  },
}
