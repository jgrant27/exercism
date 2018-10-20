class DNA {
    let strand: String
    private let ncounts: [String : Int]

    init?(strand: String) {
        self.strand = strand
        var _ncounts = ["T": 0, "A": 0, "C": 0, "G": 0]
        let _scounts =
          Dictionary(grouping: strand.uppercased().unicodeScalars,
                     by: {String($0)}).mapValues {$0.count}
        _ncounts.merge(_scounts) { (_, new) in new }
        if (strand.allSatisfy { _ncounts.keys.contains(String($0)) })
        { self.ncounts = _ncounts } else { return nil }
    }

    func count(_ str: String) -> Optional<Int> { return self.ncounts[str] }

    func counts() -> [String : Int] { return self.ncounts }
}
