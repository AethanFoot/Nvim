---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>y"] = { [["+y]], "yank to clipboard" },
    ["<leader>Y"] = { [["+Y]], "Yank to clipboard" },
    ["<leader>pp"] = { [["+p]], "put from clipboard" },
    ["<leader>P"] = { [["+P]], "Put from clipboard" },
    ["<leader>d"] = { [["_d]], "delete" },

    ["<CR>"] = { ":noh <CR> <CR>", "Clear search highlight" },

    ["\\"] = { ":", "enter command mode", opts = { nowait = true } },

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
    -- ["<leader>ff"] = { "<cmd> Telescope find_files hidden=true <CR>", "Find files" },
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

M.harpoon = {
  n = {
    ["<leader>a"] = { "<cmd> Harpoon <CR>", "Add file to harpoon" },
    ["<leader>e"] = { "<cmd> HarpoonUI <CR>", "Open harpoon list" },
    ["<A-1>"] = { "<cmd> HarpoonSelect1 <CR>", "Select the first file" },
    ["<A-2>"] = { "<cmd> HarpoonSelect2 <CR>", "Select the second file" },
    ["<A-3>"] = { "<cmd> HarpoonSelect3 <CR>", "Select the third file" },
    ["<A-4>"] = { "<cmd> HarpoonSelect4 <CR>", "Select the fourth file" },
    ["<A-5>"] = { "<cmd> HarpoonSelect5 <CR>", "Select the fifth file" },
  },
  i = {
    ["<A-1>"] = { "<cmd> HarpoonSelect1 <CR>", "Select the first file" },
    ["<A-2>"] = { "<cmd> HarpoonSelect2 <CR>", "Select the second file" },
    ["<A-3>"] = { "<cmd> HarpoonSelect3 <CR>", "Select the third file" },
    ["<A-4>"] = { "<cmd> HarpoonSelect4 <CR>", "Select the fourth file" },
    ["<A-5>"] = { "<cmd> HarpoonSelect5 <CR>", "Select the fifth file" },
  },
}

return M
