----------------------------------------------------------------------
--             Change prefix/charactter precediing the              --
--                     diagnostics virtual text                     --


vim.diagnostic.config({
    virtual_text = {
        prefix = '▎', -- Could be '●', '▎', 'x'
    }
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--               Go-to definition in a virtual split                --


local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("usr.utils").import("vim.lsp.log")
    local api = vim.api

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
        end

        if split_cmd then
            vim.cmd(split_cmd)
        end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])

            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result)
        end
    end

    return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('vs')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                     Change diagnostic icons                      --


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Customizing how diagnostics are displayed             --


vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
----------------------------------------------------------------------
