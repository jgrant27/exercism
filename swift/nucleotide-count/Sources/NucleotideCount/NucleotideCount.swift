class DNA {
    private let nucleotide_counts: [String : Int]

    init?(strand: String) {
        let counted = Dictionary(grouping: strand.uppercased().unicodeScalars,
                                 by: { String($0) }).mapValues { $0.count }
        self.nucleotide_counts = ["T": 0, "A": 0, "C": 0, "G": 0].merging(counted) { (_, new) in new }
        let validStrand = strand.allSatisfy { self.nucleotide_counts.keys.contains(String($0)) }
        if !validStrand { return nil }
    }

    func count(_ nucleotide: String) -> Int? { return self.nucleotide_counts[nucleotide] }

    func counts() -> [String : Int] { return self.nucleotide_counts }
}
