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

  -- Lsp
  use({ "neovim/nvim-lspconfig"})
  use { "williamboman/mason.nvim" }

  -- Completion
  use({ "hrsh7th/nvim-cmp"})

  -- Treesitter
  use({"nvim-treesitter/nvim-treesitter"})
  use({ "hrsh7th/cmp-buffer"})
  use({ "hrsh7th/cmp-path"})
  use({ "saadparwaiz1/cmp_luasnip"})
  use({ "hrsh7th/cmp-nvim-lsp"})
  use({ "hrsh7th/cmp-nvim-lua"})

  -- Telescope
	use({ "nvim-telescope/telescope.nvim"})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
