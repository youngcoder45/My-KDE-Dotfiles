return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        local mason_null_ls = require("mason-null-ls")

        -- Mason-null-ls setup
        mason_null_ls.setup({
            ensure_installed = {
                "stylua",
                "prettier",
                "black",
                "clang_format",
                "yamllint",
                "markdownlint",
          --      "eslint_d",
                "pylint",
                "cpplint",
            },
            automatic_installation = true,
        })

        null_ls.setup({
            sources = {
              -- diagnostics
      --          require("none-ls.diagnostics.eslint_d"),
                require("none-ls.diagnostics.cpplint"),
                null_ls.builtins.diagnostics.yamllint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.pylint,
              -- formatters
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format,
            },
        })

        -- Keymap for formatting
        vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
    end,
}

