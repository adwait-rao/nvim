require "nvchad.mappings"

local dap = require("dap")
local dapui = require("dapui")
local dap_go = require("dap-go")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- DAP core mappings
map("n", "<F5>", function() dap.continue() end, opts)                                                   -- Start/Continue
map("n", "<F10>", function() dap.step_over() end, opts)                                                 -- Step Over
map("n", "<F11>", function() dap.step_into() end, opts)                                                 -- Step Into
map("n", "<F12>", function() dap.step_out() end, opts)                                                  -- Step Out
map("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)                                    -- Toggle Breakpoint
map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts) -- Conditional Breakpoint
map("n", "<leader>dr", function() dap.repl.open() end, opts)                                            -- Open REPL
map("n", "<leader>dl", function() dap.run_last() end, opts)                                             -- Run Last

-- DAP UI mappings
map("n", "<leader>du", function() dapui.toggle() end, opts) -- Toggle UI
map("n", "<leader>de", function() dapui.eval() end, opts)   -- Evaluate expression under cursor

-- DAP-Go mappings (if you want to use dap-go's test helpers)
map("n", "<leader>dt", function() dap_go.debug_test() end, opts)      -- Debug nearest test
map("n", "<leader>dT", function() dap_go.debug_last_test() end, opts) -- Debug last test

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
