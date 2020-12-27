struct ETL {

    static func transform(_ old: [Int: [String]]) -> [String: Int] {
        return old.reduce(into: [:]) { new, pair in
            pair.value.forEach { new[$0.lowercased()] = pair.key }
        }
    }

}
