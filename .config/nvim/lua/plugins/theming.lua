return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
  {
    "igorgue/danger",
    priority = 1000,
    lazy = true,
    opts = {
      style = "dark",
    },
  },
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      --vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim", -- theme
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = { dark0_hard = "#0E1018" },
        overrides = {
          -- Comment = {fg = "#626A73", italic = true, bold = true},
          -- #736B62,  #626273, #627273
          Comment = { fg = "#81878f", italic = true, bold = true },
          Define = { link = "GruvboxPurple" },
          Macro = { link = "GruvboxPurple" },
          ["@constant.builtin"] = { link = "GruvboxPurple" },
          ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
          ["@text.note"] = { link = "TODO" },
          ["@namespace.latex"] = { link = "Include" },
          ["@namespace.rust"] = { link = "Include" },
          ContextVt = { fg = "#878788" },
          CopilotSuggestion = { fg = "#878787" },
          CocCodeLens = { fg = "#878787" },
          CocWarningFloat = { fg = "#dfaf87" },
          CocInlayHint = { fg = "#ABB0B6" },
          CocPumShortcut = { fg = "#fe8019" },
          CocPumDetail = { fg = "#fe8019" },
          DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
          -- fold
          Folded = { fg = "#fe8019", bg = "#3c3836", italic = true },
          FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
          SignColumn = { bg = "#fe8019" },
          -- new git colors
          DiffAdd = { bold = true, reverse = false, fg = "", bg = "#2a4333" },
          DiffChange = { bold = true, reverse = false, fg = "", bg = "#333841" },
          DiffDelete = { bold = true, reverse = false, fg = "#442d30", bg = "#442d30" },
          DiffText = { bold = true, reverse = false, fg = "", bg = "#213352" },
          -- statusline
          StatusLine = { bg = "#ffffff", fg = "#0E1018" },
          StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
          CursorLineNr = { fg = "#fabd2f", bg = "" },
          GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
          GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
          GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
          GruvboxRedSign = { fg = "#fb4934", bg = "" },
          GruvboxBlueSign = { fg = "#83a598", bg = "" },
          WilderMenu = { fg = "#ebdbb2", bg = "" },
          WilderAccent = { fg = "#f4468f", bg = "" },
          -- coc semantic token
          CocSemStruct = { link = "GruvboxYellow" },
          CocSemKeyword = { fg = "", bg = "#0E1018" },
          CocSemEnumMember = { fg = "", bg = "#0E1018" },
          CocSemTypeParameter = { fg = "", bg = "#0E1018" },
          CocSemComment = { fg = "", bg = "#0E1018" },
          CocSemMacro = { fg = "", bg = "#0E1018" },
          CocSemVariable = { fg = "", bg = "#0E1018" },
          -- CocSemFunction = {link = "GruvboxGreen"},
          -- neorg
          ["@neorg.markup.inline_macro"] = { link = "GruvboxGreen" },
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = true,
    name = "catppuccin",
    require("catppuccin").setup({
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        mason = true,
        -- lualine = true,
        leap = true,
        aerial = true,
        harpoon = true,
        neotest = true,
        ts_rainbow = true,
        lsp_trouble = true,
        which_key = true,
        telescope = true,
      },
    }),
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true,
    name = "kanagawa",
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
    end,
  },
}
