import UIKit

extension Array {
    subscript(index index: Int) -> (String, String)? {
        guard let value = self[index] as? Int else {return nil}
        switch (value >= 0, abs(value) % 2) {
        case (true, 0): return ("positive", "even")
        case (true, 1): return ("positive", "odd")
        case (false, 0): return ("negative", "even")
        case (false, 1): return ("negative", "odd")
        default: return nil
        }
    }
}

extension String {
    subscript(index: Int) -> Character? {
        guard 0..<count ~= index else {return nil}
        return self[self.index(startIndex, offsetBy: index)]
    }
}

//let me = "Test"
//me[2]

infix operator **
func **<T: FloatingPoint>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

infix operator **=
func **=<T: FloatingPoint>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}
