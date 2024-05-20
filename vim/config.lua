-- vim: ts=2
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
	{ "tjdevries/colorbuddy.vim" },
  { "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup({
          style = 'warmer'
      })
      require('onedark').load()
    end,
  },
	{ "preservim/vim-markdown" },
	{ "vim-latex/vim-latex" },
	{ "mlr-msft/vim-loves-dafny" },
  { "whonore/Coqtail" },
  { "junegunn/vim-easy-align" },
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "BufWinEnter",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = 120,
				height = 1,
				options = {
					number = false,
					relativenumber = false,
				},
			},
      plugins = {
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        kitty = {
          enabled = true,
          font = "+3",
        }
      }
		},
	},
}

require("lspconfig").dafny.setup({})

-- vim.cmd("set bg=light")

vim.opt.shell = "/bin/sh"
vim.g.onedark_config = {
  style = "light"
}
lvim.colorscheme = "onedark"
