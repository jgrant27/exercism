pub fn is_leap_year(year: i32) -> bool {
    return 0 == year % 4 && (!(0 == year % 100) || (0 == year % 400));
}
