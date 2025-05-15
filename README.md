# My Neovim Configuration

This is my personal Neovim configuration, designed to provide a powerful and streamlined development environment. It's built on top of [NvChad](https://github.com/NvChad/NvChad) and includes customizations for Go development, Next.js, and general web development.

## Features

* **Clean Neovim DAP Setup:** Integrated debugging support using Neovim's built-in Debug Adapter Protocol (DAP).
* **Go/Delve Setup:** Pre-configured for Go debugging with [Delve](https://github.com/go-delve/delve).
* **Next.js Full Support:** Optimized for Next.js development.
* **Prettier + ESLint + TypeScript Autoformatting:** Automatic code formatting and linting for a consistent codebase.

## Prerequisites

Before installing this configuration, ensure you have the following software installed on your Linux system:

* **Neovim:** Version 0.8 or later.  It's highly recommended to use the latest stable release.
    * Debian/Ubuntu:  `sudo apt install neovim`
    * Fedora/CentOS/RHEL: `sudo dnf install neovim`
    * Arch Linux: `sudo pacman -S neovim`
* **Git:** Required to clone the repository.
    * Debian/Ubuntu:  `sudo apt install git`
    * Fedora/CentOS/RHEL: `sudo dnf install git`
    * Arch Linux: `sudo pacman -S git`
* **Node.js:** Required for Next.js, Prettier, ESLint, and TypeScript support.  It's recommended to install Node.js via [nvm](https://github.com/nvm-sh/nvm) (Node Version Manager) to easily manage Node.js versions.
* **Prettier:** Code formatter.  Install globally using npm:  `npm install -g prettier`
* **ESLint:** JavaScript linter.  Install globally using npm:  `npm install -g eslint`
* **TypeScript:** Language service. Install globally using npm: `npm install -g typescript`
* **Go:** Required for Go development.  Follow the official installation instructions: [https://go.dev/doc/install](https://go.dev/doc/install)
* **Delve (dlv):** Go debugger.  Install using `go install`:
    * `go install github.com/go-delve/delve/cmd/dlv@latest`
    * **Important:** After installation, ensure that the directory where `dlv` is located (usually `$GOPATH/bin` or `$HOME/go/bin`) is added to your system's `PATH` environment variable.  Otherwise, the debugger will fail to launch.

## Installation

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/adwait-rao/nvim](https://github.com/adwait-rao/nvim) ~/.config/nvim
    ```
    This will clone the repository into your Neovim configuration directory.

2.  **Start Neovim:**
    When you open Neovim for the first time, it should automatically install any missing plugins.  This might take a few minutes, depending on your internet connection.

## Usage

This configuration provides a customized Neovim experience.  Explore the following to get started:

* **Basic Neovim Usage:** If you're new to Neovim, familiarize yourself with its modal editing (Normal, Insert, Visual modes) and basic commands.
* **File Exploration:** Use Neovim's built-in file exploration commands, or explore any file explorer plugins that might be included.
* **Language Server Protocol (LSP):** This configuration likely includes LSP support for Go, TypeScript, and other languages.  This provides features like auto-completion, go-to-definition, and more.
* **Debugging (DAP):**
    * For Go debugging, ensure you have Delve set up correctly (see "Prerequisites").
    * Use the  `<leader>db`  mapping to set breakpoints,  `<leader>dc`  to continue,  `<leader>dn`  to step over,  `<leader>di` to step into, and `<leader>dr` to terminate.
    * Use `<leader>dus` to open the DAP UI
* **Formatting:** Prettier should automatically format your JavaScript/TypeScript code on save.

## Customization

This is *my* configuration, so feel free to customize it to your liking!  Here are some common ways to customize Neovim:

* **Mappings:** Modify the key mappings in the  `lua/mappings.lua`  file.
* **Plugins:** Add or remove plugins in the  `lua/plugins/init.lua`  file.
* **Configuration:** Explore the  `lua/config`  directory for other configuration files.

##  Important Notes for Go Debugging

* **Delve in PATH:** The most common issue with Go debugging is that Neovim/`nvim-dap-go` cannot find the `dlv` executable.  Double-check that you've added the directory containing `dlv` to your system's `PATH` environment variable, as mentioned in the "Prerequisites" section.
* **Project Structure:** Ensure your Go project is set up correctly.  The debugger typically needs to be run in the root directory of your project.
* **`config/dap.lua`:** If you encounter issues with the debugger, you may need to tweak the settings in  `config/dap.lua`, especially the  `dlv_path`.

##  Contributing

If you find any issues or have suggestions for improvements, feel free to submit a pull request or open an issue on the [GitHub repository](https://github.com/adwait-rao/nvim).
