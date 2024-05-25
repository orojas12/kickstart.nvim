return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- toggle harpoon list
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- set current buffer as a harpoon list item
    vim.keymap.set('n', '<leader>ah', function()
      harpoon:list():replace_at(1)
    end)
    vim.keymap.set('n', '<leader>aj', function()
      harpoon:list():replace_at(2)
    end)
    vim.keymap.set('n', '<leader>ak', function()
      harpoon:list():replace_at(3)
    end)
    vim.keymap.set('n', '<leader>al', function()
      harpoon:list():replace_at(4)
    end)
    vim.keymap.set('n', '<leader>an', function()
      harpoon:list():replace_at(5)
    end)
    vim.keymap.set('n', '<leader>am', function()
      harpoon:list():replace_at(6)
    end)
    vim.keymap.set('n', '<leader>a,', function()
      harpoon:list():replace_at(7)
    end)
    vim.keymap.set('n', '<leader>a.', function()
      harpoon:list():replace_at(8)
    end)

    -- go to harpoon list item
    vim.keymap.set('n', '<A-h>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<A-j>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<A-k>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<A-l>', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<A-n>', function()
      harpoon:list():select(5)
    end)
    vim.keymap.set('n', '<A-m>', function()
      harpoon:list():select(6)
    end)
    vim.keymap.set('n', '<A-,>', function()
      harpoon:list():select(7)
    end)
    vim.keymap.set('n', '<A-.>', function()
      harpoon:list():select(8)
    end)
  end,
}
