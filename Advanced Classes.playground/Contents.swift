import UIKit

class A {
    init() {
        print("I’m A!(1)")
    }
    deinit {
        print("A removed")
    }
}

class B: A {
    override init() {
        print("I’m B!(1)")
        super.init()
        print("I’m B!(2)")
    }
    deinit {
        print("B removed")
    }
}

class C: B {
    override init() {
        print("I’m C!(1)")
        super.init()
        print("I’m C!(2)")
    }
    deinit {
        print("C removed")
    }
}

do {
    let c = C()
    let _ = c as A
}
