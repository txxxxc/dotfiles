local event = { "InsertEnter", "VeryLazy" }


return {
	{
		"zbirenbaum/copilot.lua",
		enabled = true,
		cmd = { "Copilot" },
		event = event,
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				dependencies = {
					"hrsh7th/nvim-cmp",
				},
				config = function()
					require("copilot_cmp").setup()

					local cmp = require("cmp")

					cmp.event:on("menu_opened", function()
						vim.b.copilot_suggestion_hidden = true
					end)

					cmp.event:on("menu_closed", function()
						vim.b.copilot_suggestion_hidden = false
					end)
				end,
			},
		},
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				TeleScopePrompt = false,
				cpp = false,
				["*"] = true,
			},
			server_opts_overrides = {
				trace = "verbose",
				settings = {
					advanced = {
						listCount = 10,   -- #completions for panel
						inlineSuggestCount = 3, -- #completions for getCompletions
					}
				},
			}
		},
		config = function(_, opts)
			vim.defer_fn(function()
				require("copilot").setup(opts)
			end, 100)
		end,
	},
}
