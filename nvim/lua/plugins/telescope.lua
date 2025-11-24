return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      -- This section initializes and sets up fuzzyfinder(telescope)
      local builtin = require("telescope.builtin") -- imports telescopes builtin funcitons like finding files etc
      vim.keymap.set('n', '<C-f>', builtin.find_files, {})  -- set keymap to find files that will work in normal mode 'n' and         uses combo CTRL + f
      vim.keymap.set('n', '<leader>lg', builtin.live_grep, {}) -- set keymap to find all files that contain certain text/part         that works in normal mode and uses leader(space-bar) + lg combo
  end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    -- This is opts table
      config = function()
        require("telescope").setup {
          extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select") 
      end,
  },
}
