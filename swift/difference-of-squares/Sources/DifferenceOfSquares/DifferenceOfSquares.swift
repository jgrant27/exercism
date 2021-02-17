//Solution goes in Sources

import Foundation


public struct Squares {

    let n: Int

    public init(_ n: Int) {
        self.n = n
    }

    var squareOfSum: Int {
        let sum = (0...self.n).reduce(0, +)
        return sum * sum
    }

    var sumOfSquares: Int {
        (0...self.n).reduce(0) { $0 + $1 * $1 }
    }

    var differenceOfSquares: Int {
        self.squareOfSum - self.sumOfSquares
    }

}
