local M = {}

--- Carrega um plugin com segurança e executa o setup se ele existir
---@param plugin_name string O nome do módulo do plugin
---@param config table|nil Tabela de opções para passar para o setup()
---@return boolean success Retorna true se carregou, false se falhou
function M.safe_require(plugin_name, config)
    local status, plugin = pcall(require, plugin_name)
    if status then
        plugin.setup(config or {})
        return true
    else
        return false
    end
end

--- Carrega uma lista de plugins e exibe um erro consolidado caso algum falhe
---@param plugin_list table Lista de plugins no formato { {"nome", {config}} }
function M.require_plugin_list(plugin_list)
    local errors = {}

    for _, v in ipairs(plugin_list) do
        local name = v[1]
        local config = v[2]
        local success = M.safe_require(name, config)
        if not success then 
            table.insert(errors, name)
        end
    end

    if #errors > 0 then
        local error_msg = "Falha ao carregar os seguintes plugins:\n- " .. table.concat(errors, "\n- ")
        vim.notify(error_msg, vim.log.levels.ERROR)
    end
end

function M.clean_inactive_packages()
    local status, _ = pcall(function()
        local inactive = vim.iter(vim.pack.get())
            :filter(function(x) return not x.active end)
            :map(function(x) return x.spec.name end)
            :totable()

        if #inactive > 0 then
            vim.pack.del(inactive)
            vim.notify("Plugins inativos removidos: " .. table.concat(inactive, ", "), vim.log.levels.INFO)
        end
    end)

    if not status then
        vim.notify("Não foi possível executar a limpeza (vim.pack não suportado nesta versão)", vim.log.levels.WARN)
    end
end


return M
