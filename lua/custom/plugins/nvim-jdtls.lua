local home = os.getenv 'HOME'
local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/' .. project_name

return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  dependencies = { 'mfussenegger/nvim-dap' },
  config = function()
    local config = {
      cmd = {
        -- 💀
        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar',
        vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- 💀
        '-configuration',
        jdtls_path .. '/config_linux',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        '-data',
        workspace_path,
      },
      root_dir = require('jdtls.setup').find_root { 'pom.xml', 'mvnw', 'gradlew', 'build.gradle', '.git' },

      init_options = {
        bundles = {
          vim.fn.glob(home .. '/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1),
          vim.fn.glob(home .. '/.local/share/nvim/mason/packages/java-test/extension/server/com.microsoft.java.test.plugin-*.jar', 1),
        },
      },
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
