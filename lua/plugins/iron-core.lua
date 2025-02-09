local iron = require "iron.core"

iron.setup({
  config = {
    repl_open_cmd = "horizontal_DEFAULT",  -- Define um padrão diretamente
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
  },
  keymaps = {
    send_motion = "<C-r>",
    visual_send = "<C-r>",
  },
})

