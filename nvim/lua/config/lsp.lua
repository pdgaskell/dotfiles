local M = {}

function M.setup()
    local servers = {
        jdtls = {
            settings = {
                java = {
                    configuration = {
                        updateBuildConfiguration = "automatic",
                    },
                    import = {
                        gradle = { enabled = true },
                        maven = { enabled = true },
                    },
                },
            },
        },
        pyright = {},
        terraformls = {},
        ts_ls = {},
        copilot = {},
    }

    for name, config in pairs(servers) do
        vim.lsp.config(name, config)
    end
    vim.lsp.enable(vim.tbl_keys(servers))

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client:supports_method("textDocument/completion") then
                vim.lsp.completion.enable(true, client.id, event.buf, {
                    autotrigger = true,
                })
            end

            if client and client:supports_method(
                vim.lsp.protocol.Methods.textDocument_inlineCompletion,
                event.buf
            ) then
                vim.lsp.inline_completion.enable(true, { bufnr = event.buf })
                vim.keymap.set("i", "<C-F>", vim.lsp.inline_completion.get, {
                    buffer = event.buf,
                    desc = "Accept inline Copilot completion",
                })
                vim.keymap.set("i", "<C-G>", vim.lsp.inline_completion.select, {
                    buffer = event.buf,
                    desc = "Select inline Copilot completion",
                })
            end

            vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, {
                buffer = event.buf,
                desc = "Trigger LSP completion",
            })
        end,
    })
end

return M
