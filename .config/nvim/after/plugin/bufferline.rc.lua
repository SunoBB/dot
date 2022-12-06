local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end


bufferline.setup {
  options = {
    mode = "tabs",
    --    separator_style = "slant", -- this is cool
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    color_icons = true,
  },
  highlights = {
    background = {
      fg = '#657b83'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
  },
}


vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
