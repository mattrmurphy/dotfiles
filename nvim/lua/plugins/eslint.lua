require('eslint').setup({
  bin = 'eslint',
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { 'directive', 'problem', 'suggestion', 'layout' },
    },
  },
})
