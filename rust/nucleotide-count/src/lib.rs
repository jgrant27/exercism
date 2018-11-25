use std::collections::HashMap;

pub fn get_empty_map() -> HashMap<char, usize> {
    let mut hm: HashMap<char, usize> = HashMap::new();
    hm.insert('A', 0);
    hm.insert('C', 0);
    hm.insert('G', 0);
    hm.insert('T', 0);
    hm
}

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    let hm = get_empty_map();
    if !hm.contains_key(&nucleotide) {
        return Err(nucleotide);
    }
    for ch in dna.chars() {
        if !hm.contains_key(&ch) {
            return Err(ch);
        }
    }
    Ok(dna.chars().filter(|ch| *ch == nucleotide).count())
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let mut hm = get_empty_map();
    for k in hm.clone().keys() {
        let res = count(k.clone(), dna);
        match res {
            Ok(r) => hm.insert(k.clone(), r),
            Err(e) => return Err(e),
        };
    }
    Ok(hm)
}
