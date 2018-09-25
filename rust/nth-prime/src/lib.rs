pub fn nth(n: u32) -> u32 {

    let mut c = 0;
    let mut k = 2;
    let mut p = 2;

    while c != n+1 {
        let mut is_prime = true;
        for j in 2..k {
            if 0 == k % j {
                is_prime = false;
                break;
            }
        }
        if is_prime {
            p = k;
            c += 1;
        }
        k += 1;
    }

    p
}
