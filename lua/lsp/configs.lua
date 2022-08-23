local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua" ,"pyright","bashls", "kotlin_language_server"}
lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
  -- pcall 函数用于确认加载的模块是否存在
  -- 此处判断 lsp 是否有自定义设置
	if has_custom_opts then
    -- 把自定义设置
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

