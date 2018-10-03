#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn aliquot_sum(n: u64) -> u64 {

    let mut asum = 0;
    for i in 1..n {
        if 0 == n % i && n != i { asum += i; }
    }
    return asum;
}

pub fn classify(num: u64) -> Option<Classification> {

    if 0 == num { return None; }
    let asum = aliquot_sum(num);
    if asum < num {
        Some(Classification::Deficient)
    } else if asum == num {
        Some(Classification::Perfect)
    } else {
        Some(Classification::Abundant)
    }

}
