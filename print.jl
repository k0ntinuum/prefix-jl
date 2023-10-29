function as_string(v)
    s = ""
    for i in eachindex(v)
        s *= alph[v[i] + 1]
    end
    s
end

function print_vec(v)
    print(as_string(v))
    print('\n')
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