import Foundation

class Isogram {

    static func isIsogram(_ s: String) -> Bool {
        return Dictionary(grouping: s.lowercased().unicodeScalars, by: { $0 })
          .allSatisfy { CharacterSet.letters.contains($0) ? $1.count == 1 : true }
    }

}
