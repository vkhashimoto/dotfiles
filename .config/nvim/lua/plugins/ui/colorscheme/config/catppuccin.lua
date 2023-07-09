local frappe = require("catppuccin.palettes").get_palette "frappe"
require("catppuccin").setup {
	flavour = "macchiato",
	highlight_overrides = {
		macchiato = function(--[[ macchiato ]])
			return {
				LineNr = { fg = frappe.red },
				--CursorLineNr = { fg = macchiato.red },
				LineNrAbove = { fg = frappe.lavender },
				LineNrBelow = { fg = frappe.teal },
			}
		end,

	}
}
