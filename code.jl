function encode(x , q )
    k = deepcopy(q)
    p = copy(x)
    c = Int64[]
    m = 0
    i = 1
    while p != ""
        while !(r.mode == m && prefix(r.reads,p)) r += 1 end
        roll = p[i]
        push!(c,r.writes)
        p = p[length(r.reads):end]
        m = r.goes

                roll_key(k,m,roll)
                
                @goto next_mode
            end
        end
        @label next_mode
    end
    c
end

next(x, k , m, s) = for i in eachindex(k[m][s]) if prefix(k[m][s][i], x) return i end end


function encode(p,q)
    k = deepcopy(q)
    c = Int64[]
    m = 1
    while length(p) > 0
        j = next(p, k , m, 1)
        append!(c,k[m][2][j])
        p = last(p, length(p) - length(k[m][1][j]))
        m = k[m][3][j]
    end
    c
end
function decode(c,q)
    k = deepcopy(q)
    p = Int64[]
    m = 1
    while length(c) > 0
        j = next(c, k , m, 2)
        append!(p,k[m][1][j])
        c = last(c, length(c) - length(k[m][2][j]))
        m = k[m][3][j]
    end
    p
end


function check(k)
    for m in eachindex(k)
        for i in 1:3
            if length(k[m][1][i]) != length(k[m][2]) @printf("problem at m = %d  ")




