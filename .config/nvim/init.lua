local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Plugins {{{
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'itchyny/lightline.vim'
    use 'flazz/vim-colorschemes'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'rbgrouleff/bclose.vim'
    use 'francoiscabrol/ranger.vim'
    use 'godlygeek/tabular'
    use 'tpope/vim-fugitive'
    use 'neovimhaskell/haskell-vim'
    use 'idris-hackers/idris-vim'
    use 'JuliaEditorSupport/julia-vim'
    use 'wlangstroth/vim-racket'
    use 'junegunn/rainbow_parentheses.vim'
    use 'pangloss/vim-javascript'
    use 'lervag/vimtex'
    use {'cespare/vim-toml', branch = 'main'}
    use 'plasticboy/vim-markdown'
    use 'rhysd/vim-wasm'
    use 'kylelaker/riscv.vim'
end)
-- }}}

-- Options {{{
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.joinspaces = false

opt.list = true
opt.listchars = 'tab:→ ,trail:·'
opt.cursorline = true
opt.relativenumber = true
opt.signcolumn = 'number'
opt.scrolloff = 3
opt.textwidth = 80
opt.showmode = false

opt.modelines = 0

opt.ignorecase = true
opt.smartcase = true

-- opt.undodir = '/tmp/nvim-undo'
-- opt.undofile = true

opt.hidden = true
opt.lazyredraw = true

opt.shortmess:append({c = true})
opt.completeopt = 'menu,menuone,noselect'

g.mapleader = ' '
g.maplocalleader = ','

g.tex_flavor = 'latex'

g.netrw_browsex_viewer = 'firefox'
g.ranger_replace_netrw = 1

g['rainbow#max_levels'] = 16
g['rainbow#pairs'] = {{'(', ')'}, {'[', ']'}}
-- }}}

-- Mappings {{{
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>ce', '<cmd>vsplit $MYVIMRC<cr>')
map('n', '<leader>cs', '<cmd>source $MYVIMRC<cr>')

map('n', '<leader>o', '<cmd>Telescope find_files<cr>')

map('n', '<leader>i', '<c-]>')
map('n', '<leader>r', '<c-t>')

map('n', '<leader>y', '"+y')
map('n', '<leader>d', '"+d')
map('n', '<leader>p', '"+p')
map('n', '<leader>P', '"+P')

map('v', '<leader>y', '"+y')
map('v', '<leader>d', '"+d')
map('v', '<leader>p', '"+p')
map('v', '<leader>P', '"+P')

map('', 'H', '^')
map('', 'L', '$')

map('i', '<m-space>', '<esc>')

map('n', '<c-l>', '<cmd>noh<cr>')
map('n', '<leader>v', 'V`]')

map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>bn', '<cmd>bn<cr>')
map('n', '<leader>bp', '<cmd>bp<cr>')

map('n', '<leader>wv', '<c-w>v<c-w>l')
map('n', '<leader>wh', '<c-w>s<c-w>j')
map('n', '<leader>j', '<c-w>h')
map('n', '<leader>k', '<c-w>j')
map('n', '<leader>l', '<c-w>k')
map('n', '<leader>ö', '<c-w>l')
map('n', '<leader>;', '<c-w>l')

map('t', '<c-q>', '<c-q><c-\\><c-n>')
-- }}}

-- Completion {{{
local cmp = require 'cmp'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    completion = {
        keyword_length = 3,
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { 'i', 's', 'c' }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { 'i', 's', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'calc' },
    }, {
        { name = 'buffer', option = { keyword_pattern = [[\k\+]] }},
    }),
}

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
-- }}}

-- Telescope {{{
local telescope = require 'telescope'
telescope.setup {}
telescope.load_extension('fzf')

map('n', '<leader>tt', '<cmd>Telescope builtin<cr>')
map('n', '<leader>th', '<cmd>Telescope help_tags<cr>')
-- }}}

-- LSP {{{
local lsp = require 'lspconfig'
local on_attach = function(client)
    local opts = { noremap = true, silent = true }
    local function map(from, to) vim.api.nvim_buf_set_keymap(0, 'n', from, to, opts) end

    map('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    map('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('gd', '<cmd>Telescope lsp_definitions<cr>')
    map('gi', '<cmd>Telescope lsp_implementations<cr>')
    map('gr', '<cmd>Telescope lsp_references<cr>')
    map('gt', '<cmd>Telescope lsp_document_symbols<cr>')
    map('gT', '<cmd>Telescope lsp_type_definitions<cr>')
    map('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    map('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
    map('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
    map('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>')
    map('<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
    map('<leader>n', '<cmd>lua vim.lsp.buf.formatting()<cr>')
    map('<leader>a', '<cmd>Telescope lsp_code_actions<cr>')
    map('gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    map('gn', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {'rust_analyzer'}
for _, server in ipairs(servers) do
    lsp[server].setup {on_attach = on_attach, capabilities = capabilities}
end
-- }}}

-- Lightline {{{
g.lightline = {
    active = {
        left = {
            {'mode', 'paste'},
            {'fugitive', 'readonly', 'filename', 'modified'}
        }
    },
    component = {
        lineinfo = ' %3l:%-2v'
    },
    component_function = {
        readonly = 'LightlineReadonly',
        fugitive = 'LightlineFugitive'
    }
}

cmd [[
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction
]]
-- }}}

-- Autocommands {{{
cmd [[
augroup fix_bg
    au!
    au ColorScheme * highlight Normal ctermbg=none
augroup END

augroup fold_config
    au!
    au BufEnter $MYVIMRC setlocal foldmethod=marker
augroup END

augroup rainbow_lisp
    au!
    au FileType lisp,scheme,racket RainbowParentheses
augroup END
]]
-- }}}

cmd 'colorscheme molokai'
