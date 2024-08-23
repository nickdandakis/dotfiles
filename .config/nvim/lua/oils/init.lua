require('oil').setup({
  keymaps = {
    ["<C-p>"] = false,
  },
})

-- Create a global variable to track the split buffer
local split_buffer = nil

function find_split_buffer()
  split_buffer = nil
  local current_tab = vim.api.nvim_get_current_tabpage()
  local visible_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, vim.api.nvim_tabpage_list_wins(current_tab))

  for _, buf in ipairs(visible_bufs) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if string.sub(buf_name, 1, 4) == 'oil:' then
      split_buffer = buf
      break
    end
  end

  if not split_buffer then
    split_buffer = nil
  end
end

-- Function to toggle the split buffer
function toggle_split_buffer()
  -- Find the buffer whose name starts with 'oil:\\'
  find_split_buffer()

  if split_buffer and vim.api.nvim_buf_is_valid(split_buffer) then
    -- If the split buffer exists, close it
    vim.cmd(":bdelete " .. split_buffer)
  else
    -- Open a new vertical split on the right with a fixed width of 30%
    vim.cmd(":vsp | wincmd L | vertical resize 30 | Oil")
  end

  find_split_buffer()
end

-- Map the toggle function to the <leader>\ key combination
vim.api.nvim_set_keymap("n", "<leader>\\", ":lua toggle_split_buffer()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
