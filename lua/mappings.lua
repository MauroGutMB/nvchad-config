require "nvchad.mappings"

-- add yours here

local Terminal = require("toggleterm.terminal").Terminal
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


---------------------------------------------------------------------------------------------------------------------

--Apenas roda o código

local function run_code()
  local file = vim.fn.expand("%")
  local outfile = vim.fn.expand("%:r")
  local cmd = ""

  if file:match("%.c$") then
    cmd = string.format("'./%s'", outfile)
  elseif file:match("%.cpp$") then
    cmd = string.format("'./%s'", outfile)
  elseif file:match("%.asm$") then
    cmd = string.format("'./%s' ", outfile)
  elseif file:match("%.py$") then
    cmd = string.format("python3 %s", file)
  elseif file:match("%.lua$") then
    cmd = string.format("lua %s", file)
  elseif file:match("%.sh$") then
    cmd = string.format("./%s", file)
  else
    vim.notify("not a runnable File. Please verify \'mappings.lua\'.", vim.log.levels.ERROR)
    return
  end

  local term = Terminal:new({ cmd = cmd, direction = "float", close_on_exit = false })
  term:toggle()
end
-- map do comando
map("n", "<leader>rf", run_code, { desc = "Run a file." })


-----------------------------------------------------------------------------------------------------------------------

--Compila e Roda o código

local function compile_run()
  local file = vim.fn.expand("%")
  local outfile = vim.fn.expand("%:r")
  -- local cw = vim.fn.expand("%p:h")
  local cmd = ""

  if file:match("%.c$") then
    cmd = string.format("gcc '%s' -o '%s' -lm && './%s'", file, outfile, outfile)
  elseif file:match("%.cpp$") then
    cmd = string.format("g++ '%s' -o '%s' && './%s'", file, outfile, outfile)
  elseif file:match("%.asm$") then
    cmd = string.format("nasm -f elf64 '%s' -o './%s.o' && ld -o '%s' '%s.o' && './%s' ", file, outfile, outfile, outfile, outfile)
  elseif file:match("%.py$") then
    cmd = string.format("python3 %s", file)
  elseif file:match("%.lua$") then
    cmd = string.format("lua %s", file)
  else
    vim.notify("Not a compilable/runnable File. Please verify \'mappings.lua\'.", vim.log.levels.ERROR)
    return
  end

  local term = Terminal:new({ cmd = cmd, direction = "float", close_on_exit = false })
  term:toggle()
end
-- map do comando
map("n", "<leader>rc", compile_run, { desc = "Compile and/or Run a file." })


-----------------------------------------------------------------------------------------------------------------------

--Abre um terminal 

local function open_terminal_here()
  local cwd = vim.fn.expand("%:p:h") -- diretório do arquivo atual
  local term = Terminal:new({
    dir = cwd,
    direction = "float",
    close_on_exit = true,
    hidden = true,
  })
  term:toggle()
end
-- map do comando
map("n", "<leader>tt", open_terminal_here, { desc = "Opens a floating terminal in current dir" })

