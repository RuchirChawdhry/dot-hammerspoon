function titleCase( phrase )
    local result = string.gsub( phrase, "(%a)([%w_']*)",
        function( first, rest )
            return first:upper() .. rest:lower()
        end
    )
    return result
end


function firstThree( s )
    local result = string.sub (s, 1, 4)
    return result
end
