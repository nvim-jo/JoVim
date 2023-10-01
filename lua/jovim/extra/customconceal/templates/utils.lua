local query_builder = function(text)
    return function(options)
        return string.format('(("%s" @%s) (#set! conceal "%s"))', text, options.highlight, options.conceal)
    end
end

return {
    query_builder = query_builder,
}