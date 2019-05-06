use std::collections::HashMap;

pub fn brackets_are_balanced(string: &str) -> bool {
    let close_parens: HashMap<char, char> = [('}', '{'), (']', '['), (')', '(')]
        .iter()
        .cloned()
        .collect();
    let mut res: Vec<char> = vec![];
    for p in string.chars() {
        match p {
            '{' | '[' | '(' => res.push(p),
            '}' | ']' | ')' => {
                if close_parens.get(&p) == res.last() {
                    res.pop();
                } else {
                    return false;
                }
            }
            _ => {}
        }
    }
    res.is_empty()
}
