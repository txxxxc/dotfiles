return {
  "rebelot/heirline.nvim",
  event = "BufEnter",
  enable = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local utils = require "heirline.utils"
    local TablineFileName = {
      provider = function(self)
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
      end,
      hl = {
        fg = utils.get_highlight("String").fg,
        bg = utils.get_highlight("String").bg,
      },
    }
    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self) return self.icon and (self.icon .. " ") end,
      hl = function(self) return { fg = self.icon_color } end,
    }

    local TablineFileFlags = {
      {
        condition = function(self) return vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) end,
        provider = "[+]",
        hl = { fg = utils.get_highlight("Character").fg },
      },
      {
        condition = function(self)
          return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
              or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
        end,
        provider = function(self)
          if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
            return "  "
          else
            return ""
          end
        end,
        hl = { fg = "orange" },
      },
    }

    local TablineFileNameBlock = {
      init = function(self) self.filename = vim.api.nvim_buf_get_name(self.bufnr) end,
      hl = function(self)
        if self.is_active then
          return "Clear"
        else
          return "Clear"
        end
      end,
      on_click = {
        callback = function(_, minwid, _, button)
          if button == "m" then -- close on mouse middle click
            vim.schedule(function() vim.api.nvim_buf_delete(minwid, { force = false }) end)
          else
            vim.api.nvim_win_set_buf(0, minwid)
          end
        end,
        minwid = function(self) return self.bufnr end,
        name = "heirline_tabline_buffer_callback",
      },
      FileIcon,
      TablineFileName,
      TablineFileFlags,
    }

    local TablineBufferBlock = utils.surround({ "| ", " |" }, function(self)
      if self.is_active then
        return utils.get_highlight("Clear").bg
      else
        return utils.get_highlight("Folded").bg
      end
    end, { TablineFileNameBlock })

    local BufferLine = utils.make_buflist(TablineBufferBlock)
    require("heirline").setup {
      tabline = BufferLine,
    }
  end,
}
