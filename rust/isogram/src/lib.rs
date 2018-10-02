use std::collections::BTreeSet;


pub fn check(candidate: &str) -> bool {

    if candidate.is_empty() { return true; }

    candidate.to_lowercase().split_whitespace().fold(true, |acc, word| {
        let mut prev_chars: BTreeSet<char> = BTreeSet::new();
        acc && word.chars().fold(true, |acc, ch| {
            let mut r = true;
            if ch.is_alphabetic() {
                r = !prev_chars.contains(&ch);
                prev_chars.insert(ch);
            }
            acc && r
        })
    })

}
