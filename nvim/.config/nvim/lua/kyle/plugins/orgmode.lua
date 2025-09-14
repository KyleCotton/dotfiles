return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function()
        -- Setup orgmode
        require('orgmode').setup({
            org_agenda_files = '~/org/**/*',
            org_default_notes_file = '~/org/refile.org',
            org_capture_templates = {
                t = {
                    description = "Task",
                    template = "* TODO %?\n %u",
                    target = "~/org/inbox.org",
                },
            },
        })
    end,
}
