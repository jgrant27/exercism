use std::collections::BTreeSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {

    let mut res = BTreeSet::new();
    for f in factors {
        let mut i = 1;
        while (i * f) < limit {
            res.insert(i * f);
            i += 1;
        }
    }
    res.iter().sum()

}
