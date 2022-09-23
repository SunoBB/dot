--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

    -- Configure AstroNvim updates
    updater = {
      remote = "origin", -- remote to use
      channel = "nightly", -- "stable" or "nightly"
      version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
      branch = "main", -- branch name (NIGHTLY ONLY)
      commit = nil, -- commit hash (NIGHTLY ONLY)
      pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
      skip_prompts = false, -- skip prompts about breaking changes
      show_changelog = true, -- show the changelog after performing an update
      auto_reload = false, -- automatically reload and sync packer after a successful update
      auto_quit = false, -- automatically quit the current session after a successful update
      -- remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
      -- },
    },
  
    -- Set colorscheme to use
    colorscheme = "catppuccin",
  
  
    -- Override highlight groups in any theme
    highlights = {
      -- duskfox = { -- a table of overrides/changes to the default
      --   Normal = { bg = "#000000" },
      -- },
      default_theme = function(highlights) -- or a function that returns a new table of colors to set
        local C = require "default_theme.colors"
  
        highlights.Normal = { fg = C.fg, bg = C.bg }
        return highlights
      end,
    },
  
    -- set vim options here (vim.<first_key>.<second_key> =  value)
    options = {
      opt = {
        relativenumber = true, -- sets vim.opt.relativenumber
      },
      g = {
        mapleader = " ", -- sets vim.g.mapleader
      },
    },
    -- If you need more control, you can use the function()...end notation
    -- options = function(local_vim)
    --   local_vim.opt.relativenumber = true
    --   local_vim.g.mapleader = " "
    --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
    --
    --   return local_vim
    -- end,
  
    -- Set dashboard header
    header = {
      " █████  ███████ ████████ ██████   ██████",
      "██   ██ ██         ██    ██   ██ ██    ██",
      "███████ ███████    ██    ██████  ██    ██",
      "██   ██      ██    ██    ██   ██ ██    ██",
      "██   ██ ███████    ██    ██   ██  ██████",
      " ",
      "    ███    ██ ██    ██ ██ ███    ███",
      "    ████   ██ ██    ██ ██ ████  ████",
      "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
      "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
      "    ██   ████   ████   ██ ██      ██",
    },
  
    -- Default theme configuration
    default_theme = {
      -- set the highlight style for diagnostic messages
      diagnostics_style = { italic = true },
      -- Modify the color palette for the default theme
      colors = {
      
      },
      -- enable or disable highlighting for extra plugins
      plugins = {
        aerial = true,
        beacon = false,
        bufferline = true,
        dashboard = true,
        highlighturl = true,
        hop = false,
        indent_blankline = true,
        lightspeed = false,
        ["neo-tree"] = true,
        notify = true,
        ["nvim-tree"] = false,
        ["nvim-web-devicons"] = true,
        rainbow = true,
        symbols_outline = false,
        telescope = true,
        vimwiki = false,
        ["which-key"] = true,
      },
    },
  
    -- Diagnostics configuration (for vim.diagnostics.config({...}))
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
  
    -- Extend LSP configuration
    lsp = {
      -- enable servers that you already have installed without mason
      servers = {
        -- "pyright"
      },
      -- easily add or disable built in mappings added during LSP attaching
      mappings = {
        n = {
          -- ["<leader>lf"] = false -- disable formatting keymap
        },
      },
      -- add to the global LSP on_attach function
      -- on_attach = function(client, bufnr)
      -- end,
  
      -- override the mason server-registration function
      -- server_registration = function(server, opts)
      --   require("lspconfig")[server].setup(opts)
      -- end,
  
      -- Add overrides for LSP server settings, the keys are the name of the server
      ["server-settings"] = {
        -- example for addings schemas to yamlls
        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
        --   settings = {
        --     yaml = {
        --       schemas = {
        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        --       },
        --     },
        --   },
        -- },
        -- Example disabling formatting for a specific language server
        -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
        --   on_attach = function(client, bufnr)
        --     client.resolved_capabilities.document_formatting = false
        --   end
        -- }
      },
    },
  
    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
    
    -- Configure plugins
    plugins = {
      init = {
        -- You can disable default plugins as follows:
        -- ["goolord/alpha-nvim"] = { disable = true },
  
        -- You can also add new plugins here as well:
        -- Add plugins, the packer syntax without the "use"
        -- { "andweeb/presence.nvim" },
        -- {
        --   "ray-x/lsp_signature.nvim",
        --   event = "BufRead",
        --   config = function()
        --     require("lsp_signature").setup()
        --   end,
        -- },
  
        -- We also support a key value style plugin definition similar to NvChad:
        -- ["ray-x/lsp_signature.nvim"] = {
        --   event = "BufRead",
        --   config = function()
        --     require("lsp_signature").setup()
        --   end,
        -- },
        {
          "catppuccin/nvim",
          as = "catppuccin",
          config = function()
            vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
            local ucolors = require "catppuccin.utils.colors"
            local latte = require("catppuccin.palettes").get_palette "latte"
            local frappe = require("catppuccin.palettes").get_palette "frappe"
            local macchiato = require("catppuccin.palettes").get_palette "macchiato"
            local mocha = require("catppuccin.palettes").get_palette "mocha"
            require("catppuccin").setup({
              transparent_background = false,
              term_colors = false,
              compile = {
                enabled = false,
                path = vim.fn.stdpath("cache") .. "/catppuccin",
              },
              dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
              },
              styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
              },
              integrations = {
                treesitter = true,
                native_lsp = {
                  enabled = true,
                  virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                  },
                  underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                  },
                },
                coc_nvim = false,
                lsp_trouble = false,
                cmp = true,
                lsp_saga = false,
                gitgutter = false,
                gitsigns = true,
                telescope = true,
                nvimtree = true,
                dap = {
                  enabled = false,
                  enable_ui = false,
                },
                neotree = {
                  enabled = false,
                  show_root = true,
                  transparent_panel = false,
                },
                which_key = false,
                indent_blankline = {
                  enabled = true,
                  colored_indent_levels = false,
                },
                dashboard = true,
                neogit = false,
                vim_sneak = false,
                fern = false,
                barbar = false,
                markdown = true,
                lightspeed = false,
                leap = false,
                ts_rainbow = false,
                hop = false,
                notify = true,
                telekasten = false,
                symbols_outline = false,
                mini = false,
                aerial = false,
                vimwiki = false,
                beacon = false,
                navic = {
                  enabled = false,
                  custom_bg = "NONE",
                },
                overseer = false,
                fidget = false,
                treesitter_context = false,
              },
              color_overrides = {
  
                -- mocha = {
                --   text = "#E6ECFE",
                --   base = "#1a1a1a",
                      --   mantle = "#1a1a1a",
                      --   crust = "#1a1a1a",
                --   -- pink = "#E6ECFE",               
                -- },
              },
              highlight_overrides = {
                -- mocha = {
                --   Comment = { fg = "#E6ECFE" },
                --   DashboardShortCut = { fg = "#E6ECFE" },
                --   DashboardHeader = { fg = "#E6ECFE" },
                --   DashboardCenter = { fg = "#E6ECFE" },
                --   DashboardFooter = { fg = "#E6ECFE", style = { "italic" } },
                --   NeogitBranch = { fg = "#E6ECFE" },
                    --   NeogitRemote = { fg = "#E6ECFE" },
                --   NeoTreeFileNameOpened = { fg = "#E6ECFE" },
                -- },
                
              },
              custom_highlights = {
                
              }
            })
            vim.cmd [[colorscheme catppuccin]]
          end,
        },
      },
      -- All other entries override the require("<key>").setup({...}) call for default plugins
      ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
        -- config variable is the default configuration table for the setup functino call
        local null_ls = require "null-ls"
        -- Check supported formatters and linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        config.sources = {
          -- Set a formatter
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
        }
        -- set up null-ls's on_attach function
        -- NOTE: You can remove this on attach function to disable format on save
        config.on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.api.nvim_create_autocmd("BufWritePre", {
              desc = "Auto format before save",
              pattern = "<buffer>",
              callback = vim.lsp.buf.formatting_sync,
            })
          end
        end
        return config -- return final config table to use in require("null-ls").setup(config)
      end,
      treesitter = { -- overrides `require("treesitter").setup(...)`
        ensure_installed = { "lua" },
      },
      -- use mason-lspconfig to configure LSP installations
      ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
        ensure_installed = { "sumneko_lua" },
      },
      -- use mason-tool-installer to configure DAP/Formatters/Linter installation
      ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
        ensure_installed = { "prettier", "stylua" },
      },
      ["neo-tree"] = {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          },
        },
      },
      packer = { -- overrides `require("packer").setup(...)`
        compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
      },
    },
  
    -- LuaSnip Options
    luasnip = {
      -- Add paths for including more VS Code style snippets in luasnip
      vscode_snippet_paths = {},
      -- Extend filetypes
      filetype_extend = {
        javascript = { "javascriptreact" },
      },
    },
  
    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
      source_priority = {
        nvim_lsp = 1000,
        luasnip = 750,
        buffer = 500,
        path = 250,
      },
    },
  
    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
      -- Add bindings which show up as group name
      register_mappings = {
        -- first key is the mode, n == normal mode
        n = {
          -- second key is the prefix, <leader> prefixes
          ["<leader>"] = {
            -- third key is the key to bring up next level and its displayed
            -- group name in which-key top level menu
            ["b"] = { name = "Buffer" },
          },
        },
      },
    },
  
    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
      -- Set key binding
      -- Set autocommands
      vim.api.nvim_create_augroup("packer_conf", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
        desc = "Sync packer after modifying plugins.lua",
        group = "packer_conf",
        pattern = "plugins.lua",
        command = "source <afile> | PackerSync",
      })
  
      -- Set up custom filetypes
      -- vim.filetype.add {
      --   extension = {
      --     foo = "fooscript",
      --   },
      --   filename = {
      --     ["Foofile"] = "fooscript",
      --   },
      --   pattern = {
      --     ["~/%.config/foo/.*"] = "fooscript",
      --   },
      -- }
    end,
  }
  
  return config