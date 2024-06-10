-- require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = { '~/agenda/*' },
  org_default_notes_file = '~/agenda/refile.org',
})
