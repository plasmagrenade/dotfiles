return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    init = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.foldcolumn = "1"
    end,
    opts = {
      provider_selector = function()
        return { "lsp", "indent" }
      end,
    },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end,          desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end,         desc = "Close all folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end,  desc = "Open folds except kinds" },
      { "zm", function() require("ufo").closeFoldsWith() end,        desc = "Close folds with" },
      -- Peek fold contents without opening it; falls back to LSP hover
      { "K", function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then vim.lsp.buf.hover() end
        end, desc = "Peek fold / hover" },
    },
  },
}
