vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })


symbols = {
  icon_fetcher = function(kind, bufnr)
    local ft = vim.api.nvim_buf_get_option(bufnr, 'ft')
    -- ...
  end,
}
require("outline").setup {
    -- Your setup opts here (leave empty to use defaults)
     providers = {
    priority = { 'lsp', 'coc', 'markdown', 'norg', 'c'},
    -- Configuration for each provider (3rd party providers are supported)
    lsp = {
      -- Lsp client names to ignore
      blacklist_clients = {},
    },
    markdown = {
      -- List of supported ft's to use the markdown provider
      filetypes = {'markdown'},
    },
  },
}

