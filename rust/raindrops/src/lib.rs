pub fn raindrops(n: u32) -> String {
    let mut str = String::new();

    if 0 == n % 3 {
        str += "Pling";
    }
    if 0 == n % 5 {
        str += "Plang";
    }
    if 0 == n % 7 {
        str += "Plong";
    }
    if str.is_empty() {
        str = n.to_string();
    }

    return str;
}
