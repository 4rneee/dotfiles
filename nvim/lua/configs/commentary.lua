local status_ok, nvim_comment = pcall(require, "nvim_comment")
if not status_ok then
   return
end

-- Nvim comment options
nvim_comment.setup {
   comment_empty = false,
   marker_padding = true,                  -- Linters prefer comment and line to have a space in between markers
   create_mappings = true,                 -- Should key mappings be created
   comment_empty_trim_whitespace = true,   -- Trim empty comment whitespace
   hook = nil                              -- Hook function to call before commenting takes place
}
