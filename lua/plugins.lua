local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
	},
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				implementation = "lua",
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
		opts = {
			hijack_cursor = true,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				width = 35,
				side = "left",
			},
			renderer = {
				indent_markers = {
					enable = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						none = " ",
					},
				},
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "󰜌",
							empty_open = "󰜌",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "󰄱",
							staged = "",
							unmerged = "",
							renamed = "󰁕",
							untracked = "",
							deleted = "✖",
							ignored = "",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = { "node_modules", ".git", ".DS_Store", "thumbs.db" },
			},
			git = {
				enable = true,
				ignore = false,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- Proteger contra errores
			local status_ok, configs = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				return
			end

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "html", "css" },
				auto_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {},
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			server = {
				override = false,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "tokyonight",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"tailwindcss",
					"html",
					"cssls",
					"jsonls",
					"pyright",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
}, {
	checker = {
		enabled = true,
		notify = false,
	},
})
