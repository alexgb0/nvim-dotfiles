local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		-- ["<ESC>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({select = true}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			-- elseif has_words_before() then
			--	cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
	}, {{name = "buffer"}}),
})


local compl_handler = require("cmp_nvim_lsp").default_capabilities()
lspconfig.clangd.setup{capabilities = compl_handler}
lspconfig.sumneko_lua.setup{capabilities = compl_handler}
lspconfig.denols.setup{capabilities = compl_handler}
