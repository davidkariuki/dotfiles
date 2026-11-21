-- Omarchy swaps the active theme by replacing files under current/.
-- Watch that directory and trigger the theme hot-reload used by Omarchy's
-- Neovim config. On macOS this plugin is a no-op.
if vim.fn.isdirectory(vim.fn.expand("~/.local/state/omarchy/current")) == 0 then
  return {}
end

return {
  {
    name = "omarchy-theme-watch",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
    config = function()
      local state_dir = vim.fn.expand("~/.local/state/omarchy/current")
      local uv = vim.uv or vim.loop
      local timer = uv.new_timer()
      local watcher = uv.new_fs_event()

      if not timer or not watcher then
        return
      end

      watcher:start(state_dir, {}, function(err, filename)
        if err then
          return
        end

        -- "theme" is replaced, "theme.name"/"theme.generation" are rewritten.
        if filename and filename ~= "theme" and filename ~= "theme.name" and filename ~= "theme.generation" then
          return
        end

        timer:stop()
        timer:start(
          400,
          0,
          vim.schedule_wrap(function()
            vim.api.nvim_exec_autocmds("User", { pattern = "LazyReload", modeline = false })
          end)
        )
      end)

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          pcall(function()
            watcher:stop()
            watcher:close()
            timer:stop()
            timer:close()
          end)
        end,
      })
    end,
  },
}
