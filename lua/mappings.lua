require "nvchad.mappings"

local dap = require("dap")
local dapui = require("dapui")
local dap_go = require("dap-go")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- DAP core mappings
map("n", "<F5>", function() dap.continue() end,
  { desc = "DAP: Start/Continue debugging session", noremap = true, silent = true }) -- Start or continue debugging[7][10]
map("n", "<F10>", function() dap.step_over() end,
  { desc = "DAP: Step over", noremap = true, silent = true }) -- Step over the current line of code[7][10]
map("n", "<F11>", function() dap.step_into() end,
  { desc = "DAP: Step into", noremap = true, silent = true }) -- Step into the function under cursor[7][10]
map("n", "<F12>", function() dap.step_out() end,
  { desc = "DAP: Step out", noremap = true, silent = true }) -- Step out of the current function[7][10]
map("n", "<leader>db", function() dap.toggle_breakpoint() end,
  { desc = "DAP: Toggle breakpoint", noremap = true, silent = true }) -- Toggle breakpoint at current line[7][10]
map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
  { desc = "DAP: Set conditional breakpoint", noremap = true, silent = true }) -- Set a conditional breakpoint
map("n", "<leader>dr", function() dap.repl.open() end,
  { desc = "DAP: Open REPL", noremap = true, silent = true }) -- Open DAP REPL for interactive debugging
map("n", "<leader>dl", function() dap.run_last() end,
  { desc = "DAP: Run last debug session", noremap = true, silent = true }) -- Run the last debug session again

-- DAP UI mappings
map("n", "<leader>du", function() dapui.toggle() end,
  { desc = "DAP: Toggle DAP UI", noremap = true, silent = true }) -- Toggle the DAP UI (sidebar, scopes, breakpoints, etc.)[11]
map("n", "<leader>de", function() dapui.eval() end,
  { desc = "DAP: Evaluate expression under cursor", noremap = true, silent = true }) -- Evaluate the expression under the cursor in the UI

-- DAP-Go mappings (if you want to use dap-go's test helpers)
map("n", "<leader>dt", function() dap_go.debug_test() end,
  { desc = "DAP-Go: Debug nearest test", noremap = true, silent = true }) -- Debug the nearest Go test[6]
map("n", "<leader>dT", function() dap_go.debug_last_test() end,
  { desc = "DAP-Go: Debug last test", noremap = true, silent = true }) -- Debug the last Go test that was run[6]

-- Optional: Open/close UI automatically with session
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

