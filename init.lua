-- MUST happen before lazy loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.filetype.add({
	filename = {
		["CMakeLists.txt"] = "cmake",
	},
})

require("sushant.core")
require("sushant.lazy")
