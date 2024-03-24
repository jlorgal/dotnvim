# dotnvim

Configuration files for [neovim](https://neovim.io/).

## Prerequisites

Some LSP servers require to preinstall packages to make them functional:

| **LSP server** | **Required package** |
| --- | --- |
| jsonls | npm |
| rust_analyzer | rust-analyzer |
| texlab | tectonic, latexindent |


## Installation

Follow these steps to prepare the neovim configuration:

1. Clone the configuration files in the expected directory (~/.config/nvim):

   ```bash
   git clone https://github.com/jlorgal/dotnvim.git ~/.config/nvim
   ```

2. Open neovim.

3. Install the lazy plugins. The installation is done automatically. It can be executed manually with the command:

   ```vim
   :Lazy
   ```

   and then choose the option `Sync` by pressing the `s` key. The sync step installs, cleans and updates the plugins.

4. Update treesitter parsers:

   ```vim
   :TSUpdate
   ```

5. Check health:

   ```vim
   :checkhealth
   ```

6. Restart neovim.

7. Test the configurationn by opening the Telescope plugin with the combination `<leader>ff`. Note that the `<leader>` key is defined as the space key.

