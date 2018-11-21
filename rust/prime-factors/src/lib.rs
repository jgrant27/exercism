pub fn factors(n: u64) -> Vec<u64> {
    let (mut facs, mut res, mut fac) = (Vec::new(), n, 2);

    while res > 1 {
        if 0 == res % fac {
            facs.push(fac);
            res = res / fac;
        } else {
            fac += 1;
        }
    }

    return facs;
}
