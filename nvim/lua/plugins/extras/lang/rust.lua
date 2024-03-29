local install_root_dir = vim.fn.stdpath("data") .. "/mason"
local extension_path = install_root_dir .. "/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<leader>t",
        mode = { "n" },
        function()
          local term = require("toggleterm.terminal").Terminal:new({
            cmd = "cargo run",
            direction = "float",
          })
          term:toggle()
        end,
        desc = "Cargo Run In Togg",
      },
      {
        "<leader>nq",
        mode = { "n" },
        function()
          local term = require("toggleterm.terminal").Terminal:new({
            cmd = "e ~/Nextcloud/notes/brain/learn.md",
            direction = "float",
          })
          term:toggle()
        end,
        desc = "Open note",
      },
    },
  },
  --{
  --  opts = function(_, opts)
  --    if type(opts.ensure_installed) == "table" then
  --      vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
  --    end
  --  end,
  --},
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim", "rust-lang/rust.vim" },
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local lsp_utils = require("plugins.lsp.utils")
          local Util = require("lazyvim.util")
          lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "rust_analyzer" then
              vim.keymap.set("n", "<leader>cR", "<cmd>RustRunnables<cr>", { buffer = buffer, desc = "Runnables" })
              vim.keymap.set("n", "<leader>cl", function()
                vim.lsp.codelens.run()
              end, { buffer = buffer, desc = "Code Lens" })
            end
          end)

          require("rust-tools").setup({
            tools = {
              hover_actions = { border = "solid" },
              on_initialized = function()
                vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                  pattern = { "*.rs" },
                  callback = function()
                    vim.lsp.codelens.refresh()
                  end,
                })
              end,
            },
            server = opts,
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
          })
          return true
        end,
      },
    },
  },
}
