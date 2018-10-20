struct Raindrops {
    let sounds: String

    init(_ n: Int) {
        let _sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
          .reduce("") { 0 == n % $1.0 ? $0 + $1.1 : $0 }
        sounds = _sounds.isEmpty ? String(n) : _sounds
    }
}
