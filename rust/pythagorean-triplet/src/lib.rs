pub fn find() -> Option<u32> {
    let limit: u32 = 1000;

    for c in 1..limit {
        for b in 1..c {
            let a = limit - b - c;
            if a.pow(2) + b.pow(2) == c.pow(2) && a + b + c == limit {
                println!("{} + {} + {} = {}", a, b, c, (a + b + c));
                return Some(a * b * c);
            }
        }
    }

    None
}
