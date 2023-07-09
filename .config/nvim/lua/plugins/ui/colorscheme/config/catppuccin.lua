local frappe = require("catppuccin.palettes").get_palette "frappe"
require("catppuccin").setup {
	flavour = "macchiato",
	highlight_overrides = {
		macchiato = function(macchiato)
			return {
				LineNr = { fg = frappe.red },
				CursorLine = { underline = true, sp = macchiato.pink },
				CursorLineNr = { fg = frappe.red, underline = true },
				LineNrAbove = { fg = frappe.lavender },
				LineNrBelow = { fg = frappe.teal },
			}
		end,

	}
}
