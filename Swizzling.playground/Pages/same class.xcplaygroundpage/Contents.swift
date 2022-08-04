//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

class Dummy {
    @objc
    static func swizzle() {

        let selector1 = #selector(Dummy.test)
        let selector2 = #selector(Dummy._test)
        guard
            let originalMethod = class_getClassMethod(Dummy.self, selector1),
            let swizzleMethod = class_getClassMethod(Dummy.self, selector2)
        else {
            return
        }
        method_exchangeImplementations(originalMethod, swizzleMethod)
        print("swizzled!")
    }

    @objc
    dynamic static func test() {
        print("hola 1")
    }
    @objc
    static func _test() {
        print("hola 2")
    }
}


Dummy.test()
Dummy.swizzle()
Dummy.test()

