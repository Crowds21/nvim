local util = require('lspconfig.util')
return{
  root_dir = util.root_pattern("*.kts","settings.gradle.kts")
}
