function prefix(p :: word, q :: word)
    if length(q) < length(p) return false end
    for i in eachindex(p)
        if p[i] != q[i] return false end
    end
    true
end

function inverted_prefix(c,m)
    for j in eachindex(writes[m])
        if prefix(writes[m][j],c)
            return (j - 1, goes[m][j], length(writes[m][j]))
        end
    end
    throw("failed to find prefix")
end
    
function decode(c)
    p :: word = []
    m = 1
    i = 1
    while i <= length(c)
        (j,m,l) = inverted_prefix(c[i:end],m)
        append!(p,j)
        i += l
    end
    p
end