class DNA {
    var strand: String
    var ncounts: [String : Int]

    init?(strand: String) {
        self.strand = strand
        self.ncounts = ["T": 0, "A": 0, "C": 0, "G": 0]
        if (strand.allSatisfy { self.ncounts.keys.contains(String($0)) }) {
            strand.forEach() { self.ncounts[String($0)]? += 1 }
        } else {
            return nil
        }
    }

    func count(_ str: String) -> Optional<Int> { return self.ncounts[str] }

    func counts() -> [String : Int] { return self.ncounts }
}
