-- nvim-lspconfig only provides server definitions (lsp/<name>.lua); servers are
-- started by Neovim's built-in client via vim.lsp.enable(). blink.cmp adds its
-- completion capabilities to every server automatically.
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
})

local servers = {
	"clangd", -- C, C++
	"gopls", -- Go
	"rust_analyzer", -- Rust
	"lua_ls", -- Lua (this config)
	"bashls", -- shell scripts
	"taplo", -- TOML (Cargo.toml and other config files)
}

-- Tell lua_ls about Neovim's Lua runtime, so `vim` isn't flagged as an
-- undefined global when editing this config.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { library = { vim.env.VIMRUNTIME } },
		},
	},
})

-- Only enable servers that are installed, so opening a file without its
-- server doesn't show a "failed to spawn" error.
for _, name in ipairs(servers) do
	local cmd = vim.lsp.config[name] and vim.lsp.config[name].cmd
	if type(cmd) == "table" and vim.fn.executable(cmd[1]) == 1 then
		vim.lsp.enable(name)
	end
end
