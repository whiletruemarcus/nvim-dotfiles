-- ~/-config/nvim/lua/config/keybinds.lua

local M = {}

function M.show_keybinds()
  local notes_file = vim.fn.stdpath("config") .. "/lua/config/keybinds.txt"

  local lines = {}
  local file = io.open(notes_file, "r")

  if file then
    for line in file:lines() do
      table.insert(lines, line)
    end
    file:close()
  else
    table.insert(lines, "Kunde inte hitta anteckningsfilen")
    table.insert(lines, notes_file)
  end

  -- ... (läsning av filen sker här ovanför) ...
  local notes = lines

  -- 3. Konfigurera fönstrets dimensioner och position
  local width = 60
  local height = #notes + 2
  local ui_lines = vim.o.lines
  local ui_columns = vim.o.columns
  local row = math.floor((ui_lines - height) / 2)
  local col = math.floor((ui_columns - width) / 2)

  -- 4. Skapa buffer
  local buf = vim.api.nvim_create_buf(false, true)
  -- MODERNISERING: Använd vim.bo för buffer-options
  vim.bo[buf].bufhidden = "wipe"
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, notes)

  -- 5. Skapa fönstret
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    border = "rounded",
    style = "minimal",
  })

  -- 6. Sätt fönsteralternativ (MODERNISERING: Använd vim.wo för window-options)
  -- Detta ersätter vim.api.nvim_win_set_option
  vim.wo[win].cursorline = false
  vim.wo[win].relativenumber = false
  vim.wo[win].number = false
  vim.wo[win].wrap = false
  vim.wo[win].cursorcolumn = false

  -- ... (keymappings och resten av koden är samma) ...
  -- vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':close<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })

  vim.api.nvim_set_current_win(win)
  vim.api.nvim_win_set_cursor(win, { 1, 0 })
end

return M
