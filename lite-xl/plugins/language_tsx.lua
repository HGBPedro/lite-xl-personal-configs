-- mod-version:3
-- Almost identical to JS, with the exception that / shouldn't denote a regex.
-- Current JS syntax highlighter will highlight half the document due to closing tags.
local syntax = require "core.syntax"
local style = require "core.style"
local core = require "core"

for _, attr in pairs({"bold", "italic", "bold_italic"}) do
  local attributes = {}
  if attr ~= "bold_italic" then
    attributes[attr] = true
  else
    attributes["bold"] = true
    attributes["italic"] = true
  end
  -- no way to copy user custom font with additional attributes :(
  style.syntax_fonts["tsx_"..attr] = renderer.font.load(
    USERDIR .. "/fonts/Fira-Code-Medium.ttf",
    style.code_font:get_size(),
    attributes
  )
  -- also add a color for it
  style.syntax["tsx_"..attr] = style.syntax["keyword2"]
end


syntax.add {
  name = "TypeScript with JSX",
  files = { "%.tsx$" },
  block_comment = { "{/*", "*/}" },
  comment = "//",
  patterns = {
    { pattern = "//.-\n",               type = "comment"  },
    { pattern = { "{/%*", "%*/}" },       type = "comment"  },
    { pattern = { '"', '"', '\\' },     type = "string"   },
    { pattern = { "'", "'", '\\' },     type = "string"   },
    { pattern = { "`", "`", '\\' },     type = "string"   },
    { pattern = "0x[%da-fA-F]+",        type = "number"   },
    { pattern = "-?%d+[%d%.eE]*",       type = "number"   },
    { pattern = "-?%.?%d+",             type = "number"   },
    { pattern = "[%+%-=/%*%^%%<>!~|&]", type = "operator" },
    { pattern = "interface%s()[%a_][%w_]*", type = {"keyword", "tsx_bold"} },
    { pattern = "type%s()[%a_][%w_]*", type = {"keyword", "tsx_bold_italic"} },
    { pattern = "[%a_][%w_]*%f[(]",     type = "function" },
    -- { pattern = "[%a_][%w_]*",          type = "symbol"   },
    { pattern = "%f[^<]![%a_][%w_]*",      type = "keyword2" },
    { pattern = "%f[^<][%a_][%w_]*",       type = "function" },
    { pattern = "%f[^</][%a_][%w_]*",      type = "function" },
    { pattern = "%s*%a*[=]",             type = "keyword2"  },
  },
  symbols = {
    ["async"]      = "keyword",
    ["await"]      = "keyword",
    ["break"]      = "keyword",
    ["case"]       = "keyword",
    ["catch"]      = "keyword",
    ["class"]      = "keyword",
    ["const"]      = "keyword",
    ["continue"]   = "keyword",
    ["debugger"]   = "keyword",
    ["default"]    = "keyword",
    ["delete"]     = "keyword",
    ["do"]         = "keyword",
    ["else"]       = "keyword",
    ["export"]     = "keyword",
    ["extends"]    = "keyword",
    ["finally"]    = "keyword",
    ["for"]        = "keyword",
    ["from"]       = "keyword",
    ["function"]   = "keyword",
    ["get"]        = "keyword",
    ["if"]         = "keyword",
    ["import"]     = "keyword",
    ["implements"] = "keyword",
    ["in"]         = "keyword",
    ["instanceof"] = "keyword",
    ["let"]        = "keyword",
    ["new"]        = "keyword",
    ["return"]     = "keyword",
    ["set"]        = "keyword",
    ["static"]     = "keyword",
    ["super"]      = "keyword",
    ["switch"]     = "keyword",
    ["throw"]      = "keyword",
    ["try"]        = "keyword",
    ["typeof"]     = "keyword",
    ["var"]        = "keyword",
    ["void"]       = "keyword",
    ["while"]      = "keyword",
    ["with"]       = "keyword",
    ["yield"]      = "keyword",
    ["true"]       = "literal",
    ["false"]      = "literal",
    ["null"]       = "literal",
    ["undefined"]  = "literal",
    ["arguments"]  = "keyword2",
    ["Infinity"]   = "keyword2",
    ["NaN"]        = "keyword2",
    ["this"]       = "keyword2",
  },
}
