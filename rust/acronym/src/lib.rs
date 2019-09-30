pub fn abbreviate(phrase: &str) -> String {
    if phrase.trim().is_empty() {
        "".to_string()
    } else {
        phrase.trim().split(|c: char| c==' ' || c=='-').map(|word| {
            let nw = word.trim().chars();
            let fc: String = nw.to_owned().take(1).collect::<String>().to_uppercase();
            if nw.to_owned().filter(|c| c.is_alphanumeric()).all(|c| c.is_uppercase()) {
                fc
            } else {
                let rest: String = nw.skip(1).filter(|c| c.is_uppercase()).collect();
                format!("{}{}", fc, rest)
            }
        }).collect::<String>()
    }
}
