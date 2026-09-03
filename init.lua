<<<<<<< HEAD
-- MUST happen before lazy loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.filetype.add({
	filename = {
		["CMakeLists.txt"] = "cmake",
	},
=======
vim.filetype.add({
  filename = {
    ["CMakeLists.txt"] = "cmake",
  },
>>>>>>> faa4041 (first commit)
})

require("sushant.core")
require("sushant.lazy")
