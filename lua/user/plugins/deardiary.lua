local diary = require('deardiary')
local diary_config = require('deardiary.config')
local util = require("deardiary.util")

diary_config.journals = {
    {
            path = "~/Dropbox/org/journal",
            frequencies = {
                daily = {
                    template = function(entry_date)
                    return entry_date:fmt("* %Y-%m-%d\n\n** Quotidienne\n*** Bonne nouvelle\n*** Priorité\n")
                    end,
                    formatpath = function(entry_date)
                    return entry_date:fmt(util.join_path({"daily","%Y-%m-%d.org"}))
                    end,
                    },
                }
    }
}

diary.set_current_journal(1)
