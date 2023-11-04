let random_bits = (n) =>  {
    let s = "";
    for (let i =0; i < n ; i++) s += (Math.floor(2*Math.random())).toString();
    return s;
}
let print_vec = (v) => {
    for (let i of v) process.stdout.write(alph[i]);
    console.log()
}


let nxt = (k, t, m, s) => {
    for (let i of k) if (i[0] == m && t.startsWith(i[s])) return i;
}

let roll_string = (s, i, n) => {
    var t = ''
    for (let c of s) t += ( (parseInt(c)+i) %n).toString()
    return t;
}

let roll_mode = (k,m,i,n) => {
    for (let a of k) if (a[0] == m ) a[2] = roll_string(a[2],i,n);
}

const K = [
    [0,"00","10",2],
    [0,"0","11",0],
    [0,"1","0",2],
    [1,"0","1",1],
    [1,"1","00",1],
    [2,"0000","11",0],
    [2,"0","10",0],
    [2,"1","000",1],
]
let enc = (k,x) => {
    let m = 0;
    let y ='';
    let r,w;
    while (x != '') {
        [,r,w,m]  = nxt(k,x,m,1);
        y += w;
        x = x.slice(r.length)
    }
    return y
}


let dec = (k,x) => {
    let m = 0;
    let y ='';
    let r,w;
    while (x != '') {
        [,r,w,m]  = nxt(k,x,m,2);
        y += r;
        x = x.slice(w.length)
    }
    return y
}

let enc_roll = (q,x) => {
    let k = structuredClone(q)
    let m = 0;
    let m_ = 0
    let y ='';
    let r,w;
    while (x != '') {
        [,r,w,m_]  = nxt(k,x,m,1);
        y += w;
        x = x.slice(r.length)
        roll_mode(k,m,1,2);
        m = m_;
    }
    return y
}

let dec_roll = (q,x) => {
    let k = structuredClone(q)
    let m = 0;
    let m_ = 0;
    let y ='';
    let r,w;
    while (x != '') {
        [,r,w,m_]  = nxt(k,x,m,2);
        y += r;
        x = x.slice(w.length)
        roll_mode(k,m,1,2);
        m = m_;
    }
    return y
}

const alph = "O|@*";
const p = random_bits(35);
const c = enc_roll(K, p)
const d = dec_roll(K, c)
print_vec(p);
print_vec(c);
print_vec(d);
console.log(p == d)
