return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
  },
  lazy = false,

  config = function()
    vim.keymap.set('n', '<leader>f', ':Neotree filesystem toggle left<CR>', {}) -- sets keymap to open and close neo-tree

    vim.keymap.set('n', '<leader>e', function()  -- sets keymap and a function to switch between neo-tree and current file     and vice versa
    local ft = vim.bo.filetype
    if ft == "neo-tree" then
      vim.cmd("wincmd p") -- go back to previous window
    else
      vim.cmd("Neotree focus") -- focus Neo-tree if it's open
    end
    end, { desc = "Toggle focus between Neo-tree and file" })
  end,
}
