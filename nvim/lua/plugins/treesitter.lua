return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    main = 'nvim-treesitter.configs',
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
            disable = function(_lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
    },
    dependencies = {
        -- NOTE: additional parser
        { "nushell/tree-sitter-nu" },
        { "IndianBoy42/tree-sitter-just", opts = {} },
    },
    build = ":TSUpdate",
}
