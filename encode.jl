function encode(p)
    c :: word = []
    m = 1
    for i in eachindex(p)
        append!(c,writes[m][p[i]+1])
        m = goes[m][p[i]+1]
    end
    c
end
