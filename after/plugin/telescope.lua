local builtin = require('telescope.builtin')

require('telescope').setup{
    extensions = {
        fzf = { }
    },
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { })
vim.keymap.set('n', '<C-p>', builtin.git_files, { })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
