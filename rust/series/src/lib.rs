pub fn series(digits: &str, len: usize) -> Vec<String> {
    if len == 0 {
        return vec!["".to_string(); digits.len() + 1];
    }
    if len > digits.len() {
        return vec![];
    }

    let mut res = Vec::new();
    for i in (0..digits.len()).step_by(len - 1) {
        if (i + len) <= digits.len() {
            res.push(digits[i..(i + len)].to_string());
        }
    }
    res
}
