return {
	{
		"cocopon/iceberg.vim",
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = true,
			terminal_colors = false,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
		},
	},
}
