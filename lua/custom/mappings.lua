---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>y"] = { [["+y]], "yank to clipboard" },
    ["<leader>Y"] = { [["+Y]], "Yank to clipboard" },
    ["<leader>p"] = { [["+p]], "put from clipboard" },
    ["<leader>P"] = { [["+P]], "Put from clipboard" },
    ["<leader>d"] = { [["_d]], "delete" },

    ["<CR>"] = { ":noh <CR> <CR>", "Clear search highlight" },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format { quiet = true }
      end,
      "formatting",
    },
  },
  v = {
    ["<leader>y"] = { [["+y]], "yank to clipboard" },
    ["<leader>d"] = { [["_d]], "delete" },

    [">"] = { ">gv", "indent" },
  },
  x = {
    ["<leader>p"] = { [["_dP]], "Put over selection" },
  },
}

-- more keybinds!
M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Find git files" },
    ["<leader>cd"] = { "<cmd> Telescope zoxide list <CR>", "List zoxide cache" },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = { "<cmd> TroubleToggle <CR>", "Toggle trouble" },
    ["<leader>tn"] = { "<cmd> TroubleNext <CR>", "Next trouble" },
    ["<leader>tp"] = { "<cmd> TroublePrevious <CR>", "Previous trouble" },
  },
}

M.lazygit = {
  n = {
    ["<leader>lg"] = { "<cmd> LazyGit <CR>", "Open lazygit" },
    ["<leader>lc"] = { "<cmd> LazyGitConfig <CR>", "Open lazygit" },
  },
}

M.undotree = {
  n = {
    ["<leader>u"] = { "<cmd> Undotree <CR>", "Open undotree" },
  },
}

return M
