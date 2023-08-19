-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {

    -- Keep search find centered
    ["J"] = { "mzJ`z" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    ["gt"] = { "<cmd>bnext<CR>", desc = "Goto next tab" },
    ["gT"] = { "<cmd>bprev<CR>", desc = "Goto previous tab" },
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>d"] = { [["_d]] },
    ["<leader>D"] = { [["_D]] },
    ["<leader>p"] = { [["+p]] },
    ["<leader>P"] = { [["+P]] },
    ["<leader>y"] = { [["+y]] },
    ["<leader>Y"] = { [["+Y]] },
    ["<leader>ld"] = {
      function() vim.diagnostic.open_float() end,
      desc = "Hover diagnostics",
    },
    ["]d"] = {
      function() vim.diagnostic.goto_next() end,
      desc = "Previous diagnostic",
    },
    ["[d"] = {
      function() vim.diagnostic.goto_prev() end,
      desc = "Previous diagnostic",
    },
    ["K"] = {
      function() vim.lsp.buf.implementation() end,
      desc = "Implementation of the current symbol (read Knowledge)"
    },
    ["gi"] = {
      function() vim.lsp.buf.implementation() end,
      desc = "Implementation of current symbol (read Get Implementation)",
    },
    ["gr"] = {
      function() vim.lsp.buf.references() end,
      desc = "References of current symbol (read Get References)",
    },
    ["gh"] = {
      function() vim.lsp.buf.signature_help() end,
      desc = "Help for the current type (read Get Help)",
    },
  },
  v = {
    -- Move selected text up and down with J and K
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
    ["<leader>d"] = { [["_d]] },
    ["<leader>D"] = { [["_D]] },
    ["<leader>p"] = { [["+p]] },
    ["<leader>P"] = { [["+P]] },
    ["<leader>y"] = { [["+y]] },
    ["<leader>Y"] = { [["+Y]] },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<leader>p"] = { [["+p]] },
    ["<leader>P"] = { [["+P]] },
  },
}
