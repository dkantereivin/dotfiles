return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'preservim/nerdtree'
	use 'tpope/vim-fugitive'
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	use 'dense-analysis/ale'
	use 'Shougo/deoplete.nvim'
	use 'lervag/vimtex'

	use 'joshdick/onedark.vim'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'ryanoasis/vim-devicons'
	use 'mhinz/vim-startify'
    
    --use({
    --    'iamcco/markdown-preview.nvim', 
    --    run = function() vim.fn['mkdp$util$install']() end,
    --})
    
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
