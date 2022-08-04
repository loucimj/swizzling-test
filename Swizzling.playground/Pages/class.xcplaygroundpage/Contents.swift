import UIKit

var greeting = "Hello, playground"


class Dummy {
    @objc
    static func swizzle() {

        let instance: Dummy = Dummy()
        let aClass: AnyClass! = object_getClass(instance)!
        let selector1 = #selector(Dummy.test)
        print(selector1)
        print(aClass ?? "nada")
        print(class_getClassMethod(UISheetPresentationController.Detent.self, selector1) ?? "nada")
        print(class_getClassMethod(aClass, selector1) ?? "nada")
        print(class_getClassMethod(self, selector1) ?? "nada")

        let selector2 = #selector(Dummy2.test)
        guard
            let originalMethod = class_getClassMethod(Dummy.self, selector1),
            let swizzleMethod = class_getClassMethod(Dummy2.self, selector2)
        else {
            return
        }
        method_exchangeImplementations(originalMethod, swizzleMethod)
//        class_replaceMethod(aClass, selector1, swizzledImplementation, method_getTypeEncoding(originalMethod))
//        class_replaceMethod(aClass, selector2, originalImplementation, method_getTypeEncoding(swizzleMethod))
        print("swizzled!")
    }

    @objc
    dynamic static func test() {
        print("hola 1")
    }
}

class Dummy2 {
    @objc
    static func test() {
        print("hola 2")
    }
}


Dummy.test()
Dummy.swizzle()
Dummy.test()

