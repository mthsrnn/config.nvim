local M = {}

local function build_source(url, opts)
  if opts and type(opts) == "table" then
    opts.src = url
    return opts
  end
  return url
end

M.gh = function(x, opts) return build_source('https://github.com/' .. x, opts) end
M.cb = function(x, opts) return build_source('https://codeberg.org/' .. x, opts) end
M.gl = function(x, opts) return build_source('https://gitlab.com/' .. x, opts) end
M.sh = function(x, opts) return build_source('https://git.sr.ht/~' .. x, opts) end
M.lo = function(x, opts) return build_source('/home/renan/.local/source/' .. x, opts) end


return M
