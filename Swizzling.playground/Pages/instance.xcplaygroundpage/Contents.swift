//: [Previous](@previous)

import Foundation
import UIKit
var greeting = "Hello, playground"

//: [Next](@next)
class Dummy {
    @objc
    static func swizzle() {

        let selector1 = #selector(Dummy.test)
        let selector2 = #selector(Dummy2.test)
        guard
            let originalMethod = class_getInstanceMethod(Dummy.self, selector1),
            let swizzleMethod = class_getInstanceMethod(Dummy2.self, selector2)
        else {
            return
        }
        method_exchangeImplementations(originalMethod, swizzleMethod)
        print("swizzled!")
    }

    @objc
    dynamic func test() {
        print("hola 1")
    }
}

class Dummy2 {
    @objc
    func test() {
        print("hola 2")
    }
}

let dummy = Dummy()
dummy.test()
Dummy.swizzle()
dummy.test()
