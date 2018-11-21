pub fn is_armstrong_number(num: u32) -> bool {
    let ns = num.to_string();
    let p = ns.len() as u32;
    let dv = ns
        .chars()
        .fold(0, |s, n| s + n.to_digit(10).unwrap().pow(p));
    num == dv
}
