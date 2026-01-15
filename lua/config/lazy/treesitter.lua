return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})
		local should_install = {
			-- misc
			"lua",
			"vim",

			-- c
			"c",

			-- zig
			"zig",

			-- ruby
			"ruby",
			"embedded_template",

			-- bash
			"bash",

			-- web dev
			"html",
			"css",
			"javascript",
			"typescript",
			"vue",
			"json",

			-- go
			"go",
			"gomod",
			"gosum",
			"gowork",

			-- rust
			"rust",

			-- python
			"python",

			-- awk
			"awk",

			-- markdown
			"markdown",

			-- toml
			"toml",
		}

		local regex = {}

		local function except(super, sub)
			local result = {}
			local seenInResult = {}
			local lookupSub = {}

			for _, value in ipairs(sub) do
				lookupSub[value] = true
			end

			for _, value in ipairs(super) do
				if not lookupSub[value] and not seenInResult[value] then
					table.insert(result, value)
					seenInResult[value] = true
				end
			end

			return result
		end

		local function enable_highlight(ft, bufnr)
			vim.treesitter.start(bufnr)
			if vim.list_contains(regex, ft) then
				vim.bo[bufnr].syntax = "on"
			end
		end

		local function ts_automagic(args)
			local bufnr = args.buf
			local ft = args.match

			-- Skip filetypes that don't need treesitter (dashboards, help, etc.)
			local ignored_filetypes = {
				"alpha",
				"dashboard",
				"help",
				"NvimTree",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"",
			}

			if vim.list_contains(ignored_filetypes, ft) then
				return
			end

			treesitter.install(ft):await(function()
				if not vim.api.nvim_buf_is_loaded(bufnr) then
					return
				end

				local installed = treesitter.get_installed()

				if vim.list_contains(installed, ft) then
					enable_highlight(ft, bufnr)
				end
			end)

			if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end

		treesitter.install(except(should_install, treesitter.get_installed()))

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TreesitterAutoinstallPlugin", {
				clear = true,
			}),
			callback = ts_automagic,
		})
	end,
}
