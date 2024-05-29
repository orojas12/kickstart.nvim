local vscode = {
  'Mofiqul/vscode.nvim',
  opts = {},
}

local rosepine = {
  'rose-pine/neovim',
  name = 'rose-pine',
  opts = {},
}

local tokyonight = { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  opts = {},
}

local nightfox = {
  'EdenEast/nightfox.nvim',
  opts = {},
}

local kanagawa = {
  'rebelot/kanagawa.nvim',
  opts = {},
}

local gruvbox_material = {
  'sainnhe/gruvbox-material',
  config = function()
    vim.g.gruvbox_material_enable_italic = true
  end,
}

local catppuccin = {
  'catppuccin/nvim',
  config = function()
    require('catppuccin').setup {}
  end,
}

return { rosepine, vscode, tokyonight, nightfox, kanagawa, gruvbox_material, catppuccin }
