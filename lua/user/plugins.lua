local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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
-- Install your plugins here
return packer.startup(function(use)
  
  use({ "wbthomason/packer.nvim"})

	--UI
  use({'kyazdani42/nvim-web-devicons'})
	use({'glepnir/galaxyline.nvim',branch = 'main'})
  use({'glepnir/zephyr-nvim'})
  use({'kyazdani42/nvim-tree.lua'})
  use({ "akinsho/bufferline.nvim"})
  use({ "moll/vim-bbye"})
  use({'ryanoasis/vim-devicons'})

  -- Lsp
  use({ "neovim/nvim-lspconfig"})
  use { "williamboman/nvim-lsp-installer" }
  use({"glepnir/lspsaga.nvim"})

  -- Completion
  use({ "hrsh7th/nvim-cmp"})
  use({ "saadparwaiz1/cmp_luasnip"})
  use({ "hrsh7th/cmp-buffer"})
  use({ "hrsh7th/cmp-path"})
  use({ "hrsh7th/cmp-nvim-lsp"})
  use({ "hrsh7th/cmp-nvim-lua"})
  use({ "windwp/nvim-autopairs"})
  -- snippets
	use({ "L3MON4D3/LuaSnip"})
  use({ "rafamadriz/friendly-snippets"})
  -- Treesitter
  use({"nvim-treesitter/nvim-treesitter"})
  use({ "hrsh7th/cmp-buffer"})
  use({ "hrsh7th/cmp-path"})
  use({ "saadparwaiz1/cmp_luasnip"})
  use({ "hrsh7th/cmp-nvim-lsp"})
  use({ "hrsh7th/cmp-nvim-lua"})
  use({"fladson/vim-kitty"})

  -- Tools 
  use({ "nvim-lua/plenary.nvim"})
	use({ "nvim-telescope/telescope.nvim"})
  use("folke/which-key.nvim")
  use({"lewis6991/gitsigns.nvim"})
  use({"keaising/im-select.nvim"})


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
