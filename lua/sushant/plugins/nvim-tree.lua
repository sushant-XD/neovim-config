return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        
        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)
        
        -- Custom mapping: smart file opening
        vim.keymap.set('n', '<CR>', function()
          -- Check if there are any other tabs or if current tab has actual content
          local tab_count = vim.fn.tabpagenr('$')
          local current_buf = vim.api.nvim_get_current_buf()
          local current_buf_name = vim.api.nvim_buf_get_name(current_buf)
          local is_nvim_tree = string.match(current_buf_name, "NvimTree")
          
          -- If only one tab and current buffer is nvim-tree, open in same tab (but keep tree open)
          if tab_count == 1 and is_nvim_tree then
            api.node.open.edit()
          else
            -- Otherwise open in new tab
            api.node.open.tab()
          end
        end, opts('Smart Open File'))
        
        -- Keep 'o' for explicitly opening in current buffer
        vim.keymap.set('n', 'o', function()
          api.node.open.edit()
        end, opts('Open in Current Buffer'))
        
        -- Keep 't' for explicitly opening in new tab
        vim.keymap.set('n', 't', function()
          api.node.open.tab()
        end, opts('Open in New Tab'))
      end,
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = false, -- don't close tree when opening file
          resize_window = true, -- resize tree when opening file
        },
      },
      tab = {
        sync = {
          open = true, -- open files in new tab by default
          close = true,
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end
}
