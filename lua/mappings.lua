require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add debug pointer at line"})

map("n", "<leader>dus", function ()
  local widgets = require('dap.ui.widgets');
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.open();
end,
  { desc = "Open debugging sidebar"})


map("n", "<leader>dux", function ()
  local widgets = require('dap.ui.widgets');
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.close();
end,
  { desc = "Close debugging sidebar"})

map("n", "<leader>dgl", function ()
  require('dap-go').debug_test()
end, {
    desc = "Debug go test"
  })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

