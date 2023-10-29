function demo()
    print_key_f(writes, goes)
    for i in 1:20
        p = rand([0,1],23)
        c = encode(p)
        d= decode(c)
        print_vec(p)
        print_vec(c)
        print_vec(d)
        print("\n")
    end
end