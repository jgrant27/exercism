struct Raindrops {
    var sounds: String = ""

    init(_ n: Int) {
        if 0 == n % 3 { sounds += "Pling" }
        if 0 == n % 5 { sounds += "Plang" }
        if 0 == n % 7 { sounds += "Plong" }
        if sounds.isEmpty { sounds = String(n) }
    }
}
