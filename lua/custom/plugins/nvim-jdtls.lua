return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  config = function()
    local config = {
      cmd = { 'jdtls' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }

    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = { 'java' },
      callback = function()
        require('jdtls').start_or_attach(config)
      end,
    })

    require('jdtls').start_or_attach(config)
  end,
}
