local function time()
  return os.date '%I:%M %p'
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'fileformat', 'filetype', 'location' },
      lualine_y = { time },
      lualine_z = {},
    },
  },
}
