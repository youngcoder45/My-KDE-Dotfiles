return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt"
        },
        c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt && rm /tmp/$fileNameWithoutExt",
        cpp = {
          "cd $dir &&",
          "g++ $fileName -o /tmp/$fileNameWithoutExt &&",
          "/tmp/$fileNameWithoutExt"
        },
        javascript = "node",
        html = "xdg-open",
        go = "go run",
        php = "php",
        lua = "lua",
        bash = "bash",
        sh = "sh"
      },
    })

    -- Keybinding: Ctrl+R to run code
    vim.keymap.set("n", "<C-r>", ":RunCode<CR>", { noremap = true, silent = false })
  end
}

