local helpers = {}

helpers.titleCase = function(phrase)
    local result = string.gsub(phrase, "(%a)([%w_']*)",
        function(first, rest) 
            return first:upper() .. rest:lower()
        end
    )
    return result
end

return helpers
