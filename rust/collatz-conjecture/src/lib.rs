pub fn collatz(n: u64) -> Option<u64> {

    if 0 == n { return None; }

    let mut s : u64 = 0;
    let mut t = n;
    while 1 != t {
        t = if 0 == t % 2 { t / 2 } else { 3 * t + 1 };
        s += 1;
    }
    Some(s)

}
