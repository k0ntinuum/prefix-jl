using Printf
const word = Array{Int64}
alph = ['O','|']

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

include("encode.jl")
include("decode.jl")
include("print.jl")
include("demo.jl")

demo()
