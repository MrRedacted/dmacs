return {
    "ziglang/zig.vim",
    config = function()
        require("zig").setup({
            zig_fmt_autosave = 0,
        })
    end,
}