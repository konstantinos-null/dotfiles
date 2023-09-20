local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("Something went wrong with tree-sitter")
    return
end

-- TODO: 
treesitter.setup({
  highlight = {{ enable = true }, { disable = "help"}},
  ensure_installed = { "bash" , "comment", "dockerfile", "go", "lua", "python", "yaml" },
})
-- treesitter.highlight.setup()

-- Comment.nvim setup
local status_ok2, comment = pcall(require, "Comment")
if not status_ok2 then
    print("Something went wrong with comment.nvim")
    return
end

comment.setup({
})

local status_ok3, surround = pcall(require, "nvim-surround")
if not status_ok3 then
    print("Something went wrong with surround.nvim")
    return
end

surround.setup({
})
