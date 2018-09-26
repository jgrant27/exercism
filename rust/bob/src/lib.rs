pub fn reply(message: &str) -> &str {

    let msgt = message.trim();
    let shouting = String::from(msgt);
    let letters : String =
        shouting.chars().filter(|c| c.is_alphabetic()).collect();
    let is_shouting = !letters.is_empty() &&
        letters.chars().fold(true, |acc, c| acc && c.is_uppercase());

    if msgt.is_empty() { return "Fine. Be that way!"; }
    if msgt.ends_with("?") {
        if is_shouting {
            return "Calm down, I know what I'm doing!"; }
        else {
            return "Sure.";
        }
    }
    if is_shouting { return "Whoa, chill out!" };

    return "Whatever.";
}
