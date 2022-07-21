local lastplace = require("usr.utils").import('nvim-lastplace')


----------------------------------------------------------------------
--                         Setup lastplace                          --

lastplace.setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}
----------------------------------------------------------------------
