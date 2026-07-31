local autocmd = vim.api.nvim_create_autocmd

--------------------------------------------------
-- Highlight on yank
--------------------------------------------------

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

--------------------------------------------------
-- Restore cursor position
--------------------------------------------------

autocmd("BufReadPost", {
    callback = function()
        local row = vim.fn.line([['"]])
        if row > 1 and row <= vim.fn.line("$") then
            vim.cmd([[normal! g`"]])
        end
    end,
})

--------------------------------------------------
-- Equalize splits after terminal resize
--------------------------------------------------

autocmd("VimResized", {
    command = "wincmd =",
})

--------------------------------------------------
-- Git commit messages
--------------------------------------------------

autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 72
    end,
})

--------------------------------------------------
-- Markdown
--------------------------------------------------

autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
    end,
})
