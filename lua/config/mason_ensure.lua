-- Ensures a list of Mason packages are installed (no mason-lspconfig needed)
local M = {}

function M.setup(tools)
  local ok, mr = pcall(require, "mason-registry")
  if not ok then
    vim.notify("mason-registry not available", vim.log.levels.ERROR)
    return
  end

  -- Refresh the registry (safe if called often)
  if mr.refresh then
    mr.refresh(function() M._ensure(mr, tools) end)
  else
    M._ensure(mr, tools)
  end
end

function M._ensure(mr, tools)
  for _, name in ipairs(tools or {}) do
    local ok_pkg, pkg = pcall(mr.get_package, name)
    if not ok_pkg then
      vim.notify("Mason: package not found: " .. name, vim.log.levels.WARN)
    elseif not pkg:is_installed() then
      pkg:install()
    end
  end
end

return M
