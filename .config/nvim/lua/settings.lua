local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

if fn.executable("fish") then
    vim.opt.shell = "fish"
end

g.loaded_netrwPlugin = 1 -- no netrw
g.netrw_dirhistmax = 0 -- no netrwhist

opt.autoindent = true
opt.autoread = true
opt.backspace = { "indent", "eol", "start" }
opt.cmdheight = 2
opt.cursorline = true
opt.diffopt:append("vertical")
opt.encoding = "utf-8"
opt.expandtab = true
opt.hidden = true
opt.hlsearch = false
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.incsearch = true
opt.lazyredraw = true
opt.mat = 2
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.showmatch = true
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.so = 7
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.startofline = false
opt.tabstop = 2
opt.title = true
opt.visualbell = true
opt.wildmenu = true
opt.wrap = false

local undodir = tostring(fn.stdpath("data")) .. "/undo"
if fn.isdirectory(undodir) ~= 1 then
    fn.mkdir(undodir, "p")
end
opt.undodir = undodir
opt.undofile = true

-- nvim-cmp
opt.completeopt:remove("longest")

if fn.exists("+termguicolors") == 1 then
    opt.termguicolors = true
end

opt.textwidth = 0

opt.colorcolumn = "80"

-- files, backups, undo
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- ------------
-- color scheme
-- ------------
cmd([[colorscheme tokyonight]])

cmd("syntax enable")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
    end,
})
