return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local function root_pattern(fname, pattern)
        local found = vim.fs.find(pattern, { path = fname, upward = true })[1]
        if found then
          return vim.fs.dirname(found)
        end
      end

      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        lua_ls = {
          single_file_support = false, -- do not run
          root_dir = function(fname)
            -- disable lua_ls inside pico8 projects
            if root_pattern(fname, ".pico8") then
              return nil
            end
            return root_pattern(fname, ".luarc.json")
              or root_pattern(fname, ".luacheckrc")
              or root_pattern(fname, ".git")
          end,
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              hint = { enable = true },
            },
          },
        },

        pico8_ls = {
          cmd = {
            "pico8-ls",
            "--stdio",
          },
          filetypes = { "p8", "pico8", "lua" },
          root_dir = function(fname)
            return root_pattern(fname, ".pico8")
          end,
        },
      })
    end,
  },
}
