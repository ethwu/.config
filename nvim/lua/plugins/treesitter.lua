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
    },
    build = ":TSUpdate",
}
