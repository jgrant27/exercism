pub fn build_proverb(list: Vec<&str>) -> String {
    if list.is_empty() {
        return String::new();
    }

    let mut res = Vec::new();

    for i in 0..list.len() - 1 {
        res.push(format!(
            "For want of a {} the {} was lost.",
            list[i],
            list[i + 1]
        ));
    }
    res.push(format!("And all for the want of a {}.", list[0]));

    res.join("\n")
}
