----------------------------------------------------------------------
--                         local variables                          --

---------------------------------------------
--For keymaps
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
---------------------------------------------

---------------------------------------------
--For Telescope
local telescope = require("usr.utils").import("telescope")

local actions = require("usr.utils").import("telescope.actions")
---------------------------------------------

---------------------------------------------
--For cmp
local cmp = require("usr.utils").import("cmp")

---------------------------------------------

---------------------------------------------
--For lsp-installer
local lsp_installer = require("usr.utils").import("nvim-lsp-installer")
---------------------------------------------

---------------------------------------------
--For trouble
local trouble = require("usr.utils").import("trouble")
---------------------------------------------

---------------------------------------------
-- Comment frame
local commentFrame = require("usr.utils").import('nvim-comment-frame')
---------------------------------------------

---------------------------------------------
-- One dark
local oneDark = require("usr.utils").import('onedark')
---------------------------------------------

---------------------------------------------
-- Luasnip
local ls = require("usr.utils").import("luasnip")
---------------------------------------------

----------------------------------------------------------------------


----------------------------------------------------------------------
--                            lsp config                            --


map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<Leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<Leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>" , opts)
map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
map('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Resizing splits                          --

map('', '<A-l>', '<cmd>vertical resize -3<CR>', opts)
map('', '<A-h>', '<cmd>vertical resize +3<CR>', opts)
map('', '<A-k>', '<cmd>resize -3<CR>', opts)
map('', '<A-j>', '<cmd>resize +3<CR>', opts)
map('', '<A-=>', '<C-w>=', opts)


--Remap splits navigation to just CTRL + hjkl
map("", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
map("", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
map("", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
map("", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              debug                               --


map('n', '<Leader>db', "<cmd>FloatermNew gdb bin/app<CR>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        working with tabs                         --


map('n', '<Leader>m', ':tabnew<CR>', opts)

map('n', ']t', '<cmd>tabnext<CR>',  { silent = true })
map('n', '[t', '<cmd>tabprev<CR>',  { silent = true })


map('n', '<Leader>ct', '<cmd>close<CR>', opts)

----------------------------------------------------------------------


----------------------------------------------------------------------
--                 toggle between highlight search                  --


map('n', '<C-]>', ':set hlsearch!<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                      Working With sessions                       --


map('n', '<Leader>cs', ':SClose<CR>', opts)
map('n', '<Leader>ls', ':SLoad<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Run C++ programs                         --


map('n', '<leader>tr', ':FloatermNew  --height=20 --autoclose=0  eval "$(find ./bin -type f -executable -print)"<cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Cmake                               --


map('n', '<leader>cg', ':CMakeGenerate<cr>', opts)
map('n', '<leader>cb', ':CMakeBuild<cr>', opts)
map('n', '<Leader>cm', ':CMakeClose<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Ranger                              --


map('n', '<c-t>', ':FloatermNew --height=28 --width=124 --wintype=float --name=ranger --position=center --autoclose=2 ranger <cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            maximizer                             --


vim.g.maximizer_default_mapping_key = '<Leader>sm'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             floaterm                             --


vim.g.floaterm_keymap_new = '<Leader>fy'
vim.g.floaterm_keymap_toggle = '<Leader>ft'
vim.g.floaterm_keymap_next = '<Leader>fn'
vim.g.floaterm_keymap_prev = '<Leader>fp'
vim.g.floaterm_keymap_kill = '<Leader>fc'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Cod actions                            --


map('n', '<Leader>cd', ':CodeActionMenu<Cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Telescope                             --


map('n', '<leader>tf', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>tb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>th', '<cmd>Telescope help_tags<cr>', opts)

-- Telescope Luasnip
map("n", "<leader>tsp", "<cmd>Telescope luasnip<cr>", opts)

-- Neoclip
map("n", "<Leader>yh", "<cmd>Telescope neoclip<cr>", opts)

--Todo
map("n", "<Leader>td", "<cmd>TodoTelescope<CR>", opts)


telescope.setup {
    defaults = {

        mappings = {
            i = {
                ["<C-j>"] = actions.cycle_history_next,
                ["<C-k>"] = actions.cycle_history_prev,

                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                --["gg"] = actions.moveto_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               cmp                                --


cmp.setup({
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --[[ ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }), ]]


    },
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             cmdline                              --


cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(), --stick with the defaults
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(), --stick with the defaults
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          lsp installer                           --


lsp_installer.settings({

    ui = {
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install a server
            install_server = "i",
            -- Keymap to reinstall/update a server
            update_server = "u",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             trouble                              --


map("n", "<leader>tad", "<cmd>Trouble workspace_diagnostics<cr>", opts)
map("n", "<leader>tcd", "<cmd>Trouble document_diagnostics<cr>", opts)


trouble.setup
{
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = { "o" }, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = { "zM", "zm" }, -- close all folds
        open_folds = { "zR", "zr" }, -- open all folds
        toggle_fold = { "zA", "za" }, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             onedark                              --


oneDark.setup {
    -- toggle theme style ---
    toggle_style_key = '<leader>ts', -- Default keybinding to toggle
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         symbols outline                          --


map('n', '<Leader>su', ':SymbolsOutlineOpen<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Undo tree                             --


map('n', '<Leader>ut', '<cmd>UndotreeToggle<cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            nvimtree                             --


map('n', '<Leader>tt', '<cmd>NvimTreeToggle<cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             luasnip                             --


map({ "i", "s" }, "<Leader>sn", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map({ "i", "s" }, "<Leader>sp", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
map({ "i", "s" }, "<c-s>", "<Esc>:w<cr>")
map({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
map({ "i", "s" }, "<a-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end, { silent = true })
map({ "i", "s" }, "<Leader>sc", function()
	if ls.choice_active() then
		ls.change_choice(1)
	else
		-- print current time
		local t = os.date("*t")
		local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
		print(time)
	end
end)
map({ "i", "s" }, "<Leader>sv", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)
map('n', '<Leader>ls', '<cmd>source' .. vim.fn.stdpath('config') .. '/lua/LS/luasnip-conf.lua<CR>')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             Hexmode                              --


map('n', '<Leader>he', "<cmd>Hexmode<cr>", opts);
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          comment frame                           --


commentFrame.setup({
    keymap = '<leader>cc',
    --       ^^^^^^^^^^^ change this to what ever you want

    multiline_keymap = '<leader>C',
    --                 ^^^^^^^^^^^ change this to what ever you want
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               dial                               --

map("n", "<C-a>", require("dial.map").inc_normal(), opts)
map("n", "<C-x>", require("dial.map").dec_normal(), opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Tetris                              --

map('n', '<Leader>pt', "<cmd>Tetris<cr>", opts)

--[[
Conftrol
Left Arrow: move left
Right Arrow: move right
Up Arrow: rotate piece
Down Arrow: soft drop
Space Bar: hard drop
]]
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               Hop                                --

map("", "fw", "<cmd>HopWord<CR>", opts)
map("", "fp", "<cmd>HopPattern<CR>", opts)
map("", "fc", "<cmd>HopChar2<CR>", opts)
map("", "fl", "<cmd>HopLine<CR>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            RGB picker                            --

map("n", "<Leader>rgb", "<cmd>PickColor<cr>", opts)
map("i", "<Leader>rgb", "<cmd>PickColorInsert<cr>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                      Run my window manger                        --


map('n', '<leader>rw', ':FloatermNew  --height=20 --autoclose=0 ./run.sh<cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Comment Frame                           --

vim.api.nvim_set_keymap('n', '<leader>cc', ":lua require('nvim-comment-frame').add_comment()<CR>", {})

vim.api.nvim_set_keymap('n', '<leader>C', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", {})
----------------------------------------------------------------------
