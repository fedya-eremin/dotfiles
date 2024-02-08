-- init.lua

-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()


require('orgmode').setup({
  org_hide_emphasis_markers = true,
  org_agenda_files = { '~/agenda/org/*', '~/my-orgs/**/*' },
  org_default_notes_file = '~/agenda/org/refile.org',
})
