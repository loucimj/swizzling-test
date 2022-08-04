//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

class A {
    @objc dynamic func foo() {
    }
}

final class B {
    @objc func swizzled_foo() {
        print("Swizzled foo in \(B.self)")
    }
}

method_exchangeImplementations(
    class_getInstanceMethod(A.self, #selector(A.foo))!,
    class_getInstanceMethod(B.self, #selector(B.swizzled_foo))!
)

A().foo()
