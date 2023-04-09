local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'mhinz/vim-startify'
    use 'ryanoasis/vim-devicons'
    use 'airblade/vim-gitgutter'
    use {'fatih/vim-go', cmd = 'GoInstallBinaries' }
    use 'cohama/lexima.vim' -- Autoclose pairs
    use 'morhetz/gruvbox'
    use 'udalov/kotlin-vim'
    use 'github/copilot.vim'

    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'} -- If you have nodejs and yarn
    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'simrat39/rust-tools.nvim'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'mbbill/undotree'
    use 'rust-lang/rust.vim'

    ------------ LSP -----------
    use 'neovim/nvim-lspconfig'             -- Required
    use 'williamboman/mason.nvim'           -- Optional
    use 'williamboman/mason-lspconfig.nvim' -- Optional

    -- Autocompletion Engine
    use 'hrsh7th/nvim-cmp'         -- Required
    use 'hrsh7th/cmp-nvim-lsp'     -- Required
    use 'hrsh7th/cmp-buffer'       -- Optional
    use 'hrsh7th/cmp-path'         -- Optional
    use 'saadparwaiz1/cmp_luasnip' -- Optional
    use 'hrsh7th/cmp-nvim-lua'     -- Optional

    -- Snippets
    use  'L3MON4D3/LuaSnip'             -- Required
    use  'rafamadriz/friendly-snippets' -- Optional

    use  {'VonHeikemen/lsp-zero.nvim', branch = 'v1.x'}
    -----------------------------
    if packer_bootstrap then
        require('packer').sync()
    end
end)
