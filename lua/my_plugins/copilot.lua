return {
    {
        -- GitHub Copilot
        "github/copilot.vim",
        config = function()
            -- 这里可以放置你个性化的 copilot.vim 配置，如键位映射等
            -- 下述示例展示了将 <C-J> 绑定为接受补全
            vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
        end,
    },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ravitemer/mcphub.nvim",
      "ravitemer/codecompanion-history.nvim"
    },
    opts = {
      adapters = {
        http = {
          copilot_gpt41 = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "gpt-4.1",
                  max_tokens = 32000,
                },
              },
            })
          end,
          copilot_claude_haiku_45 = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-haiku-4.5",
                },
              },
            })
          end,
          copilot_claude_sonnet_45 = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-sonnet-4.5",
                },
              },
            })
          end,
          copilot_copilot_gpt5 = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "gpt-5",
          },
              },
            })
          end,
        },
      },
      strategies = {
        chat = {
          adapter = "copilot_gpt41",
        },
        inline = {
          adapter = "copilot_gpt41",
        },
        agent = {
          adapter = "copilot_gpt41",
        },
      },
      opts = {
        log_level = "DEBUG",
        language = "Chinese",
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            position = "right",
          },
        },
        diff = {
          provider = "inline",
          provider_opts = {
            inline = {
              layout = "buffer", -- 改为 buffer 模式，直接在文件中显示
            },
          },
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        },
        history = {
          enabled = true,
          opts = {
            -- Keymap to open history from chat buffer (default: gh)
            keymap = "gh",
            -- Keymap to save the current chat manually (when auto_save is disabled)
            save_chat_keymap = "sc",
            -- Save all chats by default (disable to save only manually using 'sc')
            auto_save = true,
            -- Number of days after which chats are automatically deleted (0 to disable)
            expiration_days = 0,
            -- Picker interface (auto resolved to a valid picker)
            picker = "telescope", --- ("telescope", "snacks", "fzf-lua", or "default")
            ---Optional filter function to control which chats are shown when browsing
            chat_filter = nil, -- function(chat_data) return boolean end
            -- Customize picker keymaps (optional)
            picker_keymaps = {
              rename = { n = "r", i = "<M-r>" },
              delete = { n = "d", i = "<M-d>" },
              duplicate = { n = "<C-y>", i = "<C-y>" },
            },
            ---Automatically generate titles for new chats
            auto_generate_title = true,
            title_generation_opts = {
              ---Adapter for generating titles (defaults to current chat adapter)
              adapter = nil, -- "copilot"
              ---Model for generating titles (defaults to current chat model)
              model = nil, -- "gpt-4o"
              ---Number of user prompts after which to refresh the title (0 to disable)
              refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
              ---Maximum number of times to refresh the title (default: 3)
              max_refreshes = 3,
              format_title = function(original_title)
                -- this can be a custom function that applies some custom
                -- formatting to the title.
                return original_title
              end
            },
            ---On exiting and entering neovim, loads the last chat on opening chat
            continue_last_chat = false,
            ---When chat is cleared with `gx` delete the chat from history
            delete_on_clearing_chat = false,
            ---Directory path to save the chats
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
            ---Enable detailed logging for history extension
            enable_logging = false,
  
            -- Summary system
            summary = {
              -- Keymap to generate summary for current chat (default: "gcs")
              create_summary_keymap = "gcs",
              -- Keymap to browse summaries (default: "gbs")
              browse_summaries_keymap = "gbs",
                generation_opts = {
                  adapter = nil, -- defaults to current chat adapter
                  model = nil, -- defaults to current chat model
                  context_size = 90000, -- max tokens that the model supports
                  include_references = true, -- include slash command content
                  include_tool_outputs = true, -- include tool execution results
                  system_prompt = nil, -- custom system prompt (string or function)
                  format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
                },
            },
  
            -- Memory system (requires VectorCode CLI)
            memory = {
              -- Automatically index summaries when they are generated
              auto_create_memories_on_summary_generation = true,
              -- Path to the VectorCode executable
              vectorcode_exe = "vectorcode",
              -- Tool configuration
              tool_opts = {
                -- Default number of memories to retrieve
                default_num = 10
              },
              -- Enable notifications for indexing progress
              notify = true,
              -- Index all existing memories on startup
              -- (requires VectorCode 0.6.12+ for efficient incremental indexing)
              index_on_startup = false,
            },
          }
        }
      }

    },
  },

  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },

  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --   opts = {
  --     preview = {
  --       modes = { "n", "no", "c" },
  --       hybrid_modes = { "n" },
  --       callbacks = {
  --         on_enable = function(_, win)
  --           vim.wo[win].conceallevel = 0
  --           vim.wo[win].concealcursor = ""
  --         end,
  --       },
  --       filetypes = { "markdown", "codecompanion" },
  --       ignore_buftypes = {},
  --     },
  --   },
  -- },

  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      render_modes = { "n", "c" },
      anti_conceal = {
        enabled = true,
      },
    },
  },

  {
    "robitx/gp.nvim",
    config = function()
      local conf = {
        providers = {
          openai = {
            disable = true,
          },
          copilot = {
            disable = false,
            endpoint = "https://api.githubcopilot.com/chat/completions",
            secret = {
              "bash",
              "-c",
              "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
          },
        },
        agents = {
          {
            name = "CopilotGpt4.1",
            provider = "copilot",
            chat = true,
            command = true,
            model = { model = "gpt-4.1" },
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
          {
            name = "ClaudeHaiku4.5",
            provider = "copilot",
            chat = true,
            command = true,
            model = { model = "claude-haiku-4.5" },
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
          {
            name = "ClaudeSonnet4.5",
            provider = "copilot",
            chat = true,
            command = true,
            model = { model = "claude-sonnet-4.5" },
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
          {
            name = "CopilotGpt5",
            provider = "copilot",
            chat = true,
            command = true,
            model = { model = "gpt-5" },
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
        },
	      default_command_agent = "CopilotGpt4.1",
	      default_chat_agent = "CopilotGpt4.1",
      }
      require("gp").setup(conf)
  
      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  },

}

