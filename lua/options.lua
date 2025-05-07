require "nvchad.options"

-- OPÇÔES PERSONALIZADAS

-- Variáveis do vim abreviadas
local o = vim.o
local op = vim.opt

-- Opções modificadas
o.cursorlineopt ='both'

op.relativenumber = true
op.signcolumn = "yes"
op.scrolloff = 15
op.termguicolors = true
