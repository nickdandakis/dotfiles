local uv = vim.loop
local function yoink()
  local cwd = vim.fn.getcwd()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- Only work with loaded buffers
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name ~= "" and vim.fn.filereadable(name) == 1 then
        local buf_dir = vim.fn.fnamemodify(name, ':h')
        if buf_dir == cwd then
          local backup_name = name .. ".bak"
          local ok, err = uv.fs_copyfile(name, backup_name)
          if not ok then
            print("Error copying " .. name .. ": " .. err)
          else
            print("Copied " .. name .. " to " .. backup_name)
          end
        else
          print("Skipping " .. name .. " (not in current directory)")
        end
      end
    end
  end
end

-- Create a user command to trigger the backup
vim.api.nvim_create_user_command("Yoink", yoink, {})
