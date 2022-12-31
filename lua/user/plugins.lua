-- Automatically install Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Assure Packer is installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Could not load Packer")
    return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Install Plugins
return packer.startup(function(use)
    -- Let Packer manage itself
    use "wbthomason/packer.nvim"

    -- Colorscheme
    use "arcticicestudio/nord-vim"

    -- Enhancements
    use "justinmk/vim-sneak"
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "RRethy/vim-illuminate"
    use "nvim-tree/nvim-web-devicons"
    use "airblade/vim-rooter"
    use "ethanholz/nvim-lastplace"
    use "ThePrimeagen/harpoon"
    use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key'},
    }
    use "akinsho/toggleterm.nvim"
    use "nvim-lualine/lualine.nvim"

    -- Zen-Mode
    use "folke/zen-mode.nvim"
    -- use "folke/twilight.nvim"

    -- TreePlugin
    use "nvim-tree/nvim-tree.lua"

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use "folke/trouble.nvim"

    -- cmp plugins
    use "hrsh7th/cmp-cmdline" -- cmdline completions


    if packer_bootstrap then
        packer.sync()
    end
end)
