pub fn encode(source: &str) -> String {
    let mut rs = String::from(source);
    rs.push('\u{0}');
    let char_vec: Vec<char> = rs.chars().collect();
    let res =
        &rs[1..rs.len()]
            .chars()
            .fold((String::new(), char_vec[0], 0), |(mut s, lc, n), c| {
                if lc != c {
                    if n > 0 {
                        s.push_str(&(n + 1).to_string());
                    }
                    s.push(lc);
                    (s, c, 0)
                } else {
                    (s, lc, n + 1)
                }
            });
    res.0.to_string()
}

pub fn decode(source: &str) -> String {
    let mut res = String::new();
    let char_vec: Vec<char> = source.chars().collect();
    let mut ns = String::new();
    for i in 0..source.len() {
        if char_vec[i].is_numeric() {
            ns.push(char_vec[i]);
        } else {
            let mut n = 1;
            if !ns.is_empty() {
                n = ns.parse::<u32>().unwrap();
            }
            for _ in 0..n {
                res.push(char_vec[i]);
            }
            ns.clear();
        }
    }
    res
}
