using Printf
const word = Array{Int64}
  
goes = [ 
    [1,4],
    [3,2],
    [1,3],
    [4,2], 
]

writes = 
[ 
    [[1,1],[1,0]],
    [[0],[1]],
    [[0],[1,1]],
    [[0,0],[0,1]],
]


function as_string(v)
    s = ""
    for i in eachindex(v)
        s *= alph[v[i] + 1]
    end
    s
end

 function print_key(writes, goes)
    for i in eachindex(goes)
        for j in eachindex(goes[i])
            @printf("%2d  %2d  %-4s %2d  \n", i - 1,j - 1,as_string(writes[i][j]) ,goes[i][j] - 1)
        end
        print('\n')
    end
end

 function print_key_brief(writes, goes)
    for i in eachindex(goes)
        for j in eachindex(goes[i])
            @printf("%-s %2d  \n",as_string(writes[i][j]) ,goes[i][j] - 1)
        end
        print('\n')
    end
end

 function print_key_f(writes, goes)
    for i in eachindex(goes)
        for j in eachindex(goes[i])
            @printf("f  %2d  %-2d     =     %-5s%3d  \n",
                i - 1,j - 1,as_string(writes[i][j]) ,goes[i][j] - 1)
        end
        print('\n')
    end
end

as_string([0,1])

alph = ['O','|']
function print_vec(v)
    for i in eachindex(v)
        print(alph[v[i] + 1])
    end
    print('\n')
end

print_key_f(writes,goes)

function prefix(p :: word, q :: word)
    if length(q) < length(p) return false end
    for i in eachindex(p)
        if p[i] != q[i] return false end
    end
    true
end
            

function encode(p)
    c :: word = []
    m = 1
    for i in eachindex(p)
        append!(c,writes[m][p[i]+1])
        m = goes[m][p[i]+1]
    end
    c
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
            
        


p = rand([0,1],80)
p ==  decode(encode(p))

goes[4][2]

a

p = rand([0,1],23)
c = encode(p)
d= decode(c)
print_vec(p)
print_vec(c)
print_vec(d)

throw("error")


