require("mason").setup()
require("mason-lspconfig").setup()

--[[
require('jdtls').start_or_attach({
    capabilities = {
        textDocument = {
            publishDiagnostics = {
                relatedInformation = true,

                diagnosticServer = {
                    exclude = { "nonProjectFile" },
                }
            }
        }
    }
})
]]
