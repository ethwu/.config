return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
            disable = function(_lang, bufnr)
                return api.nvim_buf_line_count(bufnr) > 50000
            end,
        },
    },
    -- config = function()
    --     require('nvim-treesitter.configs').setup({
    --         auto_install = true,
    --         highlight = {
    --             enable = true,
    --         },
    --     })
    --     -- setup treesitter with config
    -- end,
    dependencies = {
        -- NOTE: additional parser
        -- { "nushell/tree-sitter-nu" },
        { "IndianBoy42/tree-sitter-just" },
    },
    build = ":TSUpdate",
}
