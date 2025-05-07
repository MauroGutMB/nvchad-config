require "nvchad.mappings"

-- ADICIONAR MAPPINGS ALÉM DOS PADRÔES DO nvchad
-- Conferir os mappings padrões do NVchad em "~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua"

local Terminal = require("toggleterm.terminal").Terminal
local map = vim.keymap.set



---------------------------------------------------------------------------------------------------------------------

-- Utilitários / movimentção (Compartilhado com os padrões do NVChad)

-- lazy
map("n", "<leader>ll", ":Lazy<cr>")

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-w>", "<Esc>ewi")
map("i", "<C-b>", "<Esc>bi")

---------------------------------------------------------------------------------------------------------------------

-- Identação e movimentção durante o modo visual

-- Selecionar todo o arquivo 
map("n", "vv", "ggVG", { desc = "Select all file in a archive."})

-- Mover a seleção para baixo/cima mantendo a indentação
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Adicionar indentação à seleção
map("v", "L", ">gv", { desc = "Indent selection" })
map("v", "H", "<gv", { desc = "Unindent selection" })



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
    cmd = string.format("'./%s'", outfile)
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
map("n", "<leader>tt", open_terminal_here, { desc = "Open a floating terminal in current dir" })
