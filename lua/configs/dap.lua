local dap = require('dap')
local dapui = require('dapui')
local dap_go = require('dap-go')

local dap_setup_done = false

function setup()
  if dap_setup_done then
    return
  end

  -- Find the absolute path to dlv. You can use the 'which' command in a shell:
  -- e.g., which dlv and then put that path here.
  local dlv_path = "/home/adwaitrao/go/bin/dlv" -- Replace with the actual path to your dlv executable

  dap_go.setup { -- Pass a table to the setup function
    dlv_path = dlv_path,
    -- Additional dap configurations can be added.
    -- dap_configurations accepts a list of tables where each entry
    -- represents a dap configuration. For more details do:
    -- :help dap-configuration
    dap_configurations = {
      {
        -- Must be "go" or it will be ignored by the plugin
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
    },
    -- delve configurations
    delve = {
      -- the path to the executable dlv which will be used for debugging.
      -- by default, this is the "dlv" executable on your PATH.
      path = dlv_path,
      -- time to wait for delve to initialize the debug session.
      -- default to 20 seconds
      initialize_timeout_sec = 20,
      -- a string that defines the port to start delve debugger.
      -- default to string "${port}" which instructs nvim-dap
      -- to start the process in a random available port.
      -- if you set a port in your debug configuration, its value will be
      -- assigned dynamically.
      port = "3212",
      -- additional args to pass to dlv
      args = {},
      -- the build flags that are passed to delve.
      -- defaults to empty string, but can be used to provide flags
      -- such as "-tags=unit" to make sure the test suite is
      -- compiled during debugging, for example.
      -- passing build flags using args is ineffective, as those are
      -- ignored by delve in dap mode.
      -- avaliable ui interactive function to prompt for arguments get_arguments
      build_flags = {},
      -- whether the dlv process to be created detached or not. there is
      -- an issue on delve versions < 1.24.0 for Windows where this needs to be
      -- set to false, otherwise the dlv server creation will fail.
      -- avaliable ui interactive function to prompt for build flags: get_build_flags
      detached = vim.fn.has("win32") == 0,
      -- the current working directory to run dlv from, if other than
      -- the current working directory.
      cwd = nil,
    },
    -- options related to running closest test
    tests = {
      -- enables verbosity when running the test.
      verbose = false,
    },
  }

  dap.configurations.go = {
    {
      name = "Launch Package",
      type = "go",
      request = "launch",
      program = "${fileDir}",
      dlvToolPath = dlv_path, -- Add this line, make sure it matches the dlv_path variable
    },
    {
      name = "Debug test",
      type = "go",
      request = "launch",
      program = "${fileDir}/$${fileBasenameNoExtension}.test",
      dlvToolPath = dlv_path, -- Add this line, make sure it matches the dlv_path variable
    },
  }

  dapui.setup {
    icons = {
      expanded = "▾",
      collapsed = "▸",
      current_frame = "▸",
    },
    controls = {
      icons = {
        pause = "⏸",
        continue = "▶",
        step_into = "⏎",
        step_over = "⤞",
        step_out = "Ex",
        terminate = "⏹",
      },
    },
    layouts = {
      {
        elements = {
          { id = 'scopes', size = 0.25, position = 'left' },
          { id = 'breakpoints', size = 0.25, position = 'left' },
          { id = 'stacks', size = 0.25, position = 'left' },
          { id = 'watches', size = 0.25, position = 'left' },
        },
        size = 0.4,
        position = 'left',
      },
      {
        elements = {
          { id = 'console', size = 1, position = 'bottom' },
        },
        size = 0.3,
        position = 'bottom',
      },
    },
  }

  dap_setup_done = true
end

return { setup = setup }

