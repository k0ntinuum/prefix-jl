function no_repeats(w )
    if length(w) == 0 return false end
    for i in eachindex(w)
        for j in eachindex(w)
            if i != j && w[i] == w[j] 
                return false 
            end
        end
    end
    return true
end

function random_words(n, min_l, max_l)
    w = Word[]
    for i in 1:n
        push!(w, random_word(rand(min_l:max_l)))
    end
    w
end

function random_unique_words(n, min_l, max_l)
    w = []
    while !no_repeats(w)
        w = random_words(n, min_l, max_l)
    end
    w
end

function random_reads(n, max_l)
    if n < length(alph) throw("random_reads: use more words") end
    w = random_unique_words(n - length(alph),2,max_l)
    for i in 1:length(alph)
        push!(w, [i-1])
    end
    w
end