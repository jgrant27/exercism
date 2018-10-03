/// Determines whether the supplied string is a valid ISBN number
pub fn is_valid_isbn(isbn: &str) -> bool {

    let isbn_new = isbn.replace("-", "");
    let invalid_chars =
        isbn_new.chars().any(|ch| 'X' != ch && !ch.is_digit(10));
    if invalid_chars || isbn_new.len() > 10 { return false; }

    isbn_new.chars()
        .fold((false, 0, 10),
              |(res, sum, n), ch| {
                  let new_sum =
                      if 'X' == ch {
                          sum + 10
                      } else {
                          sum + ch.to_digit(10).unwrap() * n
                      };
                  let new_res =
                      if 1 == n { 0 == new_sum % 11 } else { res };
                  (new_res, new_sum, n - 1)
              }).0

}
