extern crate regex;

use regex::Regex;
use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    let words: String = words
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphanumeric() || *c == ' ' || *c == ',' || *c == '\'' || *c == '\n')
        .collect();
    let mut hm: HashMap<String, u32> = HashMap::new();
    let re = Regex::new(r"\s|,").unwrap();
    let mut swords: Vec<&str> = re.split(words.as_str()).collect();
    swords.retain(|word| word.len() > 0);
    for mut word in swords {
        word = word.trim_matches('\'');
        let cnt = match hm.get(&word.to_string()) {
            Some(cnt) => cnt + 1,
            None => 1,
        };
        hm.insert(word.to_string(), cnt);
    }
    hm
}
