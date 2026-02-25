return    {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    --telescope
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', function() builtin.find_files({ hidden = true , cwd = vim.fn.getcwd() }) end, {})

    vim.keymap.set('n', '<A-l>', builtin.live_grep, {})
    require("telescope").setup({
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.9,
        },
      },
      pickers = {
        find_files = {
          previewer = require('telescope.config').values.file_previewer({})
        }
      }
    })
  end

}
 
