pub fn is_pangram(sentence: &str) -> bool {
    let mut uchars: Vec<char> = sentence
        .chars()
        .filter(|c| c.is_alphabetic())
        .collect();
    uchars.sort();
    uchars.dedup();
    26 <= uchars.len()
}
