pub fn verse(n: i32) -> String {
    let mut verse = String::new();
    if n > 2 {
        verse.push_str(format!("{:?} bottles of beer on the wall, {:?} bottles of beer.\nTake one down and pass it around, {:?} bottles of beer on the wall.\n", n, n, (n - 1)).as_str());
    } else if n == 2 {
        verse.push_str(format!("{:?} bottles of beer on the wall, {:?} bottles of beer.\nTake one down and pass it around, {:?} bottle of beer on the wall.\n", n, n, (n - 1)).as_str());
    } else if n == 1 {
        verse.push_str("1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n");
    } else {
        verse.push_str("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n");
    }
    return verse;
}

pub fn sing(start: i32, end: i32) -> String {
    let mut song = String::new();
    let mut s = start;
    while s >= end {
        song.push_str(verse(s).as_str());
        if s > end { song.push_str("\n"); }
        s -= 1;
    }
    return song;
}
