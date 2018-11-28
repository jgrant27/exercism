/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    code.chars().all(|c| c.is_numeric() || ' ' == c) &&
        code.replace(" ", "").len() > 1 && code.to_string().chars().rev()
        .filter(|c| c.is_numeric()).map(|c| c.to_digit(10).unwrap())
        .collect::<Vec<u32>>().chunks(2)
        .map(|chunk| { match chunk.len() {
            2 => match chunk[1] {
                5..=9 => chunk[0] + 2 * chunk[1] - 9,
                _ => chunk[0] + 2 * chunk[1],
            },
            _ => chunk[0]
        }}).sum::<u32>() % 10 == 0
}
