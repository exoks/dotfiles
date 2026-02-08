--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀                𓐓 other.lua 𓐔           
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/01/21 00:19:05 by oezzaou
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/02/08 17:50:24 by oezzaou
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

-- ===[ other plugins ]========================================================
return {
  {
    -- ===[ nvim-aupairs ]===
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    opts = {
      -- Hides the cursor during scrolling to achieve the desired effect
      hide_cursor = true,
      check_ts = true,              -- Use Treesitter for context-aware scrolling
      stop_eof = true,              -- Stops scrolling at the end of the file
      cursor_scrolls_alone = false, -- Prevents the cursor from moving independently
      easing_function = "sine",     -- Smooth sine-wave animation for constant movement
    },
    config = function(_, opts)
      require("neoscroll").setup(opts)
    end,
  },
  {
    -- ===[ nvim-aupairs ]===
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- enable treesitter if installed
      })
    end,
  },
  {
    -- ===[ nvim-surround ]===
    "kylechui/nvim-surround",
    opts = {}, -- config/options
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },
  {
    -- ===[ nvim-colorizer.lua ]===
    "norcalli/nvim-colorizer.lua",
    opts = {}, -- config/options
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },
  {
    -- ===[ vim-illuminate ]===
    "RRethy/vim-illuminate",
    opts = {
      under_cursor = true,        -- Highlight word under cursor
      min_count_to_highlight = 2, -- Highlight only if > 1 occurrence exists
      -- Time (in milliseconds) to wait after the cursor stops moving
      -- before highlighting references.
      delay = 200,
      -- In large files, highlighting can be expensive, so we reduce work.
      large_file_cutoff = 2000,
      -- Settings that apply only when the file is considered "large".
      large_file_overrides = {
        -- Use only the LSP provider for highlighting in large files.
        -- This is usually faster and more efficient than treesitter/regex.
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  -- {
  -- 	-- cursor column custumization --
  -- 	"lukas-reineke/virt-column.nvim",
  -- 	opts = {
  -- 		char = "" -- `┃`, `│`, `▏`, `▕`, `▎`, `▍`, `┆`, `┊`, `¦`, `⦚`,
  -- 	},
  -- 	config = function(_, opts)
  -- 		require("virt-column").setup(opts)
  -- 	end,
  -- },
}
