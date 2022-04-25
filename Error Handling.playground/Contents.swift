import Foundation

enum NumberError: Error {
    case notANumber
}

func toEvenNumber(_ string: String) throws -> Int {
    guard let number = Int(string) else {
        throw NumberError.notANumber
    }
    return number - number % 2
}

do {
    try toEvenNumber("10")
} catch {
    print("You can't convert the string to a number!")
}

do {
    try toEvenNumber("1")
} catch {
    print("You can't convert the string to a number!")
}

do {
    try toEvenNumber("abc")
} catch {
    print("You can't convert the string to a number!")
}




enum DivisionError: Error {
    case divisionByZero
}

func divide(_ x: Int, _ y: Int) throws -> Int {
    guard y != 0 else {
        throw DivisionError.divisionByZero
    }
    return x/y
}

do {
    try divide(10, 2)
} catch {
    print("You can't divide by zero!")
}

do {
    try divide(10, 0)
} catch {
    print("You can't divide by zero!")
}
