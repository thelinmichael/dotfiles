return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = true,
    priority = 1000,
    keys = {
      {
        "<C-h>",
        "<C-U>TmuxNagivateLeft<CR>",
        { desc = "Go to left window" },
      },
      {
        "<C-j>",
        "<C-U>TmuxNagivateDown<CR>",
        { desc = "Go to window below" },
      },
      {
        "<C-k>",
        "<C-U>TmuxNagivateUp<CR>",
        { desc = "Go to window above" },
      },
      {
        "<C-l>",
        "<C-U>TmuxNagivateRight<CR>",
        { desc = "Go to right window" },
      },
    },
  },
}
