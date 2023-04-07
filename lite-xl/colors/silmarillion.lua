-- #212026
-- #273B40
-- #024959
-- #03738C
-- #BFD6D9
-- #5A8C87
-- #90A68D
-- #A66742
-- #593D2D
-- #B89353
-- #D9D9D9

local style = require "core.style"
local common = require "core.common"

style.background = { common.color "#212026" }
style.background2 = { common.color "#273B40" }
style.background3 = { common.color "#273B40" }
style.text = { common.color "#90A68D" }
style.caret = { common.color "#90A68D" }
style.accent = { common.color "#90A68D" }
style.dim = { common.color "#5A8C87" }
style.divider = { common.color "#024959" }
style.selection = { common.color "#593D2D" }
style.line_number = { common.color "#5A8C87" }
style.line_number2 = { common.color "#BFD6D9" }
style.line_highlight = { common.color "#024059" }
style.scrollbar = { common.color "#024059" }
style.scrollbar2 = { common.color "#45736A" }
-- style.nagbar = { common.color "#ff79c6" }
-- style.nagbar_text = { common.color "#BFADA8" }
-- style.nagbar_dim = { common.color "rgba(0, 0, 0, 0.30)" }
style.good = { common.color "#72b886cc" }
style.warn = { common.color "#d08770" }
style.error = { common.color "#bf616a" }
style.modified = { common.color "#ebcb8b" }

style.syntax["normal"] = { common.color "#BFD6D9" }
style.syntax["symbol"] = { common.color "#f5faff" }
style.syntax["comment"] = { common.color "#A66742" }
style.syntax["keyword"] = { common.color "#79878C" }
style.syntax["keyword2"] = { common.color "#03738C" }
style.syntax["number"] = { common.color "#90A68D" }
style.syntax["literal"] = { common.color "#90A68D" }
style.syntax["string"] = { common.color "#B89353" }
style.syntax["operator"] = { common.color "#D9D9D9" }
style.syntax["function"] = { common.color "#79878C" }

-- PLUGINS
style.lint = {
  info = { common.color "#002366" },
  hint = { common.color "#ebcb8b" },
  warning = { common.color "#ebcb8b" },
  error = { common.color "#FF3333" }
}
style.bracketmatch_color = { common.color "#565f89" } -- bracketmatch
style.guide = { common.color "#1E202E" }
style.guide_highlight = { common.color "#363B54" }              -- indentguide
style.guide_width = 1                                 -- indentguide
