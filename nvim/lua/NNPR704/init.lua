-- check that lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- leader has to be set before lazy
vim.g.mapleader = " "

-- include all plugins
require("NNPR704.lazy")

-- all remaps
require("NNPR704.remap")

-- godoc telescope extension
require("telescope").load_extension("godoc")

-- colorsheme
vim.cmd("colorscheme rose-pine-main")

-- line numbers
vim.wo.relativenumber = true

-- enable clipboard windows
vim.opt.clipboard = "unnamedplus"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- only 80 chars
--vim.opt.colorcolumn = "88"

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- no swap + SHA files
vim.opt.swapfile = false
vim.opt.shadafile = "NONE"

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true


-- PARSER CONFIG FOR COBOL
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.cobol = {
  install_info = {
    url = "~/projekte/tree-sitter-cobol/", -- local path or git repo
    files = {"src/parser.c"}, --, "src/scanner.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "cbl", -- if filetype does not match the parser name
}

vim.treesitter.language.register('cobol', 'cbl')
