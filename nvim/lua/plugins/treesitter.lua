return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
        -- setup treesitter with config
    end,
    dependencies = {
        -- NOTE: additional parser
        { "nushell/tree-sitter-nu" },
        { "IndianBoy42/tree-sitter-just" },
    },
    build = ":TSUpdate",
}
