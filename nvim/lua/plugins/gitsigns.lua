return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buffer)
      vim.keymap.set("n", "<leader>ghp", require("gitsigns").preview_hunk, { buffer = buffer, desc = "Preview Hunk" })
    end,
  },
}
