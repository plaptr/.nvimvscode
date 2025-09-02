return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
      {"<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "Todo"},
  }
}


