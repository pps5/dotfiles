local function join_paths(...) local path_sep = '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

vim.cmd [[set runtimepath=$VIMRUNTIME]]
vim.cmd('set packpath=' .. join_paths('/tmp', 'nvim', 'site'))

-- Packer
local package_root = join_paths('/tmp', 'nvim', 'site', 'pack')
local install_path = join_paths(package_root, 'packer', 'start', 'packer.nvim')
local compile_path = join_paths(install_path, 'plugin', 'packer_compiled.lua')

local ensure_packer = function()
  local fn = vim.fn
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local function load_plugins()
  local packer_bootstrap = ensure_packer()

  require('packer').startup {
    {
      'wbthomason/packer.nvim',
      'bronson/vim-trailing-whitespace',
      'nvim-treesitter/nvim-treesitter',
      'lambdalisue/fern.vim',
      'morhetz/gruvbox',
      -- telescope
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- LSP
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Completions
      'hrsh7th/vim-vsnip',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
    },
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
  if packer_bootstrap then
    require('packer').sync()
  end
  require('mason').setup()
  require('mason-lspconfig').setup {
    ensure_installed = { 'omnisharp' }
  }
end

load_plugins()

-- misc
vim.opt.fenc = 'utf-8'
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.clipboard = 'unnamed'
vim.opt.mouse = 'a'
vim.cmd 'autocmd BufWritePre * :FixWhitespace'

-- UI
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.signcolumn = 'yes'
vim.opt.wildmode = 'list:longest'
vim.cmd 'colorscheme gruvbox'

-- Tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.wrap = false
vim.opt.hlsearch = true

-- treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
      enable = true
  }
}

-- telescope
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<space>lg', ':Telescope live_grep<CR>', { silent = true })
require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        width = 0.95,
        height = 0.95,
      }
    }
  }
}

-- Fern
vim.keymap.set('n', '<space>n', ':Fern . -toggle -reveal=% -width=60 -drawer<CR>')
vim.keymap.set('n', '<space>N', ':Fern . -reveal=%<CR>')

-- LSP
local load_config = function()
  require('vim.lsp.log').set_format_func(vim.inspect)
  local nvim_lsp = require('lspconfig')
  local home = os.getenv('HOME')
  local mason_bin_directory = join_paths(home, '.local/share/nvim/mason/bin')

  require('mason-lspconfig').setup_handlers({ function(server_name)
    -- for completion
    local capabilities = require('cmp_nvim_lsp')
      .update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local lsp_config = { capabilities = capabilities }

    lsp_config.on_attach = function(_, bufnr)
      local keymap_opts = { noremap = true, silent = true }

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keymap_opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, keymap_opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, keymap_opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, keymap_opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, keymap_opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, keymap_opts)
      vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, keymap_opts)
      vim.keymap.set('n', '<space>f', vim.lsp.buf.format, keymap_opts)
      --- diagnostics
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, keymap_opts)
      vim.keymap.set('n', '<space>[', vim.diagnostic.goto_prev, keymap_opts)
      vim.keymap.set('n', '<space>]', vim.diagnostic.goto_next, keymap_opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, keymap_opts)
    end


    if (server_name == 'omnisharp') then
        lsp_config.cmd = { join_paths(mason_bin_directory, 'omnisharp') }
    end

    if (server_name == 'sumneko_lua') then
      lsp_config.settings = {
        Lua = {
          diagnostics = {
              globals = { 'vim' }
          }
        }
      }
    end
    nvim_lsp[server_name].setup(lsp_config)
  end })
end
load_config()

-- Completion
local set_completion = function()
  local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fm['vsnip#anonymous'](args.body)
      end
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm { silent = true },
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  }
end
set_completion()

