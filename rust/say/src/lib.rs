pub fn encodety(n: u64, s: &str) -> String {
    match n % 10 { 0 => s.to_string(), _ => format!("{}-{}", s, &encodeaux(n % 10)) }
}

pub fn encodenz(n: u64, o: u64, s: &str) -> String {
    format!("{} {} {}", encodeaux(n / o), s, &encodeaux(n % o)).trim().to_string()
}

pub fn encodeaux(n: u64) -> String {
    let res = match n {
        1 => "one".to_string(),
        2 => "two".to_string(),
        3 => "three".to_string(),
        4 => "four".to_string(),
        5 => "five".to_string(),
        6 => "six".to_string(),
        7 => "seven".to_string(),
        8 => "eight".to_string(),
        9 => "nine".to_string(),
        10 => "ten".to_string(),
        11 => "eleven".to_string(),
        12 => "twelve".to_string(),
        13 => "thirteen".to_string(),
        14 => "fourteen".to_string(),
        15 => "fifteen".to_string(),
        16 => "sixteen".to_string(),
        17 => "seventeen".to_string(),
        18 => "eighteen".to_string(),
        19 => "nineteen".to_string(),
        20...29 => encodety(n, "twenty"),
        30...39 => encodety(n, "thirty"),
        40...49 => encodety(n, "forty"),
        50...59 => encodety(n, "fifty"),
        60...69 => encodety(n, "sixty"),
        70...79 => encodety(n, "seventy"),
        80...89 => encodety(n, "eighty"),
        90...99 => encodety(n, "ninety"),
        100...999 => encodenz(n, 100, "hundred"),
        1_000...999_999 => encodenz(n, 1_000, "thousand"),
        1_000_000...999_999_999 => encodenz(n, 1_000_000, "million"),
        1_000_000_000...999_999_999_999 =>
            encodenz(n, 1_000_000_000, "billion"),
        1_000_000_000_000...999_999_999_999_999 =>
            encodenz(n, 1_000_000_000_000, "trillion"),
        1_000_000_000_000_000...999_999_999_999_999_999 =>
            encodenz(n, 1_000_000_000_000_000, "quadrillion"),
        1_000_000_000_000_000_000...std::u64::MAX =>
            encodenz(n, 1_000_000_000_000_000_000, "quintillion"),
        _ => "".to_string()
    };
    res.trim().to_string()
}

pub fn encode(n: u64) -> String {
    match n {
        0 => "zero".to_string(),
        _ => encodeaux(n)
    }
}
