pub fn reverse(input: &str) -> String {

    let mut res = String::new();
    let mut chars = input.chars();
    loop {
        let ch = chars.next();
        if ch == None { break }
        res.insert(0, ch.unwrap());
    }
    res

}
