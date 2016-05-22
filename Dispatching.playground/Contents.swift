//: Experimentations with protocol dispatch

//import Foundation

/*:
----
*/

/*
 This is a simple protocol. The designer has created a default implementation 
 that relies on a helper method
 */

protocol P {
  func x()
}

extension P {
  func x() {
    helper()
    print("ext-x")
  }
  func helper() {
    print("ext-helper")
  }
}

// A conforming type which defines its own meaning for conformance
class A:P {
  func x() {
    print("a-x")
  }
}

// A conforming type which relies on the default definition of conformance.
// The author also defined a local method that (inadvertently or intentionally)
// is also called helper(). Due to the semantics of a protocol extension, this
// may be the cause for some impedence mismatch with a certain line of 'intuition'
class B:P {
  func helper() {
    print("b-helper")
  }
}

// A conforming type that define its own meaning for conformance. There again
// the author has (accidentally/purposefully) defined its a local helper method
// that shares its name with a method in the protocol extension
class C:B {
  func x() {
    print ("c-x")
  }
  override func helper() {
    print("c-helper")
  }
}

// direct
print("\nDIRECT")
var x1 = A()
x1.x()        // a-x
x1.helper()   // ext-helper
print("")

var x2 = B()
x2.x()        // ext-helper + ext-x
x2.helper()   // b-helper
print("")

var x3 = C()
x3.x()        // c-x
x3.helper()   // c-helper
print("")

print("\nCAST")

// cast
var v1:P = A()
v1.x()        // a-x
v1.helper()   // ext-helper
print("")

var v2:P = B()
v2.x()        // ext-helper + ext-x
v2.helper()   // ext-helper
print("")

var v3:P = C()
v3.x()        // ext-helper + ext-x
v3.helper()   // ext-helper
print("")

