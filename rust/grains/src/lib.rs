pub fn square(s: u32) -> u64 {
    if !(1 <= s && s <= 64) { panic!("Square must be between 1 and 64"); }
    (1..(s as u64)).fold(1, |acc, _| acc * 2)
}

pub fn total() -> u64 {
    (1..=64).fold(0, |acc, sn| acc + square(sn))
}
